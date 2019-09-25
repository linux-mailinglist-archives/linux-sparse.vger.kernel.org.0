Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5586DBDB98
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2019 12:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732743AbfIYKAU (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 06:00:20 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:42949 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732778AbfIYKAU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 06:00:20 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iD45o-00024A-QE; Wed, 25 Sep 2019 11:00:16 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iD45o-0008Dm-5x; Wed, 25 Sep 2019 11:00:16 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-sparse@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 3/5] evaluate: check variadic argument types against formatting info
Date:   Wed, 25 Sep 2019 11:00:13 +0100
Message-Id: <20190925100015.31510-4-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The variadic argumnet code did not check any of the variadic arguments
as it did not previously know the possible type. Now we have the possible
formatting information stored in the ctype, we can do some checks on the
printf formatting types.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Fixes since v1:
- Split out the format-string -> symbol code
- Use symbol_list for the symbols from format parsing
- Changed to follow the new parsing code and ctype use
- Merged the unsigned-int/long types together

Fixes since v2:
- Check for printf_va_start before checking variadic-list
- Tidy the type code and fix a couple of bugs with %l and %ll
- Fix function names in working through printf arguments.
- Tidy documentation

Fixes since v3:
- Added positional arguments
- Also added precision and width specifiers

Fixes since v4:
- Stop copying the format string
- Removed void data pointer
- Suggested code cleanups

Fixes since v5:
- Rewritten format parsing code
- Updates for handling kernel printk formatting
- Fix parsing issues with ')' characters

Fixes since v6;
- Evaluate aftre all standard args are done
- Fix 'L' parsing

Fixes since v7:
- Updated comment format
- Remove static variable from get_fmt()

Notes:
- %p still generates an address-space mismatch
- how do we deal with the kernel's attempt to make printk format all types?

hack: ) will end format too
---
 evaluate.c | 443 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 443 insertions(+)

diff --git a/evaluate.c b/evaluate.c
index 3268333..b7c78a0 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -2319,13 +2319,452 @@ static struct symbol *evaluate_alignof(struct expression *expr)
 	return size_t_ctype;
 }
 
+struct format_type {
+	const char	*format;
+	int		(*test)(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff);
+	struct symbol	*data;
+};
+
+struct format_state {
+	struct expression	*expr;
+	unsigned int		va_start;
+	unsigned int		fmt_index;
+	unsigned int		arg_index;
+	unsigned int		used_position: 1;
+};
+
+static int printf_fmt_numtype(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
+{
+	struct symbol *type = fmt->data;
+	*target = type;
+	return ctype == type;
+}
+
+static int printf_fmt_string(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
+{
+	*target = &string_ctype;
+	return check_assignment_types(*target, expr, typediff);
+}
+
+static int printf_fmt_pointer(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
+{
+	*target = &ptr_ctype;
+        return check_assignment_types(*target, expr, typediff);
+}
+
+static int printf_fmt_print_pointer(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
+{
+	int ret;
+	*target = &ptr_ctype;
+	ret =check_assignment_types(*target, expr, typediff);
+	if (ret == 0) {
+		/* if just printing, ignore address-space mismatches */
+		if (strcmp(*typediff, "different address spaces") == 0)
+			ret = 1;
+	}
+	return ret;
+}
+
+static struct format_type printf_fmt_ptr_ref = { "p", .test = printf_fmt_pointer, };
+
+static struct expression *get_expression_n(struct expression_list *args, int nr)
+{
+	return ptr_list_nth_entry((struct ptr_list *)args, nr);
+}
+
+static int is_float_spec(char t)
+{
+	return t == 'f' || t == 'g' || t == 'F' || t == 'G';
+}
+
+static struct format_type *parse_printf_get_fmt(struct format_type *type, const char *msg, const char **msgout)
+{
+	const char *ptr = msg;
+	int szmod=0;
+
+	type->test = NULL;
+	*msgout = ptr;
+
+	if (*ptr == 's') {
+		ptr++;
+		type->test = printf_fmt_string;
+	} else if (*ptr == 'c') {
+		ptr++;
+		type->test = printf_fmt_numtype;
+		type->data = &char_ctype;
+	} else if (*ptr == 'p') {
+		ptr++;
+		type->test = printf_fmt_print_pointer;
+		//todo - check if there's anything after these?
+		if (*ptr == 'x' || *ptr == 'X') {
+			ptr++;
+		} else if (isalpha(*ptr)) {
+			// probably sxomething that /is/ being de-referenced
+			ptr++;
+			type->test = printf_fmt_pointer;
+		}
+	} else if (*ptr == 'z') {
+		ptr++;
+		if (*ptr == 'd') {
+			ptr++;
+			type->test = printf_fmt_numtype;
+			type->data = &long_ctype;
+		} else if (*ptr == 'u' || *ptr == 'x') {
+			ptr++;
+			type->test = printf_fmt_numtype;
+			type->data = &ulong_ctype;
+		}
+	} else {
+		if (*ptr == 'l') {
+			szmod++;
+			ptr++;
+			if (*ptr == 'l') {
+				szmod++;
+				ptr++;
+			}
+		} else {
+			if (*ptr == 'h') { // short/char to int
+				szmod = -1;
+				ptr++;
+				if (*ptr == 'h')  // promotion from char
+					ptr++;
+			}
+			if (*ptr == 't') {  // ptrdiff_t
+				szmod = 2;
+				ptr++;
+			}
+			if (*ptr == 'j') { // intmax_t
+				// todo - replace iwth intmax_ctype when added
+				szmod = 1;
+				ptr++;
+			}
+		}
+
+		if (*ptr == 'x' || *ptr == 'X' || *ptr == 'u' || *ptr == 'o') {
+			ptr++;
+			type->test = printf_fmt_numtype;
+			switch (szmod) {
+			case -1:
+				type->data = &ushort_ctype;
+				break;
+			case 0:
+				type->data = &uint_ctype;
+				break;
+			case 1:
+				type->data = &ulong_ctype;
+				break;
+			case 2:
+				type->data = &ullong_ctype;
+				break;
+			default:
+				type->test = NULL;
+			}
+		} else if (*ptr == 'i' || *ptr == 'd') {
+			ptr++;
+			type->test = printf_fmt_numtype;
+			switch (szmod) {
+			case -1:
+				type->data = &short_ctype;
+				break;
+			case 0:
+				type->data = &int_ctype;
+				break;
+			case 1:
+				type->data = &long_ctype;
+				break;
+			case 2:
+				type->data = &llong_ctype;
+				break;
+			default:
+				type->test = NULL;
+			}
+		} else if (*ptr == 'L' && is_float_spec(ptr[1])) {
+			type->test = printf_fmt_numtype;
+			type->data = &ldouble_ctype;
+			ptr += 2;
+		} else if (is_float_spec(*ptr)) {
+			type->test = printf_fmt_numtype;
+			type->data = &double_ctype;
+			ptr++;
+		} else if (*ptr == 'n') {	/* pointer to an de-referenced int/etc */
+			// todo - we should construct pointer to int/etc //
+			// also should not have any flags or widths for this
+			type->test = printf_fmt_pointer;
+			ptr++;
+		} else {
+			// anything else here?
+		}
+	}
+
+	if (type->test == NULL)
+		return NULL;
+
+	*msgout = ptr;
+	return type;
+}
+
+static int is_printf_flag(char ch)
+{
+	return ch == '0' || ch == '+' || ch == '-' || ch == ' ' || ch == '#';
+}
+
+static int printf_check_position(const char **fmt)
+{
+	const char *ptr= *fmt;
+
+	if (!isdigit(*ptr))
+		return -1;
+	while (isdigit(*ptr))
+		ptr++;
+	if (*ptr == '$') {
+		const char *pos = *fmt;
+		*fmt = ptr+1;
+		return strtoul(pos, NULL, 10);
+	}
+	return -1;
+}
+
+static void parse_format_printf_checkpos(struct format_state *state, const char *which)
+{
+	if (state->used_position)
+		warning(state->expr->pos,
+			"format %d: %s: no position specified",
+			state->arg_index-1, which);
+}
+
+static int parse_format_printf_argfield(const char **fmtptr, struct format_state *state, struct expression_list *args, int *pos, const char *which)
+{
+	struct expression *expr;
+	struct symbol *ctype;
+	const char *fmt = *fmtptr;
+	int argpos = -1;
+
+	/* check for simple digit-string width/precision specifier first */
+	if (*fmt != '*') {
+		while (isdigit(*fmt))
+			fmt++;
+		*fmtptr = fmt;
+		return 0;
+	}
+
+	fmt++;
+	argpos = printf_check_position(&fmt);
+
+	if (argpos > 0) {
+		argpos += state->va_start - 1;
+		state->used_position = 1;
+	} else {
+		argpos = (*pos)++;
+		state->arg_index++;
+		parse_format_printf_checkpos(state, which);
+	}
+
+	*fmtptr = fmt;
+	expr = get_expression_n(args, argpos-1);
+	if (!expr) {
+		warning(state->expr->pos, "%s: no argument at position %d", which, argpos);
+		return 1;
+	}
+
+	/* check the vale we got was int/uint type */
+	ctype = evaluate_expression(expr);
+	if (ctype) {
+		struct symbol *source, *target = &int_ctype;
+
+		source = degenerate(expr);
+
+		if (source != &int_ctype && source != &uint_ctype) {
+			warning(expr->pos, "incorrect type for %s argument %d", which, argpos);
+			info(expr->pos, "   expected %s", show_typename(target));
+			info(expr->pos, "   got %s", show_typename(source));
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * printf format parsing code
+ *
+ * this code currently does not:
+ * - check castable types (such as int vs long vs long long)
+ * - validate all arguments specified are also used...
+ */
+static int parse_format_printf(const char **fmtstring,
+			       struct format_state *state,
+			       struct expression_list *args)
+{
+	struct format_type ftype;
+	struct format_type *type;
+	struct expression *expr;
+	const char *fmt = *fmtstring;
+	const char *fmtpost = NULL;
+	int pos = state->arg_index;
+	int error = 0;
+	int ret;
+
+	if (!fmt) {
+		warning(state->expr->pos, "no format string passed");
+		return -1;
+	}
+
+	/* trivial check for %% */
+	fmt++;
+	if (fmt[0] == '%') {
+		*fmtstring = fmt+1;
+		return 0;
+	}
+
+	state->arg_index++;
+	state->fmt_index++;
+
+	ret = printf_check_position(&fmt);
+	if (ret == 0) {
+		/* we got an invalid position argument */
+		error++;
+	} else if (ret < 0) {
+		parse_format_printf_checkpos(state, "position");
+	} else {
+		state->used_position = 1;
+		pos = ret + state->va_start - 1;
+	}
+
+	/* get rid of any formatting flag bits */
+	while (is_printf_flag(*fmt))
+		fmt++;
+
+	/* now there is the posibility of a width specifier */
+	if (parse_format_printf_argfield(&fmt, state, args, &pos, "width"))
+		error++;
+
+	/* now we might have the precision specifier */
+	if (*fmt == '.') {
+		fmt++;
+		if (parse_format_printf_argfield(&fmt, state, args, &pos, "position"))
+			error++;
+	}
+
+	type = parse_printf_get_fmt(&ftype, fmt, &fmtpost);
+
+	if (!type && fmt[0] == 'p')
+		type = &printf_fmt_ptr_ref;	/* probably some extension */
+
+	if (type) {
+		struct symbol *ctype, *source, *target = NULL;
+		const char *typediff = "different types";
+		int ret;
+
+		*fmtstring = fmtpost;
+		expr = get_expression_n(args, pos-1);
+		if (!expr) {
+			/* no argument, but otherwise valid argument string */
+			warning(state->expr->pos, "no argument at position '%d'", pos);
+			return 0;
+		}
+
+		ctype = evaluate_expression(expr);
+		if (!ctype)
+			return -3;
+
+		source = degenerate(expr);
+		ret = (type->test)(type, &expr, ctype, &target, &typediff);
+		if (!target)	/* shouldn't happen, but catch anyway */
+			return -4;
+
+		if (ret == 0) {
+			warning(expr->pos, "incorrect type in argument %d (%s)", pos, typediff);
+			info(expr->pos, "   expected %s", show_typename(target));
+			info(expr->pos, "   got %s", show_typename(source));
+		}
+	} else {
+		/* try and find the end of this */
+		fmtpost = *fmtstring;
+		while (*fmtpost > ' ')
+			fmtpost++;
+		warning(state->expr->pos, "cannot evaluate type '%.*s'",
+			(int)(fmtpost - *fmtstring), *fmtstring);
+		*fmtstring += 1;
+		return -1;
+	}
+
+	return 1;
+}
+
+static const char *get_printf_fmt(struct symbol *fn, struct expression_list *head)
+{
+	struct expression *expr;
+	const char *fmt_string = NULL;
+
+	expr = get_expression_n(head, fn->ctype.printf_msg-1);
+	if (!expr)
+		return NULL;
+	if (expr->string && expr->string->length)
+		fmt_string = expr->string->data;
+	if (!fmt_string) {
+		struct symbol *sym = evaluate_expression(expr);
+
+		/* attempt to find initialiser for this */
+		if (sym && sym->initializer && sym->initializer->string)
+			fmt_string = sym->initializer->string->data;
+	}
+
+	return fmt_string;
+}
+
+/*
+ * attempt to run through a printf format string and work out the types
+ * it specifies. The format is parsed from the __attribute__(format())
+ * in the parser code which stores the positions of the message and arg
+ * start in the ctype.
+ */
+static void evaluate_format_printf(const char *fmt_string, struct symbol *fn, struct expression_list *head)
+{
+	struct format_state state = { };
+	struct expression *expr;
+
+	expr = get_expression_n(head, fn->ctype.printf_msg-1);
+	if (!expr)
+		return;
+
+	state.expr = expr;
+	state.va_start = fn->ctype.printf_va_start;
+	state.arg_index = fn->ctype.printf_va_start;
+
+	if (!fmt_string) {
+		warning(expr->pos, "not a format string?");
+	} else {
+		const char *string = fmt_string;
+		int fail = 0;
+
+		for (; string[0] != '\0'; string++) {
+			if (string[0] != '%')
+				continue;
+			if (parse_format_printf(&string, &state, head) < 0)
+				fail++;
+			string--;
+		}
+
+		if (fail > 0)
+			/* format string may have '\n' etc embedded in it */
+			warning(expr->pos, "cannot evaluate format string");
+	}
+}
+
 static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 {
 	struct expression *expr;
 	struct symbol_list *argument_types = fn->arguments;
+	const char *fmt_string = NULL;
 	struct symbol *argtype;
 	int i = 1;
 
+	/*
+	 * do this first, otherwise the arugment info may get lost or changed
+	 * later on in the evaluation loop by degenerate()
+	 */
+	if (fn->ctype.printf_va_start)
+		fmt_string = get_printf_fmt(fn, head);
+
 	PREPARE_PTR_LIST(argument_types, argtype);
 	FOR_EACH_PTR (head, expr) {
 		struct expression **p = THIS_ADDRESS(expr);
@@ -2362,6 +2801,10 @@ static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 		NEXT_PTR_LIST(argtype);
 	} END_FOR_EACH_PTR(expr);
 	FINISH_PTR_LIST(argtype);
+
+	if (fn->ctype.printf_va_start)
+		evaluate_format_printf(fmt_string, fn, head);
+
 	return 1;
 }
 
-- 
2.23.0


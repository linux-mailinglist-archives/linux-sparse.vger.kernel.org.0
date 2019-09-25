Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA02EBDB97
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2019 12:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732908AbfIYKAU (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 06:00:20 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:42946 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732743AbfIYKAU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 06:00:20 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iD45o-000249-PD; Wed, 25 Sep 2019 11:00:16 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iD45o-0008Dj-54; Wed, 25 Sep 2019 11:00:16 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-sparse@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 2/5] parse: initial parsing of __attribute__((format))
Date:   Wed, 25 Sep 2019 11:00:12 +0100
Message-Id: <20190925100015.31510-3-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add code to parse the __attribute__((format)) used to indicate that
a variadic function takes a printf-style format string and where
those are. Save the data in ctype ready for checking when such an
function is encoutered.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Fixes since v1:
- moved to using ctype in base_type to store infromation
- fixed formatting issues
- updated check for bad format arguments
- reduced the line count to unsigned short to save space

Fixes since v2:
- correctly use the decl->ctype to store printf information
- fixed issues with checking format positions for va_list code
- parse but ignore scanf formatting for now

Fixes since v4:
- deal with function pointers losing format info

Fixes since v5:
- remove function pointer attribute support
---
 parse.c  | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 symbol.h |  2 ++
 2 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/parse.c b/parse.c
index f291e24..583a82c 100644
--- a/parse.c
+++ b/parse.c
@@ -87,7 +87,7 @@ static attr_t
 	attribute_address_space, attribute_context,
 	attribute_designated_init,
 	attribute_transparent_union, ignore_attribute,
-	attribute_mode, attribute_force;
+	attribute_mode, attribute_force, attribute_format;
 
 typedef struct symbol *to_mode_t(struct symbol *);
 
@@ -136,6 +136,11 @@ static void asm_modifier_inline(struct token *token, unsigned long *mods)
 	asm_modifier(token, mods, MOD_INLINE);
 }
 
+/* the types of printf style formatting from __attribute__((format)) */
+enum {
+	FmtPrintf = 0, FmtScanf,
+};
+
 static struct symbol_op typedef_op = {
 	.type = KW_MODIFIER,
 	.declarator = typedef_specifier,
@@ -386,6 +391,10 @@ static struct symbol_op attr_force_op = {
 	.attribute = attribute_force,
 };
 
+static struct symbol_op attr_format = {
+	.attribute = attribute_format,
+};
+
 static struct symbol_op address_space_op = {
 	.attribute = attribute_address_space,
 };
@@ -445,6 +454,16 @@ static struct symbol_op mode_word_op = {
 	.to_mode = to_word_mode
 };
 
+static struct symbol_op attr_printf_op = {
+	.type	= KW_FORMAT,
+	.class	= FmtPrintf,
+};
+
+static struct symbol_op attr_scanf_op = {
+	.type	= KW_FORMAT,
+	.class	= FmtScanf,
+};
+
 /* Using NS_TYPEDEF will also make the keyword a reserved one */
 static struct init_keyword {
 	const char *name;
@@ -570,6 +589,10 @@ static struct init_keyword {
 	{"externally_visible",	NS_KEYWORD,	.op = &ext_visible_op },
 	{"__externally_visible__",	NS_KEYWORD,	.op = &ext_visible_op },
 
+	{ "format",	NS_KEYWORD,	.op = &attr_format },
+	{ "printf",	NS_KEYWORD,	.op = &attr_printf_op },
+	{ "scanf",	NS_KEYWORD,	.op = &attr_scanf_op },
+
 	{ "mode",	NS_KEYWORD,	.op = &mode_op },
 	{ "__mode__",	NS_KEYWORD,	.op = &mode_op },
 	{ "QI",		NS_KEYWORD,	.op = &mode_QI_op },
@@ -1172,6 +1195,59 @@ static struct token *attribute_address_space(struct token *token, struct symbol
 	return token;
 }
 
+static int invalid_printf_format_args(long long start, long long at)
+{
+	return start < 0 || at < 0 || (start == at && start > 0) ||
+		(start == 0 && at == 0);
+}
+
+static struct token *attribute_format(struct token *token, struct symbol *attr, struct decl_state *ctx)
+{
+	struct expression *args[3];
+	struct symbol *fmt_sym = NULL;
+
+	/* expecting format ( type, start, va_args at) */
+
+	token = expect(token, '(', "after format attribute");
+	if (token_type(token) == TOKEN_IDENT)
+		fmt_sym = lookup_keyword(token->ident, NS_KEYWORD);
+	if (fmt_sym)
+		if (!fmt_sym->op || fmt_sym->op->type != KW_FORMAT)
+			fmt_sym = NULL;
+
+	token = conditional_expression(token, &args[0]);
+	token = expect(token, ',', "format attribute type");
+	token = conditional_expression(token, &args[1]);
+	token = expect(token, ',', "format attribute type position");
+	token = conditional_expression(token, &args[2]);
+	token = expect(token, ')', "format attribute arg position");
+
+	if (!fmt_sym || !args[0] || !args[1] || !args[2]) {
+		warning(token->pos, "incorrect format attribute");
+	} else if (fmt_sym->op->class != FmtPrintf) {
+		/* skip anything that isn't printf for the moment */
+		warning(token->pos, "only printf format attribute supported");
+	} else {
+		long long start, at;
+
+		start = get_expression_value(args[2]);
+		at = get_expression_value(args[1]);
+
+		if (invalid_printf_format_args(start, at)) {
+			warning(token->pos, "bad format positions");
+		} else if (start == 0) {
+			/* nothing to do here, is va_list function */
+		} else if (start < at) {
+			warning(token->pos, "format cannot be after va_args");
+		} else {
+			ctx->ctype.printf_va_start = start;
+			ctx->ctype.printf_msg = at;
+		}
+	}
+
+	return token;
+}
+
 static struct symbol *to_QI_mode(struct symbol *ctype)
 {
 	if (ctype->ctype.base_type != &int_type)
@@ -2981,6 +3057,9 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
 
 		if (!(decl->ctype.modifiers & MOD_STATIC))
 			decl->ctype.modifiers |= MOD_EXTERN;
+
+		base_type->ctype.printf_msg = decl->ctype.printf_msg;
+		base_type->ctype.printf_va_start = decl->ctype.printf_va_start;
 	} else if (base_type == &void_ctype && !(decl->ctype.modifiers & MOD_EXTERN)) {
 		sparse_error(token->pos, "void declaration");
 	}
diff --git a/symbol.h b/symbol.h
index ac43b31..7bb6f29 100644
--- a/symbol.h
+++ b/symbol.h
@@ -86,6 +86,7 @@ enum keyword {
 	KW_SHORT	= 1 << 7,
 	KW_LONG		= 1 << 8,
 	KW_EXACT	= 1 << 9,
+	KW_FORMAT	= 1 << 10,
 };
 
 struct context {
@@ -103,6 +104,7 @@ struct ctype {
 	struct context_list *contexts;
 	struct ident *as;
 	struct symbol *base_type;
+	unsigned short printf_va_start, printf_msg;
 };
 
 struct decl_state {
-- 
2.23.0


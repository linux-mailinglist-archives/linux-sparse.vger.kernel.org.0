Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74132F81D3
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 22:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbfKKVDM (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 16:03:12 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46013 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfKKVDL (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 16:03:11 -0500
Received: by mail-wr1-f67.google.com with SMTP id z10so10882733wrs.12
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 13:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cFfs/otT5CFJY0cAzzD/hSAIiXnI/nUXLhpsi67iLu8=;
        b=Dv12bX9k9m8PnL2g1DLAEdmBLFWJL5jqmKVl+7dStrVvMby2gAY4U5swFgFbhyayfP
         kPAeRUeig2AivMl2ZYgo2VxgupRYh/GzmYEW0DvyXwHqwhl4qWoaGb2wx1xp5+0ZLRPW
         4xTIPdR/zbr/VaoaT5bQX86PWU15xb7QO3EI9TMVnfKXxc81go/3TVYjawcYaq8KfxZV
         MCsThQoGwHMZeL4iNzCMK1b+dQ8QSiQy3cLKlBdB0StRkx0E7hI4Sdn3Kfgsw2Pzzmk+
         VYHgyHCDgy6ijG2VywXNL+QIBnNi6c1RPViCH+PMlU8LftjWLry9idHf5dmusMHely7p
         xf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cFfs/otT5CFJY0cAzzD/hSAIiXnI/nUXLhpsi67iLu8=;
        b=IvLcgl04FA7L9p5nW0VMOgM7+rVC5b3uO++BrnLytnrL9Gx93qwS8a3oMNdaCOKeek
         acqN9Zo+hUQjFLKH9KcJssggP3sCtElcK+FFD5w04KjmzjCZifh8E50yn2XMjwU75iiW
         IXmbGNoNJ16BTG1ND1LNXCqOGZLJ2HNUxDU55BnLrD8qDjapWYAl95ZMxHotf7r2FE/G
         MIs4rSDYtm9PovJ5ts/bvdN/wKYbSDcnwQe99WX6aTM68KKtAuieZ5dgzXYVuua1URLx
         TnX52xaNt2YTclllAU1rJN5tqfNftsOExZjRrPLiYQ4S8XqqtnuYh49x9yzV8ZqnlbJb
         vwOQ==
X-Gm-Message-State: APjAAAWEVk6LlSrB3diENtPCpbWimYP1HWW+Wr/yljA/l/VVXsl1jOvM
        3PDGwkAi+CSaaikC6LYeU3z/F3lY
X-Google-Smtp-Source: APXvYqzHBznfbVITNyJt42QXeXVSSyolK71nfkAZRTAbpIdiOeKqhzvZcx5bHlt39bm2BZfT1FMm0A==
X-Received: by 2002:a5d:5262:: with SMTP id l2mr7834377wrc.315.1573506188338;
        Mon, 11 Nov 2019 13:03:08 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:45ed:7f96:7534:3931])
        by smtp.gmail.com with ESMTPSA id z189sm694734wmc.25.2019.11.11.13.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 13:03:07 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] spec: get rid of all specifier MOD_XXX
Date:   Mon, 11 Nov 2019 22:03:02 +0100
Message-Id: <20191111210302.14172-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Modifiers like MOD_CHAR, MOD_LONG, ... are used to keep track
of the size/rank of integers and floats. But this is problematic:
* they use 5 of the precious modifiers bits
* they're not really modifiers but the base of the primitive types
* a 'long double' has MOD_LONGLONG set

Change this by using instead the explicit notion of 'rank'.
The advanatges are:
* using only 3 bits (in struct symbol)
* free 5 modifier bits
* follow closely the definition & rules of the standard
* things like integer promotion are slightly simpler.

Note: this is somewhat experimental as I'm not yet convinced
      that everything is correct (but the testsuite is OK
      and gives the same result for a defconfig + allyesconfig
      build of the kernel).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c   | 21 +++++-------
 expand.c     | 11 +++----
 gdbhelpers   | 15 ---------
 parse.c      | 12 +++----
 show-parse.c |  5 ---
 symbol.c     | 93 ++++++++++++++++++++++++++++------------------------
 symbol.h     | 16 ++++-----
 7 files changed, 77 insertions(+), 96 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 7c3389cff..8e3dfe6f9 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -150,7 +150,7 @@ static inline struct symbol *integer_promotion(struct symbol *type)
 		return &int_ctype;
 
 	/* If char/short has as many bits as int, it still gets "promoted" */
-	if (mod & (MOD_CHAR | MOD_SHORT)) {
+	if (type->rank < 0) {
 		if (mod & MOD_UNSIGNED)
 			return &uint_ctype;
 		return &int_ctype;
@@ -196,7 +196,7 @@ static struct symbol *bigger_int_type(struct symbol *left, struct symbol *right)
 	if ((lmod ^ rmod) & MOD_UNSIGNED) {
 		if (lmod & MOD_UNSIGNED)
 			goto left;
-	} else if ((lmod & ~rmod) & (MOD_LONG_ALL))
+	} else if (left->rank > right->rank)
 		goto left;
 right:
 	left = right;
@@ -557,9 +557,7 @@ Normal:
 		else
 			return rtype;
 	} else if (rclass & TYPE_FLOAT) {
-		unsigned long lmod = ltype->ctype.modifiers;
-		unsigned long rmod = rtype->ctype.modifiers;
-		if (rmod & ~lmod & (MOD_LONG_ALL))
+		if (rtype->rank > ltype->rank)
 			return rtype;
 		else
 			return ltype;
@@ -798,12 +796,12 @@ const char *type_difference(struct ctype *c1, struct ctype *c2,
 				return "different address spaces";
 			if (base1 != base2)
 				return "different base types";
+			if (t1->rank != t2->rank)
+				return "different type sizes";
 			diff = (mod1 ^ mod2) & ~MOD_IGNORE;
 			if (!diff)
 				return NULL;
-			if (diff & MOD_SIZE)
-				return "different type sizes";
-			else if (diff & ~MOD_SIGNEDNESS)
+			if (diff & ~MOD_SIGNEDNESS)
 				return "different modifiers";
 			else
 				return "different signedness";
@@ -1391,9 +1389,9 @@ static int whitelist_pointers(struct symbol *t1, struct symbol *t2)
 		return 0;
 	if (t1 == t2)
 		return 1;
-	if (t1->ctype.modifiers & t2->ctype.modifiers & MOD_CHAR)
+	if (t1->rank == -2 && t2->rank == -2)
 		return 1;
-	if ((t1->ctype.modifiers ^ t2->ctype.modifiers) & MOD_SIZE)
+	if (t1->rank != t2->rank)
 		return 0;
 	return !Wtypesign;
 }
@@ -2344,8 +2342,7 @@ static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 			if (is_int(class)) {
 				*p = cast_to(expr, integer_promotion(type));
 			} else if (class & TYPE_FLOAT) {
-				unsigned long mod = type->ctype.modifiers;
-				if (!(mod & (MOD_LONG_ALL)))
+				if (type->rank < 0)
 					*p = cast_to(expr, &double_ctype);
 			} else if (class & TYPE_PTR) {
 				if (expr->ctype == &null_ctype)
diff --git a/expand.c b/expand.c
index d66375f44..ae764153d 100644
--- a/expand.c
+++ b/expand.c
@@ -161,9 +161,8 @@ Float:
 	else
 		expr->fvalue = old->fvalue;
 
-	if (!(newtype->ctype.modifiers & MOD_LONGLONG) && \
-	    !(newtype->ctype.modifiers & MOD_LONGLONGLONG)) {
-		if ((newtype->ctype.modifiers & MOD_LONG))
+	if (newtype->rank <= 0) {
+		if (newtype->rank == 0)
 			expr->fvalue = (double)expr->fvalue;
 		else
 			expr->fvalue = (float)expr->fvalue;
@@ -358,7 +357,7 @@ static int simplify_cmp_binop(struct expression *expr, struct symbol *ctype)
 static int simplify_float_binop(struct expression *expr)
 {
 	struct expression *left = expr->left, *right = expr->right;
-	unsigned long mod = expr->ctype->ctype.modifiers;
+	int rank = expr->ctype->rank;
 	long double l, r, res;
 
 	if (left->type != EXPR_FVALUE || right->type != EXPR_FVALUE)
@@ -367,7 +366,7 @@ static int simplify_float_binop(struct expression *expr)
 	l = left->fvalue;
 	r = right->fvalue;
 
-	if (mod & MOD_LONGLONG) {
+	if (rank > 0) {
 		switch (expr->op) {
 		case '+':	res = l + r; break;
 		case '-':	res = l - r; break;
@@ -376,7 +375,7 @@ static int simplify_float_binop(struct expression *expr)
 				res = l / r; break;
 		default: return 0;
 		}
-	} else if (mod & MOD_LONG) {
+	} else if (rank == 0) {
 		switch (expr->op) {
 		case '+':	res = (double) l + (double) r; break;
 		case '-':	res = (double) l - (double) r; break;
diff --git a/gdbhelpers b/gdbhelpers
index 8d186cee7..9488a6070 100644
--- a/gdbhelpers
+++ b/gdbhelpers
@@ -119,21 +119,6 @@ define gdb_show_ctype
 	if ($arg0->modifiers & MOD_UNSIGNED)
 		printf "MOD_UNSIGNED "
 	end
-	if ($arg0->modifiers & MOD_CHAR)
-		printf "MOD_CHAR "
-	end
-	if ($arg0->modifiers & MOD_SHORT)
-		printf "MOD_SHORT "
-	end
-	if ($arg0->modifiers & MOD_LONG)
-		printf "MOD_LONG "
-	end
-	if ($arg0->modifiers & MOD_LONGLONG)
-		printf "MOD_LONGLONG "
-	end
-	if ($arg0->modifiers & MOD_LONGLONGLONG)
-		printf "MOD_LONGLONGLONG "
-	end
 	if ($arg0->modifiers & MOD_INLINE)
 		printf "MOD_INLINE "
 	end
diff --git a/parse.c b/parse.c
index 46136ec66..ccd836f67 100644
--- a/parse.c
+++ b/parse.c
@@ -255,7 +255,6 @@ static struct symbol_op int_op = {
 	.type = KW_SPECIFIER,
 	.test = Set_T,
 	.set = Set_T|Set_Int,
-	.class = CInt,
 };
 
 static struct symbol_op double_op = {
@@ -276,7 +275,6 @@ static struct symbol_op short_op = {
 	.type = KW_SPECIFIER,
 	.test = Set_S|Set_Char|Set_Float|Set_Double|Set_Long|Set_Short,
 	.set = Set_Short,
-	.class = CInt,
 };
 
 static struct symbol_op signed_op = {
@@ -1624,12 +1622,12 @@ static struct token *declaration_specifiers(struct token *token, struct decl_sta
 			}
 			seen |= s->op->set;
 			class += s->op->class;
+			if (s->op->set & Set_Int128)
+				rank = 3;
+			else if (s->op->set & Set_Char)
+				rank = -2;
 			if (s->op->set & (Set_Short|Set_Float)) {
 				rank = -1;
-			} else if (s->op->set & Set_Char) {
-				rank = -2;
-			} else if (s->op->set & Set_Int128) {
-				rank = 3;
 			} else if (s->op->set & Set_Long && rank++) {
 				if (class == CReal) {
 					specifier_conflict(token->pos,
@@ -2823,7 +2821,7 @@ static struct token *parse_function_body(struct token *token, struct symbol *dec
 static void promote_k_r_types(struct symbol *arg)
 {
 	struct symbol *base = arg->ctype.base_type;
-	if (base && base->ctype.base_type == &int_type && (base->ctype.modifiers & (MOD_CHAR | MOD_SHORT))) {
+	if (base && base->ctype.base_type == &int_type && base->rank < 0) {
 		arg->ctype.base_type = &int_ctype;
 	}
 }
diff --git a/show-parse.c b/show-parse.c
index 1c0ecf7e9..a0436cbe0 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -128,11 +128,6 @@ const char *modifier_string(unsigned long mod)
 		{MOD_ATOMIC,		"[atomic]"},
 		{MOD_SIGNED,		"[signed]"},
 		{MOD_UNSIGNED,		"[unsigned]"},
-		{MOD_CHAR,		"[char]"},
-		{MOD_SHORT,		"[short]"},
-		{MOD_LONG,		"[long]"},
-		{MOD_LONGLONG,		"[long long]"},
-		{MOD_LONGLONGLONG,	"[long long long]"},
 		{MOD_TLS,		"[tls]"},
 		{MOD_INLINE,		"inline"},
 		{MOD_ADDRESSABLE,	"[addressable]"},
diff --git a/symbol.c b/symbol.c
index c032d6d90..9d65be436 100644
--- a/symbol.c
+++ b/symbol.c
@@ -221,6 +221,7 @@ static struct symbol *examine_base_type(struct symbol *sym)
 	if (base_type->type == SYM_NODE) {
 		base_type = base_type->ctype.base_type;
 		sym->ctype.base_type = base_type;
+		sym->rank = base_type->rank;
 	}
 	return base_type;
 }
@@ -299,7 +300,7 @@ static int count_array_initializer(struct symbol *t, struct expression *expr)
 	 * on T - if it's a character type, we get the length of string literal
 	 * (including NUL), otherwise we have one element here.
 	 */
-	if (t->ctype.base_type == &int_type && t->ctype.modifiers & MOD_CHAR)
+	if (t->ctype.base_type == &int_type && t->rank == -2)
 		is_char = 1;
 
 	switch (expr->type) {
@@ -416,6 +417,7 @@ static struct symbol * examine_node_type(struct symbol *sym)
 	}
 	
 	sym->bit_size = bit_size;
+	sym->rank = base_type->rank;
 	return sym;
 }
 
@@ -561,6 +563,7 @@ void create_fouled(struct symbol *type)
 		struct symbol *new = alloc_symbol(type->pos, type->type);
 		*new = *type;
 		new->bit_size = bits_in_int;
+		new->rank = 0;
 		new->type = SYM_FOULED;
 		new->ctype.base_type = type;
 		add_symbol(&restr, type);
@@ -730,63 +733,60 @@ static int bits_in_type32 = 32;
 static int bits_in_type64 = 64;
 static int bits_in_type128 = 128;
 
-#define MOD_ESIGNED (MOD_SIGNED | MOD_EXPLICITLY_SIGNED)
-#define MOD_LL (MOD_LONG | MOD_LONGLONG)
-#define MOD_LLL MOD_LONGLONGLONG
-
-#define T_BASETYPE      SYM_BASETYPE, 0, NULL, NULL, NULL
-#define T_INT(R, S, M)  SYM_BASETYPE, (R|M), &bits_in_##S, &max_int_alignment, &int_type
+#define T_BASETYPE      SYM_BASETYPE, 0, 0, NULL, NULL, NULL
+#define T_INT(R, S, M)  SYM_BASETYPE, M, R, &bits_in_##S, &max_int_alignment, &int_type
 #define T__INT(R, S)    T_INT(R, S, MOD_SIGNED)
 #define T_SINT(R, S)    T_INT(R, S, MOD_ESIGNED)
-#define T_UINT(R, S)    T_INT(R, S, MOD_UNSIGNED)
-#define T_FLOAT_(R,S,A) SYM_BASETYPE, R, &bits_in_##S, A, &fp_type
+#define T_UINT(R,S)     T_INT(R, S, MOD_UNSIGNED)
+#define T_FLOAT_(R,S,A) SYM_BASETYPE, 0, R, &bits_in_##S, A, &fp_type
 #define T_FLOAT(R, S)   T_FLOAT_(R, S, &max_fp_alignment)
-#define T_PTR(B)        SYM_PTR, 0, &bits_in_pointer, &pointer_alignment, B
-#define T_NODE(M,B,S,A) SYM_NODE, M, S, A, B
+#define T_PTR(B)        SYM_PTR, 0, 0, &bits_in_pointer, &pointer_alignment, B
+#define T_NODE(M,B,S,A) SYM_NODE, M, 0, S, A, B
 #define T_CONST(B,S,A)  T_NODE(MOD_CONST, B, S, A)
 
 static const struct ctype_declare {
 	struct symbol *ptr;
 	enum type type;
 	unsigned long modifiers;
+	int rank;
 	int *bit_size;
 	int *maxalign;
 	struct symbol *base_type;
 } ctype_declaration[] = {
-	{ &bool_ctype,         T_INT(0,          bool, MOD_UNSIGNED) },
+	{ &bool_ctype,         T_INT(-3, bool, MOD_UNSIGNED) },
 	{ &void_ctype,         T_BASETYPE },
 	{ &type_ctype,         T_BASETYPE },
 	{ &incomplete_ctype,   T_BASETYPE },
 	{ &bad_ctype,          T_BASETYPE },
 
-	{ &char_ctype,         T__INT(MOD_CHAR,  char) },
-	{ &schar_ctype,        T_SINT(MOD_CHAR,  char) },
-	{ &uchar_ctype,        T_UINT(MOD_CHAR,  char) },
-	{ &short_ctype,        T__INT(MOD_SHORT, short) },
-	{ &sshort_ctype,       T_SINT(MOD_SHORT, short) },
-	{ &ushort_ctype,       T_UINT(MOD_SHORT, short) },
-	{ &int_ctype,          T__INT(0,         int) },
-	{ &sint_ctype,         T_SINT(0,         int) },
-	{ &uint_ctype,         T_UINT(0,         int) },
-	{ &long_ctype,         T__INT(MOD_LONG,  long) },
-	{ &slong_ctype,        T_SINT(MOD_LONG,  long) },
-	{ &ulong_ctype,        T_UINT(MOD_LONG,  long) },
-	{ &llong_ctype,        T__INT(MOD_LL,    llong) },
-	{ &sllong_ctype,       T_SINT(MOD_LL,    llong) },
-	{ &ullong_ctype,       T_UINT(MOD_LL,    llong) },
-	{ &lllong_ctype,       T__INT(MOD_LLL,   lllong) },
-	{ &slllong_ctype,      T_SINT(MOD_LLL,   lllong) },
-	{ &ulllong_ctype,      T_UINT(MOD_LLL,   lllong) },
-
-	{ &float_ctype,        T_FLOAT(0,        float) },
-	{ &double_ctype,       T_FLOAT(MOD_LONG, double) },
-	{ &ldouble_ctype,      T_FLOAT(MOD_LL,   ldouble) },
-
-	{ &float32_ctype,      T_FLOAT(0,        type32) },
-	{ &float32x_ctype,     T_FLOAT(MOD_LONG, double) },
-	{ &float64_ctype,      T_FLOAT(MOD_LONG, type64) },
-	{ &float64x_ctype,     T_FLOAT(MOD_LONG, ldouble) },
-	{ &float128_ctype,     T_FLOAT_(MOD_LL,  type128, &max_alignment) },
+	{ &char_ctype,         T__INT(-2, char) },
+	{ &schar_ctype,        T_SINT(-2, char) },
+	{ &uchar_ctype,        T_UINT(-2, char) },
+	{ &short_ctype,        T__INT(-1, short) },
+	{ &sshort_ctype,       T_SINT(-1, short) },
+	{ &ushort_ctype,       T_UINT(-1, short) },
+	{ &int_ctype,          T__INT( 0, int) },
+	{ &sint_ctype,         T_SINT( 0, int) },
+	{ &uint_ctype,         T_UINT( 0, int) },
+	{ &long_ctype,         T__INT( 1, long) },
+	{ &slong_ctype,        T_SINT( 1, long) },
+	{ &ulong_ctype,        T_UINT( 1, long) },
+	{ &llong_ctype,        T__INT( 2, llong) },
+	{ &sllong_ctype,       T_SINT( 2, llong) },
+	{ &ullong_ctype,       T_UINT( 2, llong) },
+	{ &lllong_ctype,       T__INT( 3, lllong) },
+	{ &slllong_ctype,      T_SINT( 3, lllong) },
+	{ &ulllong_ctype,      T_UINT( 3, lllong) },
+
+	{ &float_ctype,        T_FLOAT(-1, float) },
+	{ &double_ctype,       T_FLOAT( 0, double) },
+	{ &ldouble_ctype,      T_FLOAT( 1, ldouble) },
+
+	{ &float32_ctype,      T_FLOAT(-1, type32) },
+	{ &float32x_ctype,     T_FLOAT(-1, double) },
+	{ &float64_ctype,      T_FLOAT( 0, type64) },
+	{ &float64x_ctype,     T_FLOAT( 1, ldouble) },
+	{ &float128_ctype,     T_FLOAT_(2, type128, &max_alignment) },
 
 	{ &string_ctype,       T_PTR(&char_ctype) },
 	{ &ptr_ctype,          T_PTR(&void_ctype) },
@@ -806,9 +806,6 @@ static const struct ctype_declare {
 	{ &const_char_ctype,   T_CONST(&char_ctype, &bits_in_char, &max_int_alignment)},
 	{ NULL, }
 };
-#undef MOD_LLL
-#undef MOD_LL
-#undef MOD_ESIGNED
 
 void init_ctype(void)
 {
@@ -823,10 +820,20 @@ void init_ctype(void)
 		if (alignment > maxalign)
 			alignment = maxalign;
 		sym->type = ctype->type;
+		sym->rank = ctype->rank;
 		sym->bit_size = bit_size;
 		sym->ctype.alignment = alignment;
 		sym->ctype.base_type = ctype->base_type;
 		sym->ctype.modifiers = ctype->modifiers;
+
+		if (sym->type == SYM_NODE) {
+			struct symbol *base = sym->ctype.base_type;
+			sym->rank = base->rank;
+			if (!ctype->bit_size)
+				sym->bit_size = base->bit_size;
+			if (!ctype->maxalign)
+				sym->ctype.alignment = base->ctype.alignment;
+		}
 	}
 
 	// and now some adjustments
diff --git a/symbol.h b/symbol.h
index 188291cd7..3f287f7bc 100644
--- a/symbol.h
+++ b/symbol.h
@@ -177,6 +177,7 @@ struct symbol {
 					builtin:1,
 					torename:1,
 					transparent_union:1;
+			int		rank:3;	// arithmetic's rank
 			struct expression *array_size;
 			struct ctype ctype;
 			struct symbol_list *arguments;
@@ -224,11 +225,11 @@ struct symbol {
 
      // MOD UNUSED		0x00010000
 #define MOD_USERTYPE		0x00020000
-#define MOD_CHAR		0x00040000
-#define MOD_SHORT		0x00080000
-#define MOD_LONG		0x00100000
-#define MOD_LONGLONG		0x00200000
-#define MOD_LONGLONGLONG	0x00400000
+     // MOD UNUSED		0x00040000
+     // MOD UNUSED		0x00080000
+     // MOD UNUSED		0x00100000
+     // MOD UNUSED		0x00200000
+     // MOD UNUSED		0x00400000
 
 #define MOD_SAFE		0x00800000	// non-null/non-trapping pointer
 #define MOD_PURE		0x01000000
@@ -242,10 +243,9 @@ struct symbol {
 #define MOD_ACCESS	(MOD_ASSIGNED | MOD_ADDRESSABLE)
 #define MOD_NONLOCAL	(MOD_EXTERN | MOD_TOPLEVEL)
 #define MOD_STORAGE	(MOD_AUTO | MOD_REGISTER | MOD_STATIC | MOD_EXTERN | MOD_INLINE | MOD_TOPLEVEL)
+#define MOD_ESIGNED	(MOD_SIGNED | MOD_EXPLICITLY_SIGNED)
 #define MOD_SIGNEDNESS	(MOD_SIGNED | MOD_UNSIGNED | MOD_EXPLICITLY_SIGNED)
-#define MOD_LONG_ALL	(MOD_LONG | MOD_LONGLONG | MOD_LONGLONGLONG)
-#define MOD_SPECIFIER	(MOD_CHAR | MOD_SHORT | MOD_LONG_ALL | MOD_SIGNEDNESS)
-#define MOD_SIZE	(MOD_CHAR | MOD_SHORT | MOD_LONG_ALL)
+#define MOD_SPECIFIER	MOD_SIGNEDNESS
 #define MOD_IGNORE	(MOD_STORAGE | MOD_ACCESS | MOD_USERTYPE | MOD_EXPLICITLY_SIGNED | MOD_EXT_VISIBLE)
 #define	MOD_QUALIFIER	(MOD_CONST | MOD_VOLATILE | MOD_RESTRICT | MOD_ATOMIC)
 #define MOD_PTRINHERIT	(MOD_QUALIFIER | MOD_NODEREF | MOD_NORETURN | MOD_NOCAST)

base-commit: 53d3b6781687fcb6dd3dee795a2cef6eef668059
-- 
2.24.0


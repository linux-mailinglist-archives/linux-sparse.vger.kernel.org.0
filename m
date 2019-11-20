Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9134103090
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 01:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbfKTAKV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 19:10:21 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50937 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbfKTAKU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 19:10:20 -0500
Received: by mail-wm1-f65.google.com with SMTP id l17so5179894wmh.0
        for <linux-sparse@vger.kernel.org>; Tue, 19 Nov 2019 16:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/8z2egd+jrWCcqONH9VLf2BDv7gftJpBy2/Qf+PKFEo=;
        b=IfvqRdr/QCnokO6kAvbKHlANBxuQM0jfVFIR/iPxCrl6SSpYo59ZQIVRE24Q/GKRhS
         edWXunop7anypoys2ET4KagspqMDF08JxDDOtKXMC4oMu14w0IDinF8X/Xn/UB4qyaq5
         pd1CtuAxymfPGupdKsfFQQFThzbLOyZX42DgvydjfFCM3g2wqc3MMyjDKIS2H6a/gWDZ
         cHn+lP5tRNU40G6LI0ZTbNfZZnRnBuzdncvnCtStx/YpGNey7+cWI+nkAnALqSV7v/tU
         jusVXKg5lzop1OP+JYuuF4HSG8ZsQvukyV2GZ3LiSJhR04U6tlJpOgExg6/GzQIng9f+
         oNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/8z2egd+jrWCcqONH9VLf2BDv7gftJpBy2/Qf+PKFEo=;
        b=JQ4aQixE4Vy7cCxm1F+1qO24+msMydLoOVVZs1NkL5KN9AkGo4q4ssIpLD7aC1Hx5Q
         1y1kF8CA7Y3w/JsBvpM9ZKnMO615aZ7II0/Z0/qoja3rP5rA1TmX0BISCwpozzaErsrK
         9UlSt+A+eGEt0MU0mAhtOhcnsMvlG00RLMbgZsCMbj71ZhsZUuvcTd1LeNBFGMZSHOc8
         ABFZh4SS91kRbYEulJvcDcYQPYDt5RY8s7IYk2bAhLs02CF5/2CQTTOkhiCu4feCu4CL
         Z+V5glLIV/ipeRouW2qbNVbtBNGOwQH5C4LryhURTEhK9hMIP1eoyBL5l5pV5v3EyIiU
         GZ/w==
X-Gm-Message-State: APjAAAXIPBM1mOPufkTxFFEbp+Us3HmR8INpru++xEdwB0rXklVKyfXi
        mO20XZ9VwkXYRkp/+E3YfVk6zPEV
X-Google-Smtp-Source: APXvYqyVdjq3oCMhklQdoxScyKN3BW5B8DwNUPm6eJDlZvv87/FEfYSxhRSqNTk7aXsJcPB+pSHN7Q==
X-Received: by 2002:a1c:3b44:: with SMTP id i65mr55425wma.1.1574208617217;
        Tue, 19 Nov 2019 16:10:17 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:5dce:1599:e3b5:7d61])
        by smtp.gmail.com with ESMTPSA id c24sm33398808wrb.27.2019.11.19.16.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 16:10:16 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/5] propagate function modifiers only to functions
Date:   Wed, 20 Nov 2019 01:02:23 +0100
Message-Id: <20191120000224.30441-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Function attributes need to be parsed differently
than the usual specifiers: For example, in code like:
	#define __noreturn __attribute__((noreturn))
	__noreturn void foo(int a);
the __noreturn attribute should apply to the function type
while a specifier like 'const' would apply to its return type.

The situation is quite similar to how storage specifiers
must not be handled by alloc_indirect_symbol().
However, the solution used for storage specifiers (apply the
modifier bits only after the declarator is reached: cfr.commit
233d4e17c ("function attributes apply to the function declaration"))
can't be used here (because the storage modifiers can be applied
to the outermost declarator and function attributes may be
applied more deeper if function pointers are present).

Fix this by:
1) reverting the previous storage-specifier-like solution
2) collect function specifiers MODs in a new separate
   field in the declaration context (f_modifiers)
3) apply these modifiers when the declarator for the
   function type is reached (note: it must not be
   applied to the SYM_FN itself since this correspond
   to the function's return type; it must be applied to
   the parent node which can be a SYM_NODE or a SYM_PTR).
4) also apply these modifiers to the declarated symbol,
   if this symbol is a function declaration, to take
   into account attributes which are placed at the end
   of the declaration and not in front.

Reported-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
Fixes: 233d4e17c544e1de252aed8f409630599104dbc7
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c                                 | 49 +++++++++++++------------
 symbol.h                                |  3 +-
 validation/function-attribute-inner.c   |  1 -
 validation/function-attribute-pointer.c |  1 -
 4 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/parse.c b/parse.c
index 37ffede72..acae63af2 100644
--- a/parse.c
+++ b/parse.c
@@ -82,6 +82,7 @@ typedef struct token *attr_t(struct token *, struct symbol *,
 
 static attr_t
 	attribute_packed, attribute_aligned, attribute_modifier,
+	attribute_function,
 	attribute_ext_visible,
 	attribute_bitwise,
 	attribute_address_space, attribute_context,
@@ -375,6 +376,10 @@ static struct symbol_op attr_mod_op = {
 	.attribute = attribute_modifier,
 };
 
+static struct symbol_op attr_fun_op = {
+	.attribute = attribute_function,
+};
+
 static struct symbol_op ext_visible_op = {
 	.attribute = attribute_ext_visible,
 };
@@ -566,13 +571,13 @@ static struct init_keyword {
 	{ "__designated_init__",	NS_KEYWORD,	.op = &designated_init_op },
 	{ "transparent_union",	NS_KEYWORD,	.op = &transparent_union_op },
 	{ "__transparent_union__",	NS_KEYWORD,	.op = &transparent_union_op },
-	{ "noreturn",	NS_KEYWORD,	MOD_NORETURN,	.op = &attr_mod_op },
-	{ "__noreturn__",	NS_KEYWORD,	MOD_NORETURN,	.op = &attr_mod_op },
-	{ "pure",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
-	{"__pure__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
-	{"const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
-	{"__const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
-	{"__const__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
+	{ "noreturn",	NS_KEYWORD,	MOD_NORETURN,	.op = &attr_fun_op },
+	{ "__noreturn__",	NS_KEYWORD,	MOD_NORETURN,	.op = &attr_fun_op },
+	{ "pure",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
+	{"__pure__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
+	{"const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
+	{"__const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
+	{"__const__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
 	{"externally_visible",	NS_KEYWORD,	.op = &ext_visible_op },
 	{"__externally_visible__",	NS_KEYWORD,	.op = &ext_visible_op },
 
@@ -1117,6 +1122,15 @@ static struct token *attribute_modifier(struct token *token, struct symbol *attr
 	return token;
 }
 
+static struct token *attribute_function(struct token *token, struct symbol *attr, struct decl_state *ctx)
+{
+	unsigned long mod = attr->ctype.modifiers;
+	if (ctx->f_modifiers & mod)
+		warning(token->pos, "duplicate %s", modifier_string(mod));
+	ctx->f_modifiers |= mod;
+	return token;
+}
+
 static struct token *attribute_ext_visible(struct token *token, struct symbol *attr, struct decl_state *ctx)
 {
 	ctx->is_ext_visible = 1;
@@ -1862,6 +1876,7 @@ static struct token *direct_declarator(struct token *token, struct decl_state *c
 		enum kind kind = which_func(token, p, ctx->prefer_abstract);
 		struct symbol *fn;
 		fn = alloc_indirect_symbol(token->pos, ctype, SYM_FN);
+		ctype->modifiers |= ctx->f_modifiers;
 		token = token->next;
 		if (kind == K_R)
 			token = identifier_list(token, fn);
@@ -2900,21 +2915,6 @@ static struct token *toplevel_asm_declaration(struct token *token, struct symbol
 	return token;
 }
 
-static unsigned long declaration_modifiers(struct decl_state *ctx)
-{
-	unsigned long mods;
-
-	// Storage modifiers only relates to the declaration
-	mods = storage_modifiers(ctx);
-
-	// Function attributes also only relates to the declaration
-	// and must not be present in the function/return type.
-	mods |= ctx->ctype.modifiers & MOD_FUN_ATTR;
-	ctx->ctype.modifiers &=~ MOD_FUN_ATTR;
-
-	return mods;
-}
-
 struct token *external_declaration(struct token *token, struct symbol_list **list,
 		validate_decl_t validate_decl)
 {
@@ -2935,7 +2935,7 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
 
 	/* Parse declaration-specifiers, if any */
 	token = declaration_specifiers(token, &ctx);
-	mod = declaration_modifiers(&ctx);
+	mod = storage_modifiers(&ctx);
 	decl = alloc_symbol(token->pos, SYM_NODE);
 	/* Just a type declaration? */
 	if (match_op(token, ';')) {
@@ -2988,6 +2988,9 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
 				show_ident(decl->ident));
 			base_type->ctype.base_type = &int_ctype;
 		}
+		/* apply attributes placed after the declarator */
+		decl->ctype.modifiers |= ctx.f_modifiers;
+
 		/* K&R argument declaration? */
 		if (lookup_type(token))
 			return parse_k_r_arguments(token, decl, list);
diff --git a/symbol.h b/symbol.h
index 2465d6d88..d8a4f3b68 100644
--- a/symbol.h
+++ b/symbol.h
@@ -107,6 +107,7 @@ struct decl_state {
 	struct ctype ctype;
 	struct ident **ident;
 	struct symbol_op *mode;
+	unsigned long f_modifiers;		// function attributes
 	unsigned char prefer_abstract, is_inline, storage_class, is_tls;
 	unsigned char is_ext_visible;
 };
@@ -251,7 +252,7 @@ struct symbol {
 #define MOD_PTRINHERIT	(MOD_QUALIFIER | MOD_NODEREF | MOD_NORETURN | MOD_NOCAST)
 /* modifiers preserved by typeof() operator */
 #define MOD_TYPEOF	(MOD_QUALIFIER | MOD_NOCAST | MOD_SPECIFIER)
-/* modifiers for funtion attributes */
+/* modifiers for function attributes */
 #define MOD_FUN_ATTR	(MOD_PURE|MOD_NORETURN)
 /* like cvr-qualifiers but 'reversed' (OK: source <= target) */
 #define MOD_REV_QUAL	(MOD_PURE|MOD_NORETURN)
diff --git a/validation/function-attribute-inner.c b/validation/function-attribute-inner.c
index 178c7c019..3a8a8407f 100644
--- a/validation/function-attribute-inner.c
+++ b/validation/function-attribute-inner.c
@@ -6,5 +6,4 @@ _Static_assert([void (__noreturn *)(void)] == [typeof(&fun)], "");
 
 /*
  * check-name: function-attribute-inner
- * check-known-to-fail
  */
diff --git a/validation/function-attribute-pointer.c b/validation/function-attribute-pointer.c
index 27f43bfb6..fd08ac710 100644
--- a/validation/function-attribute-pointer.c
+++ b/validation/function-attribute-pointer.c
@@ -21,7 +21,6 @@ static void foo(void)
 
 /*
  * check-name: function-attribute-pointer
- * check-known-to-fail
  *
  * check-error-start
 function-attribute-pointer.c:14:20: warning: incorrect type in argument 1 (different modifiers)
-- 
2.24.0


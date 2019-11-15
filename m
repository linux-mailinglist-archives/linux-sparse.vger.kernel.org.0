Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9775EFD2C8
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 03:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbfKOCKo (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 21:10:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36966 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbfKOCKZ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 21:10:25 -0500
Received: by mail-wr1-f66.google.com with SMTP id t1so9232188wrv.4
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 18:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zxzHQsoF/FfoZHz8YH4tT6yQ/doXUTyQNDRwUngxdGA=;
        b=blhreprMzSCxNLPMSvuNeMYG0EyfdKU4naA5vE/v1su1cb5S2D7CCciN0QU3TT1dQO
         9qQ/GZsmDu8EDNFGYXNFvSYt2DeELYPclYqeIAlvuxUHkFN56nq75EN1tZZHLtfktHMq
         NwrJGsVSU0TZX4YdRZZ/KDkSAxq3JPFH/Hitu1mYdlgeUjdX9Y6/kok1WNUzvj4FPyw0
         IFEbQrtfB6u7Fu2t1E62zGu9qGo5W24EP3MLwSC4Z65eOGhPYWa6CLGmbWhsneORw97d
         Vs0MIB522Tl1b28pJMlBWF5laZ1dOOLYhnE9kIdH3rkPw8gijZhi3Wv/zJHWsvVHSMD7
         DllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zxzHQsoF/FfoZHz8YH4tT6yQ/doXUTyQNDRwUngxdGA=;
        b=b2Iyq/GOIT+3NZ2AEhHWQ8WQdaHf5HkNRdcR8qXu+9wQkQxLR9UIa4H9jYZjg6gfRr
         YrrC6zdiuwZFNwSxDHhVJPUu8D2mdImD/01xk7jo27E6r4ntXNxKaqeKU2QiN+7FpKva
         55nqGOxvwLIC6SmRHk7PStFQ+MFjN5HRZAroFUviraq2TXIhAT2b5MYVLG377i1um6L1
         DnRoWWDC5i6lLrp0aJUscrBruvGvAijDTOQ7wFwUdBb4BcX0aVWEyT14uAm/uMDMiKQU
         X8vEvTIbwY6Donm8eqr6AA83HOs3VkqIN4M6VZlfu0nznd3WSYJ9PLnjUWCcTCCLxJyT
         IJYQ==
X-Gm-Message-State: APjAAAX3MJNlZXWJXeFERkbD9oPBb8okIb8kvrQKamER/aSqLCULoz6u
        fOeJ0LaFkrd+L8BqgE1k7/F7HeAh
X-Google-Smtp-Source: APXvYqxBX89EUiVa8imJTEnWR0ZBqx27rvhV1xofHZXIsVBnzmqppGfrFsTe7yc7zHu25BiQWLi0tw==
X-Received: by 2002:adf:f60e:: with SMTP id t14mr12171891wrp.292.1573783823169;
        Thu, 14 Nov 2019 18:10:23 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:a451:455e:cb63:513c])
        by smtp.gmail.com with ESMTPSA id i13sm9115802wrp.12.2019.11.14.18.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 18:10:22 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] give a correct position to mode
Date:   Fri, 15 Nov 2019 03:10:17 +0100
Message-Id: <20191115021017.54308-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

apply_modifiers() is given a position for a warning
that can possibly be issued but:
* this position is the one of the token following the attributes
* the warning is about a mode that can't be applied.

Fix this by storing the position with the mode in the decl_state.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c  | 23 ++++++++++++-----------
 symbol.h |  1 +
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/parse.c b/parse.c
index 48a63f22f..cd5bea43c 100644
--- a/parse.c
+++ b/parse.c
@@ -670,18 +670,17 @@ struct statement *alloc_statement(struct position pos, int type)
 
 static struct token *struct_declaration_list(struct token *token, struct symbol_list **list);
 
-static void apply_modifiers(struct position pos, struct decl_state *ctx)
+static void apply_modifiers(struct decl_state *ctx)
 {
 	struct symbol *ctype;
 	if (!ctx->mode)
 		return;
 	ctype = ctx->mode->to_mode(ctx->ctype.base_type);
 	if (!ctype)
-		sparse_error(pos, "don't know how to apply mode to %s",
+		sparse_error(ctx->mode_pos, "don't know how to apply mode to %s",
 				show_typename(ctx->ctype.base_type));
 	else
 		ctx->ctype.base_type = ctype;
-	
 }
 
 static struct symbol * alloc_indirect_symbol(struct position pos, struct ctype *ctype, int type)
@@ -1233,10 +1232,12 @@ static struct token *attribute_mode(struct token *token, struct symbol *attr, st
 	token = expect(token, '(', "after mode attribute");
 	if (token_type(token) == TOKEN_IDENT) {
 		struct symbol *mode = lookup_keyword(token->ident, NS_KEYWORD);
-		if (mode && mode->op->type == KW_MODE)
+		if (mode && mode->op->type == KW_MODE) {
 			ctx->mode = mode->op;
-		else
+			ctx->mode_pos = token->pos;
+		} else {
 			sparse_error(token->pos, "unknown mode attribute %s", show_ident(token->ident));
+		}
 		token = token->next;
 	} else
 		sparse_error(token->pos, "expect attribute mode symbol\n");
@@ -1969,7 +1970,7 @@ static struct token *declaration_list(struct token *token, struct symbol_list **
 			token = handle_bitfield(token, &ctx);
 
 		token = handle_attributes(token, &ctx, KW_ATTRIBUTE);
-		apply_modifiers(token->pos, &ctx);
+		apply_modifiers(&ctx);
 
 		decl->ctype = ctx.ctype;
 		decl->ctype.modifiers |= mod;
@@ -2009,7 +2010,7 @@ static struct token *parameter_declaration(struct token *token, struct symbol *s
 	ctx.ident = &sym->ident;
 	token = declarator(token, &ctx);
 	token = handle_attributes(token, &ctx, KW_ATTRIBUTE);
-	apply_modifiers(token->pos, &ctx);
+	apply_modifiers(&ctx);
 	sym->ctype = ctx.ctype;
 	sym->ctype.modifiers |= storage_modifiers(&ctx);
 	sym->endpos = token->pos;
@@ -2025,7 +2026,7 @@ struct token *typename(struct token *token, struct symbol **p, int *forced)
 	*p = sym;
 	token = declaration_specifiers(token, &ctx);
 	token = declarator(token, &ctx);
-	apply_modifiers(token->pos, &ctx);
+	apply_modifiers(&ctx);
 	sym->ctype = ctx.ctype;
 	sym->endpos = token->pos;
 	class = ctx.storage_class;
@@ -2918,14 +2919,14 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
 	decl = alloc_symbol(token->pos, SYM_NODE);
 	/* Just a type declaration? */
 	if (match_op(token, ';')) {
-		apply_modifiers(token->pos, &ctx);
+		apply_modifiers(&ctx);
 		return token->next;
 	}
 
 	saved = ctx.ctype;
 	token = declarator(token, &ctx);
 	token = handle_attributes(token, &ctx, KW_ATTRIBUTE | KW_ASM);
-	apply_modifiers(token->pos, &ctx);
+	apply_modifiers(&ctx);
 
 	decl->ctype = ctx.ctype;
 	decl->ctype.modifiers |= mod;
@@ -3021,7 +3022,7 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
 		token = handle_attributes(token, &ctx, KW_ATTRIBUTE);
 		token = declarator(token, &ctx);
 		token = handle_attributes(token, &ctx, KW_ATTRIBUTE | KW_ASM);
-		apply_modifiers(token->pos, &ctx);
+		apply_modifiers(&ctx);
 		decl->ctype = ctx.ctype;
 		decl->ctype.modifiers |= mod;
 		decl->endpos = token->pos;
diff --git a/symbol.h b/symbol.h
index ac43b314f..ceb754ec1 100644
--- a/symbol.h
+++ b/symbol.h
@@ -109,6 +109,7 @@ struct decl_state {
 	struct ctype ctype;
 	struct ident **ident;
 	struct symbol_op *mode;
+	struct position mode_pos;
 	unsigned char prefer_abstract, is_inline, storage_class, is_tls;
 	unsigned char is_ext_visible;
 };
-- 
2.24.0


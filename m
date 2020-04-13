Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCB11A69A8
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731409AbgDMQQv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731411AbgDMQQu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:50 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE3EBC0A3BE2
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:49 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x4so9822433wmj.1
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eaQZR/qbxh5cSeYxKMDBqSuS8exXEWFF8k1ahCox/CI=;
        b=sRPlV9wI9B0W839bm4hz42HbU1xitzuJUGyQzCZH5FsCadOoYHjBaLGS5A5Gh1Qgg5
         UBoSudxOIQzoNyT4h2wzTf6cfe+YfnWsFAODjwXaAwVC1jamByL8U3rZieNEgnz0mxY7
         q+1+7mpWrvkCKAVaq+Ral/qCxzoyTRCLvIpwY+pT+ABFNCpDGRLZHvk/JjGV0kbzpArk
         vL2RKxheLAXw+dmnx0+FAddFvpBW9TeAy1JZa6nxqSvXtl/b7L9QtCEKi2MCieQ5do1N
         6ob2audZDXNTBOiLZmy6Lu4RxslM3i5WMdHjvUeMK8nNcChGCZoh7l4NgfMSf415/Xav
         /Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eaQZR/qbxh5cSeYxKMDBqSuS8exXEWFF8k1ahCox/CI=;
        b=KHVm+oSAszHeiBZoj8Th+yOdo2mgQIzZPXPQVOKyJjoXEqQm+28H6WhTEUvMQvLRUZ
         a//bI2nXD7ZT1ln84kHYenYVf0Jr1GvpeZdcsWCutoVXoUbpisqc7C9KuFNd3dSqZNK/
         6ofauQuvE9V42pqYokQ0L8IRIx/YpH3mYj4yVWdwzVuQvBZybXQEoe4xfa8/t7x014ZF
         XgXpz0Vs+izhWru2YCfFLqhGWovJBttWv9h2OAhDh+MfXVHdJ+GxlPe1Oh+R4KEwzo+c
         VYLcZpFT0rxQmSFg3jice/JwVE6jDmeRek075exGJFg54lMqKXRnjusDO07I16MBZNZf
         TBwg==
X-Gm-Message-State: AGi0PuaBv0qtTbmNIdJ11gxijCmj3tJiNXFe+GuiNFfh05zXl9yX+1t8
        +fQBPtNLqwGDYr9BzaFBDn9OfmcU
X-Google-Smtp-Source: APiQypI3kr11DTbKZknnjgNp7nTsPga+ccTXTeaYoeXBSmttTviGqKqZbxsXFHYiedSykUwx8AOV4A==
X-Received: by 2002:a1c:2942:: with SMTP id p63mr20345704wmp.183.1586794580746;
        Mon, 13 Apr 2020 09:16:20 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:20 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 10/17] scope: move scope opening/ending inside compound_statement()
Date:   Mon, 13 Apr 2020 18:15:58 +0200
Message-Id: <20200413161605.95900-11-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A compound statement starts and ends a block scope, so
it's better to start & end this scope inside the function
parsing the statement: compound_statement.
The only exception is for the body of a function where
the scope also enclose the parameter declaration but that
is fine since the function is special anyway.

Move the calls to start & close the block scope inside
compound_statement() and directly call statement_list()
for the function body.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expression.c |  2 --
 parse.c      | 13 ++++++-------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/expression.c b/expression.c
index 5b9bddfe456e..78e577cf10a1 100644
--- a/expression.c
+++ b/expression.c
@@ -71,9 +71,7 @@ struct token *parens_expression(struct token *token, struct expression **expr, c
 		struct statement *stmt = alloc_statement(token->pos, STMT_COMPOUND);
 		*expr = e;
 		e->statement = stmt;
-		start_symbol_scope();
 		token = compound_statement(token->next, stmt);
-		end_symbol_scope();
 		token = expect(token, '}', "at end of statement expression");
 	} else
 		token = parse_expression(token, expr);
diff --git a/parse.c b/parse.c
index a29c67c8cf41..5da314cd05ee 100644
--- a/parse.c
+++ b/parse.c
@@ -2547,11 +2547,7 @@ static struct token *statement(struct token *token, struct statement **tree)
 	}
 
 	if (match_op(token, '{')) {
-		stmt->type = STMT_COMPOUND;
-		start_symbol_scope();
 		token = compound_statement(token->next, stmt);
-		end_symbol_scope();
-		
 		return expect(token, '}', "at end of compound statement");
 	}
 			
@@ -2658,7 +2654,10 @@ static struct token *parameter_type_list(struct token *token, struct symbol *fn)
 
 struct token *compound_statement(struct token *token, struct statement *stmt)
 {
+	stmt->type = STMT_COMPOUND;
+	start_symbol_scope();
 	token = statement_list(token, &stmt->stmts);
+	end_symbol_scope();
 	return token;
 }
 
@@ -2810,15 +2809,15 @@ static struct token *parse_function_body(struct token *token, struct symbol *dec
 		decl->ctype.modifiers |= MOD_EXTERN;
 
 	stmt = start_function(decl);
-
 	*p = stmt;
+
 	FOR_EACH_PTR (base_type->arguments, arg) {
 		declare_argument(arg, base_type);
 	} END_FOR_EACH_PTR(arg);
 
-	token = compound_statement(token->next, stmt);
-
+	token = statement_list(token->next, &stmt->stmts);
 	end_function(decl);
+
 	if (!(decl->ctype.modifiers & MOD_INLINE))
 		add_symbol(list, decl);
 	check_declaration(decl);
-- 
2.26.0


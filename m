Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A59A61A69A7
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731413AbgDMQQv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731409AbgDMQQu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:50 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5EDDC0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:49 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h9so10720403wrc.8
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dcGjtCTYZxdmmfB1Mi4WyDom2cu6kEyoprXuL5/67rY=;
        b=oE6JSSu2TpbPvIK1+rXUDw56px5J6EWf/xlDo2DP4LGTQezWEnZpKlLKY/lGaYCirD
         Sw4vl5zIczCTBeGkdXmx0QvwkzJvsAEzbvN++RtWzToQxLlRVUas8OGyARb0OH+2gwEJ
         3h/g1hfTvx3dmBontQ8ifwdnREj+3+kyHBe58DDyZ2IvE8Fz7tOkhPzOhDH/GF9Bk0El
         OEK3uUOGliF2RJleh0Mq0mPgoJTw1xlXjvtYQ3PX1kcJOkN/xofb25RYRwM5O3pDh75p
         i1W9u7xzJ5MmopNUr2urc2BCaGGZKYsDEFc56gsOnYD9BWMb4a3vOCA4YOuWOsX/UnqE
         WkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dcGjtCTYZxdmmfB1Mi4WyDom2cu6kEyoprXuL5/67rY=;
        b=D8zQ7JwPCDbFes04JSBRkgRHgP4aJ/imDb1xj7gdFlDzZkK1l2jOX9gLu93WYsq+kV
         pKVauO6JyAzMwJN4xdDRSjy8RbYBliKYtp+Ny1AJb9ZxSdosDWtb77C2g347O1bfKyEK
         f3J6O8ylQdtpWe0LMHzcIAuNgs1IEc1kIX1pAf2pYuR1nvN2mfBF1yCcJKRqSuJnRuGy
         ZAW4XpZv4mXzmzDIsXR+u2eDfjS/Udkzvf1jB8dVa34Ho0LkNaArTa3mxbcPB/w8i9rd
         2heICQs1CXAahDVteUUTdfAnkDzDKLbBVwMMERjziCnlkJl5bvXwGh2tTRWPREeEWRXz
         YNgA==
X-Gm-Message-State: AGi0PuZttuSEA+sKU2TkOsGm4ONznc3qe6FXBHom5DFlsY1N7wXy9W0O
        Qz9jP0eWkagCUloQjghX0U5q9LnP
X-Google-Smtp-Source: APiQypIiRZxXtnQtGLJQ0qZipP7Fi1Ur75EC1/a+LdelVCHCJ9tHYlqLWvIX5L5QaA2GR6cNl/P/pA==
X-Received: by 2002:adf:fa03:: with SMTP id m3mr7247230wrr.68.1586794582674;
        Mon, 13 Apr 2020 09:16:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:22 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 12/17] scope: s/{start,end}_symbol_scope/{start,end}_block_scope/
Date:   Mon, 13 Apr 2020 18:16:00 +0200
Message-Id: <20200413161605.95900-13-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The names {start,end}_symbol_scope() are misleading as these
function really start & end a block scope and not all symbols
are declared inside a block scope.

So, rename them to their more direct name: {start,end}_block_scope().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 12 ++++++------
 scope.c |  4 ++--
 scope.h |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/parse.c b/parse.c
index 5da314cd05ee..1a2c7af22ff4 100644
--- a/parse.c
+++ b/parse.c
@@ -2222,7 +2222,7 @@ static void start_iterator(struct statement *stmt)
 {
 	struct symbol *cont, *brk;
 
-	start_symbol_scope();
+	start_block_scope();
 	cont = alloc_symbol(stmt->pos, SYM_NODE);
 	bind_symbol(cont, &continue_ident, NS_ITERATOR);
 	brk = alloc_symbol(stmt->pos, SYM_NODE);
@@ -2237,7 +2237,7 @@ static void start_iterator(struct statement *stmt)
 
 static void end_iterator(struct statement *stmt)
 {
-	end_symbol_scope();
+	end_block_scope();
 }
 
 static struct statement *start_function(struct symbol *sym)
@@ -2282,7 +2282,7 @@ static void start_switch(struct statement *stmt)
 {
 	struct symbol *brk, *switch_case;
 
-	start_symbol_scope();
+	start_block_scope();
 	brk = alloc_symbol(stmt->pos, SYM_NODE);
 	bind_symbol(brk, &break_ident, NS_ITERATOR);
 
@@ -2302,7 +2302,7 @@ static void end_switch(struct statement *stmt)
 {
 	if (!stmt->switch_case->symbol_list)
 		warning(stmt->pos, "switch with no cases");
-	end_symbol_scope();
+	end_block_scope();
 }
 
 static void add_case_statement(struct statement *stmt)
@@ -2655,9 +2655,9 @@ static struct token *parameter_type_list(struct token *token, struct symbol *fn)
 struct token *compound_statement(struct token *token, struct statement *stmt)
 {
 	stmt->type = STMT_COMPOUND;
-	start_symbol_scope();
+	start_block_scope();
 	token = statement_list(token, &stmt->stmts);
-	end_symbol_scope();
+	end_block_scope();
 	return token;
 }
 
diff --git a/scope.c b/scope.c
index 175d72c23762..be042a45357d 100644
--- a/scope.c
+++ b/scope.c
@@ -84,7 +84,7 @@ void start_file_scope(void)
 	block_scope = scope;
 }
 
-void start_symbol_scope(void)
+void start_block_scope(void)
 {
 	start_scope(&block_scope);
 }
@@ -129,7 +129,7 @@ void new_file_scope(void)
 	start_file_scope();
 }
 
-void end_symbol_scope(void)
+void end_block_scope(void)
 {
 	end_scope(&block_scope);
 }
diff --git a/scope.h b/scope.h
index 3cad514ac128..83741459eb6a 100644
--- a/scope.h
+++ b/scope.h
@@ -47,8 +47,8 @@ extern void start_file_scope(void);
 extern void end_file_scope(void);
 extern void new_file_scope(void);
 
-extern void start_symbol_scope(void);
-extern void end_symbol_scope(void);
+extern void start_block_scope(void);
+extern void end_block_scope(void);
 
 extern void start_function_scope(void);
 extern void end_function_scope(void);
-- 
2.26.0


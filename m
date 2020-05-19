Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52861D8CB3
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgESA5w (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbgESA5v (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:51 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 573CDC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:51 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l25so5517608edj.4
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8ulpsVXCCrKnCSDR5o7Y9WoDKzSav53ebbzGAADXZMk=;
        b=puP6Coi+KF8qnQ8AzJRpZabmDJv+rO3R+5wrf78tZiQvpitWAnHh+z/yFZMRzfKLxS
         3eWzuqkzUs7MH/C3z+C9pyC/YvCJWbvDML9iUth9seqRLKCthgEoM8FgNS5tgbilYi2B
         j7l8klukYIkTZUjJdnY8tNpsNq+nirHaA3UkpO3DparPzlSUqFX8+1s8eghKtvOh9ocG
         003aAvH9BkRautKPfewKCjiRglc4ZZInCi7QTPwODJmMHvkMHFqkq87QCtZSfcd7cppK
         M4XubVkwJ61K1rKRfmpJ9cwdqMY7ZU4dwR15s19uIeHhZG0qk4ObiXiMIzrTvNgq6kKG
         D1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8ulpsVXCCrKnCSDR5o7Y9WoDKzSav53ebbzGAADXZMk=;
        b=Kd2rUSQB/WqEEZJ1/smaRwcueE1Y2d/PtK5kxKjlWkaWbKrN7WkebFmpuf8BoxJKWO
         syRvDxIUGBIoxT33pmFpG0agRPozdXCyUM/g7A9YLq656t7H3hT1UI+wmHiTxbgCaEDr
         4YeFkZpAhKzqSB0kyAETZFwJac1uPljPM7V/0FuOICEEuks8lq56vs1NOUwYHjl1iBwQ
         1Cpg769IV2nS2qRFYiwLXA2pSeAvyZdNfd8N4qAePNDfFuaaSVe3bXMxeanmw9zb4VS5
         GGltU0hKZrW3ippJdRJ9lc9kjCpjA14P29lCsqe3LLv0hzbb9/bzF4rguuRxJvXtXPVX
         DztA==
X-Gm-Message-State: AOAM531UdUBRDjsTfbJAXdlmUqqNU2q6qjZ2ECH/SDONMZS4qyKUjKSA
        SKk8h6acSMFUhh9HnJKnlzpopEJy
X-Google-Smtp-Source: ABdhPJyKAnanv1LW4rG+U2nEQJ7CEDDqp6L9hLT8UO6K8y5XR9IB798H2zZDvHXECWDyrsGzynZPIg==
X-Received: by 2002:a50:98a2:: with SMTP id j31mr15513353edb.79.1589849869835;
        Mon, 18 May 2020 17:57:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:49 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 17/28] scope: s/{start,end}_symbol_scope/{start,end}_block_scope/
Date:   Tue, 19 May 2020 02:57:17 +0200
Message-Id: <20200519005728.84594-18-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The functions {start,end}_symbol_scope() haven't been renamed
when separated scope have been introduced for functions & blocks.
But these functions only start & end a block scope.

So, rename them to their more direct name: {start,end}_block_scope().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 12 ++++++------
 scope.c |  4 ++--
 scope.h |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/parse.c b/parse.c
index 29e3f939166d..ecc33765e1ef 100644
--- a/parse.c
+++ b/parse.c
@@ -2230,7 +2230,7 @@ static void start_iterator(struct statement *stmt)
 {
 	struct symbol *cont, *brk;
 
-	start_symbol_scope();
+	start_block_scope();
 	cont = alloc_symbol(stmt->pos, SYM_NODE);
 	bind_symbol(cont, &continue_ident, NS_ITERATOR);
 	brk = alloc_symbol(stmt->pos, SYM_NODE);
@@ -2245,7 +2245,7 @@ static void start_iterator(struct statement *stmt)
 
 static void end_iterator(struct statement *stmt)
 {
-	end_symbol_scope();
+	end_block_scope();
 }
 
 static struct statement *start_function(struct symbol *sym)
@@ -2290,7 +2290,7 @@ static void start_switch(struct statement *stmt)
 {
 	struct symbol *brk, *switch_case;
 
-	start_symbol_scope();
+	start_block_scope();
 	brk = alloc_symbol(stmt->pos, SYM_NODE);
 	bind_symbol(brk, &break_ident, NS_ITERATOR);
 
@@ -2310,7 +2310,7 @@ static void end_switch(struct statement *stmt)
 {
 	if (!stmt->switch_case->symbol_list)
 		warning(stmt->pos, "switch with no cases");
-	end_symbol_scope();
+	end_block_scope();
 }
 
 static void add_case_statement(struct statement *stmt)
@@ -2662,9 +2662,9 @@ static struct token *parameter_type_list(struct token *token, struct symbol *fn)
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
index 0e4fb3b42150..cc54f1e1760b 100644
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
2.26.2


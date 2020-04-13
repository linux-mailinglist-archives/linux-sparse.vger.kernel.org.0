Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36A81A69A1
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731407AbgDMQQ2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731400AbgDMQQ0 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:26 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA56BC0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:24 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id v8so10420779wma.0
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WYvvJoKZMxsXrObMn5QyGPjCbm0f5g9fxgC4oAjc9dU=;
        b=WjLchK9bqREkGTJGGdC/K+aScnlSJ2Y4wo+OEE0byNp1A1rZcCGky+q5OB5gVQDn9I
         6MY6j1zSlDThwIVnBTlfEkRGkz7OHfp/UXmNxowu9dsQHJayAcAfhZLcScQiTPNSLqso
         sEWc6t3IlFyTkPtQ+plBXk/e0MW243VS9TOp78b5DcvipD5sOhGrLImmLJ7n0xmfCjuA
         EhY+1NedvLdmrZvrA5fFSARXybFG3Ha86ocEBJ/M34PwUw8Z3LeZ1bOZlAxAcBtN4FQZ
         7QyYRsGGFXTq+CeLwjSu59KazxB0AIYgGsmpxJp7kZJnZpO5YzDNQ4tEfUPEXZYvy+W/
         3hng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WYvvJoKZMxsXrObMn5QyGPjCbm0f5g9fxgC4oAjc9dU=;
        b=YWzSiENxHET5+prOyMuT+abQN1OszBqS6TKwOycs0ggYiQovvkGevpdRu+bKT68k6I
         HEjjOH0Sxcsbny6tHDPOFP5v0/zC/4TVaWAsyKsfK3NIf3fU/5FODfEbf9m2QQtvvzoy
         XHjLox5YoicwjVVd2H7LSm48Rs77MvtC7OpH3jIKOPrR7YqjoIyWW3QztIxbGcvC5dQL
         lUFFn62NXg7kG0msXWrx70+RGSX9nAw94xPNDPXaSH43tLyq8b2iM+QloQdqSFmWQD9B
         yZsCFqA+7e0qlzSexy+hkqj5U0mHVRioPQiSAIv3XSMyF8uwDlpJLaXTAKa6BhlW2uAw
         uvTg==
X-Gm-Message-State: AGi0PubTOCc9FQXnf5pKSMWN4BAWaHWCeCCbrbT8HqVTJn+iDMn0M97d
        O+eenv0t/pBJvRDHFyyNZv1+smDx
X-Google-Smtp-Source: APiQypI6RG16DF5R+7L9bymlHGBxVgM+JWYH/mnRmt9/u9UJMn531KtKo6deewnm7GuYTefx05Kc1Q==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr7869819wmj.170.1586794583431;
        Mon, 13 Apr 2020 09:16:23 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:23 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 13/17] scope: let labels have their own scope
Date:   Mon, 13 Apr 2020 18:16:01 +0200
Message-Id: <20200413161605.95900-14-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

One way of detecting gotos inside an statement expression
is to use a new kind of scope for the gotos & labels.

So create this new scope and open/close them when
entering/leaving statement expressions.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expression.c |  2 ++
 scope.c      | 14 ++++++++++++++
 scope.h      |  4 ++++
 3 files changed, 20 insertions(+)

diff --git a/expression.c b/expression.c
index 78e577cf10a1..08650724a988 100644
--- a/expression.c
+++ b/expression.c
@@ -71,7 +71,9 @@ struct token *parens_expression(struct token *token, struct expression **expr, c
 		struct statement *stmt = alloc_statement(token->pos, STMT_COMPOUND);
 		*expr = e;
 		e->statement = stmt;
+		start_label_scope();
 		token = compound_statement(token->next, stmt);
+		end_label_scope();
 		token = expect(token, '}', "at end of statement expression");
 	} else
 		token = parse_expression(token, expr);
diff --git a/scope.c b/scope.c
index be042a45357d..24c8a7a484f7 100644
--- a/scope.c
+++ b/scope.c
@@ -36,6 +36,7 @@
 static struct scope builtin_scope = { .next = &builtin_scope };
 
 struct scope	*block_scope = &builtin_scope,		// regular automatic variables etc
+		*label_scope = &builtin_scope,		// expr-stmt labels
 		*function_scope = &builtin_scope,	// labels, arguments etc
 		*file_scope = &builtin_scope,		// static
 		*global_scope = &builtin_scope;		// externally visible
@@ -81,6 +82,7 @@ void start_file_scope(void)
 
 	/* top-level stuff defaults to file scope, "extern" etc will choose global scope */
 	function_scope = scope;
+	label_scope = scope;
 	block_scope = scope;
 }
 
@@ -93,6 +95,7 @@ void start_function_scope(void)
 {
 	start_scope(&block_scope);
 	function_scope = block_scope;
+	label_scope = function_scope;
 }
 
 static void remove_symbol_scope(struct symbol *sym)
@@ -138,6 +141,17 @@ void end_function_scope(void)
 {
 	end_scope(&block_scope);
 	function_scope = block_scope;
+	label_scope = function_scope;
+}
+
+void start_label_scope(void)
+{
+	start_scope(&label_scope);
+}
+
+void end_label_scope(void)
+{
+	end_scope(&label_scope);
 }
 
 int is_outer_scope(struct scope *scope)
diff --git a/scope.h b/scope.h
index 83741459eb6a..ddcb90bd146b 100644
--- a/scope.h
+++ b/scope.h
@@ -34,6 +34,7 @@ struct scope {
 
 extern struct scope
 		*block_scope,
+		*label_scope,
 		*function_scope,
 		*file_scope,
 		*global_scope;
@@ -53,6 +54,9 @@ extern void end_block_scope(void);
 extern void start_function_scope(void);
 extern void end_function_scope(void);
 
+extern void start_label_scope(void);
+extern void end_label_scope(void);
+
 extern void set_current_scope(struct symbol *);
 extern void bind_scope(struct symbol *, struct scope *);
 extern void rebind_scope(struct symbol *, struct scope *);
-- 
2.26.0


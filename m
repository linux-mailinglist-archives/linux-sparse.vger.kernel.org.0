Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD38214C92
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgGENCn (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgGENCn (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:02:43 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305BCC08C5DE
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:02:43 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p20so39548121ejd.13
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hfkNsG4Ak/hs2nUpGg9DlhfS8mppNAS7YLoSweae/2U=;
        b=YmxxW8PnwG5FX5RO1kHjNyFK/U05BmJrcuRrMZmkEnYy5fYBjjLelbSLfaa+2AJnQy
         vbgX5KVL8NGEfGkAJ+0LRBy5iPDsUFaDYMUo2ZVPGUF41dr2uUqsgRdncZmos6s1Bp7g
         vyy6ZIkJvXIHmJ/I8y+VuP8ur6seqfSSvq0AR7btE21Pua3f3biAImh9IMlarEJvelF1
         JBGrGwXCWAaqcWEDvaFPeITLhbw7F3uq0A/togtJp2rcaghZ+GIZ8GKHZqYxLa/kWP8e
         Y1T0/0aKrhp1638w5illpLgSdtdXLTWbxwG1cwOJs9oDPA7Tf8UlqdUGhuFo+VpsuO50
         7ekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hfkNsG4Ak/hs2nUpGg9DlhfS8mppNAS7YLoSweae/2U=;
        b=scrNWy6BDpbaZRfprzuMM79BmJ/v9MZoBxdych3fM+bFNF6Y7Z60bsQzIchCEo/+J4
         HnadbwR9HCbooQpmpLJ6v8OHpRL3erhSQXjwGkyBaLUEMPTu3BOmZudDT+v1PREsZsBm
         AqVL1RaRbbP1cOVkE2hnopQWGYqaZIuy8whNB/KA6s10S/wQ8yWl+uRpqJz3sfWBf8Eq
         uPRJWcA1+eIgUUvmrpPaSnjje4upeWb+1rTCWoofVSMXhbkGA713ijUeKsPlqFICwuMj
         LYdeP7DmlmJrQNUMyPkIUQX4jrOnBSOvrTCPA3lBlF/GxnhVBgVL5JDgGTuDSi2X9YCp
         4Bkg==
X-Gm-Message-State: AOAM533gm8zeaMhZIvxuRr8XIHkoQXK/pldEnXfmZ+Ub0aAiTuc6y/Y1
        HwKCGLQP7/+6EXzh24jnuLXHaU/o
X-Google-Smtp-Source: ABdhPJxhtJtsbyiEyKYjQzCQauE+0dgcEz99oaacPckh1b+gEqTz/Ipa5Dt2jUrjzKEvHN+c+Fe99Q==
X-Received: by 2002:a17:906:4d4c:: with SMTP id b12mr38741348ejv.506.1593954161618;
        Sun, 05 Jul 2020 06:02:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id x16sm19535945edr.52.2020.07.05.06.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:02:41 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 14/15] cleanup: move parsing helpers to parse.c
Date:   Sun,  5 Jul 2020 15:02:19 +0200
Message-Id: <20200705130220.26230-15-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
References: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

lib.c contains 2-3 helpers for parsing. Move them to parse.c.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c   | 38 --------------------------------------
 parse.c | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/lib.c b/lib.c
index fd1fe6cb3ba5..f512be2e1a43 100644
--- a/lib.c
+++ b/lib.c
@@ -50,44 +50,6 @@
 #include "bits.h"
 
 
-struct token *skip_to(struct token *token, int op)
-{
-	while (!match_op(token, op) && !eof_token(token))
-		token = token->next;
-	return token;
-}
-
-static struct token bad_token = { .pos.type = TOKEN_BAD };
-struct token *expect(struct token *token, int op, const char *where)
-{
-	if (!match_op(token, op)) {
-		if (token != &bad_token) {
-			bad_token.next = token;
-			sparse_error(token->pos, "Expected %s %s", show_special(op), where);
-			sparse_error(token->pos, "got %s", show_token(token));
-		}
-		if (op == ';')
-			return skip_to(token, op);
-		return &bad_token;
-	}
-	return token->next;
-}
-
-///
-// issue an error message on new parsing errors
-// @token: the current token
-// @errmsg: the error message
-// If the current token is from a previous error, an error message
-// has already been issued, so nothing more is done.
-// Otherwise, @errmsg is displayed followed by the current token.
-void unexpected(struct token *token, const char *errmsg)
-{
-	if (token == &bad_token)
-		return;
-	sparse_error(token->pos, "%s", errmsg);
-	sparse_error(token->pos, "got %s", show_token(token));
-}
-
 unsigned int hexval(unsigned int c)
 {
 	int retval = 256;
diff --git a/parse.c b/parse.c
index 70d8b237ce5e..cea208395090 100644
--- a/parse.c
+++ b/parse.c
@@ -655,6 +655,44 @@ void init_parser(int stream)
 }
 
 
+struct token *skip_to(struct token *token, int op)
+{
+	while (!match_op(token, op) && !eof_token(token))
+		token = token->next;
+	return token;
+}
+
+static struct token bad_token = { .pos.type = TOKEN_BAD };
+struct token *expect(struct token *token, int op, const char *where)
+{
+	if (!match_op(token, op)) {
+		if (token != &bad_token) {
+			bad_token.next = token;
+			sparse_error(token->pos, "Expected %s %s", show_special(op), where);
+			sparse_error(token->pos, "got %s", show_token(token));
+		}
+		if (op == ';')
+			return skip_to(token, op);
+		return &bad_token;
+	}
+	return token->next;
+}
+
+///
+// issue an error message on new parsing errors
+// @token: the current token
+// @errmsg: the error message
+// If the current token is from a previous error, an error message
+// has already been issued, so nothing more is done.
+// Otherwise, @errmsg is displayed followed by the current token.
+void unexpected(struct token *token, const char *errmsg)
+{
+	if (token == &bad_token)
+		return;
+	sparse_error(token->pos, "%s", errmsg);
+	sparse_error(token->pos, "got %s", show_token(token));
+}
+
 // Add a symbol to the list of function-local symbols
 static void fn_local_symbol(struct symbol *sym)
 {
-- 
2.27.0


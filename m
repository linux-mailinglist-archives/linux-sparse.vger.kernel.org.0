Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65F0B119EF0
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfLJW7m (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:42 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35971 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJW7m (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:42 -0500
Received: by mail-wm1-f68.google.com with SMTP id p17so5007677wma.1
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gawWO15ANRZ7k9UQe+4ejl7GJWafn8IHartUbp+8hTs=;
        b=lJpfIo5b998CagFpDa9i401oBqeBXM4TuszYMx68XBrUxQnKv0eBUKqDg0JEF8bmOd
         BuOv5VKwOawUf6LYXoZi5PD5yh6gVQn4kYt891sQOZruAjy0WWT83zrTBqf2tKqTbt0L
         CaTLplpBhsGQqZG9Y5in/rpEmAJI76mdC61GMOhxnEOoQHyCOLnmjL1L5dgmDcltrWuk
         es9I+5M9BOI/97kCuTrMmQcXxTq1e2YAtrzRI1CKOP4pGk/RX8mwe1TnMZ1xX3vYmFPs
         zoaB/mDuUwtJTqtjyPSS6kwkwcbpjJMoTowVOOaGrGVKKsobQKCrQ0pfuQNwfac5IQon
         lV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gawWO15ANRZ7k9UQe+4ejl7GJWafn8IHartUbp+8hTs=;
        b=nwUAKjT1vvT7E7VYmQTHgQCgl8hc6yRX10xcRB0l4I6ww4Wx3lcEAe1OIVhpMxKGNu
         IW2yTEInG9aG8dy4lTaI1tT99gfZLqNADi+bgf3WYqOl7N+NwhbxF9tvyN8qlWmsHT+l
         zzZ6/DUp4uhVYJM0aaylmYYOZ0lBKhb5AprOkDGfM/R0P6tLPs7zRLv/jjCJ4RfYakh2
         yBnxVGqqhyM2OVp8mj6oRmRW/V8tUWsDAeyRZm+YC7FIuz/PiyQ2o0wtUDCCB9oRxWwb
         wo+KI901AjhpVWnwML69EWAIPJIDDMIOcG1wMwSMcCk4WTTGrnN0B1q22D3zmTlwV9Lv
         EjKQ==
X-Gm-Message-State: APjAAAX2ITCNGfKKxkHxkzhqS+UdeayzaJnb8QNOrosbZH9KHHkxA+NX
        JLa6tU2mrdPsao+06Il9PKfv6mME
X-Google-Smtp-Source: APXvYqwE8o7Wg8eO04PLYKpsR0nCdQ4bO19rMUGyPFRSUitz/aFhmtmbeEFCFMTApK+LSqTEBmfMvA==
X-Received: by 2002:a7b:c757:: with SMTP id w23mr7242709wmk.166.1576018779391;
        Tue, 10 Dec 2019 14:59:39 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:38 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 09/17] fix addressability marking in evaluate_addressof()
Date:   Tue, 10 Dec 2019 23:59:13 +0100
Message-Id: <20191210225921.94897-10-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

mark_addressable() is used to track if a symbol has its
address taken but does not take in account the fact that
a symbol can be accessed via one of its subfields.
A failure occurs in case like:
	struct { int a; } s = { 3 };
	...
	def(&s.a);
	return s.a;

where 's' is not marked as being addressable and so the
the initializer will be expanded and the return expression
will always be replaced by 3, while def() can redefine it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                            | 2 ++
 validation/eval/addressable-complex.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index d78de2edf1ed..c0281e9b10f2 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -1542,6 +1542,8 @@ static int compatible_argument_type(struct expression *expr, struct symbol *targ
 
 static void mark_addressable(struct expression *expr)
 {
+	while (expr->type == EXPR_BINOP && expr->op == '+')
+		expr = expr->left;
 	if (expr->type == EXPR_SYMBOL) {
 		struct symbol *sym = expr->symbol;
 		sym->ctype.modifiers |= MOD_ADDRESSABLE;
diff --git a/validation/eval/addressable-complex.c b/validation/eval/addressable-complex.c
index 62ab59f04cf9..e3d4aca49088 100644
--- a/validation/eval/addressable-complex.c
+++ b/validation/eval/addressable-complex.c
@@ -16,7 +16,6 @@ int use1(void)
 /*
  * check-name: eval/addressable-complex
  * check-command: test-linearize -Wno-decl -fdump-ir $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: load\\.
-- 
2.24.0


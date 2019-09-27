Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD27C0EAF
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbfI0Xnh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:37 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44900 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbfI0Xnh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:37 -0400
Received: by mail-ed1-f66.google.com with SMTP id r16so3694294edq.11
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JQequhl2PPsaKXoLPtX2x02a5Oj9hYUGHbm555GcZDk=;
        b=V+AohnJthP+PN+DSPnLAJBf1f3Cmgk/4NemoI5VuqhJodmxvR6ohVVyaAubGo25eDb
         XKIaVhq7aTu0pOp/DfG2m6iXXkKd4lrU582A/icDFHGYzczcZ8NqY/CFIaTpNjmX+A+S
         5Ccq/2VCo6ZqRMrCtKzYmC3NLsNtXanAguW6ly/zt4HGKPp8D+bvWgbC5vuiMFcNtYWy
         auARCeB+zrpdo7RpJlbe+ETMBmiP365Bgew6coznUjEYtNVdknltViG0uIcFayz5PbQi
         SUX3HLVYQZOcEBHSHHHqPvhljQ4wW0B3U8R3vQ1wolNwfPiFWPZRzbbIJULeRAW042XA
         ovUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JQequhl2PPsaKXoLPtX2x02a5Oj9hYUGHbm555GcZDk=;
        b=KmujiLGy10QS+tByEYXqgycj/OkbS0aRwKxW1EW+J/y682y8Ge9DZSabqxEGIHhxP/
         sipy0Vpb1cNLrO3C9i4snQhH34ofkKqMfF8BnhtqRn1NkZY/0Al1kXUpI+65TuNJjoqk
         xhDV7hIokvxxWFvAp14hwPtIWW4mxclYc6YerG0kUV6hUKv7Cw7dIQHOw/e/Ut97pyTR
         sBBnwNQjyEaPhkOvoDDauy86wp9w0hFRpb+LdRJwU1knWMfjSJtLhed3IE4XPub5UmU4
         /uLmr0rVMg3zuPgZ69cIQ/P26ZftE3VAqUpxfAHN8rI9QeSiJEYilZ7DHY2Ro4Vjm6Iv
         UHUg==
X-Gm-Message-State: APjAAAV3mODRB40d+2tdozTrpubtyPfZDz1JI19ruNTCSuH1Xev64jtV
        tfNIl/C471IsKyHe82VS2Lhvb0qP
X-Google-Smtp-Source: APXvYqyw1xhh4cpG1dEk1lkJifGRZz9rMTytUbiNWrTJcP9n1PS69+MeU9kmUvlbmtP8PBXV49GG1A==
X-Received: by 2002:a17:906:4bc3:: with SMTP id x3mr9915390ejv.200.1569627815498;
        Fri, 27 Sep 2019 16:43:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:35 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 13/18] asm: use parse_asm_constraint() to verify constraints
Date:   Sat, 28 Sep 2019 01:43:17 +0200
Message-Id: <20190927234322.5157-16-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In extended ASM statements, output constraints need to be
prefixed with "=" or "+" and input constraints must not. This
is checked in verify_{output,input}_constraint() where the
constraint string is analyzed to look after these two chars.

However, the needed information is now already available thanks
to parse_asm_constraint().

So, use the result of the parsing of the constraint strings to
avoid to analyze again these strings during their verification.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 4c5c2c255..f0f9b4b34 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3561,24 +3561,22 @@ static void parse_asm_constraint(struct asm_operand *op)
 		op->is_memory = 0;
 }
 
-static void verify_output_constraint(struct expression *expr, const char *constraint)
+static void verify_output_constraint(struct asm_operand *op)
 {
-	switch (*constraint) {
-	case '=':	/* Assignment */
-	case '+':	/* Update */
-		break;
-	default:
+	struct expression *expr = op->constraint;
+	const char *constraint = expr->string->data;
+
+	if (!op->is_assign)
 		expression_error(expr, "output constraint is not an assignment constraint (\"%s\")", constraint);
-	}
 }
 
-static void verify_input_constraint(struct expression *expr, const char *constraint)
+static void verify_input_constraint(struct asm_operand *op)
 {
-	switch (*constraint) {
-	case '=':	/* Assignment */
-	case '+':	/* Update */
+	struct expression *expr = op->constraint;
+	const char *constraint = expr->string->data;
+
+	if (op->is_assign)
 		expression_error(expr, "input constraint with assignment (\"%s\")", constraint);
-	}
 }
 
 static void evaluate_asm_statement(struct statement *stmt)
@@ -3587,18 +3585,16 @@ static void evaluate_asm_statement(struct statement *stmt)
 	struct asm_operand *op;
 	struct symbol *sym;
 
-	expr = stmt->asm_string;
-	if (!expr)
+	if (!stmt->asm_string)
 		return;
 
 	FOR_EACH_PTR(stmt->asm_outputs, op) {
 		/* Identifier */
 
 		/* Constraint */
-		expr = op->constraint;
-		if (expr) {
+		if (op->constraint) {
 			parse_asm_constraint(op);
-			verify_output_constraint(expr, expr->string->data);
+			verify_output_constraint(op);
 		}
 
 		/* Expression */
@@ -3614,10 +3610,9 @@ static void evaluate_asm_statement(struct statement *stmt)
 		/* Identifier */
 
 		/* Constraint */
-		expr = op->constraint;
-		if (expr) {
+		if (op->constraint) {
 			parse_asm_constraint(op);
-			verify_input_constraint(expr, expr->string->data);
+			verify_input_constraint(op);
 		}
 
 		/* Expression */
-- 
2.23.0


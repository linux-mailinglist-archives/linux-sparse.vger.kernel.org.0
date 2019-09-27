Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7BCEC0EAC
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbfI0Xnf (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:35 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39032 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728607AbfI0Xnf (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:35 -0400
Received: by mail-ed1-f66.google.com with SMTP id a15so3730764edt.6
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eA1k5J4wUXgHTrV9QWEvq/Ju/Id3sNEYL7pdfni3J4c=;
        b=t7MlNdWm2Kb62qmRIOJHv3XpOrAyNBoTGqrwX4S2SSUrwn0R6EJ5H9uIj1buzB3T1u
         ltm8G5Y4dF2KZtz9c5zHooSgJJKwGY3K4mBl3FpD8RwjjHH6zdZwBmN68nBfnYVErmqs
         0K1ifF2FcTkmKthYKs0jFcS3jrUlsLqxdoM9Ul9+7ZnR/plV7WrU7Zlao/E8HyH/FIwq
         O0zzDXlVg78Ki8FgyUaN+v/1FC/6VSQo5JK1VcPtRdnv9SgOWYgAd4Lts/ufJs0fwpda
         CDFF5erPlnfFQE3Nwp2cWjh5ZUxJO5qXhsRYehojyfO+2/nCJRIBjGiZCDgRjgmmMvXC
         fTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eA1k5J4wUXgHTrV9QWEvq/Ju/Id3sNEYL7pdfni3J4c=;
        b=Z3MlXNy0HKI+HJugLodf4nqK7PEVetHplgsFOdfF2/AGeAuC8nq7I76lYc+0Woma5L
         T4QdwEr/v8deo+nZm5giQ4xkQMybfgmqcINdb5ksldYCcUxvBeMBDAW2+GChzfDSsL4W
         z4dn6vIs3ni5A4Qwrxx89RvV5RQMQ4cwk188H/lLJ4q0m5YzGGY4q9sKylyy2WfhPUaq
         BsFnuzUW23vLiPmSGsOAJI2NvIoK1KzYJqyF+d397wa5a/EdR4imrXNEkFuvOkflBkiR
         TgwSpMDY2xkPauIrBqWs3crnIMtBTeqRrg2WtgpyHW1bKHZn8UAEjVtymSHuwOqndDuk
         Trbw==
X-Gm-Message-State: APjAAAWTKGo82j9nDMgAC2I6Kflj1q5Fj5o1vZ7c1f8kMC4OIM1U8a6r
        90a3YrwzaxHDRFzvD1a0LtVQw0OV
X-Google-Smtp-Source: APXvYqw90sf9gUEVn09nXQJZZLzQwP/jzvFGVXjglFKimfiz7oZq7su1rLt/FC6puY2mTiL8KVnPWw==
X-Received: by 2002:a17:906:7f03:: with SMTP id d3mr9873325ejr.115.1569627812305;
        Fri, 27 Sep 2019 16:43:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:31 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 09/18] asm: check earlier that body & constraints are strings
Date:   Sat, 28 Sep 2019 01:43:13 +0200
Message-Id: <20190927234322.5157-12-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The syntax of extended ASM statements requires that the
bodies & constraints are given via a literal string.

However, at parsing time more general expressions are accepted
and it's checked only at evaluation time if these are effectively
string literals. This has at least two drawbacks:
*) evaluate_asm_statement() is slightly more complicated than
   needed, mixing these checks with the real evaluation code
*) in case of error, the diagnostic is issued later than
   other syntaxic warnings.

Fix this by checking at parse-time that ASM bodies & constraints
are string literals and not some arbitrary expressions.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c            | 14 +++-----------
 parse.c               |  7 ++++---
 validation/asm-bad0.c |  6 +++---
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 70d76523e..634da4b93 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3523,20 +3523,15 @@ static void evaluate_asm_statement(struct statement *stmt)
 	struct symbol *sym;
 
 	expr = stmt->asm_string;
-	if (!expr || expr->type != EXPR_STRING) {
-		sparse_error(stmt->pos, "need constant string for inline asm");
+	if (!expr)
 		return;
-	}
 
 	FOR_EACH_PTR(stmt->asm_outputs, op) {
 		/* Identifier */
 
 		/* Constraint */
 		expr = op->constraint;
-		if (!expr || expr->type != EXPR_STRING) {
-			sparse_error(expr ? expr->pos : stmt->pos, "asm output constraint is not a string");
-			op->constraint = NULL;
-		} else
+		if (expr)
 			verify_output_constraint(expr, expr->string->data);
 
 		/* Expression */
@@ -3553,10 +3548,7 @@ static void evaluate_asm_statement(struct statement *stmt)
 
 		/* Constraint */
 		expr = op->constraint;
-		if (!expr || expr->type != EXPR_STRING) {
-			sparse_error(expr ? expr->pos : stmt->pos, "asm input constraint is not a string");
-			op->constraint = NULL;
-		} else
+		if (expr)
 			verify_input_constraint(expr, expr->string->data);
 
 		/* Expression */
diff --git a/parse.c b/parse.c
index 401f91a1f..23c0ee012 100644
--- a/parse.c
+++ b/parse.c
@@ -2050,7 +2050,8 @@ static struct token *parse_asm_operands(struct token *token, struct statement *s
 			op->name = token->next->next->ident;
 			token = token->next->next->next;
 		}
-		token = primary_expression(token->next, &op->constraint);
+		token = token->next;
+		token = string_expression(token, &op->constraint, "asm constraint");
 		token = parens_expression(token, &op->expr, "in asm parameter");
 		add_expression(inout, op);
 	} while (match_op(token, ','));
@@ -2101,7 +2102,7 @@ static struct token *parse_asm_statement(struct token *token, struct statement *
 		token = token->next;
 	}
 	token = expect(token, '(', "after asm");
-	token = parse_expression(token, &stmt->asm_string);
+	token = string_expression(token, &stmt->asm_string, "inline asm");
 	if (match_op(token, ':'))
 		token = parse_asm_operands(token, stmt, &stmt->asm_outputs);
 	if (match_op(token, ':'))
@@ -2118,7 +2119,7 @@ static struct token *parse_asm_declarator(struct token *token, struct decl_state
 {
 	struct expression *expr;
 	token = expect(token, '(', "after asm");
-	token = parse_expression(token->next, &expr);
+	token = string_expression(token, &expr, "inline asm");
 	token = expect(token, ')', "after asm");
 	return token;
 }
diff --git a/validation/asm-bad0.c b/validation/asm-bad0.c
index fcd9b1c4d..aa9bf28d7 100644
--- a/validation/asm-bad0.c
+++ b/validation/asm-bad0.c
@@ -30,12 +30,12 @@ static void iexpr(void)
  * check-name: asm-bad0
  *
  * check-error-start
+asm-bad0.c:6:13: error: string literal expected for inline asm
+asm-bad0.c:11:32: error: string literal expected for asm constraint
+asm-bad0.c:16:49: error: string literal expected for asm constraint
 asm-bad0.c:21:41: error: Expected ] at end of array dereference
 asm-bad0.c:21:41: error: got )
 asm-bad0.c:26:59: error: Expected ] at end of array dereference
 asm-bad0.c:26:59: error: got )
-asm-bad0.c:6:9: error: need constant string for inline asm
-asm-bad0.c:11:32: error: asm output constraint is not a string
-asm-bad0.c:16:49: error: asm input constraint is not a string
  * check-error-end
  */
-- 
2.23.0


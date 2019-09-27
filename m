Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A672BC0EAE
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbfI0Xnh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:37 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:43222 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728538AbfI0Xng (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:36 -0400
Received: by mail-ed1-f68.google.com with SMTP id r9so3710095edl.10
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SnOM5Pb5Vnf7nnww3gdTizCR+rYOAfPt/wLezCRlGLc=;
        b=UASWG3ilQkkFs4lUDR2OCHCGZ9IvaBWghep0VAt+aFvY7rXR3lkfEMAMN+bnTa3kRx
         NDXq6OnsbLKhyXX8AqhouwsCQYN09XoWZfd78s4u3zzFm69sYlOVjdRnJXx8im7cYdPW
         ++l6MSSt4DRJoq15J+pJkWGrfsKhwe8CdHRzTcnJWhJwSa5emy+m88Ww12i5Jw4nf2qi
         91m3NpxDlITVpkW4zsrOnplpN3nMrA4hr28Ns5pJVcZvuduxlRpHzawSOYA3iJei78CL
         B44JWEFTwyEAoFag4cErii8tz7KNa8Hw7hgdE2tAT4vdAaszB4TNxJar2J69bVAgINKa
         kiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SnOM5Pb5Vnf7nnww3gdTizCR+rYOAfPt/wLezCRlGLc=;
        b=NaiDwgJ1VMPRvV3e7Q9ADaw1ilEj+0ZvMkIShuMNsx1IIo5KbZvP5TK4blvOYg7oud
         gAvhxldmhfnqWSwqxDFlggzTqZab0oJA+c6awrOtAORjeQ/nUw6VCYKiPM5f4/RKdoC2
         rBdGASGluW4BrEdzWFYkiRTbvk/MuXYmtID/21rRPlyUBDG3ndygqGQmJ/HIhaQWOI3r
         jvrJUwYvcFhjgsMeP2NKKmb1P5EIeH3ltsB7OUk/Iykh6uINLwN6J8X12z5KnZpQ9AvB
         NIfPc8ThyR7ieCVhbZxggAcUl1Ees7zdTwel/5PSsxz5lCAINSzspNuhKgpt02+Yafv1
         83Cg==
X-Gm-Message-State: APjAAAU3lvtD9uzMjQd4ss3SRPCzjF9RpkbVYvlxAy4v6oCV00yrf8p2
        s0mIDRCd/tRDjgfVi4GD4e3Ug1jI
X-Google-Smtp-Source: APXvYqzdHKZvjbndEEN5o0BitQf7Hk+ntLktY28QMDByBY6TjbUyxU6bzKIhm9dJPJ/Z7uFj9aSOaA==
X-Received: by 2002:a17:906:5214:: with SMTP id g20mr9802321ejm.220.1569627814777;
        Fri, 27 Sep 2019 16:43:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:34 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 12/18] asm: parse constraints
Date:   Sat, 28 Sep 2019 01:43:16 +0200
Message-Id: <20190927234322.5157-15-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The details of the ASM constraint strings are needed for
their validation but also for the proper evaluation of the
operands.

So, parse these strings and store the significant properties
in struct asm_operand where they can be used for the next steps.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c   | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 expression.h |  6 +++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 7cc695c7e..4c5c2c255 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3493,6 +3493,74 @@ static void evaluate_iterator(struct statement *stmt)
 	evaluate_statement(stmt->iterator_post_statement);
 }
 
+
+static void parse_asm_constraint(struct asm_operand *op)
+{
+	struct expression *constraint = op->constraint;
+	const char *str = constraint->string->data;
+	int c;
+
+	switch (str[0]) {
+	case '+':
+		op->is_modify = true;
+		/* fall-through */
+	case '=':
+		op->is_assign = true;
+		str++;
+		break;
+	}
+
+	while ((c = *str++)) {
+		switch (c) {
+		case '=':
+		case '+':
+			sparse_error(constraint->pos, "invalid ASM constraint '%c'", c);
+			break;
+
+		case '&':
+			op->is_earlyclobber = true;
+			break;
+		case '%':
+			op->is_commutative = true;
+			break;
+		case 'r':
+			op->is_register = true;
+			break;
+
+		case 'm':
+		case 'o':
+		case 'V':
+		case 'Q':
+			op->is_memory = true;
+			break;
+
+		case '<':
+		case '>':
+			// FIXME: ignored for now
+			break;
+
+		case ',':
+			// FIXME: multiple alternative constraints
+			break;
+
+		case '0' ... '9':
+			// FIXME: numeric  matching constraint?
+			break;
+		case '[':
+			// FIXME: symbolic matching constraint
+			return;
+
+		default:
+			// FIXME: arch-specific (and multi-letter) constraints
+			break;
+		}
+	}
+
+	// FIXME: how to deal with multi-constraint?
+	if (op->is_register)
+		op->is_memory = 0;
+}
+
 static void verify_output_constraint(struct expression *expr, const char *constraint)
 {
 	switch (*constraint) {
@@ -3528,8 +3596,10 @@ static void evaluate_asm_statement(struct statement *stmt)
 
 		/* Constraint */
 		expr = op->constraint;
-		if (expr)
+		if (expr) {
+			parse_asm_constraint(op);
 			verify_output_constraint(expr, expr->string->data);
+		}
 
 		/* Expression */
 		expr = op->expr;
@@ -3545,8 +3615,10 @@ static void evaluate_asm_statement(struct statement *stmt)
 
 		/* Constraint */
 		expr = op->constraint;
-		if (expr)
+		if (expr) {
+			parse_asm_constraint(op);
 			verify_input_constraint(expr, expr->string->data);
+		}
 
 		/* Expression */
 		if (!evaluate_expression(op->expr))
diff --git a/expression.h b/expression.h
index a06bfe130..3b79e0f11 100644
--- a/expression.h
+++ b/expression.h
@@ -139,6 +139,12 @@ struct asm_operand {
 	struct ident *name;
 	struct expression *constraint;
 	struct expression *expr;
+	unsigned int is_assign:1;
+	unsigned int is_modify:1;
+	unsigned int is_earlyclobber:1;
+	unsigned int is_commutative:1;
+	unsigned int is_register:1;
+	unsigned int is_memory:1;
 };
 
 struct expression {
-- 
2.23.0


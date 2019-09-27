Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEBCEC0EB1
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbfI0Xni (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:38 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41399 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728538AbfI0Xni (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:38 -0400
Received: by mail-ed1-f65.google.com with SMTP id f20so3711538edv.8
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sIxF0fk3/UNrjRYRUSTrX1zPJ94k+QatPGej04y0ilI=;
        b=bQncEjgdtxMwGcKofiAErxPfOQou6u0kDYUySpGgOz8tuFBNEtseFuUiaXAHVI3cR7
         t1Ebijn3/3U14DE6xWT1BXd05TVMmbxsYThecdFHWYAVs7U9lR62y8DjgeEK0qDqWBvf
         iwOLUWmFqlQTVW4+QUxQ3ajFBUExN1rAEWgUpOZg6Jst9FgMT7RD8LEofJcJqFAhiSXx
         KIYzBvM+epVbHi4RvCn65xvV61KOmB7zCsYBOIbxX0XnyzSxmV6/aQRhKg9AxtiZ8mof
         SiWtML5QOtfgqqWkA73Uw3I+koMpRpBoEzqFpLXEBRUyY//trh906OBdL7GxYFRKNi7L
         S9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sIxF0fk3/UNrjRYRUSTrX1zPJ94k+QatPGej04y0ilI=;
        b=rYHBnng1aXDOpu6eHByK7BwhS6VRxdmOTsNNnfdBavGJgV0OaDNLDoQWfeb2hBVSFB
         +cSCcWN5EENrDxMjDc7IzkMLWA5zlJC9+GTIYNptpxgnrzmWaFE95fZn2l1Mg9Ex6Hgs
         V7aCHWVG5ijKJPKbHzDiRqqqRt1GhYTzvKl0DqDOWK3wh33bnAtPIu0o9RgaQ5obtxxn
         Y4+bB8TDAo7uSxq+L79layP6YKI0iJ6TRqSkHfhYX0P9QMY9mTIRoBeFg+vV97NsRRR6
         gu4YV3mOfYutNAh3EdSVBwMBoBb6hs2615cOAru9M4VAhEUD0HszLApGQVDD1eOLPV43
         t9TQ==
X-Gm-Message-State: APjAAAXKbSV9K24PBX5hinTUxVL5UMBatXgM+X+2Ulh54sg/HFNu6AyZ
        Z75/Cy7i5QHSfxOfSRZJf0liM6OV
X-Google-Smtp-Source: APXvYqzxvXUP7jSbvOnU0Yosh/tCQslISAaRg4m5Y6sOU14zRLvwTJNPPpUT+Ly7Wd4T2CMHZrfPRQ==
X-Received: by 2002:a17:906:f4a:: with SMTP id h10mr9847450ejj.158.1569627816267;
        Fri, 27 Sep 2019 16:43:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:35 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 14/18] asm: missing evaluation of asm statements
Date:   Sat, 28 Sep 2019 01:43:18 +0200
Message-Id: <20190927234322.5157-17-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The operands of extended ASM need to have their type evaluated,
exactly like any other expression.

So, add the missing evaluation of ASM operands.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                  | 18 ++++++++++++++++++
 validation/eval/asm-memop.c |  1 -
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index f0f9b4b34..4f7efc480 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3579,6 +3579,22 @@ static void verify_input_constraint(struct asm_operand *op)
 		expression_error(expr, "input constraint with assignment (\"%s\")", constraint);
 }
 
+static void evaluate_asm_memop(struct asm_operand *op)
+{
+	if (op->is_memory) {
+		struct expression *expr = op->expr;
+		struct expression *addr;
+
+		// implicit addressof
+		addr = alloc_expression(expr->pos, EXPR_PREOP);
+		addr->op = '&';
+		addr->unop = expr;
+
+		evaluate_addressof(addr);
+		op->expr = addr;
+	}
+}
+
 static void evaluate_asm_statement(struct statement *stmt)
 {
 	struct expression *expr;
@@ -3604,6 +3620,7 @@ static void evaluate_asm_statement(struct statement *stmt)
 		if (!lvalue_expression(expr))
 			warning(expr->pos, "asm output is not an lvalue");
 		evaluate_assign_to(expr, expr->ctype);
+		evaluate_asm_memop(op);
 	} END_FOR_EACH_PTR(op);
 
 	FOR_EACH_PTR(stmt->asm_inputs, op) {
@@ -3618,6 +3635,7 @@ static void evaluate_asm_statement(struct statement *stmt)
 		/* Expression */
 		if (!evaluate_expression(op->expr))
 			return;
+		evaluate_asm_memop(op);
 	} END_FOR_EACH_PTR(op);
 
 	FOR_EACH_PTR(stmt->asm_clobbers, expr) {
diff --git a/validation/eval/asm-memop.c b/validation/eval/asm-memop.c
index 9bbb3a305..33ba0e5a5 100644
--- a/validation/eval/asm-memop.c
+++ b/validation/eval/asm-memop.c
@@ -9,7 +9,6 @@ void fo3(int *p) { asm volatile ("op %0" :: "m" (*p)); }
 /*
  * check-name: eval-asm-memop
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-start
 fo0:
-- 
2.23.0


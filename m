Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D09AC0EAD
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbfI0Xng (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:36 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:39033 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbfI0Xng (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:36 -0400
Received: by mail-ed1-f66.google.com with SMTP id a15so3730793edt.6
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j3Qvg0HNus1RCaCiDUYQh1e7G28x1XC0p6SePImSKB0=;
        b=T4MCgcvK/CX3Kv4na+M5IC8brOAntIeuSJEMOYkkZSMUtBJCSCOWJSBrOMCBmdUmHH
         OUWSqPShc4bjk9on1aVWb5UcjaxjYB7FEf51wGSLxjx+9V/Vaolb+4r7Phvr2rseKGkz
         FJPJAT7SkMg7zNn/DAtYScKqalKG1FRS64HVMBip8CwimJvHArtTBVi5766l8c5hvRuM
         QULSIJTKqOE/1EnhVvzLbBQIAv60MDBerqz3xhvbOTOX+4AZaGI9XsJsh13rEyFdOm74
         mvYFEzDKJ4+SfLI1RGtRVFEDoAGURuAWVo65b+U9QkpAmFIRhlkdwswIim5lf9jlRw2T
         TDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j3Qvg0HNus1RCaCiDUYQh1e7G28x1XC0p6SePImSKB0=;
        b=bsNfEUxudZGO3B0On2AoTOvV7eEQKmdHK0e4wqHs9Pa2AYJgvP39qFVVHJO13Hc2eJ
         VDbZ0uiH4gGPEalb9GgMoL+9eCbfJch+W9V2OG1jRvjBQL00LqKQbnh/hSjN8exiL7JY
         jcA0dQBMUECVqQkdipvIIdAhU9hkY9Tikv5MHxIj8dKT1FYIoTBmtwozApFecGrkgrGL
         CyKX9rGO5R/FRy3wINf/P8zdK234deNhO9KomiTw6xg3DoRRKYUxoz6QKbpz6H5hf85e
         aK9AqUiMCc9C74Mb+jF+fvdIJLMwg6WSy6zyedVWPTTUWaSjNc4Hzv/ZV2YVBm0t5YP4
         UBFg==
X-Gm-Message-State: APjAAAUE3EdH0YYO3BIS+p6NXbBhYk9QWeatlJSUMdrkSnbMRkChCwLy
        tPdD4svoYov3BE3A/rwrKhoEmvHw
X-Google-Smtp-Source: APXvYqxqmuRnZ0nGYpzMolkuk7anxv3EtbFepKJwTp1Ydn2bWMRep1fmXSdNKym69qWlnQrh4KwxAA==
X-Received: by 2002:a17:906:9498:: with SMTP id t24mr9770136ejx.88.1569627813995;
        Fri, 27 Sep 2019 16:43:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:33 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 11/18] asm: keep using struct asm_operand during linearization
Date:   Sat, 28 Sep 2019 01:43:15 +0200
Message-Id: <20190927234322.5157-14-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In linearize_asm_statement(), the functions asm_add_{input,output}()
are given the ASM operand 'name', 'constraint' & 'expression'
as argument. However, it's much simpler to simply give the whole
struct asm_operad.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/linearize.c b/linearize.c
index 69f2dfe6b..7724350ba 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2075,31 +2075,29 @@ static pseudo_t linearize_range(struct entrypoint *ep, struct statement *stmt)
 ALLOCATOR(asm_rules, "asm rules");
 ALLOCATOR(asm_constraint, "asm constraints");
 
-static void add_asm_input(struct entrypoint *ep, struct instruction *insn, struct expression *expr,
-	const char *constraint, const struct ident *ident)
+static void add_asm_input(struct entrypoint *ep, struct instruction *insn, struct asm_operand *op)
 {
-	pseudo_t pseudo = linearize_expression(ep, expr);
+	pseudo_t pseudo = linearize_expression(ep, op->expr);
 	struct asm_constraint *rule = __alloc_asm_constraint(0);
 
-	rule->ident = ident;
-	rule->constraint = constraint;
+	rule->ident = op->name;
+	rule->constraint = op->constraint ? op->constraint->string->data : "";
 	use_pseudo(insn, pseudo, &rule->pseudo);
 	add_ptr_list(&insn->asm_rules->inputs, rule);
 }
 
-static void add_asm_output(struct entrypoint *ep, struct instruction *insn, struct expression *expr,
-	const char *constraint, const struct ident *ident)
+static void add_asm_output(struct entrypoint *ep, struct instruction *insn, struct asm_operand *op)
 {
 	struct access_data ad = { NULL, };
 	pseudo_t pseudo = alloc_pseudo(insn);
 	struct asm_constraint *rule;
 
-	if (!expr || !linearize_address_gen(ep, expr, &ad))
+	if (!op->expr || !linearize_address_gen(ep, op->expr, &ad))
 		return;
 	linearize_store_gen(ep, pseudo, &ad);
 	rule = __alloc_asm_constraint(0);
-	rule->ident = ident;
-	rule->constraint = constraint;
+	rule->ident = op->name;
+	rule->constraint = op->constraint ? op->constraint->string->data : "";
 	use_pseudo(insn, pseudo, &rule->pseudo);
 	add_ptr_list(&insn->asm_rules->outputs, rule);
 }
@@ -2110,7 +2108,6 @@ static pseudo_t linearize_asm_statement(struct entrypoint *ep, struct statement
 	struct expression *expr;
 	struct asm_rules *rules;
 	struct asm_operand *op;
-	const char *constraint;
 
 	insn = alloc_instruction(OP_ASM, 0);
 	expr = stmt->asm_string;
@@ -2125,16 +2122,14 @@ static pseudo_t linearize_asm_statement(struct entrypoint *ep, struct statement
 
 	/* Gather the inputs.. */
 	FOR_EACH_PTR(stmt->asm_inputs, op) {
-		constraint = op->constraint ? op->constraint->string->data : "";
-		add_asm_input(ep, insn, op->expr, constraint, op->name);
+		add_asm_input(ep, insn, op);
 	} END_FOR_EACH_PTR(op);
 
 	add_one_insn(ep, insn);
 
 	/* Assign the outputs */
 	FOR_EACH_PTR(stmt->asm_outputs, op) {
-		constraint = op->constraint ? op->constraint->string->data : "";
-		add_asm_output(ep, insn, op->expr, constraint, op->name);
+		add_asm_output(ep, insn, op);
 	} END_FOR_EACH_PTR(op);
 
 	return VOID;
-- 
2.23.0


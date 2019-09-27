Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDA7DC0EB3
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbfI0Xnk (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:40 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35810 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbfI0Xnk (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:40 -0400
Received: by mail-ed1-f65.google.com with SMTP id v8so3751972eds.2
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kxo4izDidFVysmwdv+kfyq0Qbyy1ne+H7jf+alrQCx4=;
        b=reg1Yd6s4nPbhjdPU/a59tavpevW4zrhdAygvvhUr4MBKx/fZ7V0ejBM4l2an6S51H
         qUbTRwwGqzw2/1CedjUqGkFQYMfyg6ziTFCOLubIvULBGua+c5UPyIH3kyQHqx3LTZAL
         5hZLCtVn2PS0Bp9zIhWBsDR5s7O+C/ijcSB7IJSu7ERD7epO2CEAtv6EaCoEITIrT2F/
         VP+NCv/rpb2KxIKJA9gftarGFZaSkV7MkMgM4SGNTjYeVIJ67zWxbh5q4srE8/zOgCTL
         gGVqoYJn5oKAvyy6uLJZJoDrssEL6J4zMJS/3ULJDVvL21fuiA/YthBdN1/gQWKUqZvG
         k6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kxo4izDidFVysmwdv+kfyq0Qbyy1ne+H7jf+alrQCx4=;
        b=pSnouju2mWDkwDrC2QEgMLveJgxq3X+4OcotExNdahtP5dgApH1zs/ws+I7835yu+O
         Xbgt12v28GoEL0BwOGm123XUpKCDhQrtj5PFRL8XIW4+T2QKh38ydyRPUF4600in5cj0
         gRgiPKHb2ya9Iwfvi6HmrDFRW34KYS89eJoTVaD0p+0aIHPrmCvg8qQQOTyofCkkhYaK
         xWH401LrrEVaL0Qayai6DzjU1EF1LqNeRW6m4cGSclgwNaZ5icIVzE0bFgY2xIJjHBdJ
         g19xqBXZyYLDyq3hvW7CKIauRnC8/CkDa58D/2Tcfmia3lpPFjH6JroyffLf/uPCWaf9
         /BDA==
X-Gm-Message-State: APjAAAXB+XhwPn09a9mxTweW6GiMr1DzX8cHXIwzPqZ6hgeFyXZnqPog
        6ZEn6sQA/UDelm2ILALRsDvy4FFt
X-Google-Smtp-Source: APXvYqzcZqlEGNDSz+xTpXVdHkq1zg1BxTR3zQoujCGkTV3R/EOqpbK/hG+OV+lstGyHTbgZ5JsylQ==
X-Received: by 2002:a05:6402:346:: with SMTP id r6mr7349359edw.124.1569627816958;
        Fri, 27 Sep 2019 16:43:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:36 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 15/18] asm: linearization of output memory operands is different
Date:   Sat, 28 Sep 2019 01:43:19 +0200
Message-Id: <20190927234322.5157-18-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

ASM memory operands are considered by GCC as some kind of implicit
reference. Their linearization should thus not create any storage
statement: the storage is done by the ASM code itself.

Adjust the linearization of such operands accordingly.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c                   | 13 +++++++++----
 validation/linear/asm-memop.c |  1 -
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/linearize.c b/linearize.c
index 7724350ba..68be3ab1e 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2089,12 +2089,17 @@ static void add_asm_input(struct entrypoint *ep, struct instruction *insn, struc
 static void add_asm_output(struct entrypoint *ep, struct instruction *insn, struct asm_operand *op)
 {
 	struct access_data ad = { NULL, };
-	pseudo_t pseudo = alloc_pseudo(insn);
+	pseudo_t pseudo;
 	struct asm_constraint *rule;
 
-	if (!op->expr || !linearize_address_gen(ep, op->expr, &ad))
-		return;
-	linearize_store_gen(ep, pseudo, &ad);
+	if (op->is_memory) {
+		pseudo = linearize_expression(ep, op->expr);
+	} else {
+		if (!linearize_address_gen(ep, op->expr, &ad))
+			return;
+		pseudo = alloc_pseudo(insn);
+		linearize_store_gen(ep, pseudo, &ad);
+	}
 	rule = __alloc_asm_constraint(0);
 	rule->ident = op->name;
 	rule->constraint = op->constraint ? op->constraint->string->data : "";
diff --git a/validation/linear/asm-memop.c b/validation/linear/asm-memop.c
index 97df98e22..245c8d0f0 100644
--- a/validation/linear/asm-memop.c
+++ b/validation/linear/asm-memop.c
@@ -8,7 +8,6 @@ static int foo(int *p)
 /*
  * check-name: linear-asm-memop
  * check-command: test-linearize $file
- * check-known-to-fail
  *
  * check-output-start
 foo:
-- 
2.23.0


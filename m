Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8F03119EF5
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfLJW7s (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:48 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46855 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJW7s (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:48 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so21857252wrl.13
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oaIbsdT6lakziWuf1dkiOeWdtPSd6EsteHwxBEXTC0Q=;
        b=bUAlFjr46iIL01OdxejMDXKJmmOgO2JSKau4i/id5e4oMoR4ZqPwgU8VGvwVD/70+o
         F+w9CMnQm8dJY6S7Ik9/wknXvaWY1Ru+6QoYzkoX0a16GrK3OqoZOGzHEnmHy3MLBWwK
         SY1Fe2HbvwBFuMMrgg0XtdDQCWANogXTgJv1r52ji3Ukfsxy4TDCRd9JASYLjFGPiPGw
         gHwMjOxI8jKuSy3yRmGhVKOE3UfuL1qH8utU72umS6k/V0jiEKfVod3YaLIycaI+M8hR
         SlXOT7fTsGZDjZFiQTFACnJUGkJTd1AyFCr93oNvDi+8UueTiXIW3+XsanlqqsnaCr3C
         MClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oaIbsdT6lakziWuf1dkiOeWdtPSd6EsteHwxBEXTC0Q=;
        b=E0UNSGQiRp/5MfUTqgaRGAQN/Xwa/0HX2GkRDxgnQQIemK8yDnDbIni5YNsAkRJIby
         BvQzUk23Wj1mVBaunXY5NbfTcKyAmlmy2ZuNt+BoVLdFvee7Q5J4Ug1AZ15kzleOpYyJ
         OjrpwKLSnonnB5p7FWwuGOgOm7/gL7lRrfqBn7R0Vx1vVbiLy29iHFRt4932GS4MxdCS
         pJzf8ILMzC6+tSnQuMzZ/axgjt1MiCXPReBwqW9KLRj62ulrtHmoEpShUGV1v0LDSWul
         yODTLw8XvIp5/g3ai8me2tDll1dk+sx1YoTdNfb3C7bkqBqFcH7EeeaMdd1bX0GOkXBv
         V8OA==
X-Gm-Message-State: APjAAAWwUoMRofxEDvyXl23NRt07D6fnIW6wpcX2xvePa38nYdakrBDM
        lPt3EUUKpjQ7sd7wYlx2GJvfqQzP
X-Google-Smtp-Source: APXvYqyA3CszOiyKokoqTNfsaMvk8Iy3TImluFLDD40hCRmT6CPPHdnk0FuSwBLSTQe9SgNyLyD9Ow==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr10677wrm.210.1576018785669;
        Tue, 10 Dec 2019 14:59:45 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:44 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 14/17] fix simplify_loads() when doing type punning
Date:   Tue, 10 Dec 2019 23:59:18 +0100
Message-Id: <20191210225921.94897-15-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When doing loads simplification for a location where
floats & integers are mixed, loads are systematically
replaced with the value of their dominating memop (this
checks if the corresponding write or load overlaps).

However, this must not be done if the involved operations
are doing some form of integer/float type punning.

Fix this by refusing to convert load of an integer by a
previous float value or the opposite.

Note: another way to describe this problem would be to say
      that floats need to have their own memory operations:
          OP_FSTORE & OP_FLOAD
      or that instructions need to have some form of 'machine type'
      in addition of the size (like clang's i32/f32, ...).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 memops.c                                 | 11 +++++++++++
 validation/memops/type-punning-flt2int.c |  1 -
 validation/memops/type-punning-int2flt.c |  1 -
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/memops.c b/memops.c
index 5df2c0339415..f071e556da8a 100644
--- a/memops.c
+++ b/memops.c
@@ -82,6 +82,15 @@ static int local_pseudo(pseudo_t pseudo)
 		&& !address_taken(pseudo);
 }
 
+static bool compatible_loads(struct instruction *a, struct instruction *b)
+{
+	if (is_integral_type(a->type) && is_float_type(b->type))
+		return false;
+	if (is_float_type(a->type) && is_integral_type(b->type))
+		return false;
+	return true;
+}
+
 static void simplify_loads(struct basic_block *bb)
 {
 	struct instruction *insn;
@@ -114,6 +123,8 @@ static void simplify_loads(struct basic_block *bb)
 							continue;
 						goto next_load;
 					}
+					if (!compatible_loads(insn, dom))
+						goto next_load;
 					/* Yeehaa! Found one! */
 					convert_load_instruction(insn, dom->target);
 					goto next_load;
diff --git a/validation/memops/type-punning-flt2int.c b/validation/memops/type-punning-flt2int.c
index a76c6c1da534..fadaf6876d13 100644
--- a/validation/memops/type-punning-flt2int.c
+++ b/validation/memops/type-punning-flt2int.c
@@ -13,7 +13,6 @@ static int foo(void)
  * check-name: type-punning-float-to-int
  * check description: must not infer the int value from the float
  * check-command: test-linearize $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: load\\.
diff --git a/validation/memops/type-punning-int2flt.c b/validation/memops/type-punning-int2flt.c
index c05ce252f305..061b742352c4 100644
--- a/validation/memops/type-punning-int2flt.c
+++ b/validation/memops/type-punning-int2flt.c
@@ -13,7 +13,6 @@ static float foo(void)
  * check-name: type-punning-int-to-float
  * check description: must not infer the float value from the int
  * check-command: test-linearize $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: load\\.
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705BC214639
	for <lists+linux-sparse@lfdr.de>; Sat,  4 Jul 2020 15:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgGDN5z (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 4 Jul 2020 09:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgGDN5y (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 4 Jul 2020 09:57:54 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E74EC061794
        for <linux-sparse@vger.kernel.org>; Sat,  4 Jul 2020 06:57:54 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id n26so23419583ejx.0
        for <linux-sparse@vger.kernel.org>; Sat, 04 Jul 2020 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ADSa1pDDmZGimTkVuohMELwRvAP1HXLo1yWwDLJeRxY=;
        b=ZNG8NWrXQUhjIDBJWQcAUz58iMY0AkiUXrzj4h+1spCWp79nvkKlGj+2Xf+6dePlCS
         y0jU80ngonUt3RMxEogq1hv+fvwwPUpABENuXuL3pOt0AihwX5OIJctB9gLwWVUzrsoh
         zSGMyaNdsEEyksSczZieqRpKOBGlMMp3ob4UUhtSsSH4H1QiIEAh/l5pU3FpNwTtmdVJ
         smDePM+nlxrYphrvYxxgnB+zHQQsUzlQ/+O/3/+59laEqLULB4M74CLfSTMP4A2GLBQg
         1j8DpBZr9k8GsmDQ49eoR3J5t/aVhuRdpirYXMn8wQreIWG210+c6egTcSboAhGXAuAu
         Mb5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ADSa1pDDmZGimTkVuohMELwRvAP1HXLo1yWwDLJeRxY=;
        b=sHk5dsv4d65AKQIJbaD0XPZrDQD7KNsxQZA6+WN9qsHLi7W+tYGVroXUS3byqUBX81
         soXfpCKNutfJyrtmrS8LGQViQuhS/537j8Vx82NWX6jAIENzTC7RyIjwVM1t3CdY0/Tc
         loqwFafcS3hDFw1gH3E0jhc34CQ4EM7JtTfHBctKjDOjhdGuycrstCDP8x42njIefIHX
         V5pJM3PHYMcXwzrko7HLR/HS3qQPMmiMG/zXOtx9dSBKTtdcp0Qj1tKLgBQZX0EMxKfI
         /6ZtdqPzAfW6AedBV8b4HG6knnGCe06dY32PtUH3RdAdWc7WXBPRyNcGUCMC2zyXZs4X
         Q9nQ==
X-Gm-Message-State: AOAM530kgXNojZPzv4qYoC0HWk5Vs5eMVs/b7kUX5JHOKU/H9kPBHdMz
        5mqtjXVNMD25+hh5cR+KgolTqcFQ
X-Google-Smtp-Source: ABdhPJz4ob9CH7aj/ErBpCQVy5WkH6ubGSZJ40G9NY1DWIjgNSVCvUz6K9H0FPpPczvazKxO/v49GA==
X-Received: by 2002:a17:906:7247:: with SMTP id n7mr36651140ejk.105.1593871073135;
        Sat, 04 Jul 2020 06:57:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:41c2:9e8d:5955:8578])
        by smtp.gmail.com with ESMTPSA id w18sm16348297edv.11.2020.07.04.06.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 06:57:52 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/3] add memory asm constraint for PPC
Date:   Sat,  4 Jul 2020 15:57:46 +0200
Message-Id: <20200704135747.87752-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200704135747.87752-1-luc.vanoostenryck@gmail.com>
References: <20200704135747.87752-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The 'Z' asm constraint is used for doing IO accessors on PPC but
isn't part of the 'common constraints'. It's responsible for
more than half of all warnings (with defconfig + allyesconfig).

Fix this by handling this constraint in a specific method for PPC.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target-ppc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target-ppc.c b/target-ppc.c
index b138635b9103..c0d6068f436a 100644
--- a/target-ppc.c
+++ b/target-ppc.c
@@ -1,6 +1,7 @@
 #include "symbol.h"
 #include "target.h"
 #include "machine.h"
+#include "expression.h"
 
 
 static void predefine_ppc(const struct target *self)
@@ -15,6 +16,16 @@ static void predefine_ppc(const struct target *self)
 		predefine("_BIG_ENDIAN", 1, "1");
 }
 
+static const char *asm_constraint_ppc(struct asm_operand *op, int c, const char *str)
+{
+	switch (c) {
+	case 'Z':
+		op->is_memory = true;
+		break;
+	}
+	return str;
+}
+
 
 static void predefine_ppc32(const struct target *self)
 {
@@ -32,6 +43,7 @@ const struct target target_ppc32 = {
 	.target_64bit = &target_ppc64,
 
 	.predefine = predefine_ppc32,
+	.asm_constraint = asm_constraint_ppc,
 };
 
 
@@ -55,4 +67,5 @@ const struct target target_ppc64 = {
 	.target_32bit = &target_ppc32,
 
 	.predefine = predefine_ppc64,
+	.asm_constraint = asm_constraint_ppc,
 };
-- 
2.27.0


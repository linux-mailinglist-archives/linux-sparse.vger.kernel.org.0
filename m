Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83640FD249
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfKOBOK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:14:10 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38854 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbfKOBOK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:14:10 -0500
Received: by mail-wm1-f68.google.com with SMTP id z19so8583953wmk.3
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaLz94TSXFs920zrC/G9AmzAcwYsfqfaSasZyapJQ+8=;
        b=JebyXhJRuGscmulg0Hvz+vao7LG9XfLRnm5GGJ9EEKiDWROM5xJ5dLYk3St/b1ITXw
         AMRbRFLlAybbJLfPniXL1WpAmnvTdXMySEmLXd0qXb8GneW8bYEWcCLzWNfqHzNc6l4v
         LUi/OYg9+7LG0RDvGRAZW2loNNWggD4vFnX7J6hMNrk7RjMf2r+rkNL89OM9l5FRXHQV
         VrtxQF62XsLioHexP8Kor06lnNgzFMgpoI7rBB+VPwiE7WJfJlJqtut1NBdAFGqJexuY
         6Ho2x3mu6i77cJWaa89GZkld+/9JuBDL4+14mitr9vJR74u/PAaM/48ZK8NEvlu8uTRM
         5RJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaLz94TSXFs920zrC/G9AmzAcwYsfqfaSasZyapJQ+8=;
        b=lQ7WQKNKKzPOwNlVapjS86EUYgBiD2j1+DAqFzMNbSXllSWjq9g8AGpy/H/uPOzLWV
         x8YUUjieldp5LfE3Gf+ipt0cex09QaY1wVmCubtUwT0PJV80Qshr7bn43AogwyvorXK8
         uc1SIRxPeN1zDVkaaqX1s1V5KKNrRNAqGtV3p8+hTpzfHghIrVUcoM2rdvgT4jwoG7ST
         ABTxVH8XzYT4hz2CirPeJtmuD0vomAXCpXCEtR/v6kT9n5CRv6vjQ1gQudRxzNfyawqM
         flciAfgoThj1uACPwsvm6Cw73dFxSrd2Qx/cZx6OE52lXI0iLStqQVHIktEsK0PnHnYI
         0mOA==
X-Gm-Message-State: APjAAAW8s1Hgcth63XZJjcCeQtvRwYbKD5UGE8k+0GtGZ0Ed31k8XAkF
        W3laH5QSXm/zNkVqurNVOsN2dkmn
X-Google-Smtp-Source: APXvYqwIn/rSCaYtBBqoRpEICYLPQRVi0rzln3w9auh4FCuGAWOxZN/8TzLUW/Mr/hVfdGxd+kqitw==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr12277170wmg.146.1573780444430;
        Thu, 14 Nov 2019 17:14:04 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id l4sm7918792wml.33.2019.11.14.17.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:14:03 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/8] arch: remove impossible cases with 64-bit arch not being lp64
Date:   Fri, 15 Nov 2019 02:13:52 +0100
Message-Id: <20191115011355.53495-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
References: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The code at the start of init_target() already take care
of making the arch variants match their bitness. It's thus
not possible, when setting the type of [u]int32, to have
mips64, ppc64, riscv64 or sparc64 with arch_m64 different
than ARCH_LP64.

So, remove the unneeded checks.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c    | 23 +++++++++--------------
 target.c |  4 ----
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/lib.c b/lib.c
index 350d881a9..57d2738bf 100644
--- a/lib.c
+++ b/lib.c
@@ -1494,8 +1494,7 @@ static void predefined_macros(void)
 		predefine("__m68k__", 1, "1");
 		break;
 	case MACH_MIPS64:
-		if (arch_m64 == ARCH_LP64)
-			predefine("__mips64", 1, "64");
+		predefine("__mips64", 1, "64");
 		/* fall-through */
 	case MACH_MIPS32:
 		predefine("__mips__", 1, "1");
@@ -1505,11 +1504,9 @@ static void predefined_macros(void)
 		predefine("_MIPS_SZPTR", 1, "%d", ptr_ctype.bit_size);
 		break;
 	case MACH_PPC64:
-		if (arch_m64 == ARCH_LP64) {
-			predefine("__powerpc64__", 1, "1");
-			predefine("__ppc64__", 1, "1");
-			predefine("__PPC64__", 1, "1");
-		}
+		predefine("__powerpc64__", 1, "1");
+		predefine("__ppc64__", 1, "1");
+		predefine("__PPC64__", 1, "1");
 		/* fall-through */
 	case MACH_PPC32:
 		predefine("__powerpc__", 1, "1");
@@ -1531,13 +1528,11 @@ static void predefined_macros(void)
 		predefine("__s390__", 1, "1");
 		break;
 	case MACH_SPARC64:
-		if (arch_m64 == ARCH_LP64) {
-			predefine("__sparc_v9__", 1, "1");
-			predefine("__sparcv9__", 1, "1");
-			predefine("__sparcv9", 1, "1");
-			predefine("__sparc64__", 1, "1");
-			predefine("__arch64__", 1, "1");
-		}
+		predefine("__sparc_v9__", 1, "1");
+		predefine("__sparcv9__", 1, "1");
+		predefine("__sparcv9", 1, "1");
+		predefine("__sparc64__", 1, "1");
+		predefine("__arch64__", 1, "1");
 		/* fall-through */
 	case MACH_SPARC32:
 		predefine("__sparc__", 1, "1");
diff --git a/target.c b/target.c
index bdda7ec7f..146c4125d 100644
--- a/target.c
+++ b/target.c
@@ -105,10 +105,6 @@ void init_target(void)
 	}
 
 	switch (arch_mach) {
-	case MACH_MIPS64:
-		if (arch_m64 == ARCH_LP64)
-			break;
-		/* fall through */
 	case MACH_M68K:
 	case MACH_SPARC32:
 	case MACH_PPC32:
-- 
2.24.0


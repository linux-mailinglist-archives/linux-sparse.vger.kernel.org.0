Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 257C9121E64
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfLPWiI (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:08 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50422 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727779AbfLPWiI (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:08 -0500
Received: by mail-wm1-f67.google.com with SMTP id a5so1005181wmb.0
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0tCVCsbPyz5znhbk1jAbs5ljhuwBAjPRifvQndCMclI=;
        b=D2fUiTJ3u+N0dR7Iu2d771Qdm2lLn1RAlrS4AXqYYxLXEF87WIuZRSfgPmteI+UHP/
         SERmjcuDDmC51gxNF2hVSUYW0/Zl0JAVC3XpdI7CgOHYgco6T9FAXWQbh6szYdI5pqie
         L/dpcaSKpb84sIyRPytSobaKfLGv5wAFn+Tbty9WcBz6m2Rxta6LfG8kdNgjVDSo+ajE
         K+DOCSEsnrHMW4ogOz87BA0E6VTslDVTCT0XpI2ixoMdlc6wMr+cMl5MEqIidnCJx59n
         Cwt3LFQMQV1MnzCAqQSk1V6TtpR20yh96HxkcFAENY3/C6GA1TrmMdG9InLUSkdDW5xI
         /HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0tCVCsbPyz5znhbk1jAbs5ljhuwBAjPRifvQndCMclI=;
        b=OOBBmy/PBxcYeHTcr3OIn93q7CaXKbGk9i1PZUuEPGDV81n8AHAE5F99FJ9ZwA7Zag
         PJbN2D1xxvyz8xhha4oA76Ad3GR4wGrn9ZhCzHqxQ3h+SH3vuS2Gokd1OnUVsOEswfw2
         VgJedM9/ZZtYrnxUdehhHo4XWZHL9CPufP3kf8SeFWjhcuxPje7Pxq+u/BYq/42FStZq
         2OCiIIo49ETwcnzX2ekSioe6uiQmg699ec898GPZirMuT4+WRPG2mzZn64RfMDOwme3b
         iTo2DyjyA4fPIx4lczCUnuRe3WxslNYLHC3ZUldHMTTOylNa3Qg4K5m5URIqmuEcYitd
         dggw==
X-Gm-Message-State: APjAAAV4aRO/nEjFxeu871nC9eWMIQ1ExtRKLM+MABSVf3d7Zzzog8ER
        w/rRgDUjum+RM8+0ybIq8CLkfIAl
X-Google-Smtp-Source: APXvYqzHTMAAH/G74PHp5VR8NZHUfn8wIBsn9IpEwJLF3H+QDmMk0zyb6lQPbL52Wm5AsEbCaDGzwA==
X-Received: by 2002:a1c:4884:: with SMTP id v126mr1380603wma.64.1576535884999;
        Mon, 16 Dec 2019 14:38:04 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:04 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 05/10] arch: move handle_arch_finalize() into target_init()
Date:   Mon, 16 Dec 2019 23:37:51 +0100
Message-Id: <20191216223756.2428-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
References: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Before initaializing the builtin types some 'finalizations' are
needed. target_ini() already does most of this.

So, move the arch-specific content of handle_arch_finalize()
into the corresponding target files and the generic part to
target_init().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c          | 35 +----------------------------------
 lib.h          |  1 +
 target-arm64.c |  8 ++++++++
 target-riscv.c | 12 ++++++++++++
 target.c       | 10 ++++++++++
 5 files changed, 32 insertions(+), 34 deletions(-)

diff --git a/lib.c b/lib.c
index 82354af7eafa..366acd45436a 100644
--- a/lib.c
+++ b/lib.c
@@ -320,7 +320,7 @@ int preprocess_only;
 
 enum standard standard = STANDARD_GNU89;
 
-static int arch_msize_long = 0;
+int arch_msize_long = 0;
 int arch_m64 = ARCH_M64_DEFAULT;
 int arch_big_endian = ARCH_BIG_ENDIAN;
 int arch_fp_abi = FP_ABI_NATIVE;
@@ -714,38 +714,6 @@ static char **handle_switch_m(char *arg, char **next)
 	return next;
 }
 
-static void handle_arch_msize_long_finalize(void)
-{
-	if (arch_msize_long) {
-		size_t_ctype = &ulong_ctype;
-		ssize_t_ctype = &long_ctype;
-	}
-}
-
-static void handle_arch_finalize(void)
-{
-	handle_arch_msize_long_finalize();
-
-	if (fpie > fpic)
-		fpic = fpie;
-	if (fshort_wchar)
-		wchar_ctype = &ushort_ctype;
-
-	switch (arch_mach) {
-	case MACH_ARM64:
-		if (arch_cmodel == CMODEL_UNKNOWN)
-			arch_cmodel = CMODEL_SMALL;
-		break;
-	case MACH_RISCV32:
-	case MACH_RISCV64:
-		if (arch_cmodel == CMODEL_UNKNOWN)
-			arch_cmodel = CMODEL_MEDLOW;
-		if (fpic)
-			arch_cmodel = CMODEL_PIC;
-		break;
-	}
-}
-
 static char **handle_switch_o(char *arg, char **next)
 {
 	if (!strcmp (arg, "o")) {       // "-o foo"
@@ -1732,7 +1700,6 @@ struct symbol_list *sparse_initialize(int argc, char **argv, struct string_list
 	if (filelist) {
 		// Initialize type system
 		target_init();
-		handle_arch_finalize();
 		init_ctype();
 
 		predefined_macros();
diff --git a/lib.h b/lib.h
index 3e565c6fd02d..d0585e363bce 100644
--- a/lib.h
+++ b/lib.h
@@ -205,6 +205,7 @@ extern int fpie;
 extern int fshort_wchar;
 extern int funsigned_char;
 
+extern int arch_msize_long;
 extern int arch_m64;
 extern int arch_big_endian;
 extern int arch_fp_abi;
diff --git a/target-arm64.c b/target-arm64.c
index bfada515b81f..1efd0899495d 100644
--- a/target-arm64.c
+++ b/target-arm64.c
@@ -3,6 +3,12 @@
 #include "machine.h"
 
 
+static void init_arm64(const struct target *self)
+{
+	if (arch_cmodel == CMODEL_UNKNOWN)
+		arch_cmodel = CMODEL_SMALL;
+}
+
 const struct target target_arm64 = {
 	.mach = MACH_ARM64,
 	.bitness = ARCH_LP64,
@@ -11,4 +17,6 @@ const struct target target_arm64 = {
 	.unsigned_char = 1,
 
 	.wchar = &uint_ctype,
+
+	.init = init_arm64,
 };
diff --git a/target-riscv.c b/target-riscv.c
index cbec76237d48..09edfd7afeaf 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -3,6 +3,14 @@
 #include "machine.h"
 
 
+static void init_riscv(const struct target *self)
+{
+	if (arch_cmodel == CMODEL_UNKNOWN)
+		arch_cmodel = CMODEL_MEDLOW;
+	if (fpic)
+		arch_cmodel = CMODEL_PIC;
+}
+
 const struct target target_riscv32 = {
 	.mach = MACH_RISCV32,
 	.bitness = ARCH_LP32,
@@ -10,6 +18,8 @@ const struct target target_riscv32 = {
 	.unsigned_char = 1,
 
 	.target_64bit = &target_riscv64,
+
+	.init = init_riscv,
 };
 
 const struct target target_riscv64 = {
@@ -19,4 +29,6 @@ const struct target target_riscv64 = {
 	.unsigned_char = 1,
 
 	.target_32bit = &target_riscv32,
+
+	.init = init_riscv,
 };
diff --git a/target.c b/target.c
index 8d2d10588d60..006292cc00ba 100644
--- a/target.c
+++ b/target.c
@@ -181,6 +181,9 @@ void target_init(void)
 	arch_target = target;
 	arch_mach = target->mach;
 
+	if (fpie > fpic)
+		fpic = fpie;
+
 	if (target->wchar)
 		wchar_ctype = target->wchar;
 	if (target->wint)
@@ -192,4 +195,11 @@ void target_init(void)
 
 	if (target->init)
 		target->init(target);
+
+	if (arch_msize_long) {
+		size_t_ctype = &ulong_ctype;
+		ssize_t_ctype = &long_ctype;
+	}
+	if (fshort_wchar)
+		wchar_ctype = &ushort_ctype;
 }
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0817121E67
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbfLPWiK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:10 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37344 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbfLPWiK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:10 -0500
Received: by mail-wm1-f65.google.com with SMTP id f129so1002727wmf.2
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R015iISVnBATUZNCGpQtyo5zWqdusVxf/qk0xNmPJrQ=;
        b=lQoclnnKt2JOX2ZUWoxILpfrzLQspgAPeHDcowCxsDWAIl9M3EG7B/AfydhJ62zMw9
         q/FXrhncoAwqF5LIH1pma5Gf6TS7StgsSMpV/Y7HSgLUmJiqN6NgHoiO+RWRWCyaN28K
         3qEISb1qNN1K4nqz8d78YAvoZ0AWbsUAKGRcVfuSDBkyRNR9YUbYqTsfOLk9t3wH7GUT
         WswP1tQrxaNHRhYvQvB7pEXU5u/68jydM6Hpw4oDgxiKR9X+x7XkWIr3RBVonURTs8uz
         DAtT6gJbgK7TIAsca1l65rYkuCBQ6/qnYf6S5qqDVJZTsf0BxlKDhuCs9YZ+3bSscS1i
         /9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R015iISVnBATUZNCGpQtyo5zWqdusVxf/qk0xNmPJrQ=;
        b=qO6miCy6/e2eDGKK2zIPj9Pcn8b0TB6bbC/NSqIcIZeBLlr2FcQxFlUzWmu0KpgCuY
         QmAU/RlI3nxeCtI/OW1hela2Bd2OoPHDBR3TNW5MGrrASJnO3P+yy/+QPPDFgZdWdsif
         SMlTe28QiF/vZpyNtMj87hiMnjaUby3oPNeO0Obexyesq34jsoqmFuagrPJ95sXUkmbD
         lgqr5jsE1Hzr9bd1zGG3inhTiSAsNbD2MEeZ9pJw8D8889ASwpoVpvqBWt8D5CyFH/GI
         mp6UQlbY+LqDDnK/fg9ZUQkN+2aeBXl5aZxt/rKf69c6f9NuHuzp8ddZjNl7hn09G88q
         N05Q==
X-Gm-Message-State: APjAAAWWdXC7pM5V33numRHyWwf3ynv6jnVq9hBIN4sJu8W/1ubV1v0p
        mp2uOo3WZr9rNXsQuEuysZUyI3Pu
X-Google-Smtp-Source: APXvYqzRUFidjm5rlr++y9hcwaKEIh4seZgNHnKg+d7Gw+eROgHE3EFd6qNt0fkLSpQXN11aEfySbw==
X-Received: by 2002:a05:600c:2549:: with SMTP id e9mr1542613wma.6.1576535886857;
        Mon, 16 Dec 2019 14:38:06 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:06 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 07/10] arch: move target-specific predefines to the target files.
Date:   Mon, 16 Dec 2019 23:37:53 +0100
Message-Id: <20191216223756.2428-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
References: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Now that each supported arch has its own target file,
move the arch-specific predefines to these files too.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c          | 87 ++------------------------------------------------
 target-arm.c   | 20 ++++++++++++
 target-arm64.c |  6 ++++
 target-m68k.c  |  7 ++++
 target-mips.c  | 27 ++++++++++++++++
 target-ppc.c   | 32 +++++++++++++++++++
 target-riscv.c |  8 +++++
 target-s390.c  | 18 +++++++++++
 target-sparc.c | 28 ++++++++++++++++
 target-x86.c   | 20 ++++++++++++
 target.h       |  1 +
 11 files changed, 169 insertions(+), 85 deletions(-)

diff --git a/lib.c b/lib.c
index 366acd45436a..a2514b420888 100644
--- a/lib.c
+++ b/lib.c
@@ -1446,91 +1446,6 @@ static void predefined_macros(void)
 		break;
 	}
 
-	switch (arch_mach) {
-	case MACH_ARM64:
-		predefine("__aarch64__", 1, "1");
-		break;
-	case MACH_ARM:
-		predefine("__arm__", 1, "1");
-		switch (arch_fp_abi) {
-		case FP_ABI_HARD:
-			predefine("__ARM_PCS_VFP", 1, "1");
-			break;
-		case FP_ABI_SOFT:
-			predefine("__SOFTFP__", 1, "1");
-			/* fall-through */
-		case FP_ABI_HYBRID:
-			predefine("__ARM_PCS", 1, "1");
-			break;
-		}
-		predefine("__VFP_FP__", 1, "1");
-		break;
-	case MACH_M68K:
-		predefine("__m68k__", 1, "1");
-		break;
-	case MACH_MIPS64:
-		predefine("__mips64", 1, "64");
-		/* fall-through */
-	case MACH_MIPS32:
-		predefine("__mips__", 1, "1");
-		predefine("__mips", 1, "%d", ptr_ctype.bit_size);
-		predefine("_MIPS_SZINT", 1, "%d", int_ctype.bit_size);
-		predefine("_MIPS_SZLONG", 1, "%d", long_ctype.bit_size);
-		predefine("_MIPS_SZPTR", 1, "%d", ptr_ctype.bit_size);
-		break;
-	case MACH_PPC64:
-		predefine("__powerpc64__", 1, "1");
-		predefine("__ppc64__", 1, "1");
-		predefine("__PPC64__", 1, "1");
-		predefine("_ARCH_PPC64", 1, "1");
-		/* fall-through */
-	case MACH_PPC32:
-		predefine("__powerpc__", 1, "1");
-		predefine("__powerpc", 1, "1");
-		predefine("__ppc__", 1, "1");
-		predefine("__PPC__", 1, "1");
-		predefine("__PPC", 1, "1");
-		predefine("_ARCH_PPC", 1, "1");
-		if (arch_big_endian)
-			predefine("_BIG_ENDIAN", 1, "1");
-		break;
-	case MACH_RISCV64:
-	case MACH_RISCV32:
-		predefine("__riscv", 1, "1");
-		predefine("__riscv_xlen", 1, "%d", ptr_ctype.bit_size);
-		break;
-	case MACH_S390X:
-		predefine("__zarch__", 1, "1");
-		predefine("__s390x__", 1, "1");
-	case MACH_S390:
-		predefine("__s390__", 1, "1");
-		break;
-	case MACH_SPARC64:
-		predefine("__sparc_v9__", 1, "1");
-		predefine("__sparcv9__", 1, "1");
-		predefine("__sparcv9", 1, "1");
-		predefine("__sparc64__", 1, "1");
-		predefine("__arch64__", 1, "1");
-		/* fall-through */
-	case MACH_SPARC32:
-		predefine("__sparc__", 1, "1");
-		predefine("__sparc", 1, "1");
-		break;
-	case MACH_X86_64:
-		if (arch_m64 != ARCH_LP32) {
-			predefine("__x86_64__", 1, "1");
-			predefine("__x86_64", 1, "1");
-			predefine("__amd64__", 1, "1");
-			predefine("__amd64", 1, "1");
-			break;
-		}
-		/* fall-through */
-	case MACH_I386:
-		predefine("__i386__", 1, "1");
-		predefine("__i386", 1, "1");
-		break;
-	}
-
 	if (fpic) {
 		predefine("__pic__", 0, "%d", fpic);
 		predefine("__PIC__", 0, "%d", fpic);
@@ -1540,6 +1455,8 @@ static void predefined_macros(void)
 		predefine("__PIE__", 0, "%d", fpie);
 	}
 
+	if (arch_target->predefine)
+		arch_target->predefine(arch_target);
 	predefined_cmodel();
 }
 
diff --git a/target-arm.c b/target-arm.c
index f5af04ee1fbb..0d7c6134795f 100644
--- a/target-arm.c
+++ b/target-arm.c
@@ -3,6 +3,24 @@
 #include "machine.h"
 
 
+static void predefine_arm(const struct target *self)
+{
+	predefine("__arm__", 1, "1");
+	predefine("__VFP_FP__", 1, "1");
+
+	switch (arch_fp_abi) {
+	case FP_ABI_HARD:
+		predefine("__ARM_PCS_VFP", 1, "1");
+		break;
+	case FP_ABI_SOFT:
+		predefine("__SOFTFP__", 1, "1");
+		/* fall-through */
+	case FP_ABI_HYBRID:
+		predefine("__ARM_PCS", 1, "1");
+		break;
+	}
+}
+
 const struct target target_arm = {
 	.mach = MACH_ARM,
 	.bitness = ARCH_LP32,
@@ -13,4 +31,6 @@ const struct target target_arm = {
 
 	.bits_in_longdouble = 64,
 	.max_fp_alignment = 8,
+
+	.predefine = predefine_arm,
 };
diff --git a/target-arm64.c b/target-arm64.c
index 1efd0899495d..cddabb820085 100644
--- a/target-arm64.c
+++ b/target-arm64.c
@@ -9,6 +9,11 @@ static void init_arm64(const struct target *self)
 		arch_cmodel = CMODEL_SMALL;
 }
 
+static void predefine_arm64(const struct target *self)
+{
+	predefine("__aarch64__", 1, "1");
+}
+
 const struct target target_arm64 = {
 	.mach = MACH_ARM64,
 	.bitness = ARCH_LP64,
@@ -19,4 +24,5 @@ const struct target target_arm64 = {
 	.wchar = &uint_ctype,
 
 	.init = init_arm64,
+	.predefine = predefine_arm64,
 };
diff --git a/target-m68k.c b/target-m68k.c
index 1646fceb62aa..ed4a92733efe 100644
--- a/target-m68k.c
+++ b/target-m68k.c
@@ -3,6 +3,11 @@
 #include "machine.h"
 
 
+static void predefine_m68k(const struct target *self)
+{
+	predefine("__m68k__", 1, "1");
+}
+
 const struct target target_m68k = {
 	.mach = MACH_M68K,
 	.bitness = ARCH_LP32,
@@ -13,4 +18,6 @@ const struct target target_m68k = {
 
 	.bits_in_longdouble = 96,
 	.max_fp_alignment = 4,
+
+	.predefine = predefine_m68k,
 };
diff --git a/target-mips.c b/target-mips.c
index 7e2b44466f3e..395e6ff13567 100644
--- a/target-mips.c
+++ b/target-mips.c
@@ -3,6 +3,21 @@
 #include "machine.h"
 
 
+static void predefine_mips(const struct target *self)
+{
+	predefine("__mips__", 1, "1");
+	predefine("__mips", 1, "%d", ptr_ctype.bit_size);
+	predefine("_MIPS_SZINT", 1, "%d", int_ctype.bit_size);
+	predefine("_MIPS_SZLONG", 1, "%d", long_ctype.bit_size);
+	predefine("_MIPS_SZPTR", 1, "%d", ptr_ctype.bit_size);
+}
+
+
+static void predefine_mips32(const struct target *self)
+{
+	predefine_mips(self);
+}
+
 const struct target target_mips32 = {
 	.mach = MACH_MIPS32,
 	.bitness = ARCH_LP32,
@@ -13,8 +28,18 @@ const struct target target_mips32 = {
 	.max_fp_alignment = 8,
 
 	.target_64bit = &target_mips64,
+
+	.predefine = predefine_mips32,
 };
 
+
+static void predefine_mips64(const struct target *self)
+{
+	predefine("__mips64", 1, "64");
+
+	predefine_mips(self);
+}
+
 const struct target target_mips64 = {
 	.mach = MACH_MIPS64,
 	.bitness = ARCH_LP64,
@@ -22,4 +47,6 @@ const struct target target_mips64 = {
 	.unsigned_char = 0,
 
 	.target_32bit = &target_mips32,
+
+	.predefine = predefine_mips64,
 };
diff --git a/target-ppc.c b/target-ppc.c
index e867d9fec299..21ce86d813a4 100644
--- a/target-ppc.c
+++ b/target-ppc.c
@@ -3,6 +3,24 @@
 #include "machine.h"
 
 
+static void predefine_ppc(const struct target *self)
+{
+	predefine("__powerpc__", 1, "1");
+	predefine("__powerpc", 1, "1");
+	predefine("__ppc__", 1, "1");
+	predefine("__PPC__", 1, "1");
+	predefine("__PPC", 1, "1");
+	predefine("_ARCH_PPC", 1, "1");
+	if (arch_big_endian)
+		predefine("_BIG_ENDIAN", 1, "1");
+}
+
+
+static void predefine_ppc32(const struct target *self)
+{
+	predefine_ppc(self);
+}
+
 const struct target target_ppc32 = {
 	.mach = MACH_PPC32,
 	.bitness = ARCH_LP32,
@@ -12,9 +30,21 @@ const struct target target_ppc32 = {
 	.wchar = &long_ctype,
 
 	.target_64bit = &target_ppc64,
+
+	.predefine = predefine_ppc32,
 };
 
 
+static void predefine_ppc64(const struct target *self)
+{
+	predefine("__powerpc64__", 1, "1");
+	predefine("__ppc64__", 1, "1");
+	predefine("__PPC64__", 1, "1");
+	predefine("_ARCH_PPC64", 1, "1");
+
+	predefine_ppc(self);
+}
+
 const struct target target_ppc64 = {
 	.mach = MACH_PPC64,
 	.bitness = ARCH_LP64,
@@ -22,4 +52,6 @@ const struct target target_ppc64 = {
 	.unsigned_char = 1,
 
 	.target_32bit = &target_ppc32,
+
+	.predefine = predefine_ppc64,
 };
diff --git a/target-riscv.c b/target-riscv.c
index 09edfd7afeaf..e7acb36349ad 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -11,6 +11,12 @@ static void init_riscv(const struct target *self)
 		arch_cmodel = CMODEL_PIC;
 }
 
+static void predefine_riscv(const struct target *self)
+{
+	predefine("__riscv", 1, "1");
+	predefine("__riscv_xlen", 1, "%d", ptr_ctype.bit_size);
+}
+
 const struct target target_riscv32 = {
 	.mach = MACH_RISCV32,
 	.bitness = ARCH_LP32,
@@ -20,6 +26,7 @@ const struct target target_riscv32 = {
 	.target_64bit = &target_riscv64,
 
 	.init = init_riscv,
+	.predefine = predefine_riscv,
 };
 
 const struct target target_riscv64 = {
@@ -31,4 +38,5 @@ const struct target target_riscv64 = {
 	.target_32bit = &target_riscv32,
 
 	.init = init_riscv,
+	.predefine = predefine_riscv,
 };
diff --git a/target-s390.c b/target-s390.c
index 277e0909024f..159a6b1149b9 100644
--- a/target-s390.c
+++ b/target-s390.c
@@ -3,6 +3,11 @@
 #include "machine.h"
 
 
+static void predefine_s390(const struct target *self)
+{
+	predefine("__s390__", 1, "1");
+}
+
 const struct target target_s390 = {
 	.mach = MACH_S390,
 	.bitness = ARCH_LP32,
@@ -14,8 +19,19 @@ const struct target target_s390 = {
 	.max_fp_alignment = 8,
 
 	.target_64bit = &target_s390x,
+
+	.predefine = predefine_s390,
 };
 
+
+static void predefine_s390x(const struct target *self)
+{
+	predefine("__zarch__", 1, "1");
+	predefine("__s390x__", 1, "1");
+
+	predefine_s390(self);
+}
+
 const struct target target_s390x = {
 	.mach = MACH_S390X,
 	.bitness = ARCH_LP64,
@@ -26,4 +42,6 @@ const struct target target_s390x = {
 	.max_fp_alignment = 8,
 
 	.target_32bit = &target_s390,
+
+	.predefine = predefine_s390x,
 };
diff --git a/target-sparc.c b/target-sparc.c
index ca9589f5b65c..5267430f8bfd 100644
--- a/target-sparc.c
+++ b/target-sparc.c
@@ -3,6 +3,13 @@
 #include "machine.h"
 
 
+static void predefine_sparc(const struct target *self)
+{
+	predefine("__sparc__", 1, "1");
+	predefine("__sparc", 1, "1");
+}
+
+
 static void init_sparc32(const struct target *target)
 {
 	if (arch_os == OS_SUNOS) {
@@ -14,6 +21,11 @@ static void init_sparc32(const struct target *target)
 	}
 }
 
+static void predefine_sparc32(const struct target *self)
+{
+	predefine_sparc(self);
+}
+
 const struct target target_sparc32 = {
 	.mach = MACH_SPARC32,
 	.bitness = ARCH_LP32,
@@ -25,8 +37,22 @@ const struct target target_sparc32 = {
 
 	.init = init_sparc32,
 	.target_64bit = &target_sparc64,
+
+	.predefine = predefine_sparc32,
 };
 
+
+static void predefine_sparc64(const struct target *self)
+{
+	predefine("__sparc_v9__", 1, "1");
+	predefine("__sparcv9__", 1, "1");
+	predefine("__sparcv9", 1, "1");
+	predefine("__sparc64__", 1, "1");
+	predefine("__arch64__", 1, "1");
+
+	predefine_sparc(self);
+}
+
 const struct target target_sparc64 = {
 	.mach = MACH_SPARC64,
 	.bitness = ARCH_LP64,
@@ -34,4 +60,6 @@ const struct target target_sparc64 = {
 	.unsigned_char = 0,
 
 	.target_32bit = &target_sparc32,
+
+	.predefine = predefine_sparc64,
 };
diff --git a/target-x86.c b/target-x86.c
index eaca5e8bc507..046e346e3b19 100644
--- a/target-x86.c
+++ b/target-x86.c
@@ -24,6 +24,13 @@ static void init_x86(const struct target *target)
 	}
 }
 
+
+static void predefine_i386(const struct target *self)
+{
+	predefine("__i386__", 1, "1");
+	predefine("__i386", 1, "1");
+}
+
 const struct target target_i386 = {
 	.mach = MACH_I386,
 	.bitness = ARCH_LP32,
@@ -36,8 +43,19 @@ const struct target target_i386 = {
 
 	.init = init_x86,
 	.target_64bit = &target_x86_64,
+
+	.predefine = predefine_i386,
 };
 
+
+static void predefine_x86_64(const struct target *self)
+{
+	predefine("__x86_64__", 1, "1");
+	predefine("__x86_64", 1, "1");
+	predefine("__amd64__", 1, "1");
+	predefine("__amd64", 1, "1");
+}
+
 const struct target target_x86_64 = {
 	.mach = MACH_X86_64,
 	.bitness = ARCH_LP64,
@@ -49,4 +67,6 @@ const struct target target_x86_64 = {
 
 	.init = init_x86,
 	.target_32bit = &target_i386,
+
+	.predefine = predefine_x86_64,
 };
diff --git a/target.h b/target.h
index ebd8f1b15ce6..8f39abb8d875 100644
--- a/target.h
+++ b/target.h
@@ -71,6 +71,7 @@ struct target {
 	const struct target *target_64bit;
 
 	void (*init)(const struct target *self);
+	void (*predefine)(const struct target *self);
 };
 
 extern const struct target target_default;
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B6F81F5D2E
	for <lists+linux-sparse@lfdr.de>; Wed, 10 Jun 2020 22:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgFJU1y (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 10 Jun 2020 16:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726955AbgFJU1v (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 10 Jun 2020 16:27:51 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C8AC03E96B
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:50 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id m21so2333011eds.13
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EmmaH/nSkSVzAFrtz3hDIcWxtzy6Fyou6mjKrBA2g2o=;
        b=qb0Vn+XT25Vs9vr+lEqmbQVVsxJ8H9Q/JddEMzPz92FKlrNCgXqZVSQEhpgC9jhlun
         KXxzv5gdpulXyd8QVe5sDw0VPgTSZ2cyzzKTok/QYib8nev1jwTu6StPBN+6ISzDdcfb
         VJIdzuEfWWvHLShTetBLQ4G+fCbYSNqVpLcp7/uOLpgpAV2xbH/b6GmTnIIvtcFlJaMh
         tScBrda3rIUkR+v0M2Cu1fvOnX/3SZ445kDQtKGMW0PLVvgHmtjsCuPt1kR18/wDXOb9
         3oSiRLRyo51Xw8NL9ccVh4AOe+AXrc+TDO3luMDrqnSs1xQkJrCr81xVId4EU3sTCJy4
         n2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EmmaH/nSkSVzAFrtz3hDIcWxtzy6Fyou6mjKrBA2g2o=;
        b=EWaolgCdetR+Wurq3VNLsxrnjDjKKi9txjYZuJS15ANYxdWgSii4zwM/33hVV7O+5H
         hZ2c2wdi6IKM/uZ6fpUhhuw1Cl7x9EyB/2HOjKRBrKi72oll9Ezs/TWq3DgkPOMYqSAr
         1uvQJtl3E/9cgbq8K3KBCLysra2l89HJrfsOhQPTUH3nkKrXy89/EdmcMgVC0Iv397rG
         +1PWzWQw+S7+B+4Ygxoa9YQfz0xMlogvBxkOm/iu9HfGgJUG+CCSlz2+PD5CAqeaDTO8
         482ELSDvJnUPTs4Rqi7rraKLXwpmCDBc7bSKrblek8rv6FF4sPaklTvOLvmDanSkHGAf
         Rbxg==
X-Gm-Message-State: AOAM530XHMrNE0pMuXuRfu0M535xwIVve/Kzt4eEvVuUaK+tOh/TS/I7
        8FnhhdVyGq7C2+CL21HdCmMozT2b
X-Google-Smtp-Source: ABdhPJz1Qur5Of/o1kV96SVqwImO1KHbJkUyyb5hsAFr8FSWjg/9EZLm9TL8noYbNgA1gAldQQ8pew==
X-Received: by 2002:aa7:ce93:: with SMTP id y19mr3885995edv.50.1591820868867;
        Wed, 10 Jun 2020 13:27:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4870:48de:5f59:675a])
        by smtp.gmail.com with ESMTPSA id m91sm391895ede.96.2020.06.10.13.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:27:48 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 7/7] arch: add specificities for Alpha
Date:   Wed, 10 Jun 2020 22:27:35 +0200
Message-Id: <20200610202735.84968-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
References: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The real goal here is in fact to move the alpha-specfic
builtins out of the main builtins table.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile       |  1 +
 builtin.c      |  9 ---------
 machine.h      |  3 +++
 target-alpha.c | 30 ++++++++++++++++++++++++++++++
 target.c       |  2 ++
 target.h       |  1 +
 6 files changed, 37 insertions(+), 9 deletions(-)
 create mode 100644 target-alpha.c

diff --git a/Makefile b/Makefile
index bee6a324b1c7..e1831a1d259b 100644
--- a/Makefile
+++ b/Makefile
@@ -65,6 +65,7 @@ LIB_OBJS += stats.o
 LIB_OBJS += storage.o
 LIB_OBJS += symbol.o
 LIB_OBJS += target.o
+LIB_OBJS += target-alpha.o
 LIB_OBJS += target-arm.o
 LIB_OBJS += target-arm64.o
 LIB_OBJS += target-bfin.o
diff --git a/builtin.c b/builtin.c
index dd467db425df..2038de5730e3 100644
--- a/builtin.c
+++ b/builtin.c
@@ -564,15 +564,6 @@ static const struct builtin_fn builtins_common[] = {
 	{ "__sync_val_compare_and_swap", &int_ctype, 1, { &ptr_ctype }},
 	{ "__sync_xor_and_fetch", &int_ctype, 1, { &ptr_ctype }},
 
-	// Alpha-specific
-	{ "__builtin_alpha_cmpbge", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_extbl", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_extwl", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_insbl", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_inslh", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_insql", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_inswl", &long_ctype, 0, { &long_ctype, &long_ctype }},
-
 	{ }
 };
 
diff --git a/machine.h b/machine.h
index b9f22850b9db..02a7f90e5362 100644
--- a/machine.h
+++ b/machine.h
@@ -32,6 +32,7 @@ enum machine {
 	MACH_RISCV32,	MACH_RISCV64,
 	MACH_SPARC32,	MACH_SPARC64,
 	MACH_S390,	MACH_S390X,
+	MACH_ALPHA,
 	MACH_BFIN,
 	MACH_M68K,
 	MACH_NIOS2,
@@ -40,6 +41,8 @@ enum machine {
 
 #if defined(__aarch64__)
 #define MACH_NATIVE	MACH_ARM64
+#elif defined(__alpha__) || defined(__alpha)
+#define	MACH_NATIVE	MACH_ALPHA
 #elif defined(__arm__)
 #define	MACH_NATIVE	MACH_ARM
 #elif defined(__x86_64__) || defined(__x86_64)
diff --git a/target-alpha.c b/target-alpha.c
new file mode 100644
index 000000000000..3f582997eb96
--- /dev/null
+++ b/target-alpha.c
@@ -0,0 +1,30 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+#include "builtin.h"
+
+
+static void predefine_alpha(const struct target *self)
+{
+	predefine("__alpha__", 1, "1");
+	predefine("__alpha", 1, "1");
+}
+
+static const struct builtin_fn builtins_alpha[] = {
+	{ "__builtin_alpha_cmpbge", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_extbl", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_extwl", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_insbl", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_inslh", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_insql", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_inswl", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ }
+};
+
+const struct target target_alpha = {
+	.mach = MACH_ALPHA,
+	.bitness = ARCH_LP64,
+
+	.predefine = predefine_alpha,
+	.builtins = builtins_alpha,
+};
diff --git a/target.c b/target.c
index 1fd066da8639..07c298128da4 100644
--- a/target.c
+++ b/target.c
@@ -57,6 +57,7 @@ int enum_alignment = 4;
 
 
 static const struct target *targets[] = {
+	[MACH_ALPHA] =		&target_alpha,
 	[MACH_ARM] =		&target_arm,
 	[MACH_ARM64] =		&target_arm64,
 	[MACH_I386] =		&target_i386,
@@ -85,6 +86,7 @@ enum machine target_parse(const char *name)
 		enum machine mach;
 		char bits;
 	} archs[] = {
+		{ "alpha",	MACH_ALPHA,	64, },
 		{ "aarch64",	MACH_ARM64,	64, },
 		{ "arm64",	MACH_ARM64,	64, },
 		{ "arm",	MACH_ARM,	32, },
diff --git a/target.h b/target.h
index 9674d0995fd5..8640026cc6d4 100644
--- a/target.h
+++ b/target.h
@@ -80,6 +80,7 @@ struct target {
 };
 
 extern const struct target target_default;
+extern const struct target target_alpha;
 extern const struct target target_arm;
 extern const struct target target_arm64;
 extern const struct target target_bfin;
-- 
2.27.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85F91F5D2B
	for <lists+linux-sparse@lfdr.de>; Wed, 10 Jun 2020 22:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgFJU1t (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 10 Jun 2020 16:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgFJU1t (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 10 Jun 2020 16:27:49 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FCDC08C5C1
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:48 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id p18so2352901eds.7
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zKPshqvxlYJ1FO42YPXVqIw3kJe+PK8kY9r1BdlRmE4=;
        b=kLNRA+OPFqCu3iN/ODQOQTuYF5GnSYOgqjQr1XzyC6KdzbjXZQAlNDiLAMNevM+c/9
         Oy8UtF84wY8hVDLXmQCxPI7zSnhDyFhDjaT9lNmyoG78nCX8pYSdh8vrNjAXYlGf6F+N
         Q6nKQL0NDTANREEpqFzEOZaNQ09O/2Cys1UDKRX0WHif/tBlFoxYW24p4rFXzreNMjgo
         YuZ9yUHs3fFtbSDu24oz2RApBXhHGZ7Jick9wcBTo7VAN94xTnc7htLKNV3nwOGn8vKr
         Dj6+BMPWWervMxCEB80sFPllUcdyZ56kYCMivOCKHMLACj2HNGQsC5kxPWOsoGDiqx29
         K1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zKPshqvxlYJ1FO42YPXVqIw3kJe+PK8kY9r1BdlRmE4=;
        b=Bi0o3zHImw0iBA/bRzXVjYpGJziHJGWLs5duuYcF6ffIz87kMNVRG78NLu/y2d+JNN
         0t6ugoqujWvCWHesi37vCwRdpmH4DvqewQLlCs25J9AknwijdWN4/WGkburWS/BgMmAz
         2iZLa6MLUQdlWl5gC5jpJALAEgF1+cX6zlOiKX+VRDDtE1uz4REpu60QZgG6C1xtrI3c
         XB1hr8LKy5R8OiXT+oxuVbWlMr9HIZrO5de5dULKxtXnMej6I8KWHWf/JnhaF2ZWcdhk
         KIdJqtjPASmYlcB5m7ahTdh2aZ2trfuANNHdbApCwMkOTtL/qrcSE0KgN1S88fqjck3S
         KuQg==
X-Gm-Message-State: AOAM530fWS4DkH9GDhWNabmXnIiOnL2OUz+9N9mp1wZmfsidhyJdP2lE
        3GTPdLf3V73TOJq94OXH3QIKkxFf
X-Google-Smtp-Source: ABdhPJzkTXlchogJ172FjGWz95HTXMlEVMQKRGK1t6jl5VnPB//OHRDi2Q5CsRz5g5BshmBsA/NrpQ==
X-Received: by 2002:a05:6402:1bde:: with SMTP id ch30mr4152857edb.163.1591820867059;
        Wed, 10 Jun 2020 13:27:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4870:48de:5f59:675a])
        by smtp.gmail.com with ESMTPSA id m91sm391895ede.96.2020.06.10.13.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:27:46 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/7] arch: add specificities for Nios2
Date:   Wed, 10 Jun 2020 22:27:33 +0200
Message-Id: <20200610202735.84968-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
References: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The real goal here is in fact to move the nios2-specfic
builtins out of the main builtins table.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile       |  1 +
 builtin.c      |  5 -----
 machine.h      |  1 +
 target-nios2.c | 31 +++++++++++++++++++++++++++++++
 target.c       |  2 ++
 target.h       |  1 +
 6 files changed, 36 insertions(+), 5 deletions(-)
 create mode 100644 target-nios2.c

diff --git a/Makefile b/Makefile
index e93cfd66d0c9..69fae4828e62 100644
--- a/Makefile
+++ b/Makefile
@@ -70,6 +70,7 @@ LIB_OBJS += target-arm64.o
 LIB_OBJS += target-default.o
 LIB_OBJS += target-m68k.o
 LIB_OBJS += target-mips.o
+LIB_OBJS += target-nios2.o
 LIB_OBJS += target-ppc.o
 LIB_OBJS += target-riscv.o
 LIB_OBJS += target-s390.o
diff --git a/builtin.c b/builtin.c
index dcf8200ec002..9442fb5b89ef 100644
--- a/builtin.c
+++ b/builtin.c
@@ -578,11 +578,6 @@ static const struct builtin_fn builtins_common[] = {
 	{ "__builtin_bfin_ssync", &void_ctype, 0 },
 	{ "__builtin_bfin_norm_fr1x32", &int_ctype, 0, { &int_ctype }},
 
-	// Nios-II-specific
-	{ "__builtin_rdctl", &int_ctype, 0, { &int_ctype }},
-	{ "__builtin_wrctl", &void_ctype, 0, { &int_ctype, &int_ctype }},
-	{ "__builtin_custom_ini", &int_ctype, 0, { &int_ctype }},
-
 	{ }
 };
 
diff --git a/machine.h b/machine.h
index 9c17dd6aa620..a211345c80ce 100644
--- a/machine.h
+++ b/machine.h
@@ -33,6 +33,7 @@ enum machine {
 	MACH_SPARC32,	MACH_SPARC64,
 	MACH_S390,	MACH_S390X,
 	MACH_M68K,
+	MACH_NIOS2,
 	MACH_UNKNOWN
 };
 
diff --git a/target-nios2.c b/target-nios2.c
new file mode 100644
index 000000000000..05f0926e2df9
--- /dev/null
+++ b/target-nios2.c
@@ -0,0 +1,31 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+#include "builtin.h"
+
+
+static void predefine_nios2(const struct target *self)
+{
+	predefine("__NIOS2__", 1, "1");
+	predefine("__nios2__", 1, "1");
+
+	if (arch_big_endian)
+		predefine("__nios2_big_endian__", 1, "1");
+	else
+		predefine("__nios2_little_endian__", 1, "1");
+}
+
+static const struct builtin_fn builtins_nios2[] = {
+	{ "__builtin_rdctl", &int_ctype, 0, { &int_ctype }},
+	{ "__builtin_wrctl", &void_ctype, 0, { &int_ctype, &int_ctype }},
+	{ "__builtin_custom_ini", &int_ctype, 0, { &int_ctype }},
+	{ }
+};
+
+const struct target target_nios2 = {
+	.mach = MACH_NIOS2,
+	.bitness = ARCH_LP32,
+
+	.predefine = predefine_nios2,
+	.builtins = builtins_nios2,
+};
diff --git a/target.c b/target.c
index abfa975672b1..0ef0eb5a14ae 100644
--- a/target.c
+++ b/target.c
@@ -63,6 +63,7 @@ static const struct target *targets[] = {
 	[MACH_X86_64] =		&target_x86_64,
 	[MACH_MIPS32] =		&target_mips32,
 	[MACH_MIPS64] =		&target_mips64,
+	[MACH_NIOS2] =		&target_nios2,
 	[MACH_PPC32] =		&target_ppc32,
 	[MACH_PPC64] =		&target_ppc64,
 	[MACH_RISCV32] =	&target_riscv32,
@@ -89,6 +90,7 @@ enum machine target_parse(const char *name)
 		{ "i386",	MACH_I386,	32, },
 		{ "m68k",	MACH_M68K,	32, },
 		{ "mips",	MACH_MIPS32,	0,  },
+		{ "nios2",	MACH_NIOS2,	32, },
 		{ "powerpc",	MACH_PPC32,	0,  },
 		{ "ppc",	MACH_PPC32,	0,  },
 		{ "riscv",	MACH_RISCV32,	0,  },
diff --git a/target.h b/target.h
index 1202c0be1ac9..4c184d8f2fbe 100644
--- a/target.h
+++ b/target.h
@@ -85,6 +85,7 @@ extern const struct target target_arm64;
 extern const struct target target_m68k;
 extern const struct target target_mips32;
 extern const struct target target_mips64;
+extern const struct target target_nios2;
 extern const struct target target_ppc32;
 extern const struct target target_ppc64;
 extern const struct target target_riscv32;
-- 
2.27.0


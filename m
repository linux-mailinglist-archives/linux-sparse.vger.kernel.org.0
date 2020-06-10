Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520191F5D2C
	for <lists+linux-sparse@lfdr.de>; Wed, 10 Jun 2020 22:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728694AbgFJU1u (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 10 Jun 2020 16:27:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgFJU1t (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 10 Jun 2020 16:27:49 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807B3C03E96B
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:49 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id t21so2339350edr.12
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=63i+ffuPw0vB3N49WTu/ol0DdWkQ96kDl9vcy7nKexY=;
        b=u+gjmDOyeidWLcSMtqtcFPU4D0vBnXsDGzELFWwe79hrcJ3rpLxeMv80NU7YrQowSo
         ypO6mtyn3YnunGm1ScBSOMxLZ1x27Bf7QHn1vkDAYpBWxWXVCdt0sj7nTaXmPzeutfph
         Nu6msoD1monz+4l9+Wn7lr33den2NRtERhhc49nI4c9+97Pty2Y5iUHZlQ8a/Z2O/1K3
         6PXGaABNgVSf1Kurd5nmmLALwZGkkZ6EwK0D5c0OZDJ4XwWTl0S2IG1X3kLHeMZt29EM
         EAxtxJNJ0Ijgv8Skv1gnqfko0vNsdIzXJmXsDdfmcVGooRP4Ite/VTATd7olsmyD8nqW
         xxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=63i+ffuPw0vB3N49WTu/ol0DdWkQ96kDl9vcy7nKexY=;
        b=IpKS+drFVc0GgXBrgoByHfVv6D9n5jfSgvPsf7AycTcxGdK8mp8kHVCD3YXR39oiB8
         BsNE4Qd8fDvqrVLHteqkS+lb0RXgqt1OugfyTqbeZyEm3y4rRGJfHkNYwYUBgq2tnKYb
         gezFMP5wm0X1IoNGtRAWo2udXvlpm49QIQcYqJOYF5rF6za4GCiHSBznSU1Trj/fMH6x
         NqVp/8WC/Q3fVrC2h/RNX3fFrnImEcUL4+tGGgM15/BQJO72fiz8xlaM2p03DWS6Ve3y
         3hOSWjZXPSM5axiO3xOmbeHQwQwdzZgxmVVmRJnhEkfMmyjzNTLjOScFXN4zNVowNFZe
         FjEg==
X-Gm-Message-State: AOAM530RQpVNYHw0nSHggRWB23bQ3HBNz9smTKAXkDXJ5SREbjHtL/gW
        8eJBZCqcxl5WF1KP3TJpN3MiF0Vw
X-Google-Smtp-Source: ABdhPJyZlmSwRi0j3/lZ80ORWROeRwDEjsBmJffDTKX9IY81km5SU9mXHpo9HsmCOFhb1EbhYUsxzg==
X-Received: by 2002:a50:afa5:: with SMTP id h34mr4143943edd.34.1591820867974;
        Wed, 10 Jun 2020 13:27:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4870:48de:5f59:675a])
        by smtp.gmail.com with ESMTPSA id m91sm391895ede.96.2020.06.10.13.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:27:47 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 6/7] arch: add specificities for Blackfin
Date:   Wed, 10 Jun 2020 22:27:34 +0200
Message-Id: <20200610202735.84968-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
References: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The real goal here is in fact to move the bfin-specfic
builtins out of the main builtins table.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile      |  1 +
 builtin.c     |  5 -----
 machine.h     |  1 +
 target-bfin.c | 26 ++++++++++++++++++++++++++
 target.c      |  2 ++
 target.h      |  1 +
 6 files changed, 31 insertions(+), 5 deletions(-)
 create mode 100644 target-bfin.c

diff --git a/Makefile b/Makefile
index 69fae4828e62..bee6a324b1c7 100644
--- a/Makefile
+++ b/Makefile
@@ -67,6 +67,7 @@ LIB_OBJS += symbol.o
 LIB_OBJS += target.o
 LIB_OBJS += target-arm.o
 LIB_OBJS += target-arm64.o
+LIB_OBJS += target-bfin.o
 LIB_OBJS += target-default.o
 LIB_OBJS += target-m68k.o
 LIB_OBJS += target-mips.o
diff --git a/builtin.c b/builtin.c
index 9442fb5b89ef..dd467db425df 100644
--- a/builtin.c
+++ b/builtin.c
@@ -573,11 +573,6 @@ static const struct builtin_fn builtins_common[] = {
 	{ "__builtin_alpha_insql", &long_ctype, 0, { &long_ctype, &long_ctype }},
 	{ "__builtin_alpha_inswl", &long_ctype, 0, { &long_ctype, &long_ctype }},
 
-	// Blackfin-specific stuff
-	{ "__builtin_bfin_csync", &void_ctype, 0 },
-	{ "__builtin_bfin_ssync", &void_ctype, 0 },
-	{ "__builtin_bfin_norm_fr1x32", &int_ctype, 0, { &int_ctype }},
-
 	{ }
 };
 
diff --git a/machine.h b/machine.h
index a211345c80ce..b9f22850b9db 100644
--- a/machine.h
+++ b/machine.h
@@ -32,6 +32,7 @@ enum machine {
 	MACH_RISCV32,	MACH_RISCV64,
 	MACH_SPARC32,	MACH_SPARC64,
 	MACH_S390,	MACH_S390X,
+	MACH_BFIN,
 	MACH_M68K,
 	MACH_NIOS2,
 	MACH_UNKNOWN
diff --git a/target-bfin.c b/target-bfin.c
new file mode 100644
index 000000000000..b84cd5de8d54
--- /dev/null
+++ b/target-bfin.c
@@ -0,0 +1,26 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+#include "builtin.h"
+
+
+static void predefine_bfin(const struct target *self)
+{
+	predefine("__BFIN__", 1, "1");
+	predefine("__bfin__", 1, "1");
+}
+
+static const struct builtin_fn builtins_bfin[] = {
+	{ "__builtin_bfin_csync", &void_ctype, 0 },
+	{ "__builtin_bfin_ssync", &void_ctype, 0 },
+	{ "__builtin_bfin_norm_fr1x32", &int_ctype, 0, { &int_ctype }},
+	{ }
+};
+
+const struct target target_bfin = {
+	.mach = MACH_BFIN,
+	.bitness = ARCH_LP32,
+
+	.predefine = predefine_bfin,
+	.builtins = builtins_bfin,
+};
diff --git a/target.c b/target.c
index 0ef0eb5a14ae..1fd066da8639 100644
--- a/target.c
+++ b/target.c
@@ -60,6 +60,7 @@ static const struct target *targets[] = {
 	[MACH_ARM] =		&target_arm,
 	[MACH_ARM64] =		&target_arm64,
 	[MACH_I386] =		&target_i386,
+	[MACH_BFIN] =		&target_bfin,
 	[MACH_X86_64] =		&target_x86_64,
 	[MACH_MIPS32] =		&target_mips32,
 	[MACH_MIPS64] =		&target_mips64,
@@ -88,6 +89,7 @@ enum machine target_parse(const char *name)
 		{ "arm64",	MACH_ARM64,	64, },
 		{ "arm",	MACH_ARM,	32, },
 		{ "i386",	MACH_I386,	32, },
+		{ "bfin",	MACH_BFIN,	32, },
 		{ "m68k",	MACH_M68K,	32, },
 		{ "mips",	MACH_MIPS32,	0,  },
 		{ "nios2",	MACH_NIOS2,	32, },
diff --git a/target.h b/target.h
index 4c184d8f2fbe..9674d0995fd5 100644
--- a/target.h
+++ b/target.h
@@ -82,6 +82,7 @@ struct target {
 extern const struct target target_default;
 extern const struct target target_arm;
 extern const struct target target_arm64;
+extern const struct target target_bfin;
 extern const struct target target_m68k;
 extern const struct target target_mips32;
 extern const struct target target_mips64;
-- 
2.27.0


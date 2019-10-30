Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75CB8E98BE
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbfJ3JDs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:48 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34364 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbfJ3JDr (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:47 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so1370845wrr.1
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9siAmTmC1XbJQpNMsxl68pjg9PQbRz3F5HvuE/oXrjA=;
        b=fBQyj3nT2eS0lNyTz/tU2zw1xnaOuCTHpa3GMaMvrU7jfrPx9kH73PJ39pKC32P0Fx
         t3BuYamFniJnfgMbR4DN8l4pC5mc5JLhiklaubhlbMKlQU2AydAi+xzoUdap3vzUgjIR
         +BCZ/lCyQbSK6OLzZ1s9l8Ilic2hoRjPwcrlKpTuBxc1F8nalaMtw+mxV4CAR7jlNzWo
         IK/ZNf8XDimah5kMgmUrOEO8UMFKWebTe7iHkr9qdmI9iDDeAMy+Pg0tqXKHx2u/Qld3
         apK0ESjZ5iAKb9rY+3S5AaYQhlHGt9Xp3gdQRo7t9mptsEUkPqjOiIQqZHHHiYle1fTR
         VPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9siAmTmC1XbJQpNMsxl68pjg9PQbRz3F5HvuE/oXrjA=;
        b=Y0jFh16WhiXxjExewXHH0zxsO5ih3WTc2QK57c//0SPYiZ5RoTENsYbdN6LhZSvezv
         Y5t1JaN0eCtzvLFl6IN8ohlLVMtYOd55aDqU6+WXnuX0JHmZ7HwIMyDwPwhGv5OfoHe+
         apMDTBjTvvOu43EtK/T62o2ghv8gTHjWR6M97alE7kd+LJ4SjLf8KDJzTkFVTg/0lqtb
         b7EzYaxJ4G+CUXEVfEtz/vH42kqb+snucuEHRDxYU/SRFLf2nYhcvo7S14TblcwStOWh
         aKIvQ5E9+m69XYvsmFYt2eJNysIYRFYVZWSPzWgDgkZvS62lv/i29FRBFa5Se5Ckxn1F
         twGA==
X-Gm-Message-State: APjAAAWjwg+A+AjaPwjgvOpmXynxyzxSgXA2K922qyBwkn7yWqbjt5yq
        8eR2RTE04SREZdb+7tatm3L4uYe9
X-Google-Smtp-Source: APXvYqwxWSJfZYRZZxP1dvOsZOzVLlLtSDEY1PjpVztz7pSiSurqBG20uWRK09JCjz6Sq+XhqabaiQ==
X-Received: by 2002:adf:dec7:: with SMTP id i7mr14893747wrn.134.1572426225470;
        Wed, 30 Oct 2019 02:03:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:44 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 2/6] add support for s390 (ILP32)
Date:   Wed, 30 Oct 2019 10:03:23 +0100
Message-Id: <20191030090333.3412-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
References: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On s390x, the flag -m31 is needed to enable this mode.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c     | 3 +++
 machine.h | 4 +++-
 target.c  | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib.c b/lib.c
index 75a4f9870..72dcfa6a0 100644
--- a/lib.c
+++ b/lib.c
@@ -456,6 +456,8 @@ static char **handle_switch_m(char *arg, char **next)
 		arch_m64 = ARCH_LP64;
 	} else if (!strcmp(arg, "m32") || !strcmp(arg, "m16")) {
 		arch_m64 = ARCH_LP32;
+	} else if (!strcmp(arg, "m31")) {
+		arch_m64 = ARCH_LP32;
 	} else if (!strcmp(arg, "mx32")) {
 		arch_m64 = ARCH_X32;
 	} else if (!strcmp(arg, "msize-llp64")) {
@@ -1355,6 +1357,7 @@ static void predefined_macros(void)
 	case MACH_S390X:
 		predefine("__zarch__", 1, "1");
 		predefine("__s390x__", 1, "1");
+	case MACH_S390:
 		predefine("__s390__", 1, "1");
 		break;
 	case MACH_SPARC64:
diff --git a/machine.h b/machine.h
index f7567efed..e24822a7f 100644
--- a/machine.h
+++ b/machine.h
@@ -31,8 +31,8 @@ enum machine {
 	MACH_PPC32,	MACH_PPC64,
 	MACH_RISCV32,	MACH_RISCV64,
 	MACH_SPARC32,	MACH_SPARC64,
+	MACH_S390,	MACH_S390X,
 	MACH_M68K,
-	MACH_S390X,
 	MACH_UNKNOWN
 };
 
@@ -64,6 +64,8 @@ enum machine {
 #define MACH_NATIVE	MACH_M68K
 #elif defined(__s390x__) || defined(__zarch__)
 #define MACH_NATIVE	MACH_S390X
+#elif defined(__s390__)
+#define MACH_NATIVE	MACH_S390
 #else
 #define MACH_NATIVE	MACH_UNKNOWN
 #endif
diff --git a/target.c b/target.c
index c2ab55490..7829e8f9a 100644
--- a/target.c
+++ b/target.c
@@ -97,6 +97,7 @@ void init_target(void)
 	switch (arch_mach) {
 	case MACH_ARM:
 	case MACH_MIPS32:
+	case MACH_S390:
 	case MACH_S390X:
 	case MACH_SPARC32:
 		bits_in_longdouble = 64;
-- 
2.23.0


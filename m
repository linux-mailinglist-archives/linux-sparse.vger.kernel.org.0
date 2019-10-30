Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 380EDE98C0
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfJ3JDt (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:49 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38269 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfJ3JDt (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:49 -0400
Received: by mail-wr1-f68.google.com with SMTP id v9so1349991wrq.5
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BHZeEWnCahUff1zusIbKxnEenuJTA1RV3B9s6RpUpWw=;
        b=XXaWPt+J0ZkLSnAfM5/i8sEWaEtCHuycoZl6lj7O83sjbBVgIxtbvsnWfN+HZCu2rr
         VQH7dilVcnQxugewC3b/2zUHCkrJPDlJ4RbxGj0fkp3cKvCPSfy7pXaGXdtNmj9sq0EC
         dRdJk8jmLUcD8Z4KNpjtqX/HfpoX1bCV/k5W9Zll4aKs2bscyQlN1Ess0csIcoOAkidj
         see0P9EDNBn2557nLTK9fPLUs2BvrXQD462A14KJNEYKyMBQKUa+hpx6bW4ZmscGS3D/
         WPsXzhjruLio1YKFBQFYNMt2mHePvbwoUcvv3itXk5EXyPFTNnOTNcfYxq1MkxmTqW+r
         1Q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BHZeEWnCahUff1zusIbKxnEenuJTA1RV3B9s6RpUpWw=;
        b=qGTn2yls8XZMd8c7ZXXQLvFcF77TrvlWK30cmZounCWGIM1sYWILXS9KpUW31ZBhsZ
         zJLOKZaK58oezNgi2HEZjS72VVCqVlzV77ms8lGdiQG72yVSUTCSse5EiFT/VYSn4dfn
         DZLtQQfsYVkuH611lV/bq2lv0mhn5CO9iA/MUJaW/E9HOx1YAacJbjXn8jj/WHL/T15l
         jOuYBmkH8DUtcv8KFCkZMxaJUSn6/sgb4f5LjSVYW0Bjit+RajeQ+STqXbmQhLab4wN2
         hD8j/oqXYNdfV7Ql6N1k0mqJf2iwKjq9MoMptdHS0sy6jUqTFVIxJq468+nfNybghxV6
         EzqA==
X-Gm-Message-State: APjAAAXMSU5EfwYlV3f4N4xS20z43kupQTDMsnVIFe0DazbCgffSutr5
        /GtJPXSEVaXdvxHkSTir7pEFNr5q
X-Google-Smtp-Source: APXvYqwvwULoS1V8J8hJwYrEV/NvHpLE1uBGs6JJX2+KUAFu1qYD99jii/Xe41pQDOXYd5c0NLBNxA==
X-Received: by 2002:a5d:46d2:: with SMTP id g18mr355542wrs.245.1572426227242;
        Wed, 30 Oct 2019 02:03:47 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:46 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/7] arch: add support for s390 (ILP32)
Date:   Wed, 30 Oct 2019 10:03:25 +0100
Message-Id: <20191030090333.3412-6-luc.vanoostenryck@gmail.com>
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
index 2a517b447..58c12c77b 100644
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
@@ -1356,6 +1358,7 @@ static void predefined_macros(void)
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


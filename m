Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CCE010A892
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbfK0CG4 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:06:56 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39312 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725916AbfK0CGz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:06:55 -0500
Received: by mail-wm1-f66.google.com with SMTP id t26so5599348wmi.4
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GaLz94TSXFs920zrC/G9AmzAcwYsfqfaSasZyapJQ+8=;
        b=Sg4qaUYnvK5lmeEL1A/LEIK4QN3bd4pbQ1UnsgHdJG9vPY/pPFbixI8PMQSahGjfuy
         0i5dSNeXzVzbBDKpHa/HJ4u3tKI4JlyP9Dns2okhB34xcg8ihC3W36vycZM3/ZtmJ3Yd
         DAoSVS2HXJ293g2Bw8PGbg3yI8hLcOamqQszP9ulrDEPOmyk6+xmbieSzC5BhXt/FbMq
         iUleQrXh+qvlwbgnjxLo6wEnNGnvXaGgeelIWiAxxDTCpyfEpdv81AC1KZ4VjxUy4Jbb
         M6ndnDrlmBvwzpQKb5aBsHoaXtaycNYVFY9gEVu9nIUqgeE8Olzs5hzE8IbjqIw/ymWS
         eRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GaLz94TSXFs920zrC/G9AmzAcwYsfqfaSasZyapJQ+8=;
        b=XMyZA6NOZmw3INjuKN7bSjRxM81+0Y51CWWcYQ9/poXdGnS5thlaRtnOB9x5LV9gh3
         GWjXT7r1InJcAqHkHVLt5CLR3F8mKerDoNFr5khojQ5YPOZP8pEoiHnKx0gdMWDyCYgk
         t4jfc627SttB8ew95/6PGQyIZH2Ff29gg8rt4mq1rdW9aacMukLnv2itVooT1WRfLaL2
         a3u0NRyKxjAhA0GOkSemuk1s720vEu0kfEnGRbCMIiWAvDq5Gnp9qAaSpCeKUH4HYgLR
         HLjKkLLRAI395YEBOjEkVDDLXX5qBJEARQixo9tE4Qjw5zHLnFnqV5GJ1xhdZ/9P2Dsq
         ehFA==
X-Gm-Message-State: APjAAAXurkdtHa9QuJXxaeZPAg51D2j9LXrd9dO5H+wSWhabVL8Ocbq0
        9He+i3dKTgxTxfSwFSQupclQu8Du
X-Google-Smtp-Source: APXvYqwHjwyYJiY+WXNReYOuFmRqrKRLCJ7ZkTV9thk0FMrMS4rbjrguXZrTQMXCNB1gXtvfK+kCXQ==
X-Received: by 2002:a1c:2e8f:: with SMTP id u137mr1733062wmu.105.1574820413881;
        Tue, 26 Nov 2019 18:06:53 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:53 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 05/12] arch: remove impossible cases with 64-bit arch not being lp64
Date:   Wed, 27 Nov 2019 03:06:36 +0100
Message-Id: <20191127020643.68629-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
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


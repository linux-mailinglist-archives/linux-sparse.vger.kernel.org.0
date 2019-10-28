Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBB71E7B82
	for <lists+linux-sparse@lfdr.de>; Mon, 28 Oct 2019 22:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbfJ1VlL (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 28 Oct 2019 17:41:11 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43654 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731710AbfJ1VlK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 28 Oct 2019 17:41:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id n1so4001032wra.10
        for <linux-sparse@vger.kernel.org>; Mon, 28 Oct 2019 14:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iAHnmzPASli+xJh8z65PfT/qQOIzr8VdWerTKSndv6I=;
        b=pBNIOT01Wmiqt097/FI5qGMRwrRZS31qEKfE6ORTapxcrzjta+wpGBmaeBdoXTEBwD
         R24fxoZdIX8Yf7Sq+23wA9OdGNl+Iy220bCjAsr8XJArVJsHABeM5t1m71/3buC0ofIV
         1W9atd6c44OTZfAihwqRfr4rMt9kiP9chYLoNe105O2FuQV+oZ5RWaA0gIlmmaO+vKv/
         sA+b3cfFLI4KK8yX0f2cAR2oGR4cJ1P9C2rHF/jjBVf01Y4GLV0FuJqTNcKUPRTx3JHj
         ahnj68G5NABzRWcqJST7CGVXNvtNDDgPIxd+hMm6EKWF57utnAPBckHZ14ab9hHOcjMx
         Cfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iAHnmzPASli+xJh8z65PfT/qQOIzr8VdWerTKSndv6I=;
        b=Ws5+s4BTJTS5j07tDpAoG53CxeuWipGP6iWNA2NfhZbWxzCdIzmOmp0haTA4etCxmk
         cfiC0VptDgK80l5pf0raSZNoFcki2HCHAVtHSY7EJjTZlTKFmyZoHtUCTPT+NwSHSXOx
         q9aI1J+LBvKHlwhCGTCjvyVUWStOsXwxuQfVJ+JeTkCgPU63bsHMV2W9C+K+4uHtx1c8
         NuJSPDCqiJPETH7cSWhnAGy8swAGqT0GLkKNAjSP1Nq0bA7AEOjU0vv0gIFgNIDjb+Cd
         HZBa2cMTwt/Qw9l7+WnSOwDyc7g5QoA5B2kVm3dUktJ5zirxM6YGdPG0UgVP1VFAXnsE
         lCgw==
X-Gm-Message-State: APjAAAWS6IWOi+b3p3ORrRBaJ3F1oM4Z2GtqDB3olgvNtG68Z3egYZKc
        6rklxhykiFciiAx3ETeMdgImpYdH
X-Google-Smtp-Source: APXvYqy7ee87BNcEaP0plCwdkwFway1vX6k6JWjQ1Idpz8WZmPsDX/HEu2mI29Cj0EdVwaOseaMsSQ==
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr16323567wrw.155.1572298868460;
        Mon, 28 Oct 2019 14:41:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:6dcd:e18f:2cd1:7611])
        by smtp.gmail.com with ESMTPSA id k1sm11708889wru.10.2019.10.28.14.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 14:41:07 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/2] options: add support for -fpic, -fPIC, -fpie & -fPIE
Date:   Mon, 28 Oct 2019 22:41:01 +0100
Message-Id: <20191028214102.70737-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214102.70737-1-luc.vanoostenryck@gmail.com>
References: <20191028214102.70737-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Do the parsing and output the corresponding predefines.
Follow the same rules as GCC: pic/pie -> 1, PIC/PIE -> 2
and pie/PIE implies pic/PIC.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 24 ++++++++++++++++++++++++
 lib.h |  2 ++
 2 files changed, 26 insertions(+)

diff --git a/lib.c b/lib.c
index 75a4f9870..e9e637d29 100644
--- a/lib.c
+++ b/lib.c
@@ -310,6 +310,8 @@ unsigned long fdump_ir;
 int fmem_report = 0;
 unsigned long long fmemcpy_max_count = 100000;
 unsigned long fpasses = ~0UL;
+int fpic = 0;
+int fpie = 0;
 int funsigned_char = UNSIGNED_CHAR;
 
 int preprocess_only;
@@ -483,6 +485,9 @@ static void handle_arch_msize_long_finalize(void)
 static void handle_arch_finalize(void)
 {
 	handle_arch_msize_long_finalize();
+
+	if (fpie > fpic)
+		fpic = fpie;
 }
 
 static const char *match_option(const char *arg, const char *prefix)
@@ -592,6 +597,12 @@ static int handle_switches(const char *ori, const char *opt, const struct flag *
 	return 0;
 }
 
+static int handle_switch_setval(const char *arg, const char *opt, const struct flag *flag, int options)
+{
+	*(flag->flag) = flag->mask;
+	return 1;
+}
+
 
 #define	OPTNUM_ZERO_IS_INF		1
 #define	OPTNUM_UNLIMITED		2
@@ -940,6 +951,10 @@ static struct flag fflags[] = {
 	{ "tabstop=",		NULL,	handle_ftabstop },
 	{ "mem2reg",		NULL,	handle_fpasses,	PASS_MEM2REG },
 	{ "optim",		NULL,	handle_fpasses,	PASS_OPTIM },
+	{ "pic",		&fpic,	handle_switch_setval, 1 },
+	{ "PIC",		&fpic,	handle_switch_setval, 2 },
+	{ "pie",		&fpie,	handle_switch_setval, 1 },
+	{ "PIE",		&fpie,	handle_switch_setval, 2 },
 	{ "signed-char",	&funsigned_char, NULL,	OPT_INVERSE },
 	{ "unsigned-char",	&funsigned_char, NULL, },
 	{ },
@@ -1382,6 +1397,15 @@ static void predefined_macros(void)
 		predefine("__i386", 1, "1");
 		break;
 	}
+
+	if (fpic) {
+		predefine("__pic__", 0, "%d", fpic);
+		predefine("__PIC__", 0, "%d", fpic);
+	}
+	if (fpie) {
+		predefine("__pie__", 0, "%d", fpie);
+		predefine("__PIE__", 0, "%d", fpie);
+	}
 }
 
 static void create_builtin_stream(void)
diff --git a/lib.h b/lib.h
index 18c97b4ff..b3616fd45 100644
--- a/lib.h
+++ b/lib.h
@@ -199,6 +199,8 @@ extern int fmem_report;
 extern unsigned long fdump_ir;
 extern unsigned long long fmemcpy_max_count;
 extern unsigned long fpasses;
+extern int fpic;
+extern int fpie;
 extern int funsigned_char;
 
 extern int arch_m64;
-- 
2.23.0


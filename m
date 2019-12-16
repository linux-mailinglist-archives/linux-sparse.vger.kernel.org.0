Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C37A121E68
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbfLPWiK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:10 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43258 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbfLPWiK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:10 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so9207144wre.10
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WGAJnRFJQQ0zg8SRy7DX+sS60ED5dSBsNF6ObxNEQb0=;
        b=S7c2ukn7C9hfpDl2lo8WYP6fUxetIAlvp7vKhqqQdSKV9Tb6YzMGtASBn0MLsa6g3Y
         w6lQAKsOriHgr13o2bj/snqO+3gS83b27z5OwaJ8d5WD95r2tyiCXA0qUVxkwI1iYJ/o
         RLxGM8Unr5837828nqJHIwfsrqGqG03ORIfiVJ3ph3yLlZXJfeA5lMriMwi0X8gtXvUe
         wBwW9sN2c78U6kK7S7dhWBapLvIwduN2iTQSoyhOFC+dG47F5nsTqiQr7WQmXJjcEwAp
         Sl3nGLu9AaGsuIfhXDvESeQLCYTnJkxvtTzp32+F4wE7zI6VAOgIzMCj79TKtIks4MCr
         rCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WGAJnRFJQQ0zg8SRy7DX+sS60ED5dSBsNF6ObxNEQb0=;
        b=s1C2c/xalaKxq0Bjn7FrGKjRJKT/wUt/5luq7H18CBJfN5zmY/SZlcVWL/CkK7Ji3m
         15Up68UzYiaVj2DN5tTyVRyGjz3Je+qTU4LSilMMemRJKE1hVvyYnoCGWYg02iL+KHhC
         nOq43IotES0YcYvBoU4V65VqkI5f0vSOl/GxyGwLrxywXkmXr5IyMCrC/9UWFNNQJGwO
         LrEsY7VpNidTJP6EATPOOpO/mLyy/6CGN5hDyLSeVDrCf3uCq44K0hRA+5T8b7b4fbJt
         Ntg+LAFgU2JW4lJQyLOGcaBKz0uEBDifE9p7gYW+6aE/1kMyh8Nx4KAkqNVD6PHOvw3j
         pnjQ==
X-Gm-Message-State: APjAAAWTfOKmXeb/5U4MZsi4lIUyw6oi66hnVQYoaQoEZwsnrOTw3oXq
        Fyel4Sao1nkEfbLNRX6F0Z87fSoN
X-Google-Smtp-Source: APXvYqxhP3c9m964eti6hxi+2DlUZSDNgRQ/x4jLlOOsXnxl1sxK1+Q4lyRTgCsH1M5VIMGk9riqBw==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr35051018wrj.68.1576535888763;
        Mon, 16 Dec 2019 14:38:08 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:08 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 09/10] arch: use arch_target for INT128's predefine
Date:   Mon, 16 Dec 2019 23:37:55 +0100
Message-Id: <20191216223756.2428-10-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
References: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The predefine for INT128 is still done with the generic
predefines but are arch-specific.

So, set a new flag for each arch supporting int128
and use this to determine if the predefine must be
issued or not.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c          | 10 +---------
 target-arm64.c |  1 +
 target-mips.c  |  1 +
 target-ppc.c   |  1 +
 target-riscv.c |  1 +
 target-s390.c  |  1 +
 target-sparc.c |  1 +
 target-x86.c   |  1 +
 target.h       |  1 +
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/lib.c b/lib.c
index de9c87c180cb..842423c63d25 100644
--- a/lib.c
+++ b/lib.c
@@ -1350,16 +1350,8 @@ static void predefined_macros(void)
 	predefined_sizeof("DOUBLE", "", bits_in_double);
 	predefined_sizeof("LONG_DOUBLE", "", bits_in_longdouble);
 
-	switch (arch_mach) {
-	case MACH_ARM64:
-	case MACH_MIPS64:
-	case MACH_PPC64:
-	case MACH_RISCV64:
-	case MACH_S390X:
-	case MACH_SPARC64:
-	case MACH_X86_64:
+	if (arch_target->has_int128)
 		predefined_sizeof("INT128", "", 128);
-	}
 
 	predefine("__ORDER_LITTLE_ENDIAN__", 1, "1234");
 	predefine("__ORDER_BIG_ENDIAN__", 1, "4321");
diff --git a/target-arm64.c b/target-arm64.c
index 71db639cdf85..d491b65e5154 100644
--- a/target-arm64.c
+++ b/target-arm64.c
@@ -30,6 +30,7 @@ const struct target target_arm64 = {
 
 	.big_endian = 0,
 	.unsigned_char = 1,
+	.has_int128 = 1,
 
 	.wchar = &uint_ctype,
 
diff --git a/target-mips.c b/target-mips.c
index 395e6ff13567..3d73236feffd 100644
--- a/target-mips.c
+++ b/target-mips.c
@@ -45,6 +45,7 @@ const struct target target_mips64 = {
 	.bitness = ARCH_LP64,
 	.big_endian = 1,
 	.unsigned_char = 0,
+	.has_int128 = 1,
 
 	.target_32bit = &target_mips32,
 
diff --git a/target-ppc.c b/target-ppc.c
index 21ce86d813a4..b138635b9103 100644
--- a/target-ppc.c
+++ b/target-ppc.c
@@ -50,6 +50,7 @@ const struct target target_ppc64 = {
 	.bitness = ARCH_LP64,
 	.big_endian = 1,
 	.unsigned_char = 1,
+	.has_int128 = 1,
 
 	.target_32bit = &target_ppc32,
 
diff --git a/target-riscv.c b/target-riscv.c
index bbb47e9d7a34..08d036ca04b7 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -44,6 +44,7 @@ const struct target target_riscv64 = {
 	.bitness = ARCH_LP64,
 	.big_endian = 0,
 	.unsigned_char = 1,
+	.has_int128 = 1,
 
 	.target_32bit = &target_riscv32,
 
diff --git a/target-s390.c b/target-s390.c
index 159a6b1149b9..8fe7d93677b2 100644
--- a/target-s390.c
+++ b/target-s390.c
@@ -37,6 +37,7 @@ const struct target target_s390x = {
 	.bitness = ARCH_LP64,
 	.big_endian = 1,
 	.unsigned_char = 1,
+	.has_int128 = 1,
 
 	.bits_in_longdouble = 64,
 	.max_fp_alignment = 8,
diff --git a/target-sparc.c b/target-sparc.c
index 5267430f8bfd..70c440c2facf 100644
--- a/target-sparc.c
+++ b/target-sparc.c
@@ -58,6 +58,7 @@ const struct target target_sparc64 = {
 	.bitness = ARCH_LP64,
 	.big_endian = 1,
 	.unsigned_char = 0,
+	.has_int128 = 1,
 
 	.target_32bit = &target_sparc32,
 
diff --git a/target-x86.c b/target-x86.c
index 046e346e3b19..01d213ef46c2 100644
--- a/target-x86.c
+++ b/target-x86.c
@@ -61,6 +61,7 @@ const struct target target_x86_64 = {
 	.bitness = ARCH_LP64,
 	.big_endian = 0,
 	.unsigned_char = 0,
+	.has_int128 = 1,
 
 	.bits_in_longdouble = 128,
 	.max_fp_alignment = 16,
diff --git a/target.h b/target.h
index 8f39abb8d875..a89e21b63563 100644
--- a/target.h
+++ b/target.h
@@ -60,6 +60,7 @@ struct target {
 	unsigned int	big_endian:1;
 	unsigned int	unsigned_char:1;
 	unsigned int	size_t_long:1;
+	unsigned int	has_int128:1;
 
 	struct symbol	*wchar;
 	struct symbol	*wint;
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36809121E66
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfLPWiK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:10 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55069 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727799AbfLPWiK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:10 -0500
Received: by mail-wm1-f68.google.com with SMTP id b19so981493wmj.4
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zLR9r6zmvm+yTz/V8q9lZKNdn5/thLy2vepJuWM2fs0=;
        b=Ym57dCpc5q3ceGCj98vSmsfcyj9rU9W3sj7x6MwtjQc1OPl5mednks0iDCrRfU6mEX
         rN4ts74KmNyRpVFDCnHU4CVkjD9h3x2xz/nVFVl6nncdQ21z6pmB5RnDE5rdgQk2DMYM
         EP6lGcRunZpvX2D2LMfQpz2GV8jkNt4ONnHBFQ4AFuO0zVzfW4fDw56GENsYv+WMJThM
         H2gsh6E29rhnTmiDjmN0ayyKnrzEYROPCjfz0V5TK3kIUY8nko/YfuvuARxWhS1n/k0T
         OJeJcUEtkyUHlSRpsDqnrJ7Io3k/+BEcgbpfume562o4jfk+u8Ne1XfulwqkW+tpExZ1
         zTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zLR9r6zmvm+yTz/V8q9lZKNdn5/thLy2vepJuWM2fs0=;
        b=mVVuirC/Boa2QCXe7u1oLJ9C/zzVTEr/4YoaJdaJBTZO7zWAegywOQL4HQWsmDB8Ro
         8MYdiFrAmEPjqj0Vj038TZm5uklY1yC+3lTV+FqrH57TYl/4n6bMDV8KYFYsVAfB0jPI
         QRXUc5j+Cs8H8M8wRZkduip+DjRZ5vddJBBPs6AbsomjDqm+Rn65eYUYSzX/z2RvePKk
         mqmru2LJtt3EyM+24oEU4Os8dvrafYUzG85mFyi83JnDaVyEPRm0Igxo3dofI3LGdL2c
         UEfz4Av04HJ4aTXOQe0cDSDcnQ4Omt25o43WAGHFvn94NZIlaCOE8k9YdJ0TGyaKF89M
         Fk7g==
X-Gm-Message-State: APjAAAXYhsIDHMS7XA9mcPKYn8/XiDF+S5xZ85s1CH0Gv2bjVpUv8Knz
        JC21Do5GB8Q6t7miXs88+0unYYs3
X-Google-Smtp-Source: APXvYqwdwgvj1fuvlnrK+ooi/QHgA+d7CFYTji/Jg5YMPA40DNSElQEsenm/qB+5pzDcZALViXItzg==
X-Received: by 2002:a7b:cf12:: with SMTP id l18mr1579552wmg.66.1576535887547;
        Mon, 16 Dec 2019 14:38:07 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:07 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 08/10] arch: move cmodel predefines to the target files.
Date:   Mon, 16 Dec 2019 23:37:54 +0100
Message-Id: <20191216223756.2428-9-luc.vanoostenryck@gmail.com>
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
move the predefines for cmodel, which are arch-specific,
to the target files.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c          | 50 --------------------------------------------------
 lib.h          |  1 +
 target-arm64.c | 10 ++++++++++
 target-riscv.c | 10 ++++++++++
 4 files changed, 21 insertions(+), 50 deletions(-)

diff --git a/lib.c b/lib.c
index a2514b420888..de9c87c180cb 100644
--- a/lib.c
+++ b/lib.c
@@ -1275,55 +1275,6 @@ static void predefined_ctype(const char *name, struct symbol *type, int flags)
 		predefined_width(name, bits);
 }
 
-static void predefined_cmodel(void)
-{
-	const char *pre, *suf;
-	const char *def = NULL;
-	switch (arch_mach) {
-	case MACH_ARM64:
-		pre = "__AARCH64_CMODEL_";
-		suf = "__";
-		switch (arch_cmodel) {
-		case CMODEL_LARGE:
-			def = "LARGE";
-			break;
-		case CMODEL_SMALL:
-			def = "SMALL";
-			break;
-		case CMODEL_TINY:
-			def = "TINY";
-			break;
-		default:
-			break;
-		}
-		break;
-	case MACH_RISCV32:
-	case MACH_RISCV64:
-		pre = "__riscv_cmodel_";
-		suf = "";
-		switch (arch_cmodel) {
-		case CMODEL_MEDLOW:
-			def = "medlow";
-			break;
-		case CMODEL_MEDANY:
-			def = "medany";
-			break;
-		case CMODEL_PIC:
-			def = "pic";
-			break;
-		default:
-			break;
-		}
-		break;
-	default:
-		break;
-	}
-
-	if (!def)
-		return;
-	add_pre_buffer("#weak_define %s%s%s 1\n", pre, def, suf);
-}
-
 static void predefined_macros(void)
 {
 	predefine("__CHECKER__", 0, "1");
@@ -1457,7 +1408,6 @@ static void predefined_macros(void)
 
 	if (arch_target->predefine)
 		arch_target->predefine(arch_target);
-	predefined_cmodel();
 }
 
 ////////////////////////////////////////////////////////////////////////////////
diff --git a/lib.h b/lib.h
index d0585e363bce..290cbc576abe 100644
--- a/lib.h
+++ b/lib.h
@@ -222,6 +222,7 @@ enum {
 	CMODEL_PIC,
 	CMODEL_SMALL,
 	CMODEL_TINY,
+	CMODEL_LAST,
 };
 extern int arch_cmodel;
 
diff --git a/target-arm64.c b/target-arm64.c
index cddabb820085..71db639cdf85 100644
--- a/target-arm64.c
+++ b/target-arm64.c
@@ -11,7 +11,17 @@ static void init_arm64(const struct target *self)
 
 static void predefine_arm64(const struct target *self)
 {
+	static const char *cmodels[CMODEL_LAST] = {
+		[CMODEL_LARGE] = "LARGE",
+		[CMODEL_SMALL] = "SMALL",
+		[CMODEL_TINY]  = "TINY",
+	};
+	const char *cmodel = cmodels[arch_cmodel];
+
 	predefine("__aarch64__", 1, "1");
+
+	if (cmodel)
+		add_pre_buffer("#define __AARCH64_CMODEL_%s__ 1\n", cmodel);
 }
 
 const struct target target_arm64 = {
diff --git a/target-riscv.c b/target-riscv.c
index e7acb36349ad..bbb47e9d7a34 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -13,8 +13,18 @@ static void init_riscv(const struct target *self)
 
 static void predefine_riscv(const struct target *self)
 {
+	static const char *cmodels[CMODEL_LAST] = {
+		[CMODEL_MEDANY] = "medany",
+		[CMODEL_MEDLOW] = "medlow",
+		[CMODEL_PIC]    = "pic",
+	};
+	const char *cmodel = cmodels[arch_cmodel];
+
 	predefine("__riscv", 1, "1");
 	predefine("__riscv_xlen", 1, "%d", ptr_ctype.bit_size);
+
+	if (cmodel)
+		add_pre_buffer("#define __riscv_cmodel_%s 1\n", cmodel);
 }
 
 const struct target target_riscv32 = {
-- 
2.24.0


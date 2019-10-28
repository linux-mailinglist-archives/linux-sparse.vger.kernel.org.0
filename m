Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07271E7B83
	for <lists+linux-sparse@lfdr.de>; Mon, 28 Oct 2019 22:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731710AbfJ1VlL (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 28 Oct 2019 17:41:11 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43655 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731719AbfJ1VlK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 28 Oct 2019 17:41:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id n1so4001053wra.10
        for <linux-sparse@vger.kernel.org>; Mon, 28 Oct 2019 14:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tSNPoaRiPIiUGfXzaTh+GpE0UQUF6+ltw8d6k74aeLY=;
        b=PdC1Nuv0QHIFlIL98Txmj1vyb+Lt1+jaF1OBm2CuCPjmzW1BYEFO3s9kz4/YzOfNBH
         9R4RBp5vqunA6Ch8ap62JbXVUv3dvSS+EDbJ6nTTEJx8Rhvm7wy048vcrh454Zg8zQnb
         G7gtFPl9C7RhsTkaNy0VyjE4WuALe7aWOUBHp97pTM5XaU/PqwKxFR9VImE9YRuydpUL
         vOnXJhqjmNwv3oZwrpyRf1enmv4hJchcsp+y7R5H4wMKMOyujmoGvrOccjWeZ3AsHGbV
         L1YRLDTasno+7mV+FohLflT3jRyPa/gknc5U1s29b4CPHI87lcOiKusP5LTDMiYZDSfH
         Gseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tSNPoaRiPIiUGfXzaTh+GpE0UQUF6+ltw8d6k74aeLY=;
        b=gw6+/tsJp4RzD6B5eTrTne0TYf0G918HsdwjnGrtw7gCmmsnRLrnsblyY7uyJIm+VW
         9YlM/LHXhQakkkUQvQzgEYJ9Jbj6OhmL4quL+iXQKSGjRGs7+O0wRKWdufYyRTUMrjRV
         rqIICTG7B+IPP3zaWErk7peZJq2BWh2PTRz26F1GMMY/omXjWTTkrFGjflCyKpaJnHlC
         W1ZTHFkbxlIzuQ/eUab3TjNo8raKd89rvJ0ENGLsLXYpX/n0PaDeJHtq88rHtzvCr56+
         XBiM6+I93O7tUUzfzlq9xnPyOOPjC4pJkMebOvuLDsG48wyrLpWukOWgqd/JXR2qnEPw
         o43A==
X-Gm-Message-State: APjAAAX8g8Q7Rqumwz51fzNh5n/eL4cy188xBD/jj3Yvrn+xRKLlvcS4
        luhtz20fP+A4MXdQrm8HvpHClOLm
X-Google-Smtp-Source: APXvYqzepmZU4iF5K77mColxoOi346HbnG03h6UpzT5B9I5X2zcymzpQun0521Zv8Lw1iV848aldtQ==
X-Received: by 2002:adf:ea85:: with SMTP id s5mr16174122wrm.18.1572298869204;
        Mon, 28 Oct 2019 14:41:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:6dcd:e18f:2cd1:7611])
        by smtp.gmail.com with ESMTPSA id k1sm11708889wru.10.2019.10.28.14.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 14:41:08 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/2] options: add support for -mcmodel
Date:   Mon, 28 Oct 2019 22:41:02 +0100
Message-Id: <20191028214102.70737-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028214102.70737-1-luc.vanoostenryck@gmail.com>
References: <20191028214102.70737-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Do the parsing of all models used in the kernel and
output the predefines for arm64 & riscv.

Reported-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib.h | 13 +++++++++
 2 files changed, 99 insertions(+)

diff --git a/lib.c b/lib.c
index e9e637d29..84b5be6a8 100644
--- a/lib.c
+++ b/lib.c
@@ -328,6 +328,7 @@ static int arch_msize_long = 0;
 int arch_m64 = ARCH_M64_DEFAULT;
 int arch_big_endian = ARCH_BIG_ENDIAN;
 int arch_mach = MACH_NATIVE;
+int arch_cmodel = CMODEL_UNKNOWN;
 
 
 #define CMDLINE_INCLUDE 20
@@ -470,6 +471,26 @@ static char **handle_switch_m(char *arg, char **next)
 		arch_big_endian = 1;
 	} else if (!strcmp(arg, "mlittle-endian")) {
 		arch_big_endian = 0;
+	} else if (!strncmp(arg, "mcmodel", 7)) {
+		arg += 7;
+		if (*arg++ != '=')
+			die("missing argument for -mcmodel");
+		else if (!strcmp(arg, "kernel"))
+			arch_cmodel = CMODEL_KERNEL;
+		else if (!strcmp(arg, "large"))
+			arch_cmodel = CMODEL_LARGE;
+		else if (!strcmp(arg, "medany"))
+			arch_cmodel = CMODEL_MEDANY;
+		else if (!strcmp(arg, "medium"))
+			arch_cmodel = CMODEL_MEDIUM;
+		else if (!strcmp(arg, "medlow"))
+			arch_cmodel = CMODEL_MEDLOW;
+		else if (!strcmp(arg, "small"))
+			arch_cmodel = CMODEL_SMALL;
+		else if (!strcmp(arg, "tiny"))
+			arch_cmodel = CMODEL_TINY;
+		else
+			die("invalid argument for -mcmodel=%s", arg);
 	}
 	return next;
 }
@@ -488,6 +509,20 @@ static void handle_arch_finalize(void)
 
 	if (fpie > fpic)
 		fpic = fpie;
+
+	switch (arch_mach) {
+	case MACH_ARM64:
+		if (arch_cmodel == CMODEL_UNKNOWN)
+			arch_cmodel = CMODEL_SMALL;
+		break;
+	case MACH_RISCV32:
+	case MACH_RISCV64:
+		if (arch_cmodel == CMODEL_UNKNOWN)
+			arch_cmodel = CMODEL_MEDLOW;
+		if (fpic)
+			arch_cmodel = CMODEL_PIC;
+		break;
+	}
 }
 
 static const char *match_option(const char *arg, const char *prefix)
@@ -1213,6 +1248,55 @@ static void predefined_ctype(const char *name, struct symbol *type, int flags)
 		predefined_width(name, bits);
 }
 
+static void predefined_cmodel(void)
+{
+	const char *pre, *suf;
+	const char *def = NULL;
+	switch (arch_mach) {
+	case MACH_ARM64:
+		pre = "__AARCH64_CMODEL_";
+		suf = "__";
+		switch (arch_cmodel) {
+		case CMODEL_LARGE:
+			def = "LARGE";
+			break;
+		case CMODEL_SMALL:
+			def = "SMALL";
+			break;
+		case CMODEL_TINY:
+			def = "TINY";
+			break;
+		default:
+			break;
+		}
+		break;
+	case MACH_RISCV32:
+	case MACH_RISCV64:
+		pre = "__riscv_cmodel_";
+		suf = "";
+		switch (arch_cmodel) {
+		case CMODEL_MEDLOW:
+			def = "medlow";
+			break;
+		case CMODEL_MEDANY:
+			def = "medany";
+			break;
+		case CMODEL_PIC:
+			def = "pic";
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (!def)
+		return;
+	add_pre_buffer("#weak_define %s%s%s 1\n", pre, def, suf);
+}
+
 static void predefined_macros(void)
 {
 	predefine("__CHECKER__", 0, "1");
@@ -1406,6 +1490,8 @@ static void predefined_macros(void)
 		predefine("__pie__", 0, "%d", fpie);
 		predefine("__PIE__", 0, "%d", fpie);
 	}
+
+	predefined_cmodel();
 }
 
 static void create_builtin_stream(void)
diff --git a/lib.h b/lib.h
index b3616fd45..f6dea8ca2 100644
--- a/lib.h
+++ b/lib.h
@@ -207,6 +207,19 @@ extern int arch_m64;
 extern int arch_big_endian;
 extern int arch_mach;
 
+enum {
+	CMODEL_UNKNOWN,
+	CMODEL_KERNEL,
+	CMODEL_LARGE,
+	CMODEL_MEDANY,
+	CMODEL_MEDIUM,
+	CMODEL_MEDLOW,
+	CMODEL_PIC,
+	CMODEL_SMALL,
+	CMODEL_TINY,
+};
+extern int arch_cmodel;
+
 extern void dump_macro_definitions(void);
 extern struct symbol_list *sparse_initialize(int argc, char **argv, struct string_list **files);
 extern struct symbol_list *__sparse(char *filename);
-- 
2.23.0


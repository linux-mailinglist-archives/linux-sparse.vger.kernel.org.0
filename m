Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13370121E62
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbfLPWiH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:07 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36805 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbfLPWiG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:06 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so1011090wma.1
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TCZEMJ69T2lVfrg8ToTysQxT1NoSTymL9nonVC43BSI=;
        b=SJ/6qqIFwxue2ihzNHr1q/NrExNorYKm4CYvTZGWNNAwSZ+jatKSK/BR9UNERNQvWW
         5M8c2lusKXUpcnPWADqmuXPEAJft+oCs0AGCc5bDZYtj2mAV3EYihUJXqvKDejJV9GoK
         2xAQM5zCgvwhWTbi2NTwD5JlxM5R6mGUy6NaOhzUeN6o+rJURCD/6tnHRHlsDMvVfy1H
         ha3H5apfIuQGUgJW0650t5y+yWBFZhcy7W79AqnEtz1oZ3UaR2+cMOKL0ElHotRQ+1eZ
         qMD8BCRa6qGnXgaMUUS+HjvUcoVszQXwDXgNQ0nA6S3mkIH9kxzcdBlSIY0J1qoUH2XM
         3NpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TCZEMJ69T2lVfrg8ToTysQxT1NoSTymL9nonVC43BSI=;
        b=H6fFIcCdUMW1MQK7xjmd4GKbP3CERTHeLzkiA+OszNiiVQbPnptPTzjvD28CHsOkAL
         B+aa9QwGTxc6kXW6j516kXjPMNWUhTH8RdYNPVXjkZ3vRJPTk6yCU097y4u1DujVb5hJ
         T8FioF0t3UGvIZXWIlZPqj/Q6lmcJrC0l3lai5GJeXD3kRbqERnsfIqALdIA6/geuckf
         UmSRvetG+ceem9m3etgrB0undHB6L+bnZ96PXSc6yS/DoNp0bE/o5FQ9B77toMPE9jad
         1N07Hjqpau2UiyeIsdU5xRUdE3LTKZwitIFcfjJh+7XdX3rKzmjqwblzTTYf++ggmfVn
         DhJw==
X-Gm-Message-State: APjAAAXSVL3CIspRqKx0MQo1qjddsi4mgR4TpUbbgYa+F4LyJYEFrodk
        BvkFGsgfRNxJsuPIJuMB2t98fJfU
X-Google-Smtp-Source: APXvYqwctkR/vdrPBxJZTmvYEKbn3z5ZiGeiqL2RFJzF0o6PLFHsiSW6eFDZLcjUCkUuarCtQtSAiQ==
X-Received: by 2002:a1c:2355:: with SMTP id j82mr1449243wmj.135.1576535883886;
        Mon, 16 Dec 2019 14:38:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:03 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 04/10] arch: move parsing of --arch=<ARCH> to target.c
Date:   Mon, 16 Dec 2019 23:37:50 +0100
Message-Id: <20191216223756.2428-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
References: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

So, the 2 tables indexed by arch are next to each other,
both in target.c, making easier to add a new arch.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c    | 50 ++++----------------------------------------------
 target.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 target.h |  1 +
 3 files changed, 58 insertions(+), 46 deletions(-)

diff --git a/lib.c b/lib.c
index d759648a504a..82354af7eafa 100644
--- a/lib.c
+++ b/lib.c
@@ -1137,56 +1137,14 @@ static char **handle_switch_x(char *arg, char **next)
 
 static char **handle_arch(char *arg, char **next)
 {
-	static const struct arch {
-		const char *name;
-		enum machine mach;
-		char bits;
-	} archs[] = {
-		{ "aarch64",	MACH_ARM64,	64, },
-		{ "arm64",	MACH_ARM64,	64, },
-		{ "arm",	MACH_ARM,	32, },
-		{ "i386",	MACH_I386,	32, },
-		{ "m68k",	MACH_M68K,	32, },
-		{ "mips",	MACH_MIPS32,	0,  },
-		{ "powerpc",	MACH_PPC32,	0,  },
-		{ "ppc",	MACH_PPC32,	0,  },
-		{ "riscv",	MACH_RISCV32,	0,  },
-		{ "s390x",	MACH_S390X,	64, },
-		{ "s390",	MACH_S390,	32, },
-		{ "sparc",	MACH_SPARC32,	0,  },
-		{ "x86_64",	MACH_X86_64,	64, },
-		{ "x86-64",	MACH_X86_64,	64, },
-		{ NULL },
-	};
-	const struct arch *p;
+	enum machine mach;
 
 	if (*arg++ != '=')
 		die("missing argument for --arch option");
 
-	for (p = &archs[0]; p->name; p++) {
-		size_t len = strlen(p->name);
-		if (strncmp(p->name, arg, len) == 0) {
-			enum machine mach = p->mach;
-			const char *suf = arg + len;
-			int bits = p->bits;
-
-			if (bits == 0) {
-				if (!strcmp(suf, "") || !strcmp(suf, "32")) {
-					;
-				} else if (!strcmp(suf, "64")) {
-					mach += 1;
-				} else {
-					die("invalid architecture: %s", arg);
-				}
-			} else {
-				if (strcmp(suf, ""))
-					die("invalid architecture: %s", arg);
-			}
-
-			target_config(mach);
-			break;
-		}
-	}
+	mach = target_parse(arg);
+	if (mach != MACH_UNKNOWN)
+		target_config(mach);
 
 	return next;
 }
diff --git a/target.c b/target.c
index f23ed30881bd..8d2d10588d60 100644
--- a/target.c
+++ b/target.c
@@ -1,4 +1,5 @@
 #include <stdio.h>
+#include <string.h>
 
 #include "symbol.h"
 #include "target.h"
@@ -75,6 +76,58 @@ static const struct target *targets[] = {
 };
 const struct target *arch_target = &target_default;
 
+enum machine target_parse(const char *name)
+{
+	static const struct arch {
+		const char *name;
+		enum machine mach;
+		char bits;
+	} archs[] = {
+		{ "aarch64",	MACH_ARM64,	64, },
+		{ "arm64",	MACH_ARM64,	64, },
+		{ "arm",	MACH_ARM,	32, },
+		{ "i386",	MACH_I386,	32, },
+		{ "m68k",	MACH_M68K,	32, },
+		{ "mips",	MACH_MIPS32,	0,  },
+		{ "powerpc",	MACH_PPC32,	0,  },
+		{ "ppc",	MACH_PPC32,	0,  },
+		{ "riscv",	MACH_RISCV32,	0,  },
+		{ "s390x",	MACH_S390X,	64, },
+		{ "s390",	MACH_S390,	32, },
+		{ "sparc",	MACH_SPARC32,	0,  },
+		{ "x86_64",	MACH_X86_64,	64, },
+		{ "x86-64",	MACH_X86_64,	64, },
+		{ NULL },
+	};
+	const struct arch *p;
+
+	for (p = &archs[0]; p->name; p++) {
+		size_t len = strlen(p->name);
+		if (strncmp(p->name, name, len) == 0) {
+			enum machine mach = p->mach;
+			const char *suf = name + len;
+			int bits = p->bits;
+
+			if (bits == 0) {
+				if (!strcmp(suf, "") || !strcmp(suf, "32")) {
+					;
+				} else if (!strcmp(suf, "64")) {
+					mach += 1;
+				} else {
+					die("invalid architecture: %s", name);
+				}
+			} else {
+				if (strcmp(suf, ""))
+					die("invalid architecture: %s", name);
+			}
+
+			return mach;
+		}
+	}
+
+	return MACH_UNKNOWN;
+}
+
 
 void target_config(enum machine mach)
 {
diff --git a/target.h b/target.h
index 0c45ecf41ea2..c6aef9592080 100644
--- a/target.h
+++ b/target.h
@@ -92,6 +92,7 @@ extern const struct target target_x86_64;
 /* target.c */
 extern const struct target *arch_target;
 
+enum machine target_parse(const char *name);
 void target_config(enum machine mach);
 void target_init(void);
 
-- 
2.24.0


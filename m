Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA9AFE98C4
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfJ3JDx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:53 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35281 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbfJ3JDx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:53 -0400
Received: by mail-wm1-f67.google.com with SMTP id x5so1228554wmi.0
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+NxCfiSXtYClnyIjhOXlGGMb1f1qjeeoFxR3ywrcspE=;
        b=mYU/ahLdhTN5EXynMCVKJyhJkt6Fe60Z5Q7kd3Il0pqEltfpvLxTFDhuntaQZMxDAW
         I+XAWWD0GZOXqizuxr8Og7dj08RLNyY+zk8VMFoRc/OdVzaWeYuFyi0X0PFm4QoAfRTk
         5+zNO22gCIa+dEXyte7+VteZPvmjYe9nki1CEONXLAAkeLyZzI9cuwlWpoLSXgugFku5
         FYnrfBNeLoLVM+9xcOdR+ycBSYCVh1GD89Hqa8p8Kgm4/RIJ2a1Vtew9FR+dhf97eigM
         WpBo5p/uWuAtBROMa4GrEUaN1SMZfvyhR64NvFH2qZlIOJGuwRs9LvA3qHpHVOZfg1RK
         Lv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+NxCfiSXtYClnyIjhOXlGGMb1f1qjeeoFxR3ywrcspE=;
        b=N6De/DIp1Xd/ARt2wdC9fSmp7YblLWulQUAU16SmaOkUVajHNVUK74fnE3YFD1Mxqd
         HghQ5jYAcYaVXZAxAKu+WPiF4unX7n1N58ixjZbHk+OAwt3jz7uLkO1lMPTa2alWM5r6
         /hx0IOHdURo1cCjv9NflR5rkyaxyNQp6nZQDD/ITjP5T90BYTH8EqEjjevtlxE50dnUY
         5g+rIfJ3EF4exomPF3jULjFiVSc/M35nryU5pmyaVL7sXGYDTCme9+CeWpdPutsNaf9+
         Hzc5rlWtu3rzTgu7WPdcQW6eNHlJ85i5PahZkhBP78MDbuK/Gw0YYWeekxl0DqBjlQmg
         56cg==
X-Gm-Message-State: APjAAAX6+XOtuMsWbjdqzLCGz7O+aWYWmZjrONrMqGwlxg/josIG02ou
        zJzcqlQL73qoOIoed4Ix6XmFmBSa
X-Google-Smtp-Source: APXvYqy+F55pPoELtwEEUZvXfg8DHH17vCecWpG4vOFKsqk5RpANSvdov7y6Tv6Fh9DhxHO0ttPA6A==
X-Received: by 2002:a1c:60d7:: with SMTP id u206mr8321225wmb.101.1572426229739;
        Wed, 30 Oct 2019 02:03:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:49 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH v2 4/6] options: allow to specify the desired arch with --arch=<arch>
Date:   Wed, 30 Oct 2019 10:03:28 +0100
Message-Id: <20191030090333.3412-9-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
References: <20191030090333.3412-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse is universal in the sense that the same executable can
be used for all architectures. For this, most arch-specific
setting can be set with an option and the default values
are taken from the host machine.

This is working nicely for native targets. However, for cross-
compilation, while seeming to work relatively well (thanks to
the kernel build system using -m32/-m64 for all archs, for example)
things can never work 100% correctly. For example, in the case
an X86-64 host machine is used for an ARM target, the kernel
build system will call sparse with -m32, Sparse will 'autodetect'
the target arch as i386 (x86-64 + -m32) and will then predefine
the macro __i386__. Most of the time this is not a problem (at
least for the kernel) unless, of course, if the code contains
something like:
	#ifdef __i386__
	...
	#elif  __arm__
	...

So, add an option --arch=<arch> to specify the target architecture.
The native arch is still used if no such flag is given.

Reported-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c    | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 sparse.1 |  8 +++++++
 2 files changed, 76 insertions(+)

diff --git a/lib.c b/lib.c
index 72dcfa6a0..3cc8916b1 100644
--- a/lib.c
+++ b/lib.c
@@ -1046,6 +1046,73 @@ static char **handle_switch_x(char *arg, char **next)
 }
 
 
+static char **handle_arch(char *arg, char **next)
+{
+	static const struct arch {
+		const char *name;
+		char mach;
+		char bits;
+		bool big_endian:1;
+	} archs[] = {
+		{ "aarch64",	MACH_ARM64,	64, 0 },
+		{ "arm64",	MACH_ARM64,	64, 0 },
+		{ "arm",	MACH_ARM,	32, 0 },
+		{ "i386",	MACH_I386,	32, 0 },
+		{ "m68k",	MACH_M68K,	32, 0 },
+		{ "mips",	MACH_MIPS32,	0,  1 },
+		{ "powerpc",	MACH_PPC32,	0,  1 },
+		{ "ppc",	MACH_PPC32,	0,  1 },
+		{ "riscv",	MACH_RISCV32,	0,  0 },
+		{ "s390x",	MACH_S390X,	64, 1 },
+		{ "s390",	MACH_S390,	32, 1 },
+		{ "sparc",	MACH_SPARC32,	0,  1 },
+		{ "x86_64",	MACH_X86_64,	64, 0 },
+		{ "x86-64",	MACH_X86_64,	64, 0 },
+		{ NULL },
+	};
+	const struct arch *p;
+
+	if (*arg++ != '=')
+		die("missing argument for --arch option");
+
+	for (p = &archs[0]; p->name; p++) {
+		size_t len = strlen(p->name);
+		if (strncmp(p->name, arg, len) == 0) {
+			const char *suf = arg + len;
+			int bits = p->bits;
+
+			arch_mach = p->mach;
+			if (bits == 0) {
+				if (!strcmp(suf, "")) {
+					bits = 32;
+				} else if (!strcmp(suf, "32")) {
+					bits = 32;
+				} else if (!strcmp(suf, "64")) {
+					bits = 64;
+					arch_mach += 1;
+				} else {
+					die("invalid architecture: %s", arg);
+				}
+			} else {
+				if (strcmp(suf, ""))
+					die("invalid architecture: %s", arg);
+			}
+
+			// adjust the arch size (but keep x32 & llp64)
+			if (bits == 32)
+				arch_m64 = ARCH_LP32;
+			else if (bits == 64 && arch_m64 == ARCH_LP32)
+				arch_m64 = ARCH_LP64;
+			break;
+
+			if (p->big_endian)
+				arch_big_endian = 1;
+		}
+	}
+
+	return next;
+}
+
 static char **handle_version(char *arg, char **next)
 {
 	printf("%s\n", SPARSE_VERSION);
@@ -1078,6 +1145,7 @@ struct switches {
 static char **handle_long_options(char *arg, char **next)
 {
 	static struct switches cmd[] = {
+		{ "arch", handle_arch, 1 },
 		{ "param", handle_param, 1 },
 		{ "version", handle_version },
 		{ NULL, NULL }
diff --git a/sparse.1 b/sparse.1
index beb484423..be38f6883 100644
--- a/sparse.1
+++ b/sparse.1
@@ -423,6 +423,14 @@ Sparse does not issue these warnings by default.
 .
 .SH MISC OPTIONS
 .TP
+.B \-\-arch=\fIARCH\fR
+Specify the target architecture.
+For architectures having both a 32-bit and a 64-bit variant (mips, powerpc,
+riscv & sparc) the architecture name can be suffixed with \fI32\fR or \fI64\fR.
+
+The default architecture & size is the one of the machine used to build Sparse.
+.
+.TP
 .B \-gcc-base-dir \fIdir\fR
 Look for compiler-provided system headers in \fIdir\fR/include/ and \fIdir\fR/include-fixed/.
 .
-- 
2.23.0


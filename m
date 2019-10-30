Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 602AAE98C6
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbfJ3JDx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:03:53 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53504 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbfJ3JDx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:03:53 -0400
Received: by mail-wm1-f66.google.com with SMTP id n7so1205606wmc.3
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pkwhKR/eIAUCOx47YxM4QJnhanDWBGm+ZxiVZCUe/HM=;
        b=EffmjzJ5Kv1nzPBaN2c368GIXA4a2oI3qAfDdZdsAmRzd1EOOKTwChTkN4oIJOVJSb
         A9VYKvNFjx8jq8ASQa2F55stw1EO9E/zaG3e5sI2FDcrCQG9+5W2EtobbJjTsHilRBFR
         ZJ1bgaWALS4MzP+sVVbSepwSSsShkOO5sw7jNAFVWMGk99CQ5/Ka5nxv6N7brkG2Clpc
         SwmGrVsczpYQUd47LT4oTWbOoIjooOJ/7TLSuKLftnQWFB1s8fq+rIw4dfgJ2S57wB9H
         i9D0/wrjFvLd7qgKQEEVT/SPMCiWf+NY7XYpy4zmTN2Dzn+YYLTt+BVHrhXAAwm+Ji3v
         MoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pkwhKR/eIAUCOx47YxM4QJnhanDWBGm+ZxiVZCUe/HM=;
        b=mC46204Sx1ObSu7ohziiQf5+LcAVzpyTcBnRNiWysbQsg8KppT99lQeNReGlp8Zymx
         RVubGZVidvdOShses+lXcvuizcH+IXEntbSdLptRNaXz6OKYjqJdEPPyt0LQw3aiNjKK
         apiMJxxpPzK3qQ5jIZzJdxHgEptfoCiUcfZwG8F2JFG1uXZeNuiCA0NcirGGxHjRKr2Z
         l1Lf1oU2k0q8ApIoIGCDP4bdw1ly2CvYzh86J2fuugvg6vk/Vui96zKCsm5QM/fl3vxY
         qGxUWwQaDYV+x1VpImZhA/H6j3shPcy7o8Ue/Cb5vtc/2nmMYu+HoYqL3LbC1kUt8EPI
         r3yg==
X-Gm-Message-State: APjAAAVf2M1Is40FF5X7sW3DFoyZabKu8bCrwMzi92Ww6I7lHjvz/1+y
        v3kwcjq/k+lT0X4BNTFX3XgqmPQM
X-Google-Smtp-Source: APXvYqz7PP4qIQCaeq8yo+VZ4DUlQi3w3Tuac5bIMH7VPh9l/2Ef+BZZgNRyuR3Nni/XziJIEwOxlA==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr7886886wmh.54.1572426230601;
        Wed, 30 Oct 2019 02:03:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id c15sm1263247wmb.45.2019.10.30.02.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 02:03:50 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 5/7] arch: add an option to specify the desired arch: --arch=<arch>
Date:   Wed, 30 Oct 2019 10:03:29 +0100
Message-Id: <20191030090333.3412-10-luc.vanoostenryck@gmail.com>
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
 lib.c                     | 68 +++++++++++++++++++++++++++++++++++++++
 sparse.1                  |  8 +++++
 validation/arch/arm.c     | 27 ++++++++++++++++
 validation/arch/arm64.c   | 23 +++++++++++++
 validation/arch/mips32.c  | 29 +++++++++++++++++
 validation/arch/riscv64.c | 27 ++++++++++++++++
 6 files changed, 182 insertions(+)
 create mode 100644 validation/arch/arm.c
 create mode 100644 validation/arch/arm64.c
 create mode 100644 validation/arch/mips32.c
 create mode 100644 validation/arch/riscv64.c

diff --git a/lib.c b/lib.c
index 58c12c77b..91ecc12c5 100644
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
+			if (p->big_endian)
+				arch_big_endian = 1;
+
+			break;
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
diff --git a/validation/arch/arm.c b/validation/arch/arm.c
new file mode 100644
index 000000000..4eb804de6
--- /dev/null
+++ b/validation/arch/arm.c
@@ -0,0 +1,27 @@
+__arm__
+__aarch64__
+__i386__
+__x86_64__
+__LP64__
+__BYTE_ORDER__
+__SIZEOF_INT__
+__SIZEOF_LONG__
+__SIZE_TYPE__
+
+/*
+ * check-name: arch/arm
+ * check-command: sparse --arch=arm -E $file
+ *
+ * check-output-start
+
+1
+__aarch64__
+__i386__
+__x86_64__
+__LP64__
+1234
+4
+4
+unsigned int
+ * check-output-end
+ */
diff --git a/validation/arch/arm64.c b/validation/arch/arm64.c
new file mode 100644
index 000000000..12f839cc6
--- /dev/null
+++ b/validation/arch/arm64.c
@@ -0,0 +1,23 @@
+__aarch64__
+__x86_64__
+__LP64__
+__BYTE_ORDER__
+__SIZEOF_INT__
+__SIZEOF_LONG__
+__SIZE_TYPE__
+
+/*
+ * check-name: arch/arm64
+ * check-command: sparse --arch=arm64 -E $file
+ *
+ * check-output-start
+
+1
+__x86_64__
+1
+1234
+4
+8
+unsigned long
+ * check-output-end
+ */
diff --git a/validation/arch/mips32.c b/validation/arch/mips32.c
new file mode 100644
index 000000000..339218b61
--- /dev/null
+++ b/validation/arch/mips32.c
@@ -0,0 +1,29 @@
+__mips__
+__mips
+__mips64__
+__i386__
+__x86_64__
+__LP64__
+__BYTE_ORDER__
+__SIZEOF_INT__
+__SIZEOF_LONG__
+__SIZE_TYPE__
+
+/*
+ * check-name: arch/mips32
+ * check-command: sparse --arch=mips32 -E $file
+ *
+ * check-output-start
+
+1
+32
+__mips64__
+__i386__
+__x86_64__
+__LP64__
+4321
+4
+4
+unsigned int
+ * check-output-end
+ */
diff --git a/validation/arch/riscv64.c b/validation/arch/riscv64.c
new file mode 100644
index 000000000..9da7a7de3
--- /dev/null
+++ b/validation/arch/riscv64.c
@@ -0,0 +1,27 @@
+__riscv
+__riscv_xlen
+__i386__
+__x86_64__
+__LP64__
+__BYTE_ORDER__
+__SIZEOF_INT__
+__SIZEOF_LONG__
+__SIZE_TYPE__
+
+/*
+ * check-name: arch/riscv64
+ * check-command: sparse --arch=riscv64 -E $file
+ *
+ * check-output-start
+
+1
+64
+__i386__
+__x86_64__
+1
+1234
+4
+8
+unsigned long
+ * check-output-end
+ */
-- 
2.23.0


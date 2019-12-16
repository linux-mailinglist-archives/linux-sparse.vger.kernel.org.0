Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 957AD121E65
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:39:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfLPWiI (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:08 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35279 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbfLPWiI (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:08 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so1014875wmb.0
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TRFfdhd/iVLOat/clesSFfDCPPisx7ahOFMLZoGQXgU=;
        b=CVmX0qsFeULReFeneoou1UNhX6jXmxsWBeyLsHsLaM88oRhYXUSMWv2ppCFZxm/6Em
         FvGdt3NIn0A7CMnlN5muB0a12e2d+P/gjfhJK+OdnVJ91BXIGTYLXjRiKTxaTRLgyFZJ
         tQdibYiB0a+qLYynKEl/ymjdjF5Y9DdyP2UGtf+2WGRuA7KsgiOB9BOROxnzqW3s5uu9
         Ttm6exuDn+J5ybr6E7gfOwTBzfor3ngTyinxDkYmeR6lUdGSMKmGUuAIUaozYYOATLWE
         AoMYaSVNRQlgCyjC+bGnevBgXo86hKv+jib2PeAYFX7nw9CPH8zcubLzVJmBour0C9v9
         Yy2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TRFfdhd/iVLOat/clesSFfDCPPisx7ahOFMLZoGQXgU=;
        b=tDcYf1zHTkZWvFlmLughpeC3IITlh5SH1FS3X7q+7YpNTH0l2A9VOUnlI1ywnMf6Uf
         IhH2TPEb6agD2hj+lLW/5033gZ8/qmPJl1CLm9iHtKZa0mO2Z/O5N14K/qGvEIo+PcoO
         273NA/HNMUMATgOyAnUOcnmtFcz28+GiUNnE67siEc9pQZupc0A6ikDlDQlU7IXGcmFx
         HfztVg151oGRhRSrKvZhw3UhCIoipcZEORIjvG1+G7C01FzVxE28XDKd0ss10rxcWORB
         yp9/7yIYiu75+JxZkHz7D4OuwucPC+b2StX8YXxg3DN3K74PBximPHvKaO8RcNGiB4j6
         nBHQ==
X-Gm-Message-State: APjAAAV7YeuwQMX6kacr8f6yMmPnxINA8amx013UVj8y6Ot2xt9vkLpV
        denoNYyKN3qC9NBrtn5IlBbxED2+
X-Google-Smtp-Source: APXvYqxYioQcv3ainVWzXsqaHhfZGPYgvkylxfNr8XJBzjkax8PChtyUiFtn0fUqEyPyPNhjpS3EhQ==
X-Received: by 2002:a1c:14e:: with SMTP id 75mr1424288wmb.123.1576535883201;
        Mon, 16 Dec 2019 14:38:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:02 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 03/10] arch: move arch-specificities to their own files
Date:   Mon, 16 Dec 2019 23:37:49 +0100
Message-Id: <20191216223756.2428-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
References: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

lib.c and even more so, target.c, become cluttered by the
arch specific type initialization.
It would be better to move this to arch-specific files,
move the generics target related helpers to target.c
and have sparse_initialize() to just call these helpers.

For doing this:
* introduce a struct to hold the configurations for each arch,
* move the arch-specific type initialization to separate files,
* make target.c generic.

Also change the default types to LP64.

Note: this is the first step to better handle other arch
      specificities like the predefines or the handling
      of some options.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile         |  10 +++
 lib.c            |  58 +++++++------
 machine.h        |   2 +-
 symbol.h         |   1 -
 target-arm.c     |  16 ++++
 target-arm64.c   |  14 ++++
 target-default.c |  11 +++
 target-m68k.c    |  16 ++++
 target-mips.c    |  25 ++++++
 target-ppc.c     |  25 ++++++
 target-riscv.c   |  22 +++++
 target-s390.c    |  28 +++++++
 target-sparc.c   |  37 +++++++++
 target-x86.c     |  52 ++++++++++++
 target.c         | 207 +++++++++++++++++------------------------------
 target.h         |  44 ++++++++++
 16 files changed, 401 insertions(+), 167 deletions(-)
 create mode 100644 target-arm.c
 create mode 100644 target-arm64.c
 create mode 100644 target-default.c
 create mode 100644 target-m68k.c
 create mode 100644 target-mips.c
 create mode 100644 target-ppc.c
 create mode 100644 target-riscv.c
 create mode 100644 target-s390.c
 create mode 100644 target-sparc.c
 create mode 100644 target-x86.c

diff --git a/Makefile b/Makefile
index deab4897688e..e2d3a7de5498 100644
--- a/Makefile
+++ b/Makefile
@@ -65,6 +65,16 @@ LIB_OBJS += stats.o
 LIB_OBJS += storage.o
 LIB_OBJS += symbol.o
 LIB_OBJS += target.o
+LIB_OBJS += target-arm.o
+LIB_OBJS += target-arm64.o
+LIB_OBJS += target-default.o
+LIB_OBJS += target-m68k.o
+LIB_OBJS += target-mips.o
+LIB_OBJS += target-ppc.o
+LIB_OBJS += target-riscv.o
+LIB_OBJS += target-s390.o
+LIB_OBJS += target-sparc.o
+LIB_OBJS += target-x86.o
 LIB_OBJS += tokenize.o
 LIB_OBJS += unssa.o
 LIB_OBJS += utils.o
diff --git a/lib.c b/lib.c
index 711e8fbeff09..d759648a504a 100644
--- a/lib.c
+++ b/lib.c
@@ -314,7 +314,7 @@ unsigned long fpasses = ~0UL;
 int fpic = 0;
 int fpie = 0;
 int fshort_wchar = 0;
-int funsigned_char = -1;
+int funsigned_char = 0;
 
 int preprocess_only;
 
@@ -728,6 +728,8 @@ static void handle_arch_finalize(void)
 
 	if (fpie > fpic)
 		fpic = fpie;
+	if (fshort_wchar)
+		wchar_ctype = &ushort_ctype;
 
 	switch (arch_mach) {
 	case MACH_ARM64:
@@ -1137,24 +1139,23 @@ static char **handle_arch(char *arg, char **next)
 {
 	static const struct arch {
 		const char *name;
-		char mach;
+		enum machine mach;
 		char bits;
-		bool big_endian:1;
 	} archs[] = {
-		{ "aarch64",	MACH_ARM64,	64, 0 },
-		{ "arm64",	MACH_ARM64,	64, 0 },
-		{ "arm",	MACH_ARM,	32, 0 },
-		{ "i386",	MACH_I386,	32, 0 },
-		{ "m68k",	MACH_M68K,	32, 0 },
-		{ "mips",	MACH_MIPS32,	0,  1 },
-		{ "powerpc",	MACH_PPC32,	0,  1 },
-		{ "ppc",	MACH_PPC32,	0,  1 },
-		{ "riscv",	MACH_RISCV32,	0,  0 },
-		{ "s390x",	MACH_S390X,	64, 1 },
-		{ "s390",	MACH_S390,	32, 1 },
-		{ "sparc",	MACH_SPARC32,	0,  1 },
-		{ "x86_64",	MACH_X86_64,	64, 0 },
-		{ "x86-64",	MACH_X86_64,	64, 0 },
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
 		{ NULL },
 	};
 	const struct arch *p;
@@ -1165,18 +1166,15 @@ static char **handle_arch(char *arg, char **next)
 	for (p = &archs[0]; p->name; p++) {
 		size_t len = strlen(p->name);
 		if (strncmp(p->name, arg, len) == 0) {
+			enum machine mach = p->mach;
 			const char *suf = arg + len;
 			int bits = p->bits;
 
-			arch_mach = p->mach;
 			if (bits == 0) {
-				if (!strcmp(suf, "")) {
-					bits = 32;
-				} else if (!strcmp(suf, "32")) {
-					bits = 32;
+				if (!strcmp(suf, "") || !strcmp(suf, "32")) {
+					;
 				} else if (!strcmp(suf, "64")) {
-					bits = 64;
-					arch_mach += 1;
+					mach += 1;
 				} else {
 					die("invalid architecture: %s", arg);
 				}
@@ -1185,12 +1183,7 @@ static char **handle_arch(char *arg, char **next)
 					die("invalid architecture: %s", arg);
 			}
 
-			// adjust the arch size (but keep x32 & llp64)
-			if (bits == 32)
-				arch_m64 = ARCH_LP32;
-			else if (bits == 64 && arch_m64 == ARCH_LP32)
-				arch_m64 = ARCH_LP64;
-			arch_big_endian = p->big_endian;
+			target_config(mach);
 			break;
 		}
 	}
@@ -1748,6 +1741,9 @@ struct symbol_list *sparse_initialize(int argc, char **argv, struct string_list
 	// Initialize symbol stream first, so that we can add defines etc
 	init_symbols();
 
+	// initialize the default target to the native 'machine'
+	target_config(MACH_NATIVE);
+
 	args = argv;
 	for (;;) {
 		char *arg = *++args;
@@ -1777,7 +1773,7 @@ struct symbol_list *sparse_initialize(int argc, char **argv, struct string_list
 	list = NULL;
 	if (filelist) {
 		// Initialize type system
-		init_target();
+		target_init();
 		handle_arch_finalize();
 		init_ctype();
 
diff --git a/machine.h b/machine.h
index 6eba448cb81c..1fe933ce7c25 100644
--- a/machine.h
+++ b/machine.h
@@ -8,7 +8,7 @@
 #endif
 
 
-enum {
+enum bitness {
 	ARCH_LP32,
 	ARCH_X32,
 	ARCH_LP64,
diff --git a/symbol.h b/symbol.h
index e60d913651fc..9ef5a886172f 100644
--- a/symbol.h
+++ b/symbol.h
@@ -310,7 +310,6 @@ extern void init_symbols(void);
 extern void init_builtins(int stream);
 extern void declare_builtins(void);
 extern void init_ctype(void);
-extern void init_target(void);
 extern struct symbol *alloc_symbol(struct position, int type);
 extern void show_type(struct symbol *);
 extern const char *modifier_string(unsigned long mod);
diff --git a/target-arm.c b/target-arm.c
new file mode 100644
index 000000000000..f5af04ee1fbb
--- /dev/null
+++ b/target-arm.c
@@ -0,0 +1,16 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+const struct target target_arm = {
+	.mach = MACH_ARM,
+	.bitness = ARCH_LP32,
+	.big_endian = 0,
+	.unsigned_char = 1,
+
+	.wchar = &uint_ctype,
+
+	.bits_in_longdouble = 64,
+	.max_fp_alignment = 8,
+};
diff --git a/target-arm64.c b/target-arm64.c
new file mode 100644
index 000000000000..bfada515b81f
--- /dev/null
+++ b/target-arm64.c
@@ -0,0 +1,14 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+const struct target target_arm64 = {
+	.mach = MACH_ARM64,
+	.bitness = ARCH_LP64,
+
+	.big_endian = 0,
+	.unsigned_char = 1,
+
+	.wchar = &uint_ctype,
+};
diff --git a/target-default.c b/target-default.c
new file mode 100644
index 000000000000..3a9e1726ffc5
--- /dev/null
+++ b/target-default.c
@@ -0,0 +1,11 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+const struct target target_default = {
+	.mach = MACH_UNKNOWN,
+	.bitness = ARCH_LP64,
+	.big_endian = 0,
+	.unsigned_char = 0,
+};
diff --git a/target-m68k.c b/target-m68k.c
new file mode 100644
index 000000000000..1646fceb62aa
--- /dev/null
+++ b/target-m68k.c
@@ -0,0 +1,16 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+const struct target target_m68k = {
+	.mach = MACH_M68K,
+	.bitness = ARCH_LP32,
+	.big_endian = 1,
+	.unsigned_char = 0,
+
+	.wchar = &long_ctype,
+
+	.bits_in_longdouble = 96,
+	.max_fp_alignment = 4,
+};
diff --git a/target-mips.c b/target-mips.c
new file mode 100644
index 000000000000..7e2b44466f3e
--- /dev/null
+++ b/target-mips.c
@@ -0,0 +1,25 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+const struct target target_mips32 = {
+	.mach = MACH_MIPS32,
+	.bitness = ARCH_LP32,
+	.big_endian = 1,
+	.unsigned_char = 0,
+
+	.bits_in_longdouble = 64,
+	.max_fp_alignment = 8,
+
+	.target_64bit = &target_mips64,
+};
+
+const struct target target_mips64 = {
+	.mach = MACH_MIPS64,
+	.bitness = ARCH_LP64,
+	.big_endian = 1,
+	.unsigned_char = 0,
+
+	.target_32bit = &target_mips32,
+};
diff --git a/target-ppc.c b/target-ppc.c
new file mode 100644
index 000000000000..e867d9fec299
--- /dev/null
+++ b/target-ppc.c
@@ -0,0 +1,25 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+const struct target target_ppc32 = {
+	.mach = MACH_PPC32,
+	.bitness = ARCH_LP32,
+	.big_endian = 1,
+	.unsigned_char = 1,
+
+	.wchar = &long_ctype,
+
+	.target_64bit = &target_ppc64,
+};
+
+
+const struct target target_ppc64 = {
+	.mach = MACH_PPC64,
+	.bitness = ARCH_LP64,
+	.big_endian = 1,
+	.unsigned_char = 1,
+
+	.target_32bit = &target_ppc32,
+};
diff --git a/target-riscv.c b/target-riscv.c
new file mode 100644
index 000000000000..cbec76237d48
--- /dev/null
+++ b/target-riscv.c
@@ -0,0 +1,22 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+const struct target target_riscv32 = {
+	.mach = MACH_RISCV32,
+	.bitness = ARCH_LP32,
+	.big_endian = 0,
+	.unsigned_char = 1,
+
+	.target_64bit = &target_riscv64,
+};
+
+const struct target target_riscv64 = {
+	.mach = MACH_RISCV64,
+	.bitness = ARCH_LP64,
+	.big_endian = 0,
+	.unsigned_char = 1,
+
+	.target_32bit = &target_riscv32,
+};
diff --git a/target-s390.c b/target-s390.c
new file mode 100644
index 000000000000..157779ce506b
--- /dev/null
+++ b/target-s390.c
@@ -0,0 +1,28 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+const struct target target_s390 = {
+	.mach = MACH_S390,
+	.bitness = ARCH_LP32,
+	.big_endian = 1,
+	.unsigned_char = 1,
+
+	.bits_in_longdouble = 64,
+	.max_fp_alignment = 8,
+
+	.target_64bit = &target_s390x,
+};
+
+const struct target target_s390x = {
+	.mach = MACH_S390X,
+	.bitness = ARCH_LP64,
+	.big_endian = 1,
+	.unsigned_char = 1,
+
+	.bits_in_longdouble = 64,
+	.max_fp_alignment = 8,
+
+	.target_32bit = &target_s390,
+};
diff --git a/target-sparc.c b/target-sparc.c
new file mode 100644
index 000000000000..ca9589f5b65c
--- /dev/null
+++ b/target-sparc.c
@@ -0,0 +1,37 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+static void init_sparc32(const struct target *target)
+{
+	if (arch_os == OS_SUNOS) {
+		wint_ctype = &long_ctype;
+		wchar_ctype = &long_ctype;
+
+		bits_in_longdouble = 128;
+		max_fp_alignment = 16;
+	}
+}
+
+const struct target target_sparc32 = {
+	.mach = MACH_SPARC32,
+	.bitness = ARCH_LP32,
+	.big_endian = 1,
+	.unsigned_char = 0,
+
+	.bits_in_longdouble = 64,
+	.max_fp_alignment = 8,
+
+	.init = init_sparc32,
+	.target_64bit = &target_sparc64,
+};
+
+const struct target target_sparc64 = {
+	.mach = MACH_SPARC64,
+	.bitness = ARCH_LP64,
+	.big_endian = 1,
+	.unsigned_char = 0,
+
+	.target_32bit = &target_sparc32,
+};
diff --git a/target-x86.c b/target-x86.c
new file mode 100644
index 000000000000..eaca5e8bc507
--- /dev/null
+++ b/target-x86.c
@@ -0,0 +1,52 @@
+#include "symbol.h"
+#include "target.h"
+#include "machine.h"
+
+
+static void init_x86(const struct target *target)
+{
+	switch (arch_os) {
+	case OS_CYGWIN:
+		wchar_ctype = &ushort_ctype;
+		break;
+	case OS_DARWIN:
+		int64_ctype = &llong_ctype;
+		uint64_ctype = &ullong_ctype;
+		wint_ctype = &int_ctype;
+		break;
+	case OS_FREEBSD:
+		wint_ctype = &int_ctype;
+		break;
+	case OS_OPENBSD:
+		wchar_ctype = &int_ctype;
+		wint_ctype = &int_ctype;
+		break;
+	}
+}
+
+const struct target target_i386 = {
+	.mach = MACH_I386,
+	.bitness = ARCH_LP32,
+	.big_endian = 0,
+	.unsigned_char = 0,
+
+	.wchar = &long_ctype,
+	.bits_in_longdouble = 96,
+	.max_fp_alignment = 4,
+
+	.init = init_x86,
+	.target_64bit = &target_x86_64,
+};
+
+const struct target target_x86_64 = {
+	.mach = MACH_X86_64,
+	.bitness = ARCH_LP64,
+	.big_endian = 0,
+	.unsigned_char = 0,
+
+	.bits_in_longdouble = 128,
+	.max_fp_alignment = 16,
+
+	.init = init_x86,
+	.target_32bit = &target_i386,
+};
diff --git a/target.c b/target.c
index 76cbb954ab4b..f23ed30881bd 100644
--- a/target.c
+++ b/target.c
@@ -4,10 +4,10 @@
 #include "target.h"
 #include "machine.h"
 
-struct symbol *size_t_ctype = &uint_ctype;
-struct symbol *ssize_t_ctype = &int_ctype;
-struct symbol *intmax_ctype = &llong_ctype;
-struct symbol *uintmax_ctype = &ullong_ctype;
+struct symbol *size_t_ctype = &ulong_ctype;
+struct symbol *ssize_t_ctype = &long_ctype;
+struct symbol *intmax_ctype = &long_ctype;
+struct symbol *uintmax_ctype = &ulong_ctype;
 struct symbol *int64_ctype = &long_ctype;
 struct symbol *uint64_ctype = &ulong_ctype;
 struct symbol *int32_ctype = &int_ctype;
@@ -27,11 +27,11 @@ int bits_in_bool = 1;
 int bits_in_char = 8;
 int bits_in_short = 16;
 int bits_in_int = 32;
-int bits_in_long = 32;
+int bits_in_long = 64;
 int bits_in_longlong = 64;
 int bits_in_longlonglong = 128;
 
-int max_int_alignment = 4;
+int max_int_alignment = 8;
 
 /*
  * Floating point data types
@@ -45,8 +45,8 @@ int max_fp_alignment = 16;
 /*
  * Pointer data type
  */
-int bits_in_pointer = 32;
-int pointer_alignment = 4;
+int bits_in_pointer = 64;
+int pointer_alignment = 8;
 
 /*
  * Enum data types
@@ -55,149 +55,88 @@ int bits_in_enum = 32;
 int enum_alignment = 4;
 
 
-void init_target(void)
+static const struct target *targets[] = {
+	[MACH_ARM] =		&target_arm,
+	[MACH_ARM64] =		&target_arm64,
+	[MACH_I386] =		&target_i386,
+	[MACH_X86_64] =		&target_x86_64,
+	[MACH_MIPS32] =		&target_mips32,
+	[MACH_MIPS64] =		&target_mips64,
+	[MACH_PPC32] =		&target_ppc32,
+	[MACH_PPC64] =		&target_ppc64,
+	[MACH_RISCV32] =	&target_riscv32,
+	[MACH_RISCV64] =	&target_riscv64,
+	[MACH_S390] =		&target_s390,
+	[MACH_S390X] =		&target_s390x,
+	[MACH_SPARC32] =	&target_sparc32,
+	[MACH_SPARC64] =	&target_sparc64,
+	[MACH_M68K] =		&target_m68k,
+	[MACH_UNKNOWN] =	&target_default,
+};
+const struct target *arch_target = &target_default;
+
+
+void target_config(enum machine mach)
 {
-	switch (arch_mach) {
-	case MACH_I386:
-	case MACH_MIPS32:
-	case MACH_PPC32:
-	case MACH_RISCV32:
-	case MACH_SPARC32:
-	case MACH_S390:
-		if (arch_m64 == ARCH_LP64)
-			arch_mach++;
-		break;
-	case MACH_X86_64:
-	case MACH_MIPS64:
-	case MACH_PPC64:
-	case MACH_RISCV64:
-	case MACH_SPARC64:
-	case MACH_S390X:
-		if (arch_m64 == ARCH_LP32)
-			arch_mach--;
-		break;
-	}
+	const struct target *target = targets[mach];
 
-	switch (arch_mach) {
-	case MACH_I386:
-		wchar_ctype = &long_ctype;
-		/* fall through */
-	case MACH_X86_64:
-		switch (arch_os) {
-		case OS_CYGWIN:
-			wchar_ctype = &ushort_ctype;
-			break;
-		case OS_DARWIN:
-			int64_ctype = &llong_ctype;
-			uint64_ctype = &ullong_ctype;
-			wint_ctype = &int_ctype;
-			break;
-		case OS_FREEBSD:
-			wint_ctype = &int_ctype;
-			break;
-		case OS_OPENBSD:
-			wchar_ctype = &int_ctype;
-			wint_ctype = &int_ctype;
-			break;
-		}
-		break;
-	case MACH_M68K:
-	case MACH_PPC32:
-		wchar_ctype = &long_ctype;
-		break;
-	case MACH_ARM:
-	case MACH_ARM64:
-		wchar_ctype = &uint_ctype;
-		break;
-	case MACH_SPARC32:
-		if (arch_os == OS_SUNOS) {
-			wint_ctype = &long_ctype;
-			wchar_ctype = &long_ctype;
-		}
-		break;
-	default:
-		break;
-	}
-	if (fshort_wchar)
-		wchar_ctype = &ushort_ctype;
-
-	switch (arch_mach) {
-	case MACH_SPARC32:
-		if (arch_os == OS_SUNOS)
-			break;
-		/* fall through */
-	case MACH_ARM:
-	case MACH_MIPS64:
-		// FIXME: ABI n32 & (n)64 have 128-bit ldouble
-	case MACH_MIPS32:
-	case MACH_S390:
-	case MACH_S390X:
-		bits_in_longdouble = 64;
-		max_fp_alignment = 8;
-		break;
-	case MACH_X86_64:
-		if (arch_m64 == ARCH_LP64 || arch_m64 == ARCH_X32)
-			break;
-		/* fall through */
-	case MACH_I386:
-	case MACH_M68K:
-		bits_in_longdouble = 96;
-		max_fp_alignment = 4;
-		break;
-	default:
-		break;
-	}
+	arch_target = target;
+	arch_mach = target->mach;
+	arch_m64 = target->bitness;
+	arch_big_endian = target->big_endian;
+
+	funsigned_char = target->unsigned_char;
+}
 
-	switch (arch_mach) {
-	case MACH_ARM:
-	case MACH_ARM64:
-	case MACH_PPC32:
-	case MACH_PPC64:
-	case MACH_RISCV32:
-	case MACH_RISCV64:
-	case MACH_S390:
-	case MACH_S390X:
-		if (funsigned_char == -1)
-			funsigned_char = 1;
-		break;
-	default:
-		if (funsigned_char == -1)
-			funsigned_char = 0;
-		break;
-	}
+
+void target_init(void)
+{
+	const struct target *target = arch_target;
 
 	switch (arch_m64) {
-	case ARCH_X32:
-		max_int_alignment = 8;
-		int64_ctype = &llong_ctype;
-		uint64_ctype = &ullong_ctype;
-		break;
 	case ARCH_LP32:
-		/* default values */
+		max_int_alignment = 4;
+		/* fallthrough */
+	case ARCH_X32:
+		bits_in_long = 32;
+		bits_in_pointer = 32;
+		pointer_alignment = 4;
+		size_t_ctype = &uint_ctype;
+		ssize_t_ctype = &int_ctype;
 		int64_ctype = &llong_ctype;
 		uint64_ctype = &ullong_ctype;
 		intmax_ctype = &llong_ctype;
 		uintmax_ctype = &ullong_ctype;
+		if (target->target_32bit)
+			target = target->target_32bit;
 		break;
-	case ARCH_LP64:
-		bits_in_long = 64;
-		max_int_alignment = 8;
-		size_t_ctype = &ulong_ctype;
-		ssize_t_ctype = &long_ctype;
-		intmax_ctype = &long_ctype;
-		uintmax_ctype = &ulong_ctype;
-		goto case_64bit_common;
+
 	case ARCH_LLP64:
 		bits_in_long = 32;
-		max_int_alignment = 8;
 		size_t_ctype = &ullong_ctype;
 		ssize_t_ctype = &llong_ctype;
 		int64_ctype = &llong_ctype;
 		uint64_ctype = &ullong_ctype;
-		goto case_64bit_common;
-	case_64bit_common:
-		bits_in_pointer = 64;
-		pointer_alignment = 8;
+		intmax_ctype = &llong_ctype;
+		uintmax_ctype = &ullong_ctype;
+		/* fallthrough */
+	case ARCH_LP64:
+		if (target->target_64bit)
+			target = target->target_64bit;
 		break;
 	}
+	arch_target = target;
+	arch_mach = target->mach;
+
+	if (target->wchar)
+		wchar_ctype = target->wchar;
+	if (target->wint)
+		wint_ctype = target->wint;
+	if (target->bits_in_longdouble)
+		bits_in_longdouble = target->bits_in_longdouble;
+	if (target->max_fp_alignment)
+		max_fp_alignment = target->max_fp_alignment;
+
+	if (target->init)
+		target->init(target);
 }
diff --git a/target.h b/target.h
index 8bbe494f89bb..0c45ecf41ea2 100644
--- a/target.h
+++ b/target.h
@@ -1,6 +1,8 @@
 #ifndef TARGET_H
 #define TARGET_H
 
+#include "machine.h"
+
 extern struct symbol *size_t_ctype;
 extern struct symbol *ssize_t_ctype;
 extern struct symbol *intmax_ctype;
@@ -51,6 +53,48 @@ extern int pointer_alignment;
 extern int bits_in_enum;
 extern int enum_alignment;
 
+
+struct target {
+	enum machine	mach;
+	enum bitness	bitness;
+	unsigned int	big_endian:1;
+	unsigned int	unsigned_char:1;
+
+	struct symbol	*wchar;
+	struct symbol	*wint;
+
+	unsigned int	bits_in_longdouble;
+	unsigned int	max_fp_alignment;
+
+	const struct target *target_32bit;
+	const struct target *target_64bit;
+
+	void (*init)(const struct target *self);
+};
+
+extern const struct target target_default;
+extern const struct target target_arm;
+extern const struct target target_arm64;
+extern const struct target target_m68k;
+extern const struct target target_mips32;
+extern const struct target target_mips64;
+extern const struct target target_ppc32;
+extern const struct target target_ppc64;
+extern const struct target target_riscv32;
+extern const struct target target_riscv64;
+extern const struct target target_s390;
+extern const struct target target_s390x;
+extern const struct target target_sparc32;
+extern const struct target target_sparc64;
+extern const struct target target_i386;
+extern const struct target target_x86_64;
+
+/* target.c */
+extern const struct target *arch_target;
+
+void target_config(enum machine mach);
+void target_init(void);
+
 /*
  * Helper functions for converting bits to bytes and vice versa.
  */
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E1E7B98
	for <lists+linux-sparse@lfdr.de>; Mon, 28 Oct 2019 22:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731784AbfJ1Vno (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 28 Oct 2019 17:43:44 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35996 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730592AbfJ1Vno (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 28 Oct 2019 17:43:44 -0400
Received: by mail-wr1-f66.google.com with SMTP id w18so11488921wrt.3
        for <linux-sparse@vger.kernel.org>; Mon, 28 Oct 2019 14:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w6Zmg62tipbBqh5ywzjnOTCd+xXYTEIixapvTCJKO/U=;
        b=pNy/r+amSoeF2RmOtvL3cjLAr+JFlbW0cxqY1GOaq5Tu63ujbzn/rMXJ0c5DeHZFAi
         8DnvZsGBuUJEDD8Lms9hKS75fZqxc9VvMYiO1uGBPXlGQIelI9En/HnX5NIGXXq35CFs
         mKu+QDT+qgSaH7AfNLRV2EmD17II3eq57TbyZWFyAiJAesYgf4uumUR0eUd56eC45T1N
         XXe6X+iNtsVOI/IIz45DubObTMemk+4M1AS5bEmdcyG9wzm4l4i+FxNVuC75DHn3teBB
         GV8j0Tb3Az6F78u9g/ET+e+Yr123XUdX99ydGmHcPhEzfQLSOEBYmMrhJ4VnmDp4y2Io
         qwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w6Zmg62tipbBqh5ywzjnOTCd+xXYTEIixapvTCJKO/U=;
        b=Lce+TnreUt+J4j447D+ivTmpODd4sZ9/SEV8uYJAR9lID41fcsvNlLoNrbOssBX0K2
         qaSU/gk2QuWriytOQTdD05Ez11yxdtVLe4bmIdnhSurIJwotkiqi8suVeTFmAS2W63Rv
         WCRx9oB1z0ZRuN+/1HTSRhfBZqijtkmu8pa4wI6L9Jo30Zq7fch/eYq2KUPUPmlplaPD
         M3mcEfe93IsY3Wixk8ZOs661jfxsFS1aS8BjuCWbQmvJY9CvyCHtByzZFKbqMTCmdA29
         tx+0xzo0AiYySpgS9ausdh4usSKoKCH0jtcW3q0CKrgCrgjxKiTBnLa+utl49g96bEZx
         MMyA==
X-Gm-Message-State: APjAAAW+18BzFhyo3XjRfkvmBC9TgaukHZv7I/f0/srVU8weD9ZvQ272
        f9JgkyAGVPyh3xQshUsTobMXWppV
X-Google-Smtp-Source: APXvYqyYxKP2RRNpqDvx2UToYrdzWx9+Nl0c+PTtsmOtnio5jlaq5oqjMdRMYuMQQ72Bo9q8iITIdw==
X-Received: by 2002:adf:f2d1:: with SMTP id d17mr16154889wrp.353.1572299021793;
        Mon, 28 Oct 2019 14:43:41 -0700 (PDT)
Received: from localhost.localdomain (104.89-136-217.adsl-dyn.isp.belgacom.be. [217.136.89.104])
        by smtp.gmail.com with ESMTPSA id r3sm1006316wmh.9.2019.10.28.14.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 14:43:41 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] options: allow to specify the desired arch with --arch=<arch>
Date:   Mon, 28 Oct 2019 22:43:37 +0100
Message-Id: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
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
index 75a4f9870..353d19100 100644
--- a/lib.c
+++ b/lib.c
@@ -1044,6 +1044,73 @@ static char **handle_switch_x(char *arg, char **next)
 }
 
 
+static char **handle_arch(char *arg, char **next)
+{
+	static const struct arch {
+		const char *name;
+		int mach;
+		int bits;
+	} archs[] = {
+		{ "aarch64",	MACH_ARM64,	64 },
+		{ "arm64",	MACH_ARM64,	64 },
+		{ "arm",	MACH_ARM,	32 },
+		{ "i386",	MACH_I386,	32 },
+		{ "m68k",	MACH_M68K,	32 },
+		{ "mips",	MACH_MIPS64 },
+		{ "powerpc",	MACH_PPC64 },
+		{ "ppc",	MACH_PPC64 },
+		{ "riscv",	MACH_RISCV64 },
+		{ "s390",	MACH_S390X,	64 },
+		{ "s390x",	MACH_S390X,	64 },
+		{ "sparc",	MACH_MIPS64 },
+		{ "x86_64",	MACH_X86_64,	64 },
+		{ "x86-64",	MACH_X86_64,	64 },
+		{ "x86",	MACH_X86_64 },
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
+				// guess the size of the architecture
+				if (!strcmp(suf, "")) {
+					if (arch_m64 == ARCH_LP32)
+						bits = 32;
+					else
+						bits = 64;
+				} else if (!strcmp(suf, "64")) {
+					bits = 64;
+				} else if (!strcmp(suf, "32")) {
+					bits = 32;
+				} else {
+					die("invalid architecture: %s", arg);
+				}
+				if (bits == 32)
+					arch_mach -= 1;
+			} else {
+				if (strcmp(suf, ""))
+					die("invalid architecture: %s", arg);
+			}
+			if (p->bits == 32)
+				arch_m64 = ARCH_LP32;
+			else if (p->bits == 64)
+				arch_m64 = ARCH_LP64;
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
@@ -1076,6 +1143,7 @@ struct switches {
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


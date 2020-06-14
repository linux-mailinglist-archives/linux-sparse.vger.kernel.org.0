Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA4F1F8A66
	for <lists+linux-sparse@lfdr.de>; Sun, 14 Jun 2020 21:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgFNTgm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 15:36:42 -0400
Received: from avasout06.plus.net ([212.159.14.18]:44385 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgFNTgl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 15:36:41 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id kYQqjIYrZkvt5kYQrjX0Zl; Sun, 14 Jun 2020 20:36:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1592163401; bh=Adtp6+dKqTXEXa+D9JEq4kwerfZ48IeUIeVuEWcvAT4=;
        h=To:Cc:From:Subject:Date;
        b=Y6uGbVd1EGBRuUVhqdPHxaNW8Nz9EC8HS05TbvtxFdgJJdXTBmL2A9Fl0T8ye9UIA
         RLfmdFr0wIUta3gBZYZvHdxdrcsnHCJ6RYrmsXPMy+J0WCF5Mb5piS2DM2CwTjp5Sk
         SCo9XWiSL33PMDrYVdMO2KrB2hPzxcRIzkFbrR3ZzoUhc9aVpywWhu/rRPv+fBLHP/
         xZYMubgd81WCs56CqIB4MNAJKnk5LxXbllJtYzGbD2s8/DBMUxPEnceF1M+x1hqeDM
         P5NWhkKyMPe1P8BeokwRelpe6AySGrs90+ufTP7tUaSB5Cu5Tntla8yVC/9buU9pS1
         VUNY1inAu2GpQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ENCdL2RC c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=0kyHOpBKpueKQVkzCoUA:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] doc: correct some spelling
Message-ID: <a03299d8-fd2f-8f04-2bd0-e94091247bdb@ramsayjones.plus.com>
Date:   Sun, 14 Jun 2020 20:36:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA+Gn/9W/to+gzUDhRcUAgeF1NCCYjWVYfh3D+vMjNoHxpcsY73Io9fW5rA1gOU0viz0rg8WT47j5w2EXe1wPpCN7hr2/z+wbI6pfsoE/wYhJR4EubuY
 sr4dnLeVdApcwQsob28Wy8GbJskdDsR74Jaim2hRO7jxkDZ8mQHx5vv1CdVKojaayaT1+KtdLEKDUw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
---

Hi Luc,

The only spelling fixes in the manpage are s/exemple/example/,
s/trigered/triggered/ and s/&/and/. I would not normally change
any 'formatting' in sparse.1, but the '{ 0 }' and '{ }' got
split across line-endings, so I removed the spaces.
(other solutions are possible ...)

ATB,
Ramsay Jones

 Documentation/release-notes/v0.6.2.rst |  8 ++++----
 sparse.1                               | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/release-notes/v0.6.2.rst b/Documentation/release-notes/v0.6.2.rst
index 0ef67fc5..7439724c 100644
--- a/Documentation/release-notes/v0.6.2.rst
+++ b/Documentation/release-notes/v0.6.2.rst
@@ -10,7 +10,7 @@ V0.6.2
 * add support for _Generic
 
 * fully propagate declarations downward
-  For exemple, it means that code like:
+  For example, it means that code like:
 
         static int foo(void);
         int foo(void) { return 0; }
@@ -21,7 +21,7 @@ V0.6.2
   * allow a single sparse executable to be used for multiple architectures
   * add support for -mcmodel & -f{pic,PIC,pie,PIE}, mainly for RISC-V
   * add new option, --arch=$ARCH, to specify the target architecture
-  * move all arch-specifc code in separated files (target-$ARCH.c) 
+  * move all arch-specific code into separate files (target-$ARCH.c)
   * try to support the various floating-point ABIs on ARM
   * fix wchar_t & wint_t for openbsd
   * add missing predefines for PPC
@@ -72,7 +72,7 @@ V0.6.2
   * define _BIG_ENDIAN when needed
   * remove definition of _STRING_ARCH_unaligned (defined by glibc)
   * removed unneeded predefines for integers (now defined by sparse)
-  * better mult-arch support by using --arch=$ARCH
+  * better multi-arch support by using --arch=$ARCH
 
 * testsuite:
   * avoid standard includes in the tests
@@ -90,7 +90,7 @@ V0.6.2
 
 * misc:
   * add support for '-std=c17/c18'
-  * simplify testng of which version of the standard is used
+  * simplify testing of which version of the standard is used
   * various improvements to the 'dissect' tool
   * simplify the parsing of type specifiers
   * improve diagnostic messages concerning bitfields
diff --git a/sparse.1 b/sparse.1
index bbcffc41..e8994a66 100644
--- a/sparse.1
+++ b/sparse.1
@@ -437,20 +437,20 @@ Sparse does not issue these warnings by default.
 .
 .TP
 .B \-Wuniversal\-initializer
-Do not suppress warnings caused by using '{ 0 }' instead of '{ }' on
+Do not suppress warnings caused by using '{0}' instead of '{}' on
 aggregate types, ignoring its special status as universal initializer.
-The concerned warnings are, for exemple, those trigered by
+The concerned warnings are, for example, those triggered by
 \fB\-Wdesignated\-init\fR or \fB\-Wnon\-pointer\-null\fR.
 
-Sparse does not issue these warnings by default, processing '{ 0 }'
-the same as '{ }'.
+Sparse does not issue these warnings by default, processing '{0}'
+the same as '{}'.
 .
 .SH MISC OPTIONS
 .TP
 .B \-\-arch=\fIARCH\fR
 Specify the target architecture.
 For architectures having both a 32-bit and a 64-bit variant (mips, powerpc,
-riscv & sparc) the architecture name can be suffixed with \fI32\fR or \fI64\fR.
+riscv and sparc) the architecture name can be suffixed with \fI32\fR or \fI64\fR.
 
 The default architecture & size is the one of the machine used to build Sparse.
 .
-- 
2.27.0

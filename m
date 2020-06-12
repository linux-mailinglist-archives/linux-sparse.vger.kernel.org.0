Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCA621F7ECF
	for <lists+linux-sparse@lfdr.de>; Sat, 13 Jun 2020 00:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgFLWNg (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 12 Jun 2020 18:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLWNg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 12 Jun 2020 18:13:36 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF91CC03E96F
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 15:13:35 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id k11so11548725ejr.9
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 15:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dO55o09nvPXtaj2i6+XzDyaUjor+Z+Mhxfd9h36brjg=;
        b=GRjoyfm3+1FK1ukUsmc1zaWkiTVnzsZu2yw5ts9T46OM4Wnh8SBFuAWZEX2GgtycxO
         7u2IielhTRlUSypyUl6pvoceFSkSN0hm2Y0DJcZSjMXH4Av2O1TcA9N8ke8cac/ZKMuv
         E7HI82t/TbCd9HIx5c3h0KaMrYfk1cZsAHZ0zwzUvmBu5JeZpo0kuF0F7sZaStt0zwIJ
         MSdR7segA4ZB1SSxQcQ6oorYJExBSo8+VklJsWKeyzShZm8JZLCSkM7ZhOHf4rlWnu+o
         LY3OVfFUBfbp++z8msk1MPdYjx4xjylRECw7SZEv0cA2No8LkDDE0xgCKo8rEBiV9UPq
         2DBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dO55o09nvPXtaj2i6+XzDyaUjor+Z+Mhxfd9h36brjg=;
        b=SL0/HqlxlCBgKM+n/ZFIlGq5VlzZNy6LkZXzpnjmk5rrHxYGv8xlTYkLSsQA6Gmmpw
         3qLOdSgQ0Pl+L8BxooDDYVkR2BDdEU8W3FOJnmo+mzFNsnRTZFdL+iiuZLcAEZ6y+NzO
         /ulGT8r2D7inR+fmWYNdddLPViPwHoDVdwbyOezfXpuz27xPweBcmgQh2DfB4xDvCfaa
         ZpYuiLCf5TVjoksTrcOw12W5MNLWPamoYRL9G09lSOl9ljIhJqXmoQIa8EY1HoS6p6rP
         8wXE4xN3tsu7OEudy+GnuVgmOu4nSUT9ojfiGFiz7FufN4NGvJMCQB6gDzP3hSJU3lSK
         ZLTw==
X-Gm-Message-State: AOAM530P8w6BDUIH7ONX/ouqPF8/xzGwUoTX6Xlh+MAjraNcf7BQtcDJ
        cPWHq7BfGHOnU3Q+r1/wnohKSNbo
X-Google-Smtp-Source: ABdhPJwp/xlEBEmvaGuM0gcs1MlXq8q5wBmb/Jbvk9VnV1tjTINxdaJwh38+1aonLMye/cuGvyZO1A==
X-Received: by 2002:a17:906:8253:: with SMTP id f19mr15662431ejx.470.1592000014217;
        Fri, 12 Jun 2020 15:13:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8042:28a0:1c43:de41])
        by smtp.gmail.com with ESMTPSA id i23sm4221143eja.37.2020.06.12.15.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 15:13:33 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: add release notes for incoming v0.6.2
Date:   Sat, 13 Jun 2020 00:13:31 +0200
Message-Id: <20200612221331.12278-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, the release notes are kept on the wiki which
contains nothing else but a small intro.

The docs are certainly as good as this wiki to keep these
release notes. So, let try this for now.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/index.rst                |   7 ++
 Documentation/release-notes/index.rst  |   8 ++
 Documentation/release-notes/v0.6.2.rst | 100 +++++++++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 Documentation/release-notes/index.rst
 create mode 100644 Documentation/release-notes/v0.6.2.rst

diff --git a/Documentation/index.rst b/Documentation/index.rst
index 5dd87e43d264..eb3de63c9ca7 100644
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@ -39,6 +39,13 @@ Documentation
 
    doc-guide
 
+Release Notes
+-------------
+.. toctree::
+   :maxdepth: 1
+
+   release-notes/index
+
 Indices and tables
 ==================
 
diff --git a/Documentation/release-notes/index.rst b/Documentation/release-notes/index.rst
new file mode 100644
index 000000000000..c55ed09a04cd
--- /dev/null
+++ b/Documentation/release-notes/index.rst
@@ -0,0 +1,8 @@
+*************
+Release Notes
+*************
+
+.. toctree::
+   :maxdepth: 1
+
+   v0.6.2
diff --git a/Documentation/release-notes/v0.6.2.rst b/Documentation/release-notes/v0.6.2.rst
new file mode 100644
index 000000000000..0ef67fc5ad6c
--- /dev/null
+++ b/Documentation/release-notes/v0.6.2.rst
@@ -0,0 +1,100 @@
+V0.6.2
+======
+
+* add a new tool: sindex - the semantic utility
+    Sindex is a simple to use cscope-like tool but understanding
+    how symbols are used and which can track struct members.
+
+* add support for GCC's __auto_type
+
+* add support for _Generic
+
+* fully propagate declarations downward
+  For exemple, it means that code like:
+
+        static int foo(void);
+        int foo(void) { return 0; }
+
+  now behaves as expected: foo() is effectively static
+
+* multi-arch:
+  * allow a single sparse executable to be used for multiple architectures
+  * add support for -mcmodel & -f{pic,PIC,pie,PIE}, mainly for RISC-V
+  * add new option, --arch=$ARCH, to specify the target architecture
+  * move all arch-specifc code in separated files (target-$ARCH.c) 
+  * try to support the various floating-point ABIs on ARM
+  * fix wchar_t & wint_t for openbsd
+  * add missing predefines for PPC
+  * add missing predfines: __amd64 & __amd64__
+  * sparc32 on SunOS/Solaris uses 128-bit long double
+  * fix wchar_t & wint_t on SunOS/Solaris
+  * teach sparse about -fshort-wchar
+  * keep cygwin specifics with i386/x86-64 specifics
+  * keep BSD & Darwin specifics with i386/x86-64 specifics
+  * fix the signedness of plain chars
+  * add support for s390 (ILP32)
+  * add predefine for __mips__
+  * predefine "i386" if needed
+  * pre-define __unix__ and friends
+  * add necessary defined for sunos-derived systems
+  * improved detection of the native OS
+
+* warnings
+  * improve diagnostic message about wrong redeclaration
+  * conditionally accept { 0 } without warnings
+  * add -Wexternal-function-has-definition
+  * display the bitfield name in error messages
+  * oversized bitfields are now errors
+  * add an option to suppress warning 'no newline at EOF'
+  * warn when jumping into statement expressions
+  * warn when using undefined labels
+  * warn on defined but unused labels
+
+* attributes:
+  * allows '__<attribute-name>__' for all attributes.
+  * improve handling of function attributes
+  * separate modifiers into type/declaration
+  * add support for attributes 'unused' & 'gnu_inline'
+  * simplify parsing of inline/__tls/__visible
+  * better handle function-only attributes
+  * teach sparse about gnu_inline
+
+* typeof:
+  * ensure that typeofs are evaluated before using show_typename()
+  * use a single way to expand typeofs
+
+* cgcc:
+  * use -fshort-char for Cygwin
+  * add support for riscv32 & riscv64
+  * don't define __CYGWIN32__ on 64-bit
+  * filter-out sparse-specific -msize-long & -msize-llp64
+  * use -mfloat-abi=hard for armhf
+  * define _BIG_ENDIAN when needed
+  * remove definition of _STRING_ARCH_unaligned (defined by glibc)
+  * removed unneeded predefines for integers (now defined by sparse)
+  * better mult-arch support by using --arch=$ARCH
+
+* testsuite:
+  * avoid standard includes in the tests
+  * fix testcase with non-constant initializer
+    
+* IR
+  * add support for the linearization of builtins
+  * generate OP_UNREACH from  __builtin_unreachable()
+  * add OP_UNREACH after calls to __noreturn functions
+
+* doc:
+  * do not use obsolete sphinx's AutodocReporter
+  * add basic doc about the type system
+  * doc is now accessible as: https://sparse.docs.kernel.org
+
+* misc:
+  * add support for '-std=c17/c18'
+  * simplify testng of which version of the standard is used
+  * various improvements to the 'dissect' tool
+  * simplify the parsing of type specifiers
+  * improve diagnostic messages concerning bitfields
+  * fix premature examination of dereferenced object
+  * various fixes for the expansion of constant symbols
+  * fix type compatibility of _Atomic types
+
-- 
2.27.0


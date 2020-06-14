Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B391F8ADA
	for <lists+linux-sparse@lfdr.de>; Sun, 14 Jun 2020 23:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgFNVKP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 17:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgFNVKP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 17:10:15 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B705C03E97C
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 14:10:14 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id gl26so15255783ejb.11
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 14:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8THyH/pq/bp0gEMzSwobqK+fGj9m+cObUS7uen1HQ/Y=;
        b=PgZuL1Ysn+nwliGDVq7AM2CLPrx9yurrX9NtRaTmEeHnoSsGtny1mPEcLgrmleelar
         YB+78V1j3c6wyA6bcmjCrdXRP/3b/Qy16dLyGtDzK1dmv6q7GszGDZVu7Ds4vXxXK0Oh
         YiUOcrWfsBn73bW8cIXwyb0u5hMqppt12PogEamUp+ZPg2LZyXY4G5skijPyD4G2i53B
         NLEQrrEMJARW14rOzORZo28Z8uOwZUjelJsBULPQOYb9hyhVnbrsjTgig0/sfVo+EhL/
         2Cm/FotSJ1QlpslEomymg2RQpBjIdhsbEPtOLk52vV74lQtV8j8sVX/JYXlBWJwjw4XX
         38CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8THyH/pq/bp0gEMzSwobqK+fGj9m+cObUS7uen1HQ/Y=;
        b=cslNj6I/qbMZVvRhcmQ6o+ER/PzbAsn9pT9FSBYzJzyrwUeulDak3iHKqUs+odv836
         hgAaaVVCbyTaft96MXgQxccICUFuY4ZiPWdhogH4Cd9ABTPVxHzCpASXT08LqgJNM9N9
         /4ZEqhrIg0VGi4g0fEhUo5h5H043kjPjpnlqIMkMWUvoCOcl5Ozp5LEZYAMAm886gRcy
         +c00NIwXvVkGj+yZtvcpeYFwok/S+3lS+rVInIacTlwyJvm8t70p2T69IGez8SWK2Skj
         1vRVQ3geyAqMQzq3WgLC+Kj/n6j6f8eSbD8krMyCz0URX+Od4+F1rqNDrAt2oKE5Eey0
         HPJw==
X-Gm-Message-State: AOAM532BhsSNjwdPIeW7tECU65w+F9MYWpReJnS/ZQhF8Wq0yE6jVIqe
        81oeLS0xvJ3ARkcKVCOQMmbBgiIM
X-Google-Smtp-Source: ABdhPJwAUGUY4g+pQsrgJByyxFvxeVxwzCgexEACT/HWmyPvWzQwWbRYjIRM4ZIssKDCMhTzpOi0Zw==
X-Received: by 2002:a17:906:33ce:: with SMTP id w14mr10072012eja.35.1592169012840;
        Sun, 14 Jun 2020 14:10:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:d91c:9a32:92ae:d7bf])
        by smtp.gmail.com with ESMTPSA id b24sm7125872edw.70.2020.06.14.14.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 14:10:11 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] doc: reindent the sublists in the relnotes
Date:   Sun, 14 Jun 2020 23:10:08 +0200
Message-Id: <20200614211008.24700-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The html-generated version of the release notes looked
terrible because the used indentation was too small.

Fix this by indenting the sublists by 4 instead of 2

Reported-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/release-notes/v0.6.2.rst | 136 ++++++++++++-------------
 1 file changed, 67 insertions(+), 69 deletions(-)

diff --git a/Documentation/release-notes/v0.6.2.rst b/Documentation/release-notes/v0.6.2.rst
index 7439724c3d45..3d0e4ba06967 100644
--- a/Documentation/release-notes/v0.6.2.rst
+++ b/Documentation/release-notes/v0.6.2.rst
@@ -9,92 +9,90 @@ V0.6.2
 
 * add support for _Generic
 
-* fully propagate declarations downward
-  For example, it means that code like:
+* fully propagate declarations downward.
+    For example, it means that code like:
 
         static int foo(void);
         int foo(void) { return 0; }
 
-  now behaves as expected: foo() is effectively static
+    now behaves as expected: foo() is effectively static.
 
 * multi-arch:
-  * allow a single sparse executable to be used for multiple architectures
-  * add support for -mcmodel & -f{pic,PIC,pie,PIE}, mainly for RISC-V
-  * add new option, --arch=$ARCH, to specify the target architecture
-  * move all arch-specific code into separate files (target-$ARCH.c)
-  * try to support the various floating-point ABIs on ARM
-  * fix wchar_t & wint_t for openbsd
-  * add missing predefines for PPC
-  * add missing predfines: __amd64 & __amd64__
-  * sparc32 on SunOS/Solaris uses 128-bit long double
-  * fix wchar_t & wint_t on SunOS/Solaris
-  * teach sparse about -fshort-wchar
-  * keep cygwin specifics with i386/x86-64 specifics
-  * keep BSD & Darwin specifics with i386/x86-64 specifics
-  * fix the signedness of plain chars
-  * add support for s390 (ILP32)
-  * add predefine for __mips__
-  * predefine "i386" if needed
-  * pre-define __unix__ and friends
-  * add necessary defined for sunos-derived systems
-  * improved detection of the native OS
+    * allow a single sparse executable to be used for multiple architectures
+    * add support for -mcmodel & -f{pic,PIC,pie,PIE}, mainly for RISC-V
+    * add new option, --arch=$ARCH, to specify the target architecture
+    * move all arch-specific code into separate files (target-$ARCH.c)
+    * try to support the various floating-point ABIs on ARM
+    * fix wchar_t & wint_t for openbsd
+    * add missing predefines for PPC
+    * add missing predfines: __amd64 & __amd64__
+    * sparc32 on SunOS/Solaris uses 128-bit long double
+    * fix wchar_t & wint_t on SunOS/Solaris
+    * teach sparse about -fshort-wchar
+    * keep cygwin specifics with i386/x86-64 specifics
+    * keep BSD & Darwin specifics with i386/x86-64 specifics
+    * fix the signedness of plain chars
+    * add support for s390 (ILP32)
+    * add predefine for __mips__
+    * predefine "i386" if needed
+    * pre-define __unix__ and friends
+    * add necessary defined for sunos-derived systems
+    * improved detection of the native OS
 
-* warnings
-  * improve diagnostic message about wrong redeclaration
-  * conditionally accept { 0 } without warnings
-  * add -Wexternal-function-has-definition
-  * display the bitfield name in error messages
-  * oversized bitfields are now errors
-  * add an option to suppress warning 'no newline at EOF'
-  * warn when jumping into statement expressions
-  * warn when using undefined labels
-  * warn on defined but unused labels
+* warnings:
+    * improve diagnostic message about wrong redeclaration
+    * conditionally accept { 0 } without warnings
+    * add -Wexternal-function-has-definition
+    * display the bitfield name in error messages
+    * oversized bitfields are now errors
+    * add an option to suppress warning 'no newline at EOF'
+    * warn when jumping into statement expressions
+    * warn when using undefined labels
+    * warn on defined but unused labels
 
 * attributes:
-  * allows '__<attribute-name>__' for all attributes.
-  * improve handling of function attributes
-  * separate modifiers into type/declaration
-  * add support for attributes 'unused' & 'gnu_inline'
-  * simplify parsing of inline/__tls/__visible
-  * better handle function-only attributes
-  * teach sparse about gnu_inline
-
-* typeof:
-  * ensure that typeofs are evaluated before using show_typename()
-  * use a single way to expand typeofs
+    * allows '__<attribute-name>__' for all attributes.
+    * improve handling of function attributes
+    * separate modifiers into type/declaration
+    * add support for attributes 'unused' & 'gnu_inline'
+    * simplify parsing of inline/__tls/__visible
+    * better handle function-only attributes
+    * teach sparse about gnu_inline
 
 * cgcc:
-  * use -fshort-char for Cygwin
-  * add support for riscv32 & riscv64
-  * don't define __CYGWIN32__ on 64-bit
-  * filter-out sparse-specific -msize-long & -msize-llp64
-  * use -mfloat-abi=hard for armhf
-  * define _BIG_ENDIAN when needed
-  * remove definition of _STRING_ARCH_unaligned (defined by glibc)
-  * removed unneeded predefines for integers (now defined by sparse)
-  * better multi-arch support by using --arch=$ARCH
+    * use -fshort-char for Cygwin
+    * add support for riscv32 & riscv64
+    * don't define __CYGWIN32__ on 64-bit
+    * filter-out sparse-specific -msize-long & -msize-llp64
+    * use -mfloat-abi=hard for armhf
+    * define _BIG_ENDIAN when needed
+    * remove definition of _STRING_ARCH_unaligned (defined by glibc)
+    * removed unneeded predefines for integers (now defined by sparse)
+    * better multi-arch support by using --arch=$ARCH
 
 * testsuite:
-  * avoid standard includes in the tests
-  * fix testcase with non-constant initializer
+    * avoid standard includes in the tests
+    * fix testcase with non-constant initializer
     
 * IR
-  * add support for the linearization of builtins
-  * generate OP_UNREACH from  __builtin_unreachable()
-  * add OP_UNREACH after calls to __noreturn functions
+    * add support for the linearization of builtins
+    * generate OP_UNREACH from  __builtin_unreachable()
+    * add OP_UNREACH after calls to __noreturn functions
 
 * doc:
-  * do not use obsolete sphinx's AutodocReporter
-  * add basic doc about the type system
-  * doc is now accessible as: https://sparse.docs.kernel.org
+    * do not use obsolete sphinx's AutodocReporter
+    * add basic doc about the type system
+    * doc is now accessible as: https://sparse.docs.kernel.org
 
 * misc:
-  * add support for '-std=c17/c18'
-  * simplify testing of which version of the standard is used
-  * various improvements to the 'dissect' tool
-  * simplify the parsing of type specifiers
-  * improve diagnostic messages concerning bitfields
-  * fix premature examination of dereferenced object
-  * various fixes for the expansion of constant symbols
-  * fix type compatibility of _Atomic types
+    * add support for '-std=c17/c18'
+    * simplify testing of which version of the standard is used
+    * ensure that typeofs are evaluated before using show_typename()
+    * use a single way to expand typeofs
+    * various improvements to the 'dissect' tool
+    * simplify the parsing of type specifiers
+    * improve diagnostic messages concerning bitfields
+    * fix premature examination of dereferenced object
+    * various fixes for the expansion of constant symbols
+    * fix type compatibility of _Atomic types
 
-- 
2.27.0


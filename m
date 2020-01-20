Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 855A914286A
	for <lists+linux-sparse@lfdr.de>; Mon, 20 Jan 2020 11:47:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgATKrT (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 20 Jan 2020 05:47:19 -0500
Received: from [8.12.47.4] ([8.12.47.4]:48577 "EHLO jlevon"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726148AbgATKrT (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 20 Jan 2020 05:47:19 -0500
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Jan 2020 05:47:18 EST
Received: from jlevon (localhost [127.0.0.1])
        by jlevon (8.15.2+Sun/8.15.2) with ESMTP id 00KAcXjf020791;
        Mon, 20 Jan 2020 02:38:33 -0800 (PST)
Received: (from gk@localhost)
        by jlevon (8.15.2+Sun/8.15.2/Submit) id 00KAcXqq020790;
        Mon, 20 Jan 2020 02:38:33 -0800 (PST)
X-Authentication-Warning: jlevon: gk set sender to john.levon@joyent.com using -f
From:   john.levon@joyent.com
To:     linux-sparse@vger.kernel.org
Cc:     Toomas Soome <tsoome@me.com>
Subject: [PATCH] correct sparcv9 defines
Date:   Mon, 20 Jan 2020 02:38:24 -0800
Message-Id: <20200120103824.20746-1-john.levon@joyent.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: Toomas Soome <tsoome@me.com>

The SPARCV9 compile check needs to look for __sparcv9 on some systems,
and should also define "sparc".
---
 lib.c     | 13 ++++++++-----
 machine.h |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/lib.c b/lib.c
index 711e8fbe..14e51979 100644
--- a/lib.c
+++ b/lib.c
@@ -1587,15 +1587,18 @@ static void predefined_macros(void)
 		predefine("__s390__", 1, "1");
 		break;
 	case MACH_SPARC64:
-		predefine("__sparc_v9__", 1, "1");
-		predefine("__sparcv9__", 1, "1");
-		predefine("__sparcv9", 1, "1");
-		predefine("__sparc64__", 1, "1");
-		predefine("__arch64__", 1, "1");
+		if (arch_m64 != ARCH_LP32) {
+			predefine("__sparc_v9__", 1, "1");
+			predefine("__sparcv9__", 1, "1");
+			predefine("__sparcv9", 1, "1");
+			predefine("__sparc64__", 1, "1");
+			predefine("__arch64__", 1, "1");
+		}
 		/* fall-through */
 	case MACH_SPARC32:
 		predefine("__sparc__", 1, "1");
 		predefine("__sparc", 1, "1");
+		predefine("sparc", 1, "1");
 		break;
 	case MACH_X86_64:
 		if (arch_m64 != ARCH_LP32) {
diff --git a/machine.h b/machine.h
index 6eba448c..3389579c 100644
--- a/machine.h
+++ b/machine.h
@@ -56,7 +56,7 @@ enum machine {
 #define	MACH_NATIVE	MACH_RISCV64
 #elif defined(__riscv) && (__riscv_xlen == 32)
 #define	MACH_NATIVE	MACH_RISCV32
-#elif defined(__sparc_v9__)
+#elif defined(__sparc_v9__) || defined(__sparcv9)
 #define	MACH_NATIVE	MACH_SPARC64
 #elif defined(__sparc__) || defined(__sparc)
 #define	MACH_NATIVE	MACH_SPARC32
-- 
2.23.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860054B7274
	for <lists+linux-sparse@lfdr.de>; Tue, 15 Feb 2022 17:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240526AbiBOPb1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 15 Feb 2022 10:31:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbiBOPaV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 15 Feb 2022 10:30:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62915B12D0;
        Tue, 15 Feb 2022 07:28:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 22029B81AF2;
        Tue, 15 Feb 2022 15:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADCEC340ED;
        Tue, 15 Feb 2022 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644938928;
        bh=4evH3cNV/TecPqqgb9DUIrLL/d4lvxxzjc2yTb+ALNM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LUaQzzKQVIrCmdHlANzQI1zD8c8VRLrdvOLbOLJycu5eDhON+VcdLthfYgBeG9BO8
         y+TwIUOrmaFb9d57uvgOrbOQnDYqs6Jbro07BAOsWbcFuW4tHx1XaHyiAg+31a0KOu
         Zy9c7Mi78lsXbFYMcRKTKUQdgBPwkTSXjZ5lChFq+2Kt1lnV3cq4VbcGD4+i+3aALn
         XzXaQhgi1JGziq0RyOQVCHFd2O6yjHn91IYNOwJnlm4w7JktMk7whID2BCucEReX97
         wkr95GCzb9AMqLY1yaD5ou1jGWSc3XNLPvwZKVCxYjsTLe74iK94GkkSVwomUYPcJC
         +mu3LkfX/xGuA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Sasha Levin <sashal@kernel.org>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, luc.vanoostenryck@gmail.com, adobriyan@gmail.com,
        linux-sparse@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 08/33] x86/bug: Merge annotate_reachable() into _BUG_FLAGS() asm
Date:   Tue, 15 Feb 2022 10:28:06 -0500
Message-Id: <20220215152831.580780-8-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152831.580780-1-sashal@kernel.org>
References: <20220215152831.580780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: Nick Desaulniers <ndesaulniers@google.com>

[ Upstream commit bfb1a7c91fb7758273b4a8d735313d9cc388b502 ]

In __WARN_FLAGS(), we had two asm statements (abbreviated):

  asm volatile("ud2");
  asm volatile(".pushsection .discard.reachable");

These pair of statements are used to trigger an exception, but then help
objtool understand that for warnings, control flow will be restored
immediately afterwards.

The problem is that volatile is not a compiler barrier. GCC explicitly
documents this:

> Note that the compiler can move even volatile asm instructions
> relative to other code, including across jump instructions.

Also, no clobbers are specified to prevent instructions from subsequent
statements from being scheduled by compiler before the second asm
statement. This can lead to instructions from subsequent statements
being emitted by the compiler before the second asm statement.

Providing a scheduling model such as via -march= options enables the
compiler to better schedule instructions with known latencies to hide
latencies from data hazards compared to inline asm statements in which
latencies are not estimated.

If an instruction gets scheduled by the compiler between the two asm
statements, then objtool will think that it is not reachable, producing
a warning.

To prevent instructions from being scheduled in between the two asm
statements, merge them.

Also remove an unnecessary unreachable() asm annotation from BUG() in
favor of __builtin_unreachable(). objtool is able to track that the ud2
from BUG() terminates control flow within the function.

Link: https://gcc.gnu.org/onlinedocs/gcc/Extended-Asm.html#Volatile
Link: https://github.com/ClangBuiltLinux/linux/issues/1483
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
Link: https://lore.kernel.org/r/20220202205557.2260694-1-ndesaulniers@google.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/include/asm/bug.h | 20 +++++++++++---------
 include/linux/compiler.h   | 21 +++++----------------
 2 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index 84b87538a15de..bab883c0b6fee 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -22,7 +22,7 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#define _BUG_FLAGS(ins, flags)						\
+#define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
@@ -31,7 +31,8 @@ do {									\
 		     "\t.word %c1"        "\t# bug_entry::line\n"	\
 		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
 		     "\t.org 2b+%c3\n"					\
-		     ".popsection"					\
+		     ".popsection\n"					\
+		     extra						\
 		     : : "i" (__FILE__), "i" (__LINE__),		\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
@@ -39,14 +40,15 @@ do {									\
 
 #else /* !CONFIG_DEBUG_BUGVERBOSE */
 
-#define _BUG_FLAGS(ins, flags)						\
+#define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
 		     "\t.word %c0"        "\t# bug_entry::flags\n"	\
 		     "\t.org 2b+%c1\n"					\
-		     ".popsection"					\
+		     ".popsection\n"					\
+		     extra						\
 		     : : "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
@@ -55,7 +57,7 @@ do {									\
 
 #else
 
-#define _BUG_FLAGS(ins, flags)  asm volatile(ins)
+#define _BUG_FLAGS(ins, flags, extra)  asm volatile(ins)
 
 #endif /* CONFIG_GENERIC_BUG */
 
@@ -63,8 +65,8 @@ do {									\
 #define BUG()							\
 do {								\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, 0);					\
-	unreachable();						\
+	_BUG_FLAGS(ASM_UD2, 0, "");				\
+	__builtin_unreachable();				\
 } while (0)
 
 /*
@@ -75,9 +77,9 @@ do {								\
  */
 #define __WARN_FLAGS(flags)					\
 do {								\
+	__auto_type f = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));		\
-	annotate_reachable();					\
+	_BUG_FLAGS(ASM_UD2, f, ASM_REACHABLE);			\
 	instrumentation_end();					\
 } while (0)
 
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 429dcebe2b992..0f7fd205ab7ea 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -117,14 +117,6 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
  */
 #define __stringify_label(n) #n
 
-#define __annotate_reachable(c) ({					\
-	asm volatile(__stringify_label(c) ":\n\t"			\
-		     ".pushsection .discard.reachable\n\t"		\
-		     ".long " __stringify_label(c) "b - .\n\t"		\
-		     ".popsection\n\t" : : "i" (c));			\
-})
-#define annotate_reachable() __annotate_reachable(__COUNTER__)
-
 #define __annotate_unreachable(c) ({					\
 	asm volatile(__stringify_label(c) ":\n\t"			\
 		     ".pushsection .discard.unreachable\n\t"		\
@@ -133,24 +125,21 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 })
 #define annotate_unreachable() __annotate_unreachable(__COUNTER__)
 
-#define ASM_UNREACHABLE							\
-	"999:\n\t"							\
-	".pushsection .discard.unreachable\n\t"				\
-	".long 999b - .\n\t"						\
+#define ASM_REACHABLE							\
+	"998:\n\t"							\
+	".pushsection .discard.reachable\n\t"				\
+	".long 998b - .\n\t"						\
 	".popsection\n\t"
 
 /* Annotate a C jump table to allow objtool to follow the code flow */
 #define __annotate_jump_table __section(".rodata..c_jump_table")
 
 #else
-#define annotate_reachable()
 #define annotate_unreachable()
+# define ASM_REACHABLE
 #define __annotate_jump_table
 #endif
 
-#ifndef ASM_UNREACHABLE
-# define ASM_UNREACHABLE
-#endif
 #ifndef unreachable
 # define unreachable() do {		\
 	annotate_unreachable();		\
-- 
2.34.1


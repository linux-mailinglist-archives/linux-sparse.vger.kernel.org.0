Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 357E3D18A1
	for <lists+linux-sparse@lfdr.de>; Wed,  9 Oct 2019 21:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731168AbfJITRs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 9 Oct 2019 15:17:48 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:39411 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729535AbfJITRs (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 9 Oct 2019 15:17:48 -0400
Received: by mail-ed1-f68.google.com with SMTP id a15so3126702edt.6
        for <linux-sparse@vger.kernel.org>; Wed, 09 Oct 2019 12:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDAgd8JsF2yIhUY44NkaG1oLm3oKgp6LF2Q216/q0nM=;
        b=FP7HYqdRc+pW9z6Kx/pvCl70ZMLP8sR0Iev0sqZt9apDMeQWW+oevQc7Q+YAkvXI6A
         9QO2aChNzxH19qSuVktsPzE9A2AseB6EarOxffwvwNSaJJqZajAosgLrYLVYOQaUCoaz
         5XM8Pk2goIQHgsG63YRTJWi5M0KJTf3hOO5QpmyEK46pfo0C3v5LnjiW8TSg9RKS0+k9
         ABGS6wWlXrCsLByt7Xn/Ax8vUwEC6E8MND4VjNZQSsETosHfdneM530WFFCDBB2117tN
         adlKGTVQVhxFxhIOQfaRfNRp3uTT3cFdvpvstv72G5x3/zQHuiBbfdGEikzY8NS8ryMc
         lVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDAgd8JsF2yIhUY44NkaG1oLm3oKgp6LF2Q216/q0nM=;
        b=VR92oC8mumv5FSACdbJhfIj+uYsWyem9wVfAuPxSK5N7EO1Iyvxy5JnjH2H6n12zPf
         v+Fq+w+nJ5SDHE6v5MxTBVl1rTLrVP/pFiBv7cEfk5XSUs93gLd/lKYdA6LuFPNMLIwu
         KldO9z/EN+9WbokVgX7byt7HHsZRa24tZMUtYeezvXYvvCL9Cm/R40YNdDnJl47kI1pu
         vNvXGtWYbvoCkNk0JBGC0mTq+/Bg3SVOlpZpYYtd5QvEU4c4TkvQtM+0HzWpzh00mjWh
         y/e4mxSQplijo+h+c10nmowCFcCmeaLbKmWwrhi6gXQ6w9NvJRFJIV3rp7SvIaPB33Yc
         EHJg==
X-Gm-Message-State: APjAAAVO0OD77lUQKCNNKITWlXukNYFS+dGrohOwza1/rqDA0MI373b6
        owByfrHjmHU1XzB70afmKGCdAXkK
X-Google-Smtp-Source: APXvYqygW5UJCvHDq23aWhWsK9BmlMw/hyE/HSJ0n04ujY3i/ipykrt6ukAnbfhK1TLtXw384CZitg==
X-Received: by 2002:a17:906:3b10:: with SMTP id g16mr4481324ejf.34.1570648665104;
        Wed, 09 Oct 2019 12:17:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:e57a:fd21:8a5f:3932])
        by smtp.gmail.com with ESMTPSA id c15sm486987edl.16.2019.10.09.12.17.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 12:17:44 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Vegard Nossum <vegard.nossum@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] "graph" segfaults on top-level asm
Date:   Wed,  9 Oct 2019 21:17:36 +0200
Message-Id: <20191009191736.40421-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The "graph" binary segfaults on this input:
	asm("");
with gdb saying (edited for clarity):
	Program received signal SIGSEGV, Segmentation fault.
		in graph_ep (ep=0x7ffff7f62010) at graph.c:52
	(gdb) p ep->entry
	$1 = (struct instruction *) 0x0

Sadly, the commit that introduced this crash:
	15fa4d60e ("topasm: top-level asm is special")
was (part of a bigger series) meant to fix crashes because
of such toplevel asm statements.

Fix this by partially reversing this commit, adding a few
checks in some others places (for tools not using the entrypoint)
and disabling output in test-parsing.c

Fixes: 15fa4d60ebba3025495bb34f0718764336d3dfe0
Reported-by: Vegard Nossum <vegard.nossum@gmail.com>
Analyzed-by: Vegard Nossum <vegard.nossum@gmail.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 dissect.c      | 2 ++
 graph.c        | 2 ++
 linearize.c    | 8 ++++----
 sparse-llvm.c  | 3 +++
 test-inspect.c | 2 ++
 test-parsing.c | 4 +++-
 6 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/dissect.c b/dissect.c
index 14d57bf5b..70d67ccbd 100644
--- a/dissect.c
+++ b/dissect.c
@@ -575,6 +575,8 @@ static inline struct symbol *do_symbol(struct symbol *sym)
 
 	type = base_type(sym);
 
+	if (!sym->ident)		// toplevel asm
+		return type;
 	if (reporter->r_symdef)
 		reporter->r_symdef(sym);
 
diff --git a/graph.c b/graph.c
index be4cf282c..d8a276e11 100644
--- a/graph.c
+++ b/graph.c
@@ -182,6 +182,8 @@ int main(int argc, char **argv)
 		concat_symbol_list(fsyms, &all_syms);
 
 		FOR_EACH_PTR(fsyms, sym) {
+			if (!sym->ident) // toplevel asm
+				continue;
 			expand_symbol(sym);
 			linearize_symbol(sym);
 		} END_FOR_EACH_PTR(sym);
diff --git a/linearize.c b/linearize.c
index 30ed2a302..3d21bafab 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2471,15 +2471,15 @@ static struct entrypoint *linearize_fn(struct symbol *sym, struct symbol *base_t
 	bb = alloc_basic_block(ep, sym->pos);
 	set_activeblock(ep, bb);
 
+	entry = alloc_instruction(OP_ENTRY, 0);
+	add_one_insn(ep, entry);
+	ep->entry = entry;
+
 	if (stmt->type == STMT_ASM) {	// top-level asm
 		linearize_asm_statement(ep, stmt);
 		return ep;
 	}
 
-	entry = alloc_instruction(OP_ENTRY, 0);
-	add_one_insn(ep, entry);
-	ep->entry = entry;
-
 	concat_symbol_list(base_type->arguments, &ep->syms);
 
 	/* FIXME!! We should do something else about varargs.. */
diff --git a/sparse-llvm.c b/sparse-llvm.c
index c7a9fbb7e..69da8d4e8 100644
--- a/sparse-llvm.c
+++ b/sparse-llvm.c
@@ -1139,6 +1139,9 @@ static void output_fn(LLVMModuleRef module, struct entrypoint *ep)
 	int nr_args = 0;
 	int i;
 
+	if (!sym->ident)		// toplevel asm
+		return;
+
 	function.fn = get_sym_value(module, sym);
 	LLVMSetFunctionCallConv(function.fn, LLVMCCallConv);
 	LLVMSetLinkage(function.fn, function_linkage(sym));
diff --git a/test-inspect.c b/test-inspect.c
index 63754cb3c..d9bbebf0e 100644
--- a/test-inspect.c
+++ b/test-inspect.c
@@ -20,6 +20,8 @@ static void expand_symbols(struct symbol_list *list)
 {
 	struct symbol *sym;
 	FOR_EACH_PTR(list, sym) {
+		if (!sym->ident)	// toplevel asm
+			continue;
 		expand_symbol(sym);
 	} END_FOR_EACH_PTR(sym);
 }
diff --git a/test-parsing.c b/test-parsing.c
index c5bc42e19..d18342f5f 100644
--- a/test-parsing.c
+++ b/test-parsing.c
@@ -44,6 +44,8 @@ static void clean_up_symbols(struct symbol_list *list)
 	struct symbol *sym;
 
 	FOR_EACH_PTR(list, sym) {
+		if (!sym->ident)	// toplevel asm
+			continue;
 		expand_symbol(sym);
 	} END_FOR_EACH_PTR(sym);
 }
@@ -70,7 +72,7 @@ int main(int argc, char **argv)
 		// Simplification
 		clean_up_symbols(list);
 
-#if 1
+#if 0
 		// Show the end result.
 		show_symbol_list(list, "\n\n");
 		printf("\n\n");
-- 
2.23.0


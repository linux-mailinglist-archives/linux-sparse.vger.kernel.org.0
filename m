Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF1A1A4A07
	for <lists+linux-sparse@lfdr.de>; Fri, 10 Apr 2020 20:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgDJStg (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 10 Apr 2020 14:49:36 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51012 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgDJStg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 10 Apr 2020 14:49:36 -0400
Received: by mail-wm1-f66.google.com with SMTP id x25so3377401wmc.0
        for <linux-sparse@vger.kernel.org>; Fri, 10 Apr 2020 11:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gAz+1kMDGfUni4hQ93qxKz9HlNJPkHtE8fypg0li60U=;
        b=FklBCA4yGgy8tjo2cYzz7hX6nzonu0IE71Bs4PAWRUW9gxbG380DcItUSE5FTvwZ2P
         e4u7LUtPGVTi7kUP9tjrS1dPS5zjDSNX4fPN8xIFMh2i04VcqrZQpEqGEv15iQQR0LeJ
         I3pFbSuBQvh8saOTP4lYE0iJdV7mlGudyGW1cLL7nSc9Ut6vKagMTOSNYBO4dbbtscPq
         XY4sbCkC7trEjfvA9/LT3rt2JuSuKLAV+f2CGqEu/0VbKb7l2yxjEOnHVLheGhunVDPX
         fd+qD3NIMEU9n6OwhAsqMhFB4+WmJ3MnrbMfkuEzIWCGvOTf032Wr2dYaZD2eVqA5ZEV
         RF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gAz+1kMDGfUni4hQ93qxKz9HlNJPkHtE8fypg0li60U=;
        b=H44PfBVDO3c35NqqBL64Y4Uhcp0f3Diotg/8FMcX9AhyP4sH8H0utIMdzdMRZAigYZ
         SO1SCJLmqm8QZ1h7TOgi6nXFqT9HF1Bhs3RLBrmJj5dRsu6Q9CSCFkKo2JY4VIsv33DV
         TEQQPndEGBXkf+HAX+n0TpXpasU2S/7VgFAI/J0tFfIeRK4G27ovInBaANy31ZE6UiCS
         hRzlbuKLHilVyLRL8tQ1SqagOjeiiBjDPggBpyQlB/EgiZ5whNopzx0rK4dY9S8qEpZU
         imD6hSJEPMYbKJLnNjnFytwraElLftjOpPLJN9Xewq/qkoZRVyGNe2d8Qx3vQwdTvcE+
         r0GQ==
X-Gm-Message-State: AGi0PubnFxA8edjAZp9RiTV1pD494h3JYJ1BXXkZk94WsKS7AI9RIEAB
        vdmubcm7Zokv86ww3GXl/NPTyLk7
X-Google-Smtp-Source: APiQypK3hQma9boloCvIbJ95epq3n+4Q+KGKeRHzLnZ2ndpFHZrKl4jwBA4bq3NL+uReCGQ27gAzQg==
X-Received: by 2002:a7b:c004:: with SMTP id c4mr6172339wmb.108.1586544572883;
        Fri, 10 Apr 2020 11:49:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:957f:f707:be30:7cd4])
        by smtp.gmail.com with ESMTPSA id u16sm3935364wro.23.2020.04.10.11.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 11:49:32 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [SPARSE PATCH 5/5] perform early CFG cleanup
Date:   Fri, 10 Apr 2020 20:49:18 +0200
Message-Id: <20200410184918.64692-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
References: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

add insert_self_branch()

A goto done into an piece of code discarded at expand or
linearize time will produce an invalid IR. More precisely,
the BB containing this goto will have as children a BB which:
1) has no instructions at all, so no terminator
2) has a null ->ep (normaly interpreted as unreachable)
3) is not added to the list of BBs.

What's really annoying is that such gotos are not detected at
earlier stages, so such invalid IR can be created completly
silently.

Fix this by adding, before any optimizations, a cleanup phase
which will detect such BBs and:
1) add a warning for the corresponding gotos
1) add branch to themselves as a way to properly terminate
   (any terminator would do the job).
2) add them to the list of BBs and make them reachable.

Note: the downside of a cleanup like this is that it could
      hide other problems with invalid CFG and assumptions
      are made (in the warning) about the origin of the
      problem.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 flow.c                                  | 27 +++++++++++++++++++++++++
 flow.h                                  |  1 +
 linearize.c                             |  5 +++++
 linearize.h                             |  1 +
 optimize.c                              |  3 +++
 validation/linear/goto-and-expr-stmt0.c |  1 -
 6 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/flow.c b/flow.c
index ef8d04e5827f..976d476cdacd 100644
--- a/flow.c
+++ b/flow.c
@@ -814,4 +814,31 @@ out:
 	} END_FOR_EACH_PTR(bb);
 }
 
+void cleanup_cfg(struct entrypoint *ep)
+{
+	struct basic_block *bb;
+
+	FOR_EACH_PTR(ep->bbs, bb) {
+		struct basic_block *tgt;
+		struct instruction *br;
+
+		if (!bb->insns)
+			continue;
+		if (!bb->ep)
+			continue;
+
+		br = last_instruction(bb->insns);
+		if (!br)
+			continue;
 
+		FOR_EACH_PTR(bb->children, tgt) {
+			if (!tgt->insns) {
+				sparse_error(br->pos, "branch to unexisting label");
+				insert_self_branch(tgt);
+				tgt->ep = ep;
+				if (!lookup_bb(ep->bbs, tgt))
+					add_bb(&ep->bbs, tgt);
+			}
+		} END_FOR_EACH_PTR(tgt);
+	} END_FOR_EACH_PTR(bb);
+}
diff --git a/flow.h b/flow.h
index 099767d408f5..13eca195bab4 100644
--- a/flow.h
+++ b/flow.h
@@ -18,6 +18,7 @@ extern void kill_dead_stores(struct entrypoint *ep, pseudo_t addr, int local);
 extern void simplify_symbol_usage(struct entrypoint *ep);
 extern void simplify_memops(struct entrypoint *ep);
 extern void pack_basic_blocks(struct entrypoint *ep);
+extern void cleanup_cfg(struct entrypoint *ep);
 
 extern void convert_instruction_target(struct instruction *insn, pseudo_t src);
 extern void remove_dead_insns(struct entrypoint *);
diff --git a/linearize.c b/linearize.c
index a2cde941ce18..7b685016ea3e 100644
--- a/linearize.c
+++ b/linearize.c
@@ -740,6 +740,11 @@ void insert_select(struct basic_block *bb, struct instruction *br, struct instru
 	add_instruction(&bb->insns, br);
 }
 
+void insert_self_branch(struct basic_block *bb)
+{
+	add_jump(bb, bb);
+}
+
 static inline int bb_empty(struct basic_block *bb)
 {
 	return !bb->insns;
diff --git a/linearize.h b/linearize.h
index 76efd0b47ffa..7eca88016e26 100644
--- a/linearize.h
+++ b/linearize.h
@@ -308,6 +308,7 @@ struct entrypoint {
 
 extern void insert_select(struct basic_block *bb, struct instruction *br, struct instruction *phi, pseudo_t if_true, pseudo_t if_false);
 extern void insert_branch(struct basic_block *bb, struct instruction *br, struct basic_block *target);
+extern void insert_self_branch(struct basic_block *bb);
 
 struct instruction *alloc_phisrc(pseudo_t pseudo, struct symbol *type);
 struct instruction *alloc_phi_node(struct basic_block *bb, struct symbol *type, struct ident *ident);
diff --git a/optimize.c b/optimize.c
index e8cb7fc31e4b..515d6d8d81e5 100644
--- a/optimize.c
+++ b/optimize.c
@@ -48,6 +48,9 @@ void optimize(struct entrypoint *ep)
 	if (fdump_ir & PASS_LINEARIZE)
 		show_entry(ep);
 
+	// Detect invalid gotos and band-aid them
+	cleanup_cfg(ep);
+
 	/*
 	 * Do trivial flow simplification - branches to
 	 * branches, kill dead basicblocks etc
diff --git a/validation/linear/goto-and-expr-stmt0.c b/validation/linear/goto-and-expr-stmt0.c
index 548813531779..a68aa59bcbcf 100644
--- a/validation/linear/goto-and-expr-stmt0.c
+++ b/validation/linear/goto-and-expr-stmt0.c
@@ -20,7 +20,6 @@ a:
 /*
  * check-name: goto-and-expr-stmt0
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-excludes: END
-- 
2.26.0


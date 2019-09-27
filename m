Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 643C1C0EB2
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbfI0Xnj (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:39 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36444 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbfI0Xnj (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:39 -0400
Received: by mail-ed1-f66.google.com with SMTP id h2so3746300edn.3
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yiBVmjLvtUxLkBWELtNSRiQfWzyWOYMOqHSYgFqWD6w=;
        b=IfbVSztQwUzZu2uFhMTkoUON1UuDkW6NS4QSquRc4FtcdBrxw0UauOGZ9oGFGde7nT
         14FZDwnS1hwUAl2Rj4wYUSXAraKQCVl1SyLFUOUalHNTaAloOxmj9ZBa73DlPSDNkTo0
         FM5fkJJznqPs0cKBuCFDjQp49InXWrOZCkbpBCXBNiUBexGcy6mx/hKHMtH3E1H3munB
         B73omc387R7CuVeNNOEVF7z0Bip3itqBs5YcieHXSGqJatBWiQzwD+PqxGmHHorFdiZS
         BZjnMXhTFj5y24VKuMgx11y73TEx787cgdRJZkqi4wC+RQ+9fTz4j/JOgaMGPB1bwGcc
         jwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yiBVmjLvtUxLkBWELtNSRiQfWzyWOYMOqHSYgFqWD6w=;
        b=Zf6HB47lIBEVjubZV0MJuNrv7SrmzvonJdHbXhsdaVeaIzgZu/4VRz16z4ltJaTmTh
         PVDkgrhYUlpHCUxWmNbD29Lu8O1C4lx4VEw5UvP30D7SWdZbea9VDvKHx9lDipbI16K2
         oHPak9AznSAXxaaG+erRWBtropeJZ8QW1CJN1Hw9EiFOIFrOVNiCRFz7XD7NXrLeHdf6
         fBE8lM90hKlRWD71+mxXYAWv7rXOmA5/x31DyyrDvN6kmMii1NtdLN1CgqzKa7U9CSCE
         hUQb0woL4MFFOHQFNMjebW6Rp8vQmbcBU5KY/PuQ40NP+ZrYP6WITOFv4xsezMD7a8nh
         fpOQ==
X-Gm-Message-State: APjAAAXQ8WeGs8ybQLr086ZRw4H4JeOPEo5RHWlfDy6amrNnx1Komzg0
        aGE8OaSgtWFMc41xq833ixbvA6gE
X-Google-Smtp-Source: APXvYqzkYSVT7YzQngtSaxrmNPkzohyTdEI79YADGqp0UclbYOMcgISn0QV9NIPLb+TF9UV1LXxyfA==
X-Received: by 2002:a50:fd01:: with SMTP id i1mr7364595eds.184.1569627817727;
        Fri, 27 Sep 2019 16:43:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:37 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 16/18] asm: fix liveness memory operand
Date:   Sat, 28 Sep 2019 01:43:20 +0200
Message-Id: <20190927234322.5157-19-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Since memory operands are only some kind of reference, the pseudo
in an output operand is not defined by the statement, the reference
is only used.

Fix the liveness processing accordingly.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c | 1 +
 linearize.h | 1 +
 liveness.c  | 5 ++++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/linearize.c b/linearize.c
index 68be3ab1e..09b1c7ee8 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2101,6 +2101,7 @@ static void add_asm_output(struct entrypoint *ep, struct instruction *insn, stru
 		linearize_store_gen(ep, pseudo, &ad);
 	}
 	rule = __alloc_asm_constraint(0);
+	rule->is_memory = op->is_memory;
 	rule->ident = op->name;
 	rule->constraint = op->constraint ? op->constraint->string->data : "";
 	use_pseudo(insn, pseudo, &rule->pseudo);
diff --git a/linearize.h b/linearize.h
index 89da3db6e..76efd0b47 100644
--- a/linearize.h
+++ b/linearize.h
@@ -68,6 +68,7 @@ struct asm_constraint {
 	pseudo_t pseudo;
 	const char *constraint;
 	const struct ident *ident;
+	unsigned int is_memory:1;
 };
 
 DECLARE_ALLOCATOR(asm_constraint);
diff --git a/liveness.c b/liveness.c
index 93a7cc300..33cd04831 100644
--- a/liveness.c
+++ b/liveness.c
@@ -39,7 +39,10 @@ static void asm_liveness(struct basic_block *bb, struct instruction *insn,
 	} END_FOR_EACH_PTR(entry);
 		
 	FOR_EACH_PTR(insn->asm_rules->outputs, entry) {
-		def(bb, entry->pseudo);
+		if (entry->is_memory)
+			use(bb, entry->pseudo);
+		else
+			def(bb, entry->pseudo);
 	} END_FOR_EACH_PTR(entry);
 }
 
-- 
2.23.0


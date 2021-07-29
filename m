Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D20643DAE29
	for <lists+linux-sparse@lfdr.de>; Thu, 29 Jul 2021 23:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbhG2VVI (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 29 Jul 2021 17:21:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:56306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233832AbhG2VVH (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 29 Jul 2021 17:21:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F13BE60C51;
        Thu, 29 Jul 2021 21:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627593663;
        bh=z9yk+mOEGcbUExGsrG2j4qFwgJXi9bpw+n9fat1ixzE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kpXKpAlZkNv9OkGzsqZMUSFu4BVkRdlDi55zgnDq8XLDQtzQPvzbeKd2vqgyXHcSX
         liFO48zu4ogjxV1PO47GP/50IT7TCKZnIFyYpSsXYPC5koRwDIVtq+TPbvSTvI9te2
         kIu6oINrG7Dv4TH+Q/mIsVN44cx8m5aOmaPoAMXqvKXr9jF3Gbx60zzqZ4l77rVi4p
         qNOW8U/8WpaNNCU4gOITsho5PheoxxpPgmacjeFmATBYAssWrounEOd5kfL4RJYlKQ
         q35OEV48ILoIbdHz4JHxB6y+zh24vhuyedc18QkM9ZlzlaZQCUtXpdjuAUMfWa18XG
         svLqKJFTPqEQA==
From:   Luc Van Oostenryck <lucvoo@kernel.org>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/5] scheck: mkvar() with target or input type
Date:   Thu, 29 Jul 2021 23:20:53 +0200
Message-Id: <20210729212054.34327-5-lucvoo@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729212054.34327-1-lucvoo@kernel.org>
References: <20210729212054.34327-1-lucvoo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Most instructions have one associated type, the 'target type'.
Some, like compares, have another one too, the 'input type'.

So, when creating a bitvector from an instruction, we need to specify
the type in some way.

So, create an helper for both cases: mktvar() and mkivar().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 scheck.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scheck.c b/scheck.c
index 5e2b60abb163..07b15a0600e3 100644
--- a/scheck.c
+++ b/scheck.c
@@ -70,6 +70,18 @@ static BoolectorNode *mkvar(Btor *btor, BoolectorSort s, pseudo_t pseudo)
 	return pseudo->priv = n;
 }
 
+static BoolectorNode *mktvar(Btor *btor, struct instruction *insn, pseudo_t src)
+{
+	BoolectorSort s = get_sort(btor, insn->type, insn->pos);
+	return mkvar(btor, s, src);
+}
+
+static BoolectorNode *mkivar(Btor *btor, struct instruction *insn, pseudo_t src)
+{
+	BoolectorSort s = get_sort(btor, insn->itype, insn->pos);
+	return mkvar(btor, s, src);
+}
+
 static BoolectorNode *get_arg(Btor *btor, struct instruction *insn, int idx)
 {
 	pseudo_t arg = ptr_list_nth(insn->arguments, idx);
-- 
2.32.0


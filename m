Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A793DAE08
	for <lists+linux-sparse@lfdr.de>; Thu, 29 Jul 2021 23:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbhG2VPD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 29 Jul 2021 17:15:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:52382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229738AbhG2VPD (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 29 Jul 2021 17:15:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9D0260EFF;
        Thu, 29 Jul 2021 21:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627593299;
        bh=9/v80hTGMPWeFQ0HuZKjXRTrNzQN+vEySxHf4fBS0o8=;
        h=From:To:Cc:Subject:Date:From;
        b=oGha733YucCMi+of9CiPxxvXWn8LvmFv3PQ3KxynZo+aoTclOCM5c6vot494K6xsL
         aRURPxQ/TrJ0rRqdtXn8zh7Tpia3FEH1xWPaCvx2x20Cnk5WcPw6c5F73FSYM4wwe0
         Q/fMaCO5UA8IGUlYyFFQoP33PWfrZDY4JZA83kUK/Q55HO87mX+3+EIh4xjw/8diBg
         2fCzrKih4rjbLfIGxnOeNE6TDH4MoRWtiuRmYEXP6hajk7jXWUKmQDBQDeHOSDM9m3
         fQFdWVLAWyxjCxR3MHvTRvaPl3xIYFivTbCDFwWqNTwJ3kxqjCfaDN1gEVwXxIrTia
         yXpTIelq6J2pA==
From:   Luc Van Oostenryck <lucvoo@kernel.org>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] fix missing itype in SEL(x, 0/1, 1/0) --> (x ==/!= 0)
Date:   Thu, 29 Jul 2021 23:14:48 +0200
Message-Id: <20210729211448.34171-1-lucvoo@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Since commit 226b62bc2ee4 ("eval_insn: give an explicit type to compare's operands")
it's needed to set the operands' type of every compare instructions but
it was missing in this case where a select is transformed into a compare.

So, add the missing type.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 simplify.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/simplify.c b/simplify.c
index 02709ce4853c..0353642ba188 100644
--- a/simplify.c
+++ b/simplify.c
@@ -2449,6 +2449,7 @@ static int simplify_select(struct instruction *insn)
 				opcode = OP_SET_NE;
 			}
 			insn->opcode = opcode;
+			insn->itype = insn->type;
 			/* insn->src1 is already cond */
 			insn->src2 = src1; /* Zero */
 			return REPEAT_CSE;
-- 
2.32.0


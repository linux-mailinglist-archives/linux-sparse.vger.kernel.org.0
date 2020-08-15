Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA9D24528C
	for <lists+linux-sparse@lfdr.de>; Sat, 15 Aug 2020 23:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728435AbgHOVxC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 15 Aug 2020 17:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729166AbgHOVwo (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 15 Aug 2020 17:52:44 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C3FC0A3BE2
        for <linux-sparse@vger.kernel.org>; Sat, 15 Aug 2020 09:12:58 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i26so9061834edv.4
        for <linux-sparse@vger.kernel.org>; Sat, 15 Aug 2020 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yegErvVm+vBniXtZPPuQmrxTHVkuYxJPOOvzKNKEG6Q=;
        b=Ub7hN1c8mWCERJfEKpEh93KAzaDmx502CJ0XVqgt4wpUcXhFvMczW4zIIWQZmdOnGn
         UHWjBJkKYiLgyypmH4dDTzzVKNZLzyyiqGCudCPTP0zSzZh6D1bieG5Ae5my0Adlbd4I
         /mYu0EPmQiX8+nvVxj57N9++fF+J0qYWDWjjT1GnJwovvn4zMDtg9u9pJ075E6po29aQ
         CEDXXCjuDWNpCi9G2Z66BqYI5jut6y8NlzqGVMRKkKKnwpQ6g0mqmMOXDECwDAtkVDmS
         TUM+MgMa0wJCCqtJ3kpcLMiqUKVbd4x2M0jmTqEnWxjWgrvtamR+fVDIsAqUcFi46p6U
         biUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yegErvVm+vBniXtZPPuQmrxTHVkuYxJPOOvzKNKEG6Q=;
        b=aOtNE4Hvwl0YeRJUOa2pV6UKwaDsD4IQaN6S8NUQ2rnGAowDUOghblAkcQDr/oXTGO
         IIFseBJIgTFEdR8ZZB4h6EFEk4/Rhq5/4fTTKTNnUfV+Q+X2wujCQ3N61i/NOoCmyhE2
         8PTvnBurRvzL62H7lf0tLtHCMe1zQwpDJUuyjRaphDwHTbz+cXV9vdl8zbcLPX0zxajD
         64Ep55NNuZeNT+bL3IqXEUBt3pr97WEN8OrFedFCXzixLkiSHFXaq0NIU6PF5MLhRlzh
         JvmlryRDczzDyFDZzARHYKeXlt4JhFdCTcF9GJRKFg3QerPJh+mW6wTy+FXplZNwiLkp
         9MBA==
X-Gm-Message-State: AOAM531uScO59HhhDDl4YmAgjz+6jcW0TZK32Y2ET1sFLr7we1z4+i/j
        FmiGftfR9SBu2Zy5tUPv7rluEJ4DM+w=
X-Google-Smtp-Source: ABdhPJw8/RgFTK57AQvIkF+n2zV9LfZWLJ0eneTwUZU8CRg578rF0phh8/wb506BBlqG8QWVhRK+WA==
X-Received: by 2002:a05:6402:2216:: with SMTP id cq22mr7495677edb.294.1597507977414;
        Sat, 15 Aug 2020 09:12:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:a7fb:e200:9042:5c68:7405:68b0])
        by smtp.gmail.com with ESMTPSA id qc23sm10051080ejb.97.2020.08.15.09.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2020 09:12:56 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Valentin Schneider <valentin.schneider@arm.com>
Subject: [PATCH] fix evaluate_ptr_add() when sizeof(offset) != sizeof(pointer)
Date:   Sat, 15 Aug 2020 18:12:53 +0200
Message-Id: <20200815161253.3397-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

For a binary op, both sides need to be converted to the resulting
type of the usual conversion. For a compound-assignment (which
is equivalent to a binary op followed by an assignment), the LHS
can't be so converted since its type needs to preserved for
the assignment, so only the RHS is converted at evaluation and
the type of the RHS is used at linearization to convert the LHS.

However, in the case of pointer arithmetics, a number of shortcuts
are taken and as a result additions with mixed sizes can be produced
producing invalid IR.

So, fix this by converting the RHS to the same size as pointers,
as done for 'normal' binops.

Note: On 32-bit kernel, this patch also removes a few warnings
      about non size-preserving casts. It's fine as these warnings
      were designed for when an address would be stored in an
      integer, not for storing an offset like it's the case here.

Reported-by: Valentin Schneider <valentin.schneider@arm.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 63a9390b5ee7..1839e35d039f 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -619,7 +619,7 @@ static struct symbol *evaluate_ptr_add(struct expression *expr, struct symbol *i
 		ctype = &ptr_ctype;
 	expr->ctype = ctype;
 
-	if (multiply == 1 && itype->bit_size >= bits_in_pointer)
+	if (multiply == 1 && itype->bit_size == bits_in_pointer)
 		return ctype;
 
 	if (index->type == EXPR_VALUE) {
@@ -639,7 +639,7 @@ static struct symbol *evaluate_ptr_add(struct expression *expr, struct symbol *i
 		return ctype;
 	}
 
-	if (itype->bit_size < bits_in_pointer)
+	if (itype->bit_size != bits_in_pointer)
 		index = cast_to(index, ssize_t_ctype);
 
 	if (multiply > 1) {
-- 
2.28.0


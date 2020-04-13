Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D291A699B
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731394AbgDMQQS (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731399AbgDMQQR (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:17 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E925DC0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:16 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a201so10161970wme.1
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7S7AQqOJ4TAMPOMVgkSGn7XiUGtrE4UuYrMyysCA7yE=;
        b=rwPecPAKZAPivXtWmAcCLekZb1fhkR4e5AOHzwyJUq58AyC9p94X4nE98kcmY/m2oy
         y+vi2Vyuawa0pgqhmsga0gCKoyZDBiQQCLfVxcLKSaMRcvH7NcrtFdVWxkpY5bs3ub0n
         B3ffbjnmtQd7HPsXFVXN8H73kvmphD+ZhtB6+F/YVmySp2d8Ax3Y89ZJKqAmzZ0hLtku
         L3hpomDGUDuECr4tuDQKrgaRDf9tM2JDXV2BazAuQ/KdVDx+qFkyFNurtxw3qCCjXjIT
         9Lm/tNthNnhXxz3beNOXLFvsBpJ+KcUKWD7ypD6yrqJbCkYgPGZWvJqy7ES/7ZbMwbGf
         RKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7S7AQqOJ4TAMPOMVgkSGn7XiUGtrE4UuYrMyysCA7yE=;
        b=r4w8nCU8BiWl5DCjyFx+As5l4x+griHobUOjhFfr/c0Q8pqL0cBdbENsvKNPfE9KUM
         7FK2PvrTynNyc4F4uKRGSpryk8bXrwERqWYZTo6DZZYnUl9Z+kXV2qQXMu7xiV618jgw
         hEdpa7QO8HOb0nbbP0WucpnoorksHRp0wj3UVN2J8514g5fogCd0mc3d6sXWB31UyQVR
         zBhrAEFexpFOQrI03/4wFW6ljRJs+9YI8xBoh/QkP5f85E+7GDeJBpXtkdNktsqZuS1+
         jSYKYmPbaeEkIX19Q4xUzlmpGwEVbeqAcXbjVcwIhLBEASdiRckdss/x+oAlrP78qPtD
         ZYtg==
X-Gm-Message-State: AGi0PubYPRfxZxlSZ98s/ffQJGFdM5RdCW/han5JvUx2u0r8zjGWTJSx
        VIz9djkdv+v2t+XHI6A2rsYfd3Xy
X-Google-Smtp-Source: APiQypJacwKAB2rwVeo0crrg9GXdVoPD8hyHMXr5LXqRWdez0gPZlkwaG8biz9SeA/RqffgaSvElEQ==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr19128826wmz.21.1586794575341;
        Mon, 13 Apr 2020 09:16:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:14 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 05/17] bad-goto: reorg test in evaluate_goto_statement()
Date:   Mon, 13 Apr 2020 18:15:53 +0200
Message-Id: <20200413161605.95900-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

No functional changes here, only changing the code structure
to prepare more incoming changes.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index b7bb1f52aa91..a432d243610e 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3741,10 +3741,14 @@ static void evaluate_goto_statement(struct statement *stmt)
 {
 	struct symbol *label = stmt->goto_label;
 
-	if (label && !label->stmt && label->ident && !lookup_keyword(label->ident, NS_KEYWORD))
+	if (!label) {
+		// no label associated, may be a computed goto
+		evaluate_expression(stmt->goto_expression);
+		return;
+	}
+	if (!label->stmt && label->ident && !lookup_keyword(label->ident, NS_KEYWORD)) {
 		sparse_error(stmt->pos, "label '%s' was not declared", show_ident(label->ident));
-
-	evaluate_expression(stmt->goto_expression);
+	}
 }
 
 struct symbol *evaluate_statement(struct statement *stmt)
-- 
2.26.0


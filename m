Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FFB1A699A
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731324AbgDMQQR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731394AbgDMQQQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:16 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6050C0A3BE2
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:15 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f13so10690714wrm.13
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7LF9AVcq2xtZ8oDZuvpLZnYN7G/B3yPhrOdR/NsgrC8=;
        b=i0DcbpJ8ptEEHnOzhRxZQL71s/yxFSXZr6WtI9+6jgdDlwGVO4Imy7/ER+jtgnFVhu
         sKTZnDKe1zIq3imFS7g7HeHNr8gtZd5/vM+qwA9qLindi6+1ezHrXi3btKowZhLnrkEK
         U4912qSZ6iSIKwOT0ByNdqbHpXGo1mxbFPVT9fg4fpBgHVxoqLPq7rtw3ortMFAWGwy+
         tE/5ohtoaLYbRS9o8EJSZM0ISqgf1LI8rO+PFhYI88R/PaAe3surZZrQ2QhIJI+gomDS
         mXdQ8IxgQvCoH1DdlEJ6G1v2U7XxkbEm2etPnYaCZ00lWajTgK9COfi+69WIJFr+f3LQ
         Zc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7LF9AVcq2xtZ8oDZuvpLZnYN7G/B3yPhrOdR/NsgrC8=;
        b=OfE554t4gMhLlgf53s6Mqyx1f4HS3W5cX1ufNekM3SrWwLMWvnDtCEKlYjlXkWY7na
         rTEnxuUzUqa1Fmh8BwCBQY9Id0LmqsaGuAgeH9zlkawI5opFi0RCkfni6m24BK9BQhTt
         bUgig6qgdreuernZYZSIqcZa/0ElTcY69sgvobB7WeuopYu/gCSmW3XJW8/aFCAxsi7I
         X5D4XPfxKpPUS95Q1v3hzhIZ5OEYGoOEWkz7rNq+45X1y5B0cLf5bG40JpWNUM+m9NWH
         0EA+dbkKzLn4ucS5ub6lF09FLk3xZqvmdAYLIu3kxK/iTW3KtlHPOmfObgq4xdJL2GOE
         XdlQ==
X-Gm-Message-State: AGi0PubGgeG3A7QNNeS6YTQaFQ3z6/bmtY6iHfge/Q4Cp7Ve5pmeZ5iI
        4E7pU2TrSH/CTU1FY6II5jX92TxI
X-Google-Smtp-Source: APiQypIp5ISNULxqCBCXE01cSUJfmK8sf0FQpBfuxY1AMfkBvh3jEVsnBcG+2ndshmKb95L166uwWw==
X-Received: by 2002:adf:9022:: with SMTP id h31mr18972559wrh.223.1586794574333;
        Mon, 13 Apr 2020 09:16:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:13 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 04/17] bad-goto: do not linearize if the IR will be invalid
Date:   Mon, 13 Apr 2020 18:15:52 +0200
Message-Id: <20200413161605.95900-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In some error cases, it's not possible to produce a valid &
correct IR for the concerned function. For exemple, if the
AST contains invalid gotos, the CFG will either be invalid
or won't correspond to the erroneous source code.

So, refuse to linearize such functions.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c | 2 +-
 symbol.h    | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/linearize.c b/linearize.c
index b040d345d469..222714564a3f 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2480,7 +2480,7 @@ static struct entrypoint *linearize_fn(struct symbol *sym, struct symbol *base_t
 	pseudo_t result;
 	int i;
 
-	if (!stmt)
+	if (!stmt || base_type->bogus_linear)
 		return NULL;
 
 	ep = alloc_entrypoint();
diff --git a/symbol.h b/symbol.h
index c86dfb335e29..de13d60b8b75 100644
--- a/symbol.h
+++ b/symbol.h
@@ -171,6 +171,7 @@ struct symbol {
 			unsigned long	offset;
 			int		bit_size;
 			unsigned int	bit_offset:8,
+					bogus_linear:1,
 					variadic:1,
 					initialized:1,
 					examined:1,
-- 
2.26.0


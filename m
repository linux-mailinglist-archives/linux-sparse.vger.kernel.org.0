Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49CE9200E08
	for <lists+linux-sparse@lfdr.de>; Fri, 19 Jun 2020 17:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391108AbgFSPEQ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 19 Jun 2020 11:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391070AbgFSPEH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 19 Jun 2020 11:04:07 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89F0C06174E
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:06 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id s28so7825448edw.11
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MPWCkyHwWQ53a4azwa7BX5F7K9HADZqogDZFLLqWvVI=;
        b=OO9PUKxo1P8kaK+1PCXVUrx4vZG0xHaYgW518mwSWbdo+8OnA50dbYk6ahKTl0WFMF
         4SsEHegenpWm3VD67ThwtB0lXbprE89icSn++Mf2kI49uBKPbLlknfD1KZTOxOqpHM/W
         2yXIIgZpTqksS0gOwK5F50BARFx4PVgWN71wIpz/sv8CzSHmnqNobCoMcx4MmF3KM4PS
         rOznnM6dwKPAYxEEG7f8JQRde4f94JPRa5uaFy2WO1emwm84jcKsSrRx/fzPYml8MfBT
         wk9xPVwYe/EDwZb1+hiQA20adIfMK3kZa8s6wn71fSsmrpq5or8hNwXTxsLzLfB2Lqcz
         86YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MPWCkyHwWQ53a4azwa7BX5F7K9HADZqogDZFLLqWvVI=;
        b=YPNnuDRKYVhed4Sk3kiPXVo+Dpk1HUgb1RmUGKSurr4tji61e5tIxV5e8AZcMj/I1I
         cXJCyYgQ4MV9I5J04EubeQNW3PDcslQP2Mk7J3dBmSi7oiNW5mqQ0YmF9tBbD3nRKh6a
         ZtsraHlYBSCz0V2x9HWC2InOE6XN/bE5LlqwYS+hI9ZmEMBIckruj0fIQ0mao8Q1/4tI
         NHe+bkAH3SSGhFpAU5lllXPrbwJPNBGvnmiOamFxRrDO9n1SwrlirFryoN2Wpkehet37
         TRd9BjzhEB6JBSw8LxKz/nvtrEKhMXpwguXZq6nLUClg2t+AylOYF2zpPo5xCzLP0uP+
         X8gg==
X-Gm-Message-State: AOAM533v1s6BjEYJmZfytHdpzlWpSjWxHmi+o077uSBwp75G5aUftcG5
        dBZk6euPVS6XipDgaZ9RB6rrUCrw
X-Google-Smtp-Source: ABdhPJxEvW28HR0tvI/yOQQ3YNQJU3xoYRZZ9Y90vYfXSsqkzEsPzU4TTzWUr9tQJQ58SuMc4JvEsA==
X-Received: by 2002:aa7:d7cc:: with SMTP id e12mr3704531eds.70.1592579045271;
        Fri, 19 Jun 2020 08:04:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5db0:70:8732:dad2])
        by smtp.gmail.com with ESMTPSA id k22sm4852307edr.93.2020.06.19.08.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 08:04:04 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/5] gensel: use temporary variable in generic selection
Date:   Fri, 19 Jun 2020 17:02:57 +0200
Message-Id: <20200619150300.63695-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619150300.63695-1-luc.vanoostenryck@gmail.com>
References: <20200619150300.63695-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Use a temporary variable for 'map->type' to make the expressions
in the following patches more readable.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 95aef4dc0758..cf40eed418b4 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3293,9 +3293,11 @@ static struct symbol *evaluate_generic_selection(struct expression *expr)
 		return NULL;
 
 	for (map = expr->map; map; map = map->next) {
-		if (!evaluate_symbol(map->type))
+		struct symbol *stype = map->type;
+
+		if (!evaluate_symbol(stype))
 			continue;
-		if (!type_selection(ctrl, map->type))
+		if (!type_selection(ctrl, stype))
 			continue;
 
 		res = map->expr;
-- 
2.27.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D827C939F
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 23:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbfJBVq3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 17:46:29 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46928 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfJBVq3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 17:46:29 -0400
Received: by mail-ed1-f65.google.com with SMTP id t3so503325edw.13
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 14:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhPzca6BGeQuqxwTpzGeAL/fS8pCBLkYe+hGV0kMSeU=;
        b=tcQkb2wQYz26d/CtE/6G9lqXr0fZHUhYCDv+FicDEliP4v84AAYLLV+Opwj/VjcfOX
         f5vr7Ke2MyZbGVkovt6VL1aAXJBIyetaQ+eOX5XHWOE1oIrirrbcACBeVqyvXdvyEbBz
         NP0wZJlTYqKdAF6UgTU22KORKcP9AM9Lsr3ndbQaWGwBk4Le+gXakVo3KBSDtBm5A/Ve
         kTAqXYzK1XTmjPh3s7Px1L7AhVNTscPD9O0TH30En0pgu8bLJhiCf+31Ie4CBp8onQQy
         hXgnfPs38tcieldUU9AztLtbNF3Sy9rodw9a0J78dv0qBhC+f4i+TIEGbGTg4PrxE9O8
         Qhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhPzca6BGeQuqxwTpzGeAL/fS8pCBLkYe+hGV0kMSeU=;
        b=f9ELHd9VpCXnk+ydcNbc9mWAh85A1J+T/hQk5f3DwDdQ8ovehd8685vvO/LA+s72Yl
         /3nLlFSGZzQTDzU6Qk93PL6zYfUFSUDvCjahEOoS06kVs+u1TJ0tG/Oidtp/+xfMVjxf
         CT1dWXajJlvPcXhQFlCV0gur3ak8ZmvYHVlFvROmhmuDNxwBdB8b9K4eyeIobIQKrszF
         +bFwonGYfNQGSvYx8s1ciMHa+2vRORtnDcCHjFpccxxS9S6GZDw3Rss6t/xzO1E/jL4T
         QukspkHlopl9zXH1nx84iSuFKEKCCXxo6NLWApDX6KCojF6o898ajJ0thdhZCFKp46bh
         3iBw==
X-Gm-Message-State: APjAAAVJ+FQcjQceG6T8zkyU5Sys2Zpj8AU5FnxcjVZYRHRm6YWfbKvm
        1mAIEe+nYDD2RpW+jK0l7VhfhUH2
X-Google-Smtp-Source: APXvYqwKDcL6jNgiLT02bo3b1VTC6HMoNSVj42+56+tGUOvliDrcQAYAtRQXGE6VDF5VScvgKwewxw==
X-Received: by 2002:a17:906:1248:: with SMTP id u8mr4988698eja.172.1570052787585;
        Wed, 02 Oct 2019 14:46:27 -0700 (PDT)
Received: from localhost.localdomain ([91.177.171.57])
        by smtp.gmail.com with ESMTPSA id r18sm75347edl.6.2019.10.02.14.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 14:46:27 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] asm: warn on invalid empty constraints
Date:   Wed,  2 Oct 2019 23:46:20 +0200
Message-Id: <20191002214620.61002-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Empty ASM constraints are invalid. So, catch them
at parsing time and issue a warning.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/evaluate.c b/evaluate.c
index 919c944cf..74c7fd1d8 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3503,6 +3503,9 @@ static void parse_asm_constraint(struct asm_operand *op)
 	int c;
 
 	switch (str[0]) {
+	case '\0':
+		sparse_error(constraint->pos, "invalid ASM constraint (\"\")");
+		break;
 	case '+':
 		op->is_modify = true;
 		/* fall-through */
-- 
2.23.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F30EF73B7
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 13:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKKMTw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 07:19:52 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33443 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfKKMTw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 07:19:52 -0500
Received: by mail-wm1-f67.google.com with SMTP id a17so11923507wmb.0
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 04:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1CJSH7ZZ7gHo3JrqDXPO+UnqCLaVHKiefps+CzH0YlQ=;
        b=AKH7oxyvVxmvD0qHWDwNmMovRB1vAkDLvUKs9AB37+ZncSENKp10glvdo7Bv7C24zW
         BGcEHy2/Qsta5ZrciN7kBm/IV+wXWdEMmcMJFDUEmKbjOjeDZROboXlmgU6CjxwbqYM7
         ChJbxHiNeCJkeKTjFqyyCiOaLD9sKEF7j4SvvQ5WHUtef6KM8MoJA2Bnr1Jj/VNaTotg
         BiUa2GaCtI/aEGmg9LcaB8xXAcTI3yMPnZfPRbIholq4iLmT9ztOYUQpij6m1GsVabSr
         Yb675+4uKHChrzIQ5gHirKnzJlxtGnJC6GmiTlOb9JSBsnenueaAjOk3F3HDsZVBuMVA
         GOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1CJSH7ZZ7gHo3JrqDXPO+UnqCLaVHKiefps+CzH0YlQ=;
        b=IInFES/CoKkqNDZ4TJzKX/lRZyN10j5JK7dY56XG+oEe7iSiztCaGSiks6oFQKfx9W
         YzqjgQD2ILaOMYyWIIoSTVOQKFRp/wLv+8oqKyOpuFzJFA2CqpOLXJsAT9xJVEEhGQr1
         a9m2IzprShFwruMwxSI5lzKZRZEPfeZcieLRbR1G1B4X/g7ocJ6X5Z57gZ1fx9VDTiaD
         x6QI2wAQYs8xCYJPD8FmqzZNvXn3ady041gb9HslJpU1+B9BaLr9Y/tMGqHpq+lqyzmB
         9QMQd8sMuVGkQ/8uZiH3rYaLQeQpGNEuDz3YbJuNmpIy5OT5GIFTjIKG3K71pfSqcCQt
         1nSw==
X-Gm-Message-State: APjAAAUT5d78fVdojmsAga/0iLM8bghAP5XuegGLNts5V5sB8tVKaWVg
        /dNRwQ6LyD7+OlSqdHTgb8IkcPEv
X-Google-Smtp-Source: APXvYqxWX27b20vr/0Udiqc0p1f79e8KrhViVdcOj8BQ7HQij/jgPRhgh0LkiLtA9/6BLwkra5TtqA==
X-Received: by 2002:a05:600c:24c9:: with SMTP id 9mr19574015wmu.137.1573474790017;
        Mon, 11 Nov 2019 04:19:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id j14sm16256478wrp.16.2019.11.11.04.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 04:19:49 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/3] arch: remove impossible case with mips64 not being lp64
Date:   Mon, 11 Nov 2019 13:19:43 +0100
Message-Id: <20191111121944.78498-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111121944.78498-1-luc.vanoostenryck@gmail.com>
References: <20191111121944.78498-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The code at the start of init_target() already take care
of making the arch variants match their bitness. It's thus
not possible, when setting the type of [u]int32, to have
mips64 with a bitness different than lp64.

So, remove the unneeded check.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target.c b/target.c
index 17bdb2544..e1f2fd5d9 100644
--- a/target.c
+++ b/target.c
@@ -102,10 +102,6 @@ void init_target(void)
 	}
 
 	switch (arch_mach) {
-	case MACH_MIPS64:
-		if (arch_m64 == ARCH_LP64)
-			break;
-		/* fall through */
 	case MACH_M68K:
 	case MACH_SPARC32:
 	case MACH_PPC32:
-- 
2.24.0


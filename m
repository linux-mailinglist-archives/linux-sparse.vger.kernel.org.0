Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EABC910308D
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 01:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727508AbfKTAKS (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 19:10:18 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54612 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbfKTAKS (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 19:10:18 -0500
Received: by mail-wm1-f68.google.com with SMTP id z26so5145028wmi.4
        for <linux-sparse@vger.kernel.org>; Tue, 19 Nov 2019 16:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EbcGdb2etypFKyYpg2YTuX8/FbDkZFv1slhFbefJcSc=;
        b=iqZI0K+f+zBoFsHwPAGhPZzIUXwHrAGcIJrLtsZWLPJ4Uk+hfy02vgd0RerWqpN5W0
         WIAsL+EJaNAyOB/3B8dBh78Vbl6KNdsC/NVosxhMKL26Yt0EDlZv9qKrwRZ+4/9WYe20
         gIcal/7A7LYjdtyZVLb6T7bcagCtY5nPDF4b9+G5A/JHMee+WbvaQkZexiF57qoOGfGH
         9LOZiwbmB2po274C3n6XXygUtmOm/opo7rzCskSJusiP7IWwYTq+u90UZobtkVkeu9eo
         MohCg9OIFsU/hrJ3UQRekFYoK1cERMEnoPuuA8yNjOTgKzCOhrULcmlXhH1a1ql9gdIZ
         oSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EbcGdb2etypFKyYpg2YTuX8/FbDkZFv1slhFbefJcSc=;
        b=jimedK7jFPC0VhLcnr+hMcDQACebsFIp0W5MllOyh4QeCp3Txr+92nEjwDaV1cf9ZO
         F4fl8be0sGN62cTA9yONpJvhfQ9kfRlj2dZzFZ09eF8f4dx7NUZ6+dpJTaYw6IPc1Ftn
         0BTfFpPc0mKBUh4opNBqNvIOHTCTVs36WVvpoM/+ddcrZC1VvulJP+A7IARUvEMHqYSd
         mbBgL3UXTNjEblhlnO83rTzAmyMu4h5l7TruZzwEJl1gCVisA1orvqlMgNQMsIeRToLz
         DBrKXwIfAURrkhYU6MD3OjyaqzACu7IWt5kKIBRN4LX1hLrOugVzu0msiTzYTQ4JHmCQ
         gNqQ==
X-Gm-Message-State: APjAAAUVYszNBeuoXM6YTTcgXF73DLY69Y251ma4BSWbbKOFv+PdA3hm
        kwqHV63QZNcurt4NZs8gIzRqpSsi
X-Google-Smtp-Source: APXvYqyCQYuFTJCKIT8m72bGqxIruA8dJRJHaVcMRjdeyzOCsRWR5+CUgy5ckY1AKWGUvPnivi/VuQ==
X-Received: by 2002:a1c:7214:: with SMTP id n20mr62547wmc.126.1574208615175;
        Tue, 19 Nov 2019 16:10:15 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:5dce:1599:e3b5:7d61])
        by smtp.gmail.com with ESMTPSA id c24sm33398808wrb.27.2019.11.19.16.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 16:10:14 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/5] fix assignment: pointer to __pure/__noreturn function to void *
Date:   Wed, 20 Nov 2019 01:02:21 +0100
Message-Id: <20191120000224.30441-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's fine for a pointer to a __pure or a __noreturn function
to be assigned to a void pointer (since this pointer can't
be used to make an indirect function call without another cast).

Ensure this by ignoring the corresponding modifiers when checking
such assignments.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index 7c3389cff..b9d3cfe3c 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -1464,7 +1464,7 @@ static int check_assignment_types(struct symbol *target, struct expression **rp,
 			 */
 			if (b1->type == SYM_FN)
 				mod1 |= MOD_CONST;
-			if (mod2 & ~mod1) {
+			if (mod2 & ~mod1 & ~MOD_FUN_ATTR) {
 				*typediff = "different modifiers";
 				return 0;
 			}
-- 
2.24.0


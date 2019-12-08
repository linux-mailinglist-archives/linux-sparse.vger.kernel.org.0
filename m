Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93207116419
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Dec 2019 00:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbfLHXWE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 8 Dec 2019 18:22:04 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34568 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfLHXWE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 8 Dec 2019 18:22:04 -0500
Received: by mail-wm1-f66.google.com with SMTP id f4so14107016wmj.1
        for <linux-sparse@vger.kernel.org>; Sun, 08 Dec 2019 15:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vqP2b0U7GK2jdTIr8nNB7+K+OugtjdhrzIT9yaeuwnw=;
        b=S19GhsPOPn1GN1hL040cfQYXQhynlws+X8OOGRUZiQgM7UYvTXHdqFGSsmFYFz/83v
         IduAfX1Ec3W+W7OEYPFO2xCzrbJvflNzqlloRdiDx8F2SW2cMWtiep/c+Kxah+rMMqZG
         OHpNbizN9rdYrQdwCczXeV67VUE7b06B+CzpcNlaXW0rdeV/ASw3TbHXX+nlOBuK4ke3
         L7gkXu/qzdqxPvb34urHrxgO8CZaYy59Mj8Vc4Q83schOiROn4RGD2Oq0Nn2IZhVoPiH
         IZI8I/2V2bfaSLYot371dY8mPPE0mgJtnJIfu+rAxaOiRHLZ4RwBJo2uE592nJ/c76lz
         UWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqP2b0U7GK2jdTIr8nNB7+K+OugtjdhrzIT9yaeuwnw=;
        b=biUVq5CYbFkLnJbz9Pg8qNZldnnhpy0+w/DVKA7hVuc3yVbi04EHdI8ZyvKHSBo2sM
         kxQlx5vr8PjaSIYhOku9bqFWmYa4cDn9LTH67yvWnQ2BaIS25D1x5VKg4JHQX117bgXe
         lKz0Rjd3vXGetwIRcSXcLkkcLX+nLkmmHAUSe5q8WJ54LQAq0M8ji0ScEogsViOWM9Fe
         7YBDd47mtR5sWSYpMvF1QoPRX0SVWNhgI/s7YDOJVhBDmy6Z4YsR5A/KzvL9MNFhZNw+
         3hekKlAW9fbXzY9GkYs2m5BN6k/DBppwEKOM6q9KNtMZi7S7NOIySuFW7h2EPV1Xfshb
         Xr5g==
X-Gm-Message-State: APjAAAW1Dwt8BEavbsdQ/GQ1PrVC84DU+igekQHRJ35KuUkWTRA9+Cgb
        yATYBSWe/r+OI1LR8+VPUGdq8/Y5
X-Google-Smtp-Source: APXvYqzEuDL/149yG1yxDAl9F1/6XZsuvo0MhV6nTldgZDeDrVyuQ8kIvak1Ps9F9XrW4j6J10XjDg==
X-Received: by 2002:a1c:e007:: with SMTP id x7mr20335509wmg.3.1575847321888;
        Sun, 08 Dec 2019 15:22:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40d5:8a00:61ab:d604:b478:87a3])
        by smtp.gmail.com with ESMTPSA id w17sm25377996wrt.89.2019.12.08.15.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 15:22:01 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/5] bitfield: don't warn twice on invalid width
Date:   Mon,  9 Dec 2019 00:19:18 +0100
Message-Id: <20191208231921.49964-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
References: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

At parsing time, bitfields with invalid width have their size
set to -1 but at examination time this size is interpreted as
an unsigned value, causing a second warning.

Fix this by avoiding to cast the size to an unsigned variable.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/symbol.c b/symbol.c
index fb14b624574a..6c1fb2a5195f 100644
--- a/symbol.c
+++ b/symbol.c
@@ -254,12 +254,11 @@ static struct symbol * examine_array_type(struct symbol *sym)
 static struct symbol *examine_bitfield_type(struct symbol *sym)
 {
 	struct symbol *base_type = examine_base_type(sym);
-	unsigned long bit_size, alignment, modifiers;
+	unsigned long alignment, modifiers;
 
 	if (!base_type)
 		return sym;
-	bit_size = base_type->bit_size;
-	if (sym->bit_size > bit_size)
+	if (sym->bit_size > base_type->bit_size)
 		warning(sym->pos, "impossible field-width, %d, for this type",  sym->bit_size);
 
 	alignment = base_type->ctype.alignment;
-- 
2.24.0


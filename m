Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7C0311F756
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 12:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfLOLGf (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 06:06:35 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46999 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfLOLGe (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 06:06:34 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so3648006wrl.13
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 03:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z0txDWXz8JOEkDKUOwgJZJqGR65GrXQosTkilaTkXXM=;
        b=ds6UMCR423x7F5TdWTqgzvmdInf/8d0ISp5tIHw7zN6E9fdCGqJRc+hlAigJSgWSxT
         zml5ybHeiIaAlVbmScIfoZvv/x6/01SdQSL8NKIhPTed/u0yNu04Bie1JzP39gsfpp9H
         1Ul1+uwmMD0UenjhSq0rDmEmWqJTHxZ57G0u4aE9WhHfPOyT6Oy0daiPjGFGD6VMDwDd
         +KynBgJMpSuyz5Qr+GBC8wldELTO21PlqJPyL5oXQvMA/9Z9XJFfttdh0A8/NRZpJ1uX
         ZeNZwYPkoqBEG5C1RZgBsD4vErxjYiumTnfcaSAj5Eq2h9gzq8ucwJUQIdBksqMDCYuj
         p9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z0txDWXz8JOEkDKUOwgJZJqGR65GrXQosTkilaTkXXM=;
        b=hrovqavNkZuSNbfciiF4JYhui/mYHuBQ3SHYGhkZap2eo3iLthvdAgsswqum2DBxI8
         BzddHjXFlPusf/PRFO8SD8/R+UQdlULi3pYfCapaRvKmfbrh+f1W5bpVpSsPQNBCB9n5
         EsjEndNrrcntaI7U3JujswrhUa7cBtuFRlppcaDnSXB8NWvQWRlBm8OPr15iOuwsz5MJ
         BfGSPJuJy7ZykbFXQ5dISx91gFZEA++B4Hfp9vCUYiNFIrcmdsqXsg80TzvlPMzAXCFz
         lioT3va04uiL3fSPyn3iDeobnW107B4seDeGeUoLKDKjj0CecnCqSBSScT2ZudmFGzQu
         qJYA==
X-Gm-Message-State: APjAAAWY3t9hukO61RR6E023RwxdipFZ35paFyLcCsJgypxMms39Ct1R
        lEdnVEfHGJg6vSVO6Z4fiXUb28CO
X-Google-Smtp-Source: APXvYqz1es6VFwgdAECPS4CpHxDddz++H9KUUZjAtck7eD7qJCmo4mj5YoxqPoPiNcCaPOo0paiYig==
X-Received: by 2002:a5d:4e90:: with SMTP id e16mr25288082wru.318.1576407992476;
        Sun, 15 Dec 2019 03:06:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:180:4f0:43c8:9084])
        by smtp.gmail.com with ESMTPSA id r5sm16760690wrt.43.2019.12.15.03.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 03:06:32 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/4] typeof: avoid using is_bitfield_type()
Date:   Sun, 15 Dec 2019 12:04:25 +0100
Message-Id: <20191215110425.76533-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
References: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

is_bitfield_type() is one of the few type-testing helper
based on get_sym_type(). But get_sym_type() test for SYM_NODE
and SYM_ENUM, which is not needed here.

So, simply test for SYM_BITFIELD.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/symbol.c b/symbol.c
index 46fe740b4cc1..ab6e9841696f 100644
--- a/symbol.c
+++ b/symbol.c
@@ -460,12 +460,12 @@ static struct symbol *examine_typeof(struct symbol *sym)
 
 	if (!base)
 		base = &bad_ctype;
-	if (is_bitfield_type(base))
-		warning(base->pos, "typeof applied to bitfield type");
 	if (base->type == SYM_NODE) {
 		mod |= base->ctype.modifiers & MOD_TYPEOF;
 		base = base->ctype.base_type;
 	}
+	if (base->type == SYM_BITFIELD)
+		warning(base->pos, "typeof applied to bitfield type");
 	sym->type = SYM_NODE;
 	sym->ctype.modifiers = mod;
 	sym->ctype.base_type = base;
-- 
2.24.0


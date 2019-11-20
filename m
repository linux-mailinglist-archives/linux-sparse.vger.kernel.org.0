Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6054C10308E
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 01:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfKTAKT (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 19:10:19 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34235 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbfKTAKS (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 19:10:18 -0500
Received: by mail-wm1-f66.google.com with SMTP id j18so3733881wmk.1
        for <linux-sparse@vger.kernel.org>; Tue, 19 Nov 2019 16:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iWlev8Slco83nSbbmpZ6MdII8C1/AKaY/7WsxuARr8M=;
        b=FKvZYVFsnGXIo5/LsmhCcBnsELYHBfDh8LnGyHEjSjkvsG66MfeHzvnsd8pWofqhtO
         j3HzkqgFHS4ykOW6Dr4+fWovACF5dmEbhrYLRComJZflA/Zl6hz5gYT2Uo+SH1lDbcJW
         zW59mp6n9O7RzoJA5CmZkeXi1qAyVz6hjtT5pwnnnHXatZIjbFQBvW4QTiVMiFyyE9Pi
         6SRo7PI6aUyT1FOrbcnrshPMmdXGum2Og99rBveudvYM5Vdh/kg/tMhCa1jvXKZkaBhY
         QPRt5964jtlp8HzvXBUlS3ygUlg9fPwKWmtAyS3YAS0Rj2ONip4wT9zLl5pALLS2vWQv
         NppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iWlev8Slco83nSbbmpZ6MdII8C1/AKaY/7WsxuARr8M=;
        b=WgxEJcYDy3xE79vdk5WD6LPoFXu2r5WZjeQfA8yDBsYeHB7XB3dm0FCTfp+RcClwXG
         jfW2wtEhi5up6YQUyza45jISXHt8cu05gVB4sLDcw5N8Q/xU/L+rcauJMk4d9ToZ/G3C
         NZsGloaaxGXwRpCCJgP0XIXQJ0RH2eJPd9uqy7mn7pMpnIxKd0PqLEPJHV1U+owemr+1
         IwnZiJ3vata4IPl0BtzmAWPVtyLmBDfo7cR59PilF2YruF5WaovcE7B1gibyHG7+Oqg9
         Kzgt9uLSEXVYqbAevaHAxc4NyocZURvE3HcZ9vHJrfbuAitZ5UlKB7tCVo1VV5SWwSTJ
         ngZA==
X-Gm-Message-State: APjAAAXuFr1FukyQMsN4qMJ4i/KHOIGcTVnqRkrKK4JDlpP6oDsJIsDe
        CPfR9G/RcJsfhAmRKjROtXCjSRig
X-Google-Smtp-Source: APXvYqxdAYS1geBZYv5mZJlbmHfnTlBrxP37XNP4caaeHuy+3Bbk6eV2IypMMd2UFddJnncM9knSKw==
X-Received: by 2002:a05:600c:cf:: with SMTP id u15mr76881wmm.60.1574208616204;
        Tue, 19 Nov 2019 16:10:16 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:5dce:1599:e3b5:7d61])
        by smtp.gmail.com with ESMTPSA id c24sm33398808wrb.27.2019.11.19.16.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 16:10:15 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/5] fix assignment check with function attribute
Date:   Wed, 20 Nov 2019 01:02:22 +0100
Message-Id: <20191120000224.30441-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's OK to assign a non-qualified type to the corresponding
const- or -volatile-qualified type (same for 'restrict').
For modifiers like __pure or __noreturn, it's the opposite:
it's OK to assign the qualified version to the corresponding
non-qualified type.

Allow this by using type_difference() with the appropriate mask
when checking assignments.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 8 ++++++--
 symbol.h   | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index b9d3cfe3c..863750fab 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -658,7 +658,7 @@ static struct symbol *evaluate_ptr_add(struct expression *expr, struct symbol *i
 
 static void examine_fn_arguments(struct symbol *fn);
 
-#define MOD_IGN (MOD_QUALIFIER | MOD_PURE)
+#define MOD_IGN (MOD_QUALIFIER | MOD_FUN_ATTR)
 
 const char *type_difference(struct ctype *c1, struct ctype *c2,
 	unsigned long mod1, unsigned long mod2)
@@ -1429,6 +1429,7 @@ static int check_assignment_types(struct symbol *target, struct expression **rp,
 
 	if (tclass == TYPE_PTR) {
 		unsigned long mod1, mod2;
+		unsigned long modl, modr;
 		struct symbol *b1, *b2;
 		// NULL pointer is always OK
 		int is_null = is_null_pointer_constant(*rp);
@@ -1471,7 +1472,10 @@ static int check_assignment_types(struct symbol *target, struct expression **rp,
 			goto Cast;
 		}
 		/* It's OK if the target is more volatile or const than the source */
-		*typediff = type_difference(&t->ctype, &s->ctype, 0, mod1);
+		/* It's OK if the source is more pure/noreturn than the target */
+		modr = mod1 & ~MOD_REV_QUAL;
+		modl = mod2 &  MOD_REV_QUAL;
+		*typediff = type_difference(&t->ctype, &s->ctype, modl, modr);
 		if (*typediff)
 			return 0;
 		return 1;
diff --git a/symbol.h b/symbol.h
index 516b61361..2465d6d88 100644
--- a/symbol.h
+++ b/symbol.h
@@ -253,6 +253,8 @@ struct symbol {
 #define MOD_TYPEOF	(MOD_QUALIFIER | MOD_NOCAST | MOD_SPECIFIER)
 /* modifiers for funtion attributes */
 #define MOD_FUN_ATTR	(MOD_PURE|MOD_NORETURN)
+/* like cvr-qualifiers but 'reversed' (OK: source <= target) */
+#define MOD_REV_QUAL	(MOD_PURE|MOD_NORETURN)
 
 
 /* Current parsing/evaluation function */
-- 
2.24.0


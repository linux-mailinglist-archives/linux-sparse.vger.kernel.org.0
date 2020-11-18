Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF4E52B865D
	for <lists+linux-sparse@lfdr.de>; Wed, 18 Nov 2020 22:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbgKRVL4 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 18 Nov 2020 16:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbgKRVL4 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 18 Nov 2020 16:11:56 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7928C0613D4
        for <linux-sparse@vger.kernel.org>; Wed, 18 Nov 2020 13:11:55 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id q16so3518374edv.10
        for <linux-sparse@vger.kernel.org>; Wed, 18 Nov 2020 13:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=diwXHAZLBE0IQzWJ276Ed2JgGJSuVV259wDFXcX4CVY=;
        b=M8YBfKipFLd9vmcXywPnPEnkWbKUE9X3JAxXCRY2LdyO7R9Qt+c1x1uGp4Dc7c1oTI
         +kTfeHlC9sqdrgY71f2XA/zGsJ5u+isinzLvb0wPdnosMFiX4C0C3uh9WEq5yWTtt6Hn
         yX3Y6kKEBgTbew54qk8GSYR4p12q2FIPaSyjfL7ypfU6NHgJGPzAUwvo0UcoRNGgXCO7
         EBAyEWYFhe9EnKKDoXYkHWX3Xeg7rCV3wFzMqDFui3OL5+9DwVNETVQ/ZjLoJLOf0PIa
         tsh7ia0i1WazOAIx7e0LBjezchIf4rI+pMJ/IpNrUE67osej89Vd2zHon8PWjHZzvgYG
         izGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=diwXHAZLBE0IQzWJ276Ed2JgGJSuVV259wDFXcX4CVY=;
        b=kD+Qj677cQyHMszZ5tRpujIeZPkGqfwPSnknX6BJTZU0jF+wCwWZMpIwFLEO13uz+E
         +8KGN1qcELtPYmS2tSrWAh9+1U//wn9FjSSANKJOIJ+KiHWxQkfKSAnDbh0tR+at1egC
         pF3fcjZVQnd2ChL1OoCx1r3x/t/hvQmEzMbztdLrVBM+OEq+5DBkGmT9ewY7zV1aF90o
         9MUFCMo4aP6ETUpnUEDc9rOYwo4PqB9PEYytmcOcvSFhkvMIvEegTyO28VjLqZEJwoUo
         fP3sUGifQR5bR8ihnfbxsgSRqpu4pdSauKvot3pYl5LH9pwh0hdanz6umtkn51DyNGQC
         DWDw==
X-Gm-Message-State: AOAM530IjGyJmVC1LgdMBNScPd2b5ADKyXkvht1c+gKDLuk+KmFdVvD5
        VNuh9rdvmVJHweTDL3aFML/3MaVAA0s=
X-Google-Smtp-Source: ABdhPJw/7CxVuX6vxYUPllXmWE96M8YlVSMpRJNP/sN2oy+XMOoGo5pVnYT2nIt2/v0h5LogodFcqw==
X-Received: by 2002:a50:a40c:: with SMTP id u12mr14871266edb.337.1605733914229;
        Wed, 18 Nov 2020 13:11:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:491a:3e51:301b:6e24])
        by smtp.gmail.com with ESMTPSA id rp13sm13510712ejb.79.2020.11.18.13.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 13:11:53 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/5] unqual: comma expressions should drop qualifiers
Date:   Wed, 18 Nov 2020 22:11:45 +0100
Message-Id: <20201118211147.10680-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118211147.10680-1-luc.vanoostenryck@gmail.com>
References: <20201118211147.10680-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Comma expressions should be subjected to lvalue-conversion
and thus should drop qualifiers.

Fix this by calling unqualify_type() after array-to-pointer
conversion.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                     | 2 +-
 validation/eval/unqual-comma.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index fd84205c7f2c..b6e8477185f4 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -1028,7 +1028,7 @@ static struct symbol *evaluate_binop(struct expression *expr)
 
 static struct symbol *evaluate_comma(struct expression *expr)
 {
-	expr->ctype = degenerate(expr->right);
+	expr->ctype = unqualify_type(degenerate(expr->right));
 	if (expr->ctype == &null_ctype)
 		expr->ctype = &ptr_ctype;
 	expr->flags &= expr->left->flags & expr->right->flags;
diff --git a/validation/eval/unqual-comma.c b/validation/eval/unqual-comma.c
index e06586cd43e3..11546d22348a 100644
--- a/validation/eval/unqual-comma.c
+++ b/validation/eval/unqual-comma.c
@@ -9,5 +9,4 @@ int *foo(volatile int x)
 
 /*
  * check-name: unqual-comma
- * check-known-to-fail
  */
-- 
2.29.2


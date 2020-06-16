Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313901FC09D
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 23:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgFPVES (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 16 Jun 2020 17:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbgFPVES (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 16 Jun 2020 17:04:18 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE75C061573
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:04:18 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y13so23259887eju.2
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3ZoLeQ8nsOkrX2b/9gHq8xw+n1DDhp+0pQFopadGcU=;
        b=P2K2FIXU4fdEBUDHvbm5zbBEXtYCHZGETNGtqbrNrJBnTitIuTh/akt15jU18VlLcq
         TIIEdNA60NlSyqAOAfigEWkIRNGM1RzWpiogg4Xa3NA9IYsyEfw9wdhKDlHD0xVhVrNz
         7i6BofpFXaAbYdoDvV3XltmBMTkNLTpCu7HfKYQzCDp/fPM3DUAbpl61r0tpJ7ATQp5s
         5MVmkj1qrO7QEm7wdr8N8HMdCa2zan4M5OpstxRLjZBaPu/w96npSpliyDBTFuZCkgSi
         +APsN7+G7IR9CAlPh7C5X1rEq2gEgpEDUo3wvqtAAgE4Z5CapiDLMhvyhfscwRnC+brE
         hZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r3ZoLeQ8nsOkrX2b/9gHq8xw+n1DDhp+0pQFopadGcU=;
        b=VnlA50SJTygbgp+BFbRCSxPaMmPX9ukFTiVA+l6zrt9eBDFwd/S1gSJN4sOW604U3w
         khozpXXJcNfpt9qCR3HDveRqqaEtgagqwtyb9Bxk8dJNyelSOCLiVsKK0Dkw71Rejzfx
         284P2eRfGoifixl2zutBY5YbmGHhhIBaPHpCLICkA4zVO9oyLWZJlBY3lafeHOwKDX+x
         7ROnBRDpcAvS1uT53OptL62STT9oDGBaP+u8EQZXYdnf2sOlVpv5WfsRBr5riILGhFKp
         3OjJtazObJWpaFJhiyGwisqzDhJHXs4v/SU/V42EEIvpg7bKsaPoSVI36KDmPX5VYRlQ
         4Bcw==
X-Gm-Message-State: AOAM531zzwKOM6/C0aQtwIlHYmT5F3xpsIocqKyKnLhVoxYbE+SuKmXc
        JdWWGXgGjZfcL4Sm9k5JyqHn7OSb
X-Google-Smtp-Source: ABdhPJwzUZXO3PfutwuJ5oCE87DxQrLlUThdJNUHW/PbzMTQ4jpoOuLJlQc9kVxVTSrQQmJebdaY4g==
X-Received: by 2002:a17:906:805a:: with SMTP id x26mr4748108ejw.458.1592341456731;
        Tue, 16 Jun 2020 14:04:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5034:6797:70f1:e20a])
        by smtp.gmail.com with ESMTPSA id lx26sm11705583ejb.112.2020.06.16.14.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 14:04:16 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: reformulate an item in the TODO
Date:   Tue, 16 Jun 2020 23:04:13 +0200
Message-Id: <20200616210413.77884-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

One of the item wasn't even grammatical. Reformulate it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/TODO.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/TODO.md b/Documentation/TODO.md
index 64c1523cdbd0..e2043e481f99 100644
--- a/Documentation/TODO.md
+++ b/Documentation/TODO.md
@@ -84,8 +84,8 @@ Longer term/to investigate
 
 	"warning: Variable length array is used. (-Wno-vla)"
 
-* ptrlists must have elements be removed while being iterated but this
-  is hard to insure it is not done.
+* ptrlists must not have elements removed while being iterated;
+  this should somehow be enforced.
 * having 'struct symbol' used to represent symbols *and* types is
   quite handy but it also creates lots of problems and complications
 * Possible mixup of symbol for a function designator being not a pointer?
-- 
2.27.0


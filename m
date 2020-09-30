Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9DA27F617
	for <lists+linux-sparse@lfdr.de>; Thu,  1 Oct 2020 01:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731863AbgI3XlX (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Sep 2020 19:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731217AbgI3XlD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Sep 2020 19:41:03 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EDBC061755
        for <linux-sparse@vger.kernel.org>; Wed, 30 Sep 2020 16:41:03 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id e2so1158428wme.1
        for <linux-sparse@vger.kernel.org>; Wed, 30 Sep 2020 16:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmH4oJRt2f85TVas9Da1K2wdzSVZOZTSleRSyc5LD70=;
        b=AtpD+icM2M5wN+1uxgg+F8Ooxxz+4KmvfUTFBdR2Y13F2LgCMS/l7NACQ982mTsc2b
         g7N2hxk5OIS8c4psprIf8wMhd5jWOzHwGIVA9cT46DzJxtof9apsgrLUf15Gm6CVq8Bm
         xu1SEtesQUj8N+CEfIXjxu1P6jBa2WdL8lnb2bRIevI4CoRiVJojFbzvnfRM4koiF/NW
         kzy3mQcIv8Jp0/Ba4WwXZYyVMGUDxeuKIOVyciFjpeovcvccvX8wIWHUK1SaG4EXSLWS
         UVgdehPjBtgsEdGGo98Hq2Uj8BRRd0c3nUMm/ghqLPeCCEc0wsBr9qmF23UHIRkwNgDW
         9kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jmH4oJRt2f85TVas9Da1K2wdzSVZOZTSleRSyc5LD70=;
        b=gIIsIhJtzGA1s1jAH/t9wVEUYZz6ZKYMMoX94KcEgUiwDVb9ZKdtHLSwONedBqMedn
         rgv42Wrc8/DMztd7AKrM0UISKFav7FWbk77kQiW43Qf9l7ctH/3UocW4jVm/EISG4X8a
         aSzYodP3dUrANWFgS2g/E0xbXTS4KRpgWNzkBJiz0QKMm5RO4srGVrsW9iGnH8CgBZ9G
         blbsk8eMhie1FISNGoLILtQhLE715Ec58feNAmpDhItVgDTh8w91LwbzNYyPMLKLaP3S
         jpCqESJBHknefunOnLwVcPdoeZKLy/HYq89jBiyo/xJnweWinxtiVRxSnKPZ0xj5wO3s
         fIjg==
X-Gm-Message-State: AOAM531HYPeUAeZC+iGhPyTH3PSb3A5Jyf2UAlGeP+/XIb7hynsN9/ON
        IqUwC1TwmNnnwAjM/nlhztqTjtpZTeI=
X-Google-Smtp-Source: ABdhPJzStfHzFehYOK+koqA20fFuORDvSjxtGJyZ6MnrvFFzUtmBlcUG93X5FsK/URBvYamGc0HOpw==
X-Received: by 2002:a1c:2d94:: with SMTP id t142mr5332461wmt.74.1601509261999;
        Wed, 30 Sep 2020 16:41:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:d0c8:dbcc:51b0:75b9])
        by smtp.gmail.com with ESMTPSA id t4sm5934615wrr.26.2020.09.30.16.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 16:41:01 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] testsuite: fix erroneous comment
Date:   Thu,  1 Oct 2020 01:40:58 +0200
Message-Id: <20200930234058.67157-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/optim/canonical-mul.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/validation/optim/canonical-mul.c b/validation/optim/canonical-mul.c
index 3ae9e3a64c0f..0c14226faaaf 100644
--- a/validation/optim/canonical-mul.c
+++ b/validation/optim/canonical-mul.c
@@ -7,7 +7,7 @@ uint xtc_umul_ytc(uint x, uint y) { return (x * 3) * (y * 2); }
  * check-description:
  *	1) verify that constants in mul chains are
  *	   pushed at the right of the whole chain.
- *	   For example '(a * 3) * b' must be canonicalized into '(a * b) * 1'
+ *	   For example '(a * 3) * b' must be canonicalized into '(a * b) * 3'
  *	   This is needed in general for constant simplification;
  *	   for example, for:
  *		'(a * 3) * (b * 2)'
-- 
2.28.0


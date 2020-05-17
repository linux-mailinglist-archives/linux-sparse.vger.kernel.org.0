Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415241D6E08
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgEQX12 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgEQX11 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:27:27 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74EDEC061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:27:27 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id i15so9663413wrx.10
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/EO466mfXPDQZcbTG2kIBF5PZ1kS0xbfJb/GK0jUv84=;
        b=KFsUXlNSLp+Ntj3cnqk3FluUgGRx8JCwcO5dQ/7JUE9dmKc8IhmGSLYMzm/zSo89Mz
         BNZG4ILjPHAYFwWnufeO00BE+G+fAn8WHdJxQp+jVmSzI32nzM7tK2Gz1Abi5wKqMreb
         myfgGi6Ov7nNhat9D4euHiOtl9UsNV3qqBOIg1O9xX4DUx/m/kApkjDCPNVGfdhvuSiW
         bKthflP7yYMjXx9uAfwnOAB/AKd2Xkyn9qJYoMaefEC6O2Y7Eu+ZouKYxnAUK06jLVOD
         dBN9zyFXUM4C7bGka2H7Ll6U8zYbvsoR/iii18ae05LKHABn+VrITwUORDR/hybv9yc6
         Y2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/EO466mfXPDQZcbTG2kIBF5PZ1kS0xbfJb/GK0jUv84=;
        b=JiDRSv/ytKhD7Ovhz+NOy0Rx/LPnkkB3rCSp54NCNfflg0IusuHo28P9zPAr66NdLy
         BJzvd1jHtNaD+FvgkgxFq2+iGlGjf0JjHYd9h/HIs77IEdamYjkDiC9UBkvYEPM2ViGL
         Vyc3483bwXBwcmtE9rF+VszWbAjwOcMEM0kxnCzXd0H8KYU9yVGYx8KQOjApDyfbgeEt
         C1gLB/9Ktev9lzfwsfp+uAOpYObJMGxlmtk11lna1TpawGruUwmrsdtsQ/zpXc4pBQie
         Zagr9T2PktNGFfx/PVeXxXFldVmSUw/dFm1LJdSNBhvc/qgLzgFbt5ZCLE+M/HlLPl7X
         6OSA==
X-Gm-Message-State: AOAM53186RwIMsPWpD3KIZjGNpYO/LzB9qauC8LHLJVHNYOteeDw+4ll
        6nWiM+wVf4DzhgvuV5l69FWtQ6JN
X-Google-Smtp-Source: ABdhPJxe+K1PYruDZh5nsT5v5zSupLAbx2GglskTUTRe/gndl9NbdbLnGqSdabqY3G74N5X1b+FDSA==
X-Received: by 2002:adf:e4d0:: with SMTP id v16mr16488311wrm.294.1589758045878;
        Sun, 17 May 2020 16:27:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id d9sm14056278wmd.10.2020.05.17.16.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:27:25 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/3] doc: remove done item from the TODO
Date:   Mon, 18 May 2020 01:27:19 +0200
Message-Id: <20200517232719.1789-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200517232719.1789-1-luc.vanoostenryck@gmail.com>
References: <20200517232719.1789-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/TODO.md | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/TODO.md b/Documentation/TODO.md
index 31826df33aae..4344a1dc9b0d 100644
--- a/Documentation/TODO.md
+++ b/Documentation/TODO.md
@@ -24,12 +24,6 @@ Core
   - add the sym into a list and
   - recalculate the addressability before memops's SSA conversion
 * bool_ctype should be split into internal 1-bit / external 8-bit
-* Previous declarations and the definition need to be merged. For example,
-  in the code here below, the function definition is **not** static:
-  ```
-	static void foo(void);
-	void foo(void) { ... }
-  ```
 
 Testsuite
 ---------
-- 
2.26.2


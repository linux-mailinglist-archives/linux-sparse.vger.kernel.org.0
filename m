Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5951F9D9F
	for <lists+linux-sparse@lfdr.de>; Mon, 15 Jun 2020 18:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730135AbgFOQk2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 15 Jun 2020 12:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbgFOQk1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 15 Jun 2020 12:40:27 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3526C061A0E
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 09:40:27 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id f7so18154165ejq.6
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 09:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BgEtV+T7DHfTuptEBiWtJG8NpgOmEM8aoYHy+jgm52c=;
        b=rR3+mKAU6Zt/gXuH7QWTb30NQKzQDd3KJvRQwJdRbkGEyOpdc9CpT5ig9sM7XbkenL
         sFzUc0pLhl91S9f8oDbt//qfA9K78Haxyoay7LSC90p/v7nnxYZsqw3Z+2Po1L20kHj8
         GeZwAdBckl/3bXmzNGBkus6+edwV3xAqrTMAsegr4SaLJZUuIIUZl1r2H5GbvbgVs9eZ
         11+iPTkTynWM102PJ8KTAnmae5G2uXZO4LfthMrLNvNb8rjx/zRHem3011W4GhM1vXzB
         sZ88+tO0tCG582Pvuc9VA7Q4E0sVOCapJIuAI2Lhv3+cTA7s0zLDAC9ip0WJ+3QSpF3T
         7VTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BgEtV+T7DHfTuptEBiWtJG8NpgOmEM8aoYHy+jgm52c=;
        b=jnkafTYLPpSRzARMTg5fih0l+kA8+g7u64noVts6t7B6e9RC+0lyycaKdCxsnuSu+1
         oXwriOM1R7+p67tIwAuNjohdvsNK0ublCGSP17ORiCuMVoPj+irjzLL4XszrhY6iGBDW
         mtL1vy8ofKnKaSDpEifRZ2951IOWjdQViGcVT9FWNKnLTjeeG+Qdlh1DYbdQBiKmUEAG
         maAiIln/zq191AIqwo7SNKwbaOh5PahvEfbz3/ii2Rn+e4kbgBb/wAqX6+psSp7A7Vhn
         RmmoVrj4LtcqssUs5ZdL2eaT/XneW+wsUfCLoS+xhu8pQH2UrShjF3XHHMI0y01THt0c
         i1XQ==
X-Gm-Message-State: AOAM530FOEghSoaOelBwgcDj4OhPtkg7cI9pxxhPKLTSFHkVAjWdY6pr
        yxh8hDw4ZbiVB1kK4z7ZKHHZQ5hX
X-Google-Smtp-Source: ABdhPJyt626ZtGJ6j2o5tZBiAnGiweqRSSVHIeZ7kfT6NBqMwx/deCWDDaqGVHXrbhmjMCY9OuYkZQ==
X-Received: by 2002:a17:907:20db:: with SMTP id qq27mr25766592ejb.232.1592239225499;
        Mon, 15 Jun 2020 09:40:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:2438:c4f9:4ba4:a33e])
        by smtp.gmail.com with ESMTPSA id 36sm8726143edl.31.2020.06.15.09.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 09:40:24 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: minimal version for Sphinx is 1.7
Date:   Mon, 15 Jun 2020 18:40:22 +0200
Message-Id: <20200615164022.59492-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Because of the changes needed after the removal of the obsolete
sphinx.ext.autodoc.AutodocReporter, the minimal version of Sphinx
is 1.7 (the first one containing switch_source_input()).

So, update this information in the conf file.

Fixes: b741a793e63c0fd4a333cd575ac2339f5a9b2698
Reported-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/conf.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 90583908c5ed..bd2532f7c777 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -21,7 +21,7 @@ import datetime
 
 # -- General configuration ------------------------------------------------
 
-needs_sphinx = '1.3'
+needs_sphinx = '1.7'
 
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
-- 
2.27.0


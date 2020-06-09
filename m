Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D121F468A
	for <lists+linux-sparse@lfdr.de>; Tue,  9 Jun 2020 20:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732107AbgFISpe (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 9 Jun 2020 14:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgFISpa (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 9 Jun 2020 14:45:30 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008C9C05BD1E
        for <linux-sparse@vger.kernel.org>; Tue,  9 Jun 2020 11:45:29 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o15so23521948ejm.12
        for <linux-sparse@vger.kernel.org>; Tue, 09 Jun 2020 11:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=05jE+VRCzcGausP6xeH6NmBEiIDHmMKq1isC28GZ734=;
        b=BpPGtnENRiMs5IRtvFDlQPlPhclDgg7hLMF1eOyArz0qDN3QULNbMvXaDPFWkyVZY7
         Rur1S7cEw/oO6yXu2ALTuFxqTEAl0vPz2oNySkGMeZT2GlgTbz8Vj8Oof0CK3zwvlN3X
         2UfA5AT98H4rij8cLwhNW2eJ3qe4lqGavFTMu9YxGAci6EgycFyG6QDDh0eXCpRlf5/g
         w+Cctwkd+FmIPFE89AG1h8hi+IZIux/XyIHh8emcMguxRrFj48SfuCT2/5CJenqN2ktQ
         0KW+1qm+DvDRJ7xL57+kRmzJ+XCRnV3vR4VpTNrQOplcGnCpd6ZxgpkxEd0yJabpYogq
         uaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=05jE+VRCzcGausP6xeH6NmBEiIDHmMKq1isC28GZ734=;
        b=QHj4trIZzyQqb486pxuzvmRks2VZSppVCoQPvbl7+7qztu+kZHu3veFi3p3num6/d0
         GX0I5G+SSAVecjnb/75qVKhw+4ZJ62Vf+UEEYsgd+gpcTBYoXUCXvewvPz8zY9169vER
         Ecgzr/MVpXNO9yJEHMuwXmoHQwUM8k2zyjpqDhWRUEqIYR2fPZ9law4kSkBPrwILEfGd
         eq88dTFm00MqWk853Qf+iJ2j7IbW6MQxT3xvGwJRZfjyhrECK2mk2qs/cRBWdDjsz0U4
         0ssftC5hHtkuCD43e+hPbQNzjvrI9v+IyYo4vs8c++3i7kFKzjKzbaA48UVui1/g0wef
         HaoA==
X-Gm-Message-State: AOAM5328fcrhm25axS3OAyecbvQojNxUOCn2dZGbnNi7AU2FW3hYWmPF
        iOVflpm4g6ecDZyxbTR2cz+YBATY
X-Google-Smtp-Source: ABdhPJxtmq2AE6kXzcjt38NhtMHiX+Y2oUM1b40r7MTK8Pv34dhUj1n58r5KiHtBl4cyKE9II5am3g==
X-Received: by 2002:a17:906:1f15:: with SMTP id w21mr24905841ejj.265.1591728328413;
        Tue, 09 Jun 2020 11:45:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:ec72:5ff4:b4be:67ba])
        by smtp.gmail.com with ESMTPSA id p26sm14679916eds.57.2020.06.09.11.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 11:45:27 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Era Mayflower <mayflowerera@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        kbuild test robot <lkp@intel.com>
Subject: [SPARSE PATCH] nios2: add declaration for __builtin_{rd,wr}ctl()
Date:   Tue,  9 Jun 2020 20:45:21 +0200
Message-Id: <20200609184521.47758-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609151329.GU23011@xsang-OptiPlex-9020>
References: <20200609151329.GU23011@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These 2 are used for the kernel and the lack of a
declaration is causing problems.

So add the declarations for these 2 builtins.
At the same time also add one for '__builtin_custom_ini()'
since this one may also be used in the kernel.

Note: a better fix should be to move this to target-nios2.c

Link: https://lore.kernel.org/lkml/20200609151329.GU23011@xsang-OptiPlex-9020/
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 builtin.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/builtin.c b/builtin.c
index debc22c036ec..5ed17700d422 100644
--- a/builtin.c
+++ b/builtin.c
@@ -613,4 +613,9 @@ void declare_builtins(void)
 	declare_builtin("__builtin_bfin_csync", &void_ctype, 0, NULL);
 	declare_builtin("__builtin_bfin_ssync", &void_ctype, 0, NULL);
 	declare_builtin("__builtin_bfin_norm_fr1x32", &int_ctype, 0, &int_ctype, NULL);
+
+	// Nios-II-specific
+	declare_builtin("__builtin_rdctl", &int_ctype, 0, &int_ctype, NULL);
+	declare_builtin("__builtin_wrctl", &void_ctype, 0, &int_ctype, &int_ctype, NULL);
+	declare_builtin("__builtin_custom_ini", &int_ctype, 0, &int_ctype, NULL);
 }
-- 
2.27.0


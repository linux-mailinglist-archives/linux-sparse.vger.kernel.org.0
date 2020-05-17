Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC7681D6DFE
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgEQXVz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbgEQXVz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:21:55 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E703BC061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:21:53 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id j5so9745526wrq.2
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JY258YOT+HFXk5UjRflT+QgJyksA3xkAN45842TxMWI=;
        b=ZKSmhsIip06u6OPiIF9kNLUdXC+2c3pbbV2R75RTzM9yZgsCDIbBFrtmOmq4dxiCAd
         6veMIW0KgXUyDnHzXSNZtg3EoTajNcG8RW0JA1IozsUcSTsWHY79I8fi5QO0ttDolf6N
         MFJMRFK8EK6DVBRSDnEoNS1HDf6kQwy3vZ4lzsn08i7eEwE7tU0R1ZNy2x5ZurqJ6GJh
         5JHDmxFPcDpAXMRzmzcbLZiW9f+QP2LlZNKt+Nx/Ah8kMntmZrJqe1VmMN9lTkhnIbtX
         50xJO/LJzM6wix27Y1Qtza6VPP2IJlNfDCQn7P8ZnpF/9WsysBxGssbUU9fcCD6fjjq7
         JjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JY258YOT+HFXk5UjRflT+QgJyksA3xkAN45842TxMWI=;
        b=tN6n0h4VhZuvM9O9lRULGIaAs/7ZR6TsIS1hfoAYaAshOBc5/KYR7rrrQ/RafZkNo0
         cwuIYKsVNwbU6djhdQNY14pMUWT7U3rF8quvOXPR2gNOcou59wgVieacfZmhmcmh4/sj
         9LJgJrGjolxxOWNwlnewU2PlAcx3By1j4erel6OYVAX4dcXL+dVfXYFuh2Fj02OprDWu
         pkwOTNQfwi7PAGGLYyFsZYlQlsJdq53ampqHimMR3yfpDQQBRUdjHRekUhy1f3pn22lY
         6/H4pr4Zz60ZuxvlV31lRhCkqLM6RnzL3MgoFS5vTb/aaX0UMFGZc6C0Oav6sTJWL+G+
         lOtQ==
X-Gm-Message-State: AOAM532sFsBco5h03RBqpkRnwRonQj8x8UbOC8ONgnoBKNp4IKfWet/o
        +OhxiqjiG8DhYZwNs8dxUF3DxyPo
X-Google-Smtp-Source: ABdhPJxt+SINL7iqFNXct+qfVMFqjpuqJPd4XAXhfbj0uMcrxlJwFMvyOBUzW/Z1B2LwfrjmZYlqBg==
X-Received: by 2002:adf:f207:: with SMTP id p7mr16281905wro.20.1589757712385;
        Sun, 17 May 2020 16:21:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id 205sm11527818wmc.12.2020.05.17.16.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:21:51 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] misc: fix typo: s/OS_UNIX/OS_NATIVE/
Date:   Mon, 18 May 2020 01:21:46 +0200
Message-Id: <20200517232146.1710-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 machine.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/machine.h b/machine.h
index c55e3f1badd4..9c17dd6aa620 100644
--- a/machine.h
+++ b/machine.h
@@ -113,7 +113,7 @@ enum {
 #elif defined(__sun__) || defined(__sun)
 #define OS_NATIVE	OS_SUNOS
 #elif defined(__unix__) || defined(__unix)
-#define OS_UNIX		OS_UNIX
+#define OS_NATIVE	OS_UNIX
 #else
 #define OS_NATIVE	OS_UNKNOWN
 #endif
-- 
2.26.2


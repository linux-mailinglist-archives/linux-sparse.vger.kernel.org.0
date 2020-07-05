Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C5A214CA6
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgGENQN (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgGENQN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:16:13 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4780C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:16:12 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id lx13so20953869ejb.4
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=djRCi90v2STqbVx2hk4u7EGjBQ1YnyXlN+7jgcqK9CQ=;
        b=E9wGCdX7pCKkJM7SMySG2FXNQf2Hx2a5S2Zr1FeZoFIGNi9gGnPiAl0cK4Nw8ALRix
         wuPJmf/QbsJ7G+nVTdKNBx+7djIyibGMxRLbRJMcvRaQ7nxKL3CPe+gOZcGPSdwjoqsw
         iXqXCuDJDyH3fFnx9wkSAe+DMcjcWBGuN33Wi4usJmmQ1yuZKVwSu4fscwKV3moTYixR
         ZzApz3R67Rl6BxHG5RpP+/8ryCI4QUKPabeD5ZawhuyzRgLFhpzeI2uNd5qrAxsSbX3L
         /KvTmmEHci+S/J8jlWHp57XQLC0+d3PR32wjDRMpt1dRGFBnjjxuihhiX6mkKu4c1Rmg
         lJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=djRCi90v2STqbVx2hk4u7EGjBQ1YnyXlN+7jgcqK9CQ=;
        b=M7wF3JQ+5dSuJvOdw4ewsSKFkinyHBkDcuRworcsk1QovF8yHz7+XUfX3IdFoQSdz8
         EK9ES5cFssBHQ368339lxScOFxv3JEuSEMKbw3DM89L3EWmfsr3O6xmL2V/DuvSE882X
         9q7wEYV1NCQurXvdMyFh8MK58Vd0YDNnYiNwSdLnVgpzXCrOnnKuAwk4iJzDKQ57Y8st
         xEryfNxTbLml9R5GJNjHd8KxOhJLJajA3rO5I/vU+yBQBDRwQot2dZqnrRsGbl3yCG9D
         YOTSqBkKpge/7cgFAgOm+2sL4/CysgwqeWXQflkJPRNbAc1dZ9v9ItkaNyraFcfyT602
         8Ggg==
X-Gm-Message-State: AOAM531AIIKep6LoQ3DArHWDWDvrhycoC01FrflXZ1c4+OT6stSx5bEq
        61DHS3wBDLkIm9/eqdw91eWO6u43
X-Google-Smtp-Source: ABdhPJyZ7l02UNH2W9swntwYMklfONGAQ13dXrsh195igMvm9jEtUVVaz7iPUr5FuLsYLaGe4NUEdw==
X-Received: by 2002:a17:906:6897:: with SMTP id n23mr38358293ejr.473.1593954971134;
        Sun, 05 Jul 2020 06:16:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id j21sm7915321edq.20.2020.07.05.06.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:16:10 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/2] add helper predefine_{strong,weak}()
Date:   Sun,  5 Jul 2020 15:16:02 +0200
Message-Id: <20200705131605.26551-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A lot of predefined macros are just set to the value '1'.
So, create a pair of helper for this and use it to limit
the use of add_pre_buffer() in target-specific files.


Luc Van Oostenryck (2):
  predefine: add helper predefine_{strong,weak}()
  predefine: avoid add_pre_buffer() for targets

 lib.h          |  2 ++
 pre-process.c  | 26 ++++++++++++++++++++++++++
 target-arm64.c |  2 +-
 target-riscv.c |  2 +-
 4 files changed, 30 insertions(+), 2 deletions(-)


base-commit: 88c90bb192663bfc2dc54782c316e39e6fe26e1d
-- 
2.27.0


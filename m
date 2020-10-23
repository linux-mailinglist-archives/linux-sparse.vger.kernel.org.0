Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F280C297301
	for <lists+linux-sparse@lfdr.de>; Fri, 23 Oct 2020 17:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464731AbgJWP6k (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 23 Oct 2020 11:58:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S464730AbgJWP6k (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 23 Oct 2020 11:58:40 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6254C0613CE
        for <linux-sparse@vger.kernel.org>; Fri, 23 Oct 2020 08:58:39 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id dg9so2007264edb.12
        for <linux-sparse@vger.kernel.org>; Fri, 23 Oct 2020 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OyH0gkqQvjRpwv/1qKhMaYxlckcw0HyS7cwewoaLERM=;
        b=qtTdfjZ4yein7BCz3ezTjvOWkLdeLAyBS4bocpUDJZrpdq3OXpAK0ZCOvZdGAq8jb/
         xjL9zhwa+1B96lJldNXsFGIZ4LbMSr5r62QC5GdJu9r4OiqSn1D9/jlLlyDRNIpz0meU
         9xnOnAeIquguAScCHXYoZskdHd15qxEv9mfSOPnWIoDJKv98nUhGDwJTEcNii1PFpYG0
         mezPXIaXTYjE2o0BL9goGgydt11caGKiAOHSU0mO2ysyKpqQZkXmMT7kA7n4JUyAfVIC
         i4M/6z1KDypBcutTECIYWUc5dW/zAgEo32CliPEuV7PRWjhD2jGpebbOZiKZQ9fF78KU
         lEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OyH0gkqQvjRpwv/1qKhMaYxlckcw0HyS7cwewoaLERM=;
        b=X7VFG5t49yLqI6CXFgG0aZrRwsdJdHIUjNR3JFeLP/1X+x/Qh/SwPA0727BubsbnN6
         0ldyUc8JL3tTmVuemeWFz9IOubphDxo+SV5sw62Im4s5g/a09k67hKobAbLcDkA9EtUN
         OC7P7x/++4RdTWJizqbbe/gbe/odur/u+KZl/QjzjVfHWfi6AIQAuQ2pJpQDJZ2A1VDR
         24n6ho6/WP8+S3opePurrIkmibsEdkI/hr/NIO2ilRczoptjZmrV59vtmYhmb/sTM/s6
         uX0PaIpyCkILVWe3L2R9NX+0J6ZdomPLXKd7t6E27VZWZiEO9Qb+GERPU9mrHhOp4YTN
         PdVA==
X-Gm-Message-State: AOAM530oR5rVKK5hzRq2zLdryKmkrqVS3aAdc2YR72zBpT7goTELA+0g
        dRoFvW8QXjGRaZc7cara+AhyrYxwc64=
X-Google-Smtp-Source: ABdhPJx68MrSCvRpfrOYtCManRQM7nGybR6v6YDry/G4nDVAQic8OUunmicTYTVcNis7CYJ1aKpySA==
X-Received: by 2002:aa7:d7ca:: with SMTP id e10mr2816778eds.269.1603468718133;
        Fri, 23 Oct 2020 08:58:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:c9b0:42da:8135:1fa1])
        by smtp.gmail.com with ESMTPSA id y3sm1062569ejk.92.2020.10.23.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 08:58:37 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/2] simplify and canonicalize unsigned compares
Date:   Fri, 23 Oct 2020 17:58:30 +0200
Message-Id: <20201023155832.57237-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Some unsigned compares are always true or false. Some others,
testing if the value is greater or smaller than 0 or 1 are
equivalent to testing if this value is equal or not to 0.

These 2 patches simplify the first ones and canonicalize the
others to the equivalent equality test.

Luc Van Oostenryck (2):
  simplify unsigned compares against 0
  canonicalize unsigned compares against 0 or 1

 simplify.c                   | 30 ++++++++++++++++++++++++++++++
 validation/optim/set-uimm0.c | 14 ++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 validation/optim/set-uimm0.c

-- 
2.28.0


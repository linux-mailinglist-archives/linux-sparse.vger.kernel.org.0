Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7101FFCE7
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Jun 2020 22:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgFRUtf (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jun 2020 16:49:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgFRUtf (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jun 2020 16:49:35 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 065D9C06174E
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:35 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id mb16so7883376ejb.4
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oLyhXASdwHzF+pWKUE52j1gv+f3JFoMKWrMXKWyd3Dk=;
        b=mCMou/T5+5+Cl3t/wMJt03XU2IyuzclyxHmWyiwwzwBSxyO1VpJMiBg1Lg9CO1CIbG
         Gq/vU+8P8t4FmfJPGWih1ZYPPqx/O14LEEdCf4SMi4pMT05hUVHjMvMJNdosPGVD8CXZ
         cl7q89BedDfwnGHGopPML6rmpCgMme5bQ84kBZydYIixFIXLsLKFg9RSiXmMZzC0AyeN
         sA0gccwAArorEImc6IK/z5sIGiS2cWyHEod9AS69ObyBpsNaiaqcjM9p9tOBm0GzJk4G
         YjYvxv35HitqHX9aiwD0vEQOKEKwaQ0BgySlo6+udiympB6w9tTRrVTEm6lAzaSS1FP/
         ZWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oLyhXASdwHzF+pWKUE52j1gv+f3JFoMKWrMXKWyd3Dk=;
        b=MeNJi/HdfiE1v1yLLb2SigHme890b6Gu4yuXKGsylbY/m+znhResNwzHbngUliWUJc
         xXYz5vVIUFaU427i0HXib6zcTQS+dBk/VhIZsPo9kTnj+pTcyXgInasesKnVYDmXYDqJ
         K4dieuhBWPbSNIoMH+5GeUAfNEc9FwUbXV92WqRImZhCgQQ8Ap6/WiQfbpWeGyNIRDu5
         BFkhmO5WhTEGsxNhMnU/0J1Oy6BaWEYz7H7Otc60Dsi0sS/TxoDf/PSzY93G8jztI9tL
         OuLoMparZ2jM1I7iaf+J0jsgYkhBH2hdbwf1By7DGgdYeYFRso5hvgYe0+OckfLXoSFp
         VLgg==
X-Gm-Message-State: AOAM5331xEdstF/eb6/pI3Wuz4IZ+DWBVob1sItGL828AMrEL/Hx6Qht
        YLB3C0FcRtycUSTfZ7kJS5gdasns
X-Google-Smtp-Source: ABdhPJyZ/fvUe7h29VdCB82RzwADM47fJzB3sp3isyg/VHAWSc2aemimhn/bl+gW3+MJRxU2KCgFpA==
X-Received: by 2002:a17:906:9402:: with SMTP id q2mr534408ejx.216.1592513373513;
        Thu, 18 Jun 2020 13:49:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4c3c:7f8a:3583:598e])
        by smtp.gmail.com with ESMTPSA id s15sm2913160edw.54.2020.06.18.13.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 13:49:32 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/5] support builtin macros & __has_feature()
Date:   Thu, 18 Jun 2020 22:47:11 +0200
Message-Id: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This series adds:
* support for builtin macros with arguments
* support for __has_feature() & __has_extension()

Luc Van Oostenryck (5):
  pre-process: add testcases for __has_feature() & __has_extension()
  pre-process: rename 'expander' into 'expand_simple'
  pre-process: add support for builtin macros
  pre-process: add support for __has_feature() & __has_extension()
  pre-process: make __has_{attribute,builtin}() true builtin macros

 ident-list.h                          |   6 +-
 lib.c                                 |   2 -
 pre-process.c                         | 180 ++++++++++++++++++--------
 symbol.h                              |   4 +-
 validation/preprocessor/has-feature.c |  20 +++
 5 files changed, 151 insertions(+), 61 deletions(-)
 create mode 100644 validation/preprocessor/has-feature.c

-- 
2.27.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3BC214C98
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGENLw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgGENLv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:11:51 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7683EC061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:11:51 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id b15so32207739edy.7
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aV7BTbp5U+peawNJtfJLeprmw9x8TQ6CMBRxseWxh4Q=;
        b=R+VVBzNOxuY/dbzxk5n0FMlLh1YraYQGFmP+ymyM5nABLORyu0qx5VXf8+EShuscbU
         pXGwFHycELd5tzNg7ZbLdEuFKZrCnMtn8DSMA7yOHCWgXN1Wf/rul64rZPlN1bFV0ctZ
         x05HOo1Aes2tZT9zecCBK7vuOJh/3fFRZPNs+AiDqdLgTThnx01KgRY2nlU7533DCBxF
         Ifh+P8phCNxnqGsnKX494dGlc3ivj4BxCq2xfJwLWOKt7oyDwYuhgH3gU880suuOi9Y+
         bJAlLW0u9F86yea3cjw3wZ3Zn+T7IfKzVipXCMVD2mtEADrbt5OC73/wG3as01PU2Tex
         IMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aV7BTbp5U+peawNJtfJLeprmw9x8TQ6CMBRxseWxh4Q=;
        b=Ll6puX897PxCr5FXunRAFoOO/nZ1JyowILYwsSONCwZYv6r3FQh82jx2o3H3tBY1kn
         k+WZpG9gy6UwmywNeiYo0mhetPiuHQrJGSOTxWcFpm8JswGkWODYOHG9NQRjlS3q+J75
         hoBbEyW81sgYeYLxqN8X/CeoutFYP8XHtTXj5eP5C2Crw8bsZ8F+u4pI0Zo1Lywrp8WG
         FR+UgAj15mpDnDW8pLYV5/pns4jAx885nt7zFxF4O+mVaB6m5AyKT8okoBNhipGHug4m
         T23DV3E1he3DmI4CuDJmwAkGEKXKhP42csej2yiBHI9887ppX7/2f/oasRky7NNvNi+V
         7iPA==
X-Gm-Message-State: AOAM531OmYfwniLVtX4POfMnVe1AB3hrEnHMZ5jTj5th9c984s9bKL8y
        NFWcKLsUJ19ANaTEoO32jqKI/STd
X-Google-Smtp-Source: ABdhPJwozMRp+PteT34WJnhCdayBHNMkMlcSx5db5HamZ5F79pCiQ/lIPgZIWk6fkgmU0TtNhkKhHQ==
X-Received: by 2002:a05:6402:3049:: with SMTP id bu9mr37299519edb.232.1593954709953;
        Sun, 05 Jul 2020 06:11:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id b4sm19245250edx.96.2020.07.05.06.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:11:49 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/2] predefine: fix multi-token predefine
Date:   Sun,  5 Jul 2020 15:11:44 +0200
Message-Id: <20200705131146.26439-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The function predefine() and its variants are only valid
if they define a single-token value but predefine_min()
will produce a multi-token value if the type is signed.
    
This series contains a fix and a tescase for this.


Luc Van Oostenryck (2):
  predefine: add testcase for multi-token predefines
  predefine: fix multi-token predefine

 predefine.c                            | 2 +-
 validation/preprocessor/predef-token.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 validation/preprocessor/predef-token.c


base-commit: 88c90bb192663bfc2dc54782c316e39e6fe26e1d
-- 
2.27.0


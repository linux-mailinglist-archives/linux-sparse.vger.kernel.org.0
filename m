Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D83320E47
	for <lists+linux-sparse@lfdr.de>; Sun, 21 Feb 2021 23:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231722AbhBUW3U (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 21 Feb 2021 17:29:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbhBUW3T (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 21 Feb 2021 17:29:19 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A670C061574
        for <linux-sparse@vger.kernel.org>; Sun, 21 Feb 2021 14:28:39 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id w1so26072202ejf.11
        for <linux-sparse@vger.kernel.org>; Sun, 21 Feb 2021 14:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=faHkbOB3HjoqeifDgdneNr5aBGCQydJ7XvFado8vBT0=;
        b=EoKJGnqH9eY29YKx5YdCEHQ90JnxYWFxLIsbbBtZQ1x755ltXp5zhJdiZbyfHvOwgu
         1h8EHMIlfrz/qJZevNepqH1w8qrxx3/9VAnyFrLdqCf/xuIqdWdLq7r8fyzCJD52X/pQ
         N+mSJEbEnF40nvos9Y4rk6nX+lrhbaEmF6l8eY75yyqlAOIgeZj1MyP/B1LUaCO/ld8C
         0+14iANlVlQhemVBMKdPgD9B+84mn63qX1tMO0aaC7spXsEqmSHr9KNjrAMdaD34IxpX
         LN2Hy5+YvhU8zW161hGCoTmUOaueytqRIzeDal9qA0fs/P4DU7b9uLErkqA3eb53ik+p
         JPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=faHkbOB3HjoqeifDgdneNr5aBGCQydJ7XvFado8vBT0=;
        b=bP+gBL7oE7M1HxCAsIeYiH/sE+Xp9Nu+NwiSiEeHQgP90Nmj9u1XVdeWeExe26UBAZ
         5D4jpcOC63hRAtnn3h+MuNIlLqIGrYDHMEAPMcOkNiw8kOvofSF3coJZ9dbG/jH1gVlh
         BslNePTlC9PwOgXzCMcLA3mq9pVihhuJzAjmVYTRajzYr0XDpm7OsaMhIzlbrvm33lP4
         UjDSZLVvu0iJXd/z2o0vfWnutLcWrhiDM/hr4E9UK1JsEpeqhdvdWqVmOxrVLgFHUUKE
         xzVYesl2NQKzd5JX+qOjDvhgXmHdhRAJXdUs3qrdCTekfd7w3d50vUl8Anng+XrMT/Qr
         XMwA==
X-Gm-Message-State: AOAM533TAUfV9xQLyKpp0W3gdS81OEsHkD0H8aFVlzheVB17BKCrl55b
        D0fejScRV2OZYsg4TseKwdAa5me/p6c=
X-Google-Smtp-Source: ABdhPJymhmjHiEx49dDr3YjWhC/ug9rcyAwaVQVcVIkHzqYkhZ05hbrPo/lQsqHhfn0ezYC/q9EWEA==
X-Received: by 2002:a17:906:32d1:: with SMTP id k17mr18380316ejk.141.1613946517970;
        Sun, 21 Feb 2021 14:28:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:9463:3f6a:e4eb:cf54])
        by smtp.gmail.com with ESMTPSA id d6sm297744ejr.59.2021.02.21.14.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Feb 2021 14:28:37 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/3] output *memory* operands need their address as *input*
Date:   Sun, 21 Feb 2021 23:28:31 +0100
Message-Id: <20210221222834.7974-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These patches fix a problem with the linearization of asm statements
with output memory operands. These operands need to have their address
generated before the asm instruction but was generated after it.

Note: the problem wasn't visible when the address was a symbol
      because the OP_SYMADDR producing the address is simplified
      away at some later stage with the symbol directly handled
      by the memory operation.

Luc Van Oostenryck (3):
  asm: add testcase for problem with output addresses
  asm: factor out add_asm_rule() from add_asm_{in,out}put()
  asm: output *memory* operands need their address as *input*

 linearize.c                  | 54 +++++++++++++++++++++++-------------
 validation/linear/asm-out0.c | 25 +++++++++++++++++
 2 files changed, 60 insertions(+), 19 deletions(-)
 create mode 100644 validation/linear/asm-out0.c


base-commit: 60c1f2706e30eacc29296e6cb5d9327c85a01340
-- 
2.30.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325331D6E0C
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgEQXb2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgEQXb2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:31:28 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD6DC061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:27 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id s8so9705729wrt.9
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mdl1oKrfLmxz3jCMiJwBI0t9J9IfB2m+4ci3hx6qoYQ=;
        b=Gdp9iAq3YgdxtXRTil9ZKqP9+LaCQZA7U2rBRREqyBehet4YC9kQI15MkvEl+TD8Gz
         9ZqoTJBdTaebkVNCY4Y2SquOA03u4y/XitTIm395PRvbLtPAcRNcebGQukqFdSMUSWpB
         FdQbakxZ3PEyJ1v7xz5RLZjZoMS2jraf9SM7dZU+8c9bpestbkHTVlj/Xpk905j/syj3
         yDTA3HH4Us+Y4tO/1ojBjBMwumfVkfB0XReh6iNRSN7JUOvcW1EgX5afU5rw9l/YR72q
         e8jspUAmPK6SKZ+rxOJsHdNw18wY78/oMgM/8Zu4t1f/nqWJuzXXcTftc3+JkCNmfPV2
         1cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Mdl1oKrfLmxz3jCMiJwBI0t9J9IfB2m+4ci3hx6qoYQ=;
        b=kUs1kxqeUsw7fXDpP2esZkqK1seIwbaZMUPYjz5xaxirVxxO/7beAh97pJ8q+Ns89C
         k8HVPpEHZP585RbN7TM577xdlOA4x5BlNcYMCzWvc420LSLdWL8nsC4MizdA5yjJVfYJ
         qCa2UfvsRCUEedKIV2dsiuZp5Ifm6otsPz3ecMVcu9w428I79XnIYB5v+Nx2mEw4BUO5
         IafwOSB568tMRheBgxGK5hokyA0s1YHpp9jdxHOY+55LweWuwyglytOa0Z6dK64mBD3H
         Al4cRrISG4i58mrQiQd1NxSZNeIfN5AvJk1CAFaSUwvBcNRw7XO1F4m6EalXnod3FMwk
         GNAw==
X-Gm-Message-State: AOAM533NIJWkb2QxCa7DN38oZFO74UM28Q4kuj/QrxtDGTAehHRyH/Gm
        B0fAYPznMRpK04tzVpfTI3f99bTp
X-Google-Smtp-Source: ABdhPJzujO46xLdVensxuR8nCCcGc46XByOP1Y6Beh1NmP2wvbPWjbjl8W7d9fXls5QylwM/nDn1Ng==
X-Received: by 2002:adf:fa92:: with SMTP id h18mr16672261wrr.260.1589758286173;
        Sun, 17 May 2020 16:31:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id 89sm14665016wrj.37.2020.05.17.16.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:31:25 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/6] improve handling of function attributes
Date:   Mon, 18 May 2020 01:31:16 +0200
Message-Id: <20200517233122.1872-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Small improvements in the handling of function attributes as
a preparatory step for more functional changes.


Luc Van Oostenryck (6):
  attribute: sort the table of modifier names
  attribute: add helper apply_mod() and use it
  attribute: allow some attribute to be present multiple times
  attribute: add support for unused
  attribute: separate modifiers into type/declaration
  attribute: teach sparse about attribute((gnu_inline))

 parse.c                      | 34 +++++++++++++++++++++-------------
 show-parse.c                 | 28 +++++++++++++++-------------
 symbol.h                     | 11 ++++++++---
 validation/cond_expr2.c      |  2 +-
 validation/function-redecl.c |  6 +++---
 5 files changed, 48 insertions(+), 33 deletions(-)


base-commit: b8fad4bcd02210912de8cbdefcd77e9ca743a575
-- 
2.26.2


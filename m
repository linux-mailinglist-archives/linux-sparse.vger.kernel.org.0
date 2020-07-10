Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC6A21ABE4
	for <lists+linux-sparse@lfdr.de>; Fri, 10 Jul 2020 02:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgGJANy (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 9 Jul 2020 20:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgGJANy (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 9 Jul 2020 20:13:54 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 597DEC08C5CE
        for <linux-sparse@vger.kernel.org>; Thu,  9 Jul 2020 17:13:54 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id n2so3214657edr.5
        for <linux-sparse@vger.kernel.org>; Thu, 09 Jul 2020 17:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKKRmhWVjCBl22aFgYiAYoiwoSwzW1TyaZxqpmDdLEs=;
        b=DrXODzockBIGVx4hZ3DXIC1ead1HrpAvptGFeRWdX+ZEVZLL2V+Xz3Gpx90Td9/ByF
         QfwZ69/cUNJ9DN5UCcV4z3H8h4AakoNrLequ/+GoewU9iMiqCkcrAvE//UjUno+40Qrb
         i+2iqepQltsXn8XZdAykeQNyHbqZOU4pelP5HNs80oaqrLxjdUJ1jI+CJdtnTwVYGlZi
         JDH0V86P86SYRYJlOnr8nEPfQ2qZz234KKpOaJ/YBFcGX9e0YlsKN5DRQT2WnNqgQkLl
         065wibuI1aTReg2Hgw7sHWM3rZRSAklICwnTqD/6NOCnEG6WKaQJim3Q2Pymp2hsakev
         BpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKKRmhWVjCBl22aFgYiAYoiwoSwzW1TyaZxqpmDdLEs=;
        b=pHhhX7IezNLWrA+WGKdyEOB/x64w6NGYqNhRfYHY4YFTlcjYa+VLk26VycUE6mlyF5
         +yqBm8Wf5+m+26go1OTEVOdz9A5bDHV+WHq2Y0CWloEtEXfWGAW8s5y25PiFgepGEjxX
         eZm9u/BNFDwSdbFQ1lopkGhohoFi31V3BSvMJPGdi10OmS/+Y5f+r5qPLmUNiuY/kIbN
         KwLadCJlNEIU91BDPmHlHUzHBNupqK3wUHRFaDFZL6egJfeMvRoNsI2PEVtssZn71alQ
         ep7s2cP982Kjc1P3e0YwtF/SynpZX8nZz2VmssNAvSAKaeRK1xPQt0C0+yPh6YH9VvDZ
         0ecQ==
X-Gm-Message-State: AOAM531wVKimrfL5CNNkrlODlUtP5gWJvipoFaTS4Kw/4K0H0kF2pnyu
        SEsvUbKfxz3GxhDYQ5EoHQwBoD/+
X-Google-Smtp-Source: ABdhPJxIeZrZ2TtmGiFxFVTAzkbE1y2Z5RjciU+CFblRl4Jl2vUDCXZMpbwaS35EWsFoXadKGhDrSA==
X-Received: by 2002:aa7:d5cd:: with SMTP id d13mr50595726eds.370.1594340032723;
        Thu, 09 Jul 2020 17:13:52 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:c80f:e21c:9480:e854])
        by smtp.gmail.com with ESMTPSA id u8sm2614199ejm.65.2020.07.09.17.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 17:13:51 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/4] fix evaluation of assignment and qualified arrays
Date:   Fri, 10 Jul 2020 02:13:18 +0200
Message-Id: <20200710001322.18391-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This series contains a tentative fix for a problem reported
today on the mailing list as well as some related testcases.
The problem concerns the assignment of pointers to const arrays,
like the following code:
	int a[2][3];
	const int (*p)[3] = a;
which was incorrectly given a warning.

Luc Van Oostenryck (4):
  add a testcase for assignment to const <type> (*)[]
  add another testcase  with const array/pointer
  add testcase for missing warning for assignment to const
  [RFC] fix evaluation error with assignment of qualified arrays

 evaluate.c                         |  4 +--
 validation/eval/array-quals-node.c | 29 ++++++++++++++++++
 validation/eval/array-quals0.c     |  6 ++++
 validation/eval/array-quals1.c     | 49 ++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 validation/eval/array-quals-node.c
 create mode 100644 validation/eval/array-quals0.c
 create mode 100644 validation/eval/array-quals1.c

-- 
2.27.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC99BFCC4
	for <lists+linux-sparse@lfdr.de>; Fri, 27 Sep 2019 03:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfI0Bl6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 26 Sep 2019 21:41:58 -0400
Received: from mail-ed1-f42.google.com ([209.85.208.42]:35827 "EHLO
        mail-ed1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbfI0Bl6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 26 Sep 2019 21:41:58 -0400
Received: by mail-ed1-f42.google.com with SMTP id v8so938180eds.2
        for <linux-sparse@vger.kernel.org>; Thu, 26 Sep 2019 18:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Jx0R+/T7g/RNcRvULizJ8sSqlE6C1HQspu7znGvSQ0=;
        b=qe2jqqg9s6eui2FarCCL+XZXLufq1BBXivmGLdsbv48gPN55oxL/QKh6S9mbM6zHRW
         gydywbh+vccGUxDPt9ZdO1lhc2fQOHOChgu/Jj3N2XS2Fo+ySG1f+vBGhgFxENsDFTIS
         XVJMtwrSZtSHVZ/vvN43IIarrL1o5imha3VqHV9HrfXSsLFwj4VLeYd5pKddAxLJqthv
         nnROHYvCbpJWBwgkujDbmBbeedEX5wlk/uB8rzt02oOSDFtp84cl7g8qhdo+eKZJUfhh
         FIoJAC+WB0F9ZpX4ub45pJvz1DYx37SaGaw9y3HH2bpkeqv0+AHt0oyUzKRConhysTGG
         Cjsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0Jx0R+/T7g/RNcRvULizJ8sSqlE6C1HQspu7znGvSQ0=;
        b=qJIuEhF0Omm6WKehNisJo7ATLNR3Z4BwthNOQLjPBesI0zrxdvbAXf9cwk0Pdl/b+E
         sVkJI51cazMA6KRU65fmsNHQZ/V9QnR7Z2CdmD1gX+wazOyGFhIiLSTy1g+IK6WenB2d
         ITiYFeBw4KIoWW9FQZ49xGtc6zDRoZY2LD5N58dSpf/l9JDjXxlQXnL4ppU1ZSrkhFoC
         GENEQyuOIbUb+5E/V0WfuJ/zHAWiZZ437dqhz+9z91cfpPgC6e0ETvBw77EGjr3Gvdwx
         zrHeeMnPBmrV0KupatvVqWUE8h/4OFS7xAjzGb89MpZjDPxXO7MWzOZhw2xXdpa4Y7HK
         jX1A==
X-Gm-Message-State: APjAAAVea5unp1zJA9fe7cySlH7+LMAEL28rwCUnrfTwhy14m7ZDqKj+
        rSAP55SO7Ytcy01FoFIACMweg+S+
X-Google-Smtp-Source: APXvYqzTTP/Tv9vGERA1ckxZhV7REmdDfcaZDyYJ+3ncAklZOwvbrNddzZL4hei01xafwjFZzguQPA==
X-Received: by 2002:a17:906:3546:: with SMTP id s6mr5560931eja.82.1569548516233;
        Thu, 26 Sep 2019 18:41:56 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:5de2:f287:160f:22])
        by smtp.gmail.com with ESMTPSA id i1sm425312ejv.92.2019.09.26.18.41.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 18:41:55 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/2] do not linearize invalid expression
Date:   Fri, 27 Sep 2019 03:41:48 +0200
Message-Id: <20190927014150.38705-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Expressions without a valid type should never be linearized
since they have no (valid) type and haven't been expanded.


Luc Van Oostenryck (2):
  add test for evaluation of invalid assignments
  do not linearize invalid expression

 linearize.c                   |  2 +-
 validation/eval-bad-assign1.c | 14 ++++++++++++++
 validation/eval-bad-assign2.c | 22 ++++++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 validation/eval-bad-assign1.c
 create mode 100644 validation/eval-bad-assign2.c

-- 
2.23.0


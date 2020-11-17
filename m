Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C422B560E
	for <lists+linux-sparse@lfdr.de>; Tue, 17 Nov 2020 02:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731758AbgKQBLE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Nov 2020 20:11:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731752AbgKQBLE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Nov 2020 20:11:04 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EC1C0613CF
        for <linux-sparse@vger.kernel.org>; Mon, 16 Nov 2020 17:11:02 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id ay21so20752715edb.2
        for <linux-sparse@vger.kernel.org>; Mon, 16 Nov 2020 17:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXHnlpDgXkXhgDr/d4NwR2YrJ5yZ75WblMuE33jI8Y4=;
        b=gk2wbRbdVSCiWWab9DkLrMY5riDAd3u78qKTEgLN9FbR9an0G2djte6TYBL2skDvLj
         FaXX7jEOeCCCbDUnXY54JUlh0ql4bs30lwmzxxiBKcgZObvSsWTdWS+9sZnYPbdg2oI4
         CsOly2T5MBFbtvM+umAQerlMP34z+xgcyKm16ffHlI7MaThwpwXRwF1tGFBI6z0X9Oq/
         MdYA6cHBI227z4v9/HBmIf8fbeLXANtGG+LtzM+loovgKscXa96a1rQboeLhpoHBbNtF
         7cIpX3AsSaHAWujg2kxkjz3xbq7jMyJvwuph9yEYKnvO7JJ4YhlhPshD/2l8CKh1a5CH
         FLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXHnlpDgXkXhgDr/d4NwR2YrJ5yZ75WblMuE33jI8Y4=;
        b=m/XFLaigPZ2g2iM8YNxky7yTTnqBN5x0bvb+bs1baWjvb/4Q0/SJr7h2eQe3cQY6qq
         kBRn0aGwjIfNh0fH3Ml6+rZJzEmMXtpoCWMzkTpmCtnQGKw95U/hzd2uPRXU0+cSAgm3
         kKR7NdLAsNsixiCpr7iWvGBvZSBqreidRU40gJ124rEqOZEdXPxudxEBHSIEI9FHFETe
         mDPtkkv0GKh0utcSwd4wXUNStUIylCx3oozGTZB4fJ8Ef33tJawrlYfXn1FcTCX8pLdm
         hUg15ZLByFpiaFIfMbcWxILWu3WR0pzoWzaKJBHNavgwvZzffKeasfuXTdHhj8tIXoAS
         31yA==
X-Gm-Message-State: AOAM532TYnl8DCbeC3oA8MEAEzoyo4L5MiZ9SaUw421Hf/Zfv9tMqwSM
        UyjKYy/ESgX63GRWVJJ3bSiR/HOrBLw=
X-Google-Smtp-Source: ABdhPJxqjoW8ebps+YuSk1uHZEYanGRaMVylzNSMFQrHEcsfrLWtuVzzS2j1wGZP98Rz91pfOu16vA==
X-Received: by 2002:a50:f104:: with SMTP id w4mr17825408edl.381.1605575461388;
        Mon, 16 Nov 2020 17:11:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:a141:d91b:1f47:d972])
        by smtp.gmail.com with ESMTPSA id e9sm11231812edn.30.2020.11.16.17.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 17:11:00 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/2] simplify CBR-CBR on the same condition
Date:   Tue, 17 Nov 2020 02:10:56 +0100
Message-Id: <20201117011058.53995-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These two patches do the the CBR-CBR 'diamond' simplification.
Together with the previous series, it shaves a few more 
'context imbalance' warnings but I think it will need to handle
phi-sources to show its full potential.


Luc Van Oostenryck (2):
  rebuild dominance tree during CFG cleanup
  simplify CBR-CBR on the same condition

 flow.c     | 106 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 optimize.c |  10 ++++-
 2 files changed, 114 insertions(+), 2 deletions(-)

-- 
2.29.2


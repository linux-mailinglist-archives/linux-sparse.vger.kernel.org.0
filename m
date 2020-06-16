Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 292251FC094
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 23:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgFPVDF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 16 Jun 2020 17:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgFPVDE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 16 Jun 2020 17:03:04 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD70C061573
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:03:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id gl26so23201771ejb.11
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0S6RonPrt6EWvo6JxhahihBox1h2GouEj1ZV4/gSyAs=;
        b=gL/u8eNtjwUTb2MBSLqILa+Ak/MII0djrp1CYSPWxI+SoGkqX+sMlFr2F5cjQ6cxqr
         MfgK+58BO3/8QJLgOJz1n1TqcFcGKR5ewNVBlPuO8FM6JrLeHZ6/VZI1BE7aRRoSVkrK
         S6iDLHxIRtDuh0nKxf+oBp4gHmudEaSeuOyOF65ON9XX2mJ97NlNyJRd3rOyTtpt6pTD
         3US5K6FmLrsC4/UkmYFSG5ttQHx+lDm67BbYvu5egt3yidkvwiK0qLZmYOdcze6z60+r
         dnLC6zSUdcvn/O1tcL0Ak4//RkaJkqyRk9TnWXnTlTnE2IGzSuDFMntActvz9NJ9tCkA
         5MpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0S6RonPrt6EWvo6JxhahihBox1h2GouEj1ZV4/gSyAs=;
        b=eIjUYxXXnxqlQKxu9Zw6UHiKl35WfuhVFyR9jsrRhYYkpVyO75b0zCK7EZHIE2TdJS
         tPsVdvzTH6iJAQn5iUMwIvIRa91ftIZ5aqUfpPj3Pg0m2bdoOlCw0sHN8hd+4hHkdS1b
         78dBUHWw5hyKK48BecXR4llfCi8PI2AjyXgpRszLdIICpnCpL5RCkpSjHjPrsrbLFQo6
         zhopLO0fR0ksjQIKzx7ynLyMSkr1FuE6UUS6cElgI6c28zXBHMsg0lX1v987lJ9p1SlK
         WhNl0XG5J7xOxh2UUio0g2PFsYt2CMnhRQbg8v5VemMlhMNJfm4bm/+NPQvRKKCccCnb
         75Gw==
X-Gm-Message-State: AOAM532SqPeXxz150PXKYWzXcp0Sc0748jFuQNLWL0TEBWZwspZ8qAI1
        2kB/pX9bTOzD9IhVhhwm/SWhq6FB
X-Google-Smtp-Source: ABdhPJzD+KmP7vM2j6TSkmrkwIK0aeh3XnGfyv6jFgepL2Vf+554fiKQYD6Q1Iab913+GO/6JCw2dg==
X-Received: by 2002:a17:906:5c0a:: with SMTP id e10mr4621544ejq.389.1592341382924;
        Tue, 16 Jun 2020 14:03:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5034:6797:70f1:e20a])
        by smtp.gmail.com with ESMTPSA id dt22sm411410ejc.104.2020.06.16.14.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 14:03:02 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] doc: update TODO
Date:   Tue, 16 Jun 2020 23:02:59 +0200
Message-Id: <20200616210259.77723-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Support for __builtin_unreachable() was added in commit
  d2be323e25c3 ("teach sparse to linearize __builtin_unreachable()")

So, remove this item from the TODO list.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/TODO.md | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/TODO.md b/Documentation/TODO.md
index 4344a1dc9b0d..64c1523cdbd0 100644
--- a/Documentation/TODO.md
+++ b/Documentation/TODO.md
@@ -34,7 +34,6 @@ Misc
 ----
 * GCC's -Wenum-compare / clangs's -Wenum-conversion -Wassign-enum
 * parse __attribute_((fallthrough))
-* add support for __builtin_unreachable()
 * add support for format(printf())  (WIP by Ben Dooks)
 * make use of UNDEFs (issues warnings, simplification, ... ?)
 * add a pass to inline small functions during simplification.
-- 
2.27.0


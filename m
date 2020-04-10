Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9AB1A4A05
	for <lists+linux-sparse@lfdr.de>; Fri, 10 Apr 2020 20:49:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726690AbgDJStd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 10 Apr 2020 14:49:33 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37942 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgDJStd (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 10 Apr 2020 14:49:33 -0400
Received: by mail-wm1-f65.google.com with SMTP id f20so3612761wmh.3
        for <linux-sparse@vger.kernel.org>; Fri, 10 Apr 2020 11:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y8ExLF23gYvGvTkFxPg7LA0+C79TpIx33Zu/iI0Bako=;
        b=JlPD/Q2+p1sb7EBQr9LJZ5YKEJLSdZO4Sa7jNwg2ObdfF+VhCDCFyoEwLHOPcl9XOn
         dq0OgUKKRB1TBas86NrVHBLvo4j2hYM2sUh0B3aVxwbDr3GAD87zQWTZvPPe7iaB8pyB
         XV+szXqWOsF7mNxqOanjtb9RHEQ+iUlg31eJuSVhXHk8UjtPxOHgxQZVOXoCH6fg2udo
         zLkmSPzufSrtuFHHRx4nKytA2Wq/4a9C3sTp/8WoKfyBvxNyK8B3+ld3KISoVOYtKBXG
         iMI3KzknofoQvS7KrfG1j4X/aMJWaN498q4KogJrA+fvlUCbeWQ3oOmxjdB0Mz3y252z
         j8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y8ExLF23gYvGvTkFxPg7LA0+C79TpIx33Zu/iI0Bako=;
        b=CW5cYolhzmEywHY4RzcWCuhArnr7RRkQg2bUwa7uMVVWbLZfoYc+YxQ3MzhZHb8xDX
         rzqFkTswO6EzmAjLp3rbu/hB2yBVvuYUb1KsiMLUuDVuLr4q1p/Xe3k7QQR3fQEj8Ogj
         A4xNFbX19D2PtH6yN6+32YIv05c2Of69mkYHmnYZabMCYGrlQdW7i52M9e7dZpkrTQGa
         PQc+t3+C57mE36O56TrerZB81IKP2Rhx5rSmLroqtn7xLnwszuYc+j12JLM872ZFdZlD
         T1dercxw7ZW3TchtxT7OvJRyJ6woslcYqijb88dtKNtLKm5sLAuU64J5RSXyZ9vmHw/Z
         f9Iw==
X-Gm-Message-State: AGi0PuYpIcnFB4xc5nTqLlhszB9s89/kLfszCp9rf1WcgCZ+0LbarEp4
        +ta+F1m9rR1/5TCO7igDFeXKWBru
X-Google-Smtp-Source: APiQypIYhNIOfQ0HQVJzRGDsA5p8GcPP6HqAvVK1xNFRdsLzrS/qagT5QoU9gVRpXV2aQvORUc2Lfw==
X-Received: by 2002:a1c:195:: with SMTP id 143mr6384781wmb.0.1586544571937;
        Fri, 10 Apr 2020 11:49:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:957f:f707:be30:7cd4])
        by smtp.gmail.com with ESMTPSA id u16sm3935364wro.23.2020.04.10.11.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 11:49:31 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [SPARSE PATCH 4/5] extract add_jump() from add_goto()
Date:   Fri, 10 Apr 2020 20:49:17 +0200
Message-Id: <20200410184918.64692-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
References: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

add_goto() uses the active BB (and automaticallydesactive
it just after). This is fine at linearization but is not
what is needed at later stages.

So, extract the gist into a separate helper: add_jump().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/linearize.c b/linearize.c
index 4e9f9b3693e9..a2cde941ce18 100644
--- a/linearize.c
+++ b/linearize.c
@@ -633,16 +633,21 @@ static void finish_block(struct entrypoint *ep)
 		ep->active = NULL;
 }
 
+static void add_jump(struct basic_block *src, struct basic_block *dst)
+{
+	struct instruction *br = alloc_instruction(OP_BR, 0);
+	br->bb_true = dst;
+	add_bb(&dst->parents, src);
+	add_bb(&src->children, dst);
+	br->bb = src;
+	add_instruction(&src->insns, br);
+}
+
 static void add_goto(struct entrypoint *ep, struct basic_block *dst)
 {
 	struct basic_block *src = ep->active;
 	if (bb_reachable(src)) {
-		struct instruction *br = alloc_instruction(OP_BR, 0);
-		br->bb_true = dst;
-		add_bb(&dst->parents, src);
-		add_bb(&src->children, dst);
-		br->bb = src;
-		add_instruction(&src->insns, br);
+		add_jump(src, dst);
 		ep->active = NULL;
 	}
 }
-- 
2.26.0


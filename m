Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12384F5F58
	for <lists+linux-sparse@lfdr.de>; Sat,  9 Nov 2019 14:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfKINLA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 08:11:00 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55413 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfKINLA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 08:11:00 -0500
Received: by mail-wm1-f66.google.com with SMTP id b11so8804007wmb.5
        for <linux-sparse@vger.kernel.org>; Sat, 09 Nov 2019 05:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ElDiy3FlWfGbPcZ3zUI05uKPPzch8pG5cKH1HgNPFs=;
        b=MGSNtPT6hc/4jXeN7Ym9BneQ6YhzAedp7k93n+NP6pS4k5XXTJdHCi2ZpTDEDOHJhV
         rSN2VQnl4Wzh7CR3ayk2I8Sha+mzEPAlbWXqK54XnBCE/KJWgyXQDaEOZ+47WkCSIUvN
         0Dai0yFFfjJJt9ouxdXsngmaJCwjQYIA43DUHUa+tVINqQaJC4loEARqUWOkFwbeD4oJ
         EH8n6vcHzFXqscWJ7vMPHEL6M7NjDphQG+g7vy46SM5IXk/Uev/1k6Jg2XH63KSa3W30
         JtGyWLUl3BJ336JLKrlxSfvuV/9gdiqbwUzSt24q2ZKbOY7N6FbeYGn9G14l79kkt0lB
         Mxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4ElDiy3FlWfGbPcZ3zUI05uKPPzch8pG5cKH1HgNPFs=;
        b=ZPhzLBQOKne2p2JTprbarpZNWvlJsBpoyEVbjVfCE9eoBcuWGGB/nP2ClJSVl1UhhW
         vQnnnGfoJdFQUVj//WyxfFF1KKTvuKscBdt972DNUaxrfFiELB0wQzVWd1khvv7yfL4a
         /vbwvRpTWriGvGdh8n9ZIzrVcBFGRJyCmUxPcs9U+h0BvL0994kfCLDPdQhbzaUIQk9r
         iIyFnRy4d8k/F3KOcFCNeaQ2pa04CqA4UoGKOncfY512oaz679vs3NttZHOpe+lLAUbI
         Zh080i+HNHF4RgZvTB/xXOjDmPhi+0/+WZ7AsCw3v8BWkURLGruZ/cqayFDerV5Cxnmt
         FuPw==
X-Gm-Message-State: APjAAAVh5xBlkP1vLKcFPi+7PrcHmgPBsi7vYuW4NZCM5RVr7anhaoO0
        +IJZKxuoxrYSwy1W+SFsa1p6l31B
X-Google-Smtp-Source: APXvYqw14hP1wykD4hWrsMzF/XCKG834QGtWI6YLpKytgMhZYCT06wqF1WR6elbjc2EidWE+RtcKsA==
X-Received: by 2002:a1c:411:: with SMTP id 17mr11786463wme.122.1573305056240;
        Sat, 09 Nov 2019 05:10:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:417d:57dd:ed4c:6a6d])
        by smtp.gmail.com with ESMTPSA id 65sm16200067wrs.9.2019.11.09.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 05:10:55 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 0/2] cgcc: small simplifications
Date:   Sat,  9 Nov 2019 14:08:47 +0100
Message-Id: <20191109130849.62559-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The introduction of '--arch=$ARCH' has allowed to simplify
somewhat cgcc. These two patches are some further small
simplifications.

Luc Van Oostenryck (2):
  cgcc: remove _STRING_ARCH_unaligned
  cgcc: let sparse define _BIG_ENDIAN

 cgcc  | 5 ++---
 lib.c | 2 ++
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 318F0FD246
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:14:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfKOBOH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:14:07 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37257 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbfKOBOH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:14:07 -0500
Received: by mail-wr1-f68.google.com with SMTP id t1so9134448wrv.4
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lVXP/1JHAne9ltDeFrxETvhhww25mpKpPVizRh4mj3E=;
        b=c866hfqYZAmf+AtvTiYN+woZCmLGXz6+Lw9haOg9SmWlHDk9cFPs5b+ei2H0mI8JVm
         Y7eJX+j9+TKs147gMHYD9mkTGP0BnAv3wegKzUILUjys6KHs6VS0x0XCmTXyKUyRr4DB
         YGZIodVLlzA/NIAoFamflid+JZ5FK9hYv78h90zMkjuEgn8kDLTEQgDBn0yfnjGC6+l7
         KJlwUpnNoSbm/OQBbRSISgrWXdcfeXAcStXfcUuGU8oYt++YgxvBSv5pDEuARfPMZaZy
         UFuv8OCEtcvILHd4Rl13M5aHiHei8Eqp6F4GLuBECyjgG09yt6k6OsgWRHoGuWY6OusO
         Ewlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lVXP/1JHAne9ltDeFrxETvhhww25mpKpPVizRh4mj3E=;
        b=M8V9XI5dapMqCtz7B8DPofxAz0Y/BQ3AB/tqVZzqmmPqS66XaKPxF0IkoTSLgi8Ch4
         QluwpOBZN9mbCYLWYWsRk01dtdTiVo/epQqY5l+3GD7n/5KoC9eLe0Km0XuzWBq+U9wz
         hoOfVKoARulnYGwS+BYHZiTYKHAug1/f138KoP4QNjZ63PO12TEmFvPcQBulE4Yg819A
         QtP37jGtRVPOzLjch9fPKHa55oV5Dmx+p66FDy7GUm5F+XmBs3V0P7hw9Ode+V8joXj8
         d6962EXE4QRRdr9csJoqIzzOCsXq8H2wkbgMN4fHZtKgLiXOHQk8t9JKMZ0S3/+ED4bA
         9C0g==
X-Gm-Message-State: APjAAAVNnIxc2Isg2G4mI6XeWocc0cT/cTXB2Zsp/IB3PdXS2sDCnqkb
        QJskzF8gE9//GGauv6EEtBOa16Oy
X-Google-Smtp-Source: APXvYqxSwLN2R7sqQzVEhUSWbJ1EEyvuadYyqgO1SF+gdfIGOPq1gKMbLKPL/u887BCJWGUR46Hq7A==
X-Received: by 2002:adf:e286:: with SMTP id v6mr12804355wri.241.1573780445332;
        Thu, 14 Nov 2019 17:14:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id l4sm7918792wml.33.2019.11.14.17.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:14:04 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 6/8] arch: ppc32 has 64-bit long double
Date:   Fri, 15 Nov 2019 02:13:53 +0100
Message-Id: <20191115011355.53495-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
References: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The arch ppc32 had long doubles incorrectly set as having 128 bits.

Fix this by using the correct 64 bits size for them.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target.c b/target.c
index 146c4125d..530970912 100644
--- a/target.c
+++ b/target.c
@@ -120,6 +120,7 @@ void init_target(void)
 	switch (arch_mach) {
 	case MACH_ARM:
 	case MACH_MIPS32:
+	case MACH_PPC32:
 	case MACH_S390:
 	case MACH_S390X:
 	case MACH_SPARC32:
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC85FD244
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfKOBOF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:14:05 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37252 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbfKOBOF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:14:05 -0500
Received: by mail-wr1-f67.google.com with SMTP id t1so9134398wrv.4
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+w7kb1cXBLQbRGiw72b2ab1XiHXySDxCH77HPaF+Ogw=;
        b=cwhQLtMnXJSRYOJxFHTk90TF1/rt2TWHnGgsNs99O/m7s8oHffGP0015+f6X5u4rgx
         fI2/3O35Yf14QldHbyQVoQQ7eLd/SNrMmv4twwrWxhUCZ8pIjlUeqsGLnDUEwMTfrl1s
         l3v4hIUy/A+/O+id7N6ZD535ZOQkKI5yO90p4tVY3hnWctRFY9tEidaG1Lu6PLQTKHBc
         fSJnPPOPZMd/HpC9hcU/+My1PgCpvh7TPGHsMFZbn73n1pGfIKQoC777WVJ7aDofv6fD
         aWRWZzFYILnweTCCGDtQaNFzvGQ3/o/mz1/Pt0TPJFqV81Xw9KRRqqJ0ECeOw/Z/gN6I
         Iqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+w7kb1cXBLQbRGiw72b2ab1XiHXySDxCH77HPaF+Ogw=;
        b=DrOvxk1Trb0WOkWNIgPw5fHyPLkLzwfyPOhUp/CfCM/G2ztbsbqk+g/5dDMpzFoEBg
         KDCYBcCigEkYu4pwlDjIK/KS8AN8duXN5zoCL8uXJ8rQzgjKQB7uX2lkrWcxHykwVrC7
         kvGb3CtKMudn8zjl4BpYOjWTrpTiWM9yrTBSlJ6ZEAavxEJI0Hp0WE/cBGY2n8jhAgUw
         4+UNzSSNHQhl0jqryaMcRnvXetk6dqbi2WqOUXkjUdx5BGh6W2Z1l4tlMzwrMV0HqKH+
         YDUaAA6GV4sx4yY91Sffc23DNhAeIYS6fhkVx6tPX48N6j4AXm36bWr9981XXMPk+30w
         5AUQ==
X-Gm-Message-State: APjAAAUzfpCzDXAZ5M9wTcgZnFGx5JTkF+o3xeLNHmYfDwTwyCz6HYhv
        6TkV6kyjCjBvJDz68m8K6VuBtqwq
X-Google-Smtp-Source: APXvYqwO/Z/WS32eJATBen6tgGHaOlrM2odPfydisPoADXGOSHjdxVWT8sdk4ZZ2qmJaBS3Fm05NiQ==
X-Received: by 2002:adf:c413:: with SMTP id v19mr2124512wrf.208.1573780443346;
        Thu, 14 Nov 2019 17:14:03 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id l4sm7918792wml.33.2019.11.14.17.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:14:02 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/8] arch: do not needlessly set bitness on 32-bit archs
Date:   Fri, 15 Nov 2019 02:13:51 +0100
Message-Id: <20191115011355.53495-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
References: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The code at the start of init_target() already take care
of making the arch variants match their bitness. There is
no need to redo that while setting the type of [u]int32.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target.c b/target.c
index 647817a22..bdda7ec7f 100644
--- a/target.c
+++ b/target.c
@@ -114,7 +114,6 @@ void init_target(void)
 	case MACH_PPC32:
 	case MACH_MIPS32:
 	case MACH_RISCV32:
-		arch_m64 = ARCH_LP32;
 		int32_ctype = &long_ctype;
 		uint32_ctype = &ulong_ctype;
 		break;
-- 
2.24.0


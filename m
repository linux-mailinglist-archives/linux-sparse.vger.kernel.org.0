Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2E8B11D9A7
	for <lists+linux-sparse@lfdr.de>; Thu, 12 Dec 2019 23:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730935AbfLLWrz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 12 Dec 2019 17:47:55 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38511 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730707AbfLLWry (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 12 Dec 2019 17:47:54 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so4423291wmi.3
        for <linux-sparse@vger.kernel.org>; Thu, 12 Dec 2019 14:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQWw6okVx0CT138ojrsuhy1Nd5zOefqoRKdniSKTQ1Y=;
        b=sF2Uu0ok8a0u6DExeO+QrAa+CrNlWdcWjBTU60UjAaElbOSeCYyUiZ2La3oB43VvRJ
         qP9Hmo82e/SIAMfwIbdixxFu56cSs3jT1SKLUZzfPzSVjxUn5HrkZL2EbLUW91WjFxnX
         w6Zu5O5c79LndkXSAla41SLh5qy5bpxxFupMAmxKMfhU4ScSZR5jMYWfLHQwAAmWOuZn
         HlO0Eflr9g+VamHKbgFMkrykwXV3SOI7o0L2hoJ5fj9NHL1eIL42ckZ1XI/OvbG3LTuL
         75oqB8oKoHvInIoflitxKZLqCGYSJpoJ+8sDwrv7A8CzboHRMAMrMzeV4YfuYZ37uefI
         rMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQWw6okVx0CT138ojrsuhy1Nd5zOefqoRKdniSKTQ1Y=;
        b=QLPcgVrQAagnHgNBWw+vOvX4j4S/s1UJht7VICBejNI+KE8g4lhRmKKFRSjR9kn+mi
         jV2LM6Yt2lYFSH7/UFmiAJ+e/uGK17/QSM07fLFcBPhrnQ2xdSKWwqWxhKmtL2EJ/kV7
         MpAEe0Rk5aUpzrIr99DIKWjrsr+JcBZ47Uc6hsnn7fBE21dalTpfcGtaVZ07Nq9dTRwg
         yZqC3GxqnADGv7XjZOhvrRJH7Pq1sO4bskcA0sp+9AFZX5Ak7dZQdK6PDmBoOk63Gc6K
         lmJFGkLiN4QQRt2A9zfXuRKMk4IOZQ2Qo1vnobSfP067+k2wstsVjQWJHYUy1gaCKhWn
         EVVA==
X-Gm-Message-State: APjAAAWbA0+EA+1UMAPh5NUGe7OZVh4T3SviY1byeLWe9lffk+gxVgeR
        XtHp2dxIc6DTpCcuFzmZ7b2MYvJJ
X-Google-Smtp-Source: APXvYqzt/GjNZfvZj8S+KPAeP9wU0Sf5uYjBNW6HZ62LTLOoFbZw9BsHU38yxbhRoYpZBrRxdoaKFg==
X-Received: by 2002:a7b:c4cc:: with SMTP id g12mr9600067wmk.68.1576190872472;
        Thu, 12 Dec 2019 14:47:52 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:34fa:4b73:5583:32d1])
        by smtp.gmail.com with ESMTPSA id 60sm7918331wrn.86.2019.12.12.14.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 14:47:51 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] constexpr: mark __builtin_choose_expr() as constexpr
Date:   Thu, 12 Dec 2019 23:47:20 +0100
Message-Id: <20191212224720.64551-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

__builtin_choose_expr() always returns a constant and is
 GCC extension, so it can safely be marked as such.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 builtin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/builtin.c b/builtin.c
index 52285a91cd1e..27f90302ea1d 100644
--- a/builtin.c
+++ b/builtin.c
@@ -99,6 +99,7 @@ static int evaluate_choose(struct expression *expr)
 	} END_FOR_EACH_PTR(arg);
 
 	*expr = get_expression_value(args[0]) ? *args[1] : *args[2];
+	expr->flags = CEF_SET_ICE;
 
 	return 1;
 }
-- 
2.24.0


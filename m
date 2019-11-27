Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E21510A898
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfK0CHC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:07:02 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37924 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfK0CHC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:07:02 -0500
Received: by mail-wr1-f66.google.com with SMTP id i12so24861426wro.5
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GjM2r7NkAeACkvyE57ImfAowQTC4dblaTWyBXC2KGGY=;
        b=K1oG+gZ85I2tL5YH4SCiwJgrJmaB2qKUT/C/17j1Xo3b7Fegd+tFQb4K2D35REw5l2
         qKDE3yUHjtYukSlKLa0L5qZaVaWHYh4ksuQryt5XK4sgUF9fDj6m4cEBts/jN0i63AEc
         kBw4CKOM3NSv8/8MVCOgezciQBFY9sr2msocv6UYdHPHQhIOLIOKaphZ+78IOGHkVRtc
         b7Ie4ltp0Fb9BzdnolK98ORhAEmBHUslBxt2mZgAEZUAOpJnoonNR1Qp8E6u6vWD4QqB
         VV3eWlsO9kMM1QvLhaHDSuQNduQba/5TQ9HMmDo/X+TKkG7qaW4edxCjtx5bNV0h3NvQ
         OBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GjM2r7NkAeACkvyE57ImfAowQTC4dblaTWyBXC2KGGY=;
        b=emj9UqEbAtBYwvA6PmXYfVBylu5wE7Be95qG5ql5ikF97gEgE0svpbdm5Nt+ggIgVY
         KGeSPmJ1AxXBzB7Rz7lfJSHPnIV/MsRr6bOdvLLsjwwL2sarintIT89Iy8cb1b3kp5B/
         p/4uiZ1+Jl5jvyG5yaL9VJx04U6b37rw7bGTG/m5nh2oihMVy082ZHNxlcWtJoRBbbk4
         i7jO1rk+qp5qHAZ8Nr0ZCJZzv+7U1fuLAU3z4kiTNe7nHqn8F6m2EV0/jIe4G1NTgjHG
         leKtwFB9jhUX+cP/tANNCKCA6xAergO/F1uKhln6K8UNM9sETW8sqHZrrvX63L5POaZV
         Ak+w==
X-Gm-Message-State: APjAAAV0TPMWtMWi98Z7TWcA1ahPGjOhryxvi+RFbT6CiC+CjWr4V2ls
        Yy9du5TXZ1QLodmPGntnAzMxxpem
X-Google-Smtp-Source: APXvYqzIwxtM6U+Owhr4w6iJUxs/t/uLKCXhbwUD22+51eC/F9gbvwjfpwI5hnMUJ4lm0+S5PAb3Sg==
X-Received: by 2002:a5d:46ce:: with SMTP id g14mr2693039wrs.98.1574820419987;
        Tue, 26 Nov 2019 18:06:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:59 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 11/12] arch: sparc32 on SunOS/Solaris uses 128-bit long doubles
Date:   Wed, 27 Nov 2019 03:06:42 +0100
Message-Id: <20191127020643.68629-12-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 32-bit sparc running SunOS or Solaris, long doubles
are 128-bit, not 64-bit.

Add a special case to handle this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target.c b/target.c
index 64e6533f6..ebc7d493b 100644
--- a/target.c
+++ b/target.c
@@ -116,11 +116,14 @@ void init_target(void)
 	}
 
 	switch (arch_mach) {
+	case MACH_SPARC32:
+		if (arch_os == OS_SUNOS)
+			break;
+		/* fall through */
 	case MACH_ARM:
 	case MACH_MIPS32:
 	case MACH_S390:
 	case MACH_S390X:
-	case MACH_SPARC32:
 		bits_in_longdouble = 64;
 		max_fp_alignment = 8;
 		break;
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8AC510A891
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfK0CGz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:06:55 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37916 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfK0CGz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:06:55 -0500
Received: by mail-wr1-f68.google.com with SMTP id i12so24861237wro.5
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+w7kb1cXBLQbRGiw72b2ab1XiHXySDxCH77HPaF+Ogw=;
        b=DVy8dlm7PUcCNRu5bmMPd+DJgcoGL+nWx0wJjY7Pu01qUgIxhwrtySLNxL4u/RgvNk
         N9i/pvPmKBXVpmADFEMkonB3f3uOFogUedIhYr6TX0/VEenrzAfIilREbaqZLONfRGXK
         9LM5kTQi801Uo0qI/76gej4IEbM3D9WCmLmbnWfBcQs+8/2Z/895sGDoLJABGtSIfbgs
         gt5V/nn9KeLX9EsNw9+q/3f6wKYLgElg0st9lAwlFpbbSU7qbxQIFYob0gqaXzXmPLIq
         b4vtqoAjQYPABG+CcWR0jS+uuhc/9R5MsSVgwdrz/bNTCnUYygZGquI9axf2k5ZsIAW5
         mj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+w7kb1cXBLQbRGiw72b2ab1XiHXySDxCH77HPaF+Ogw=;
        b=Dxr2D5suhTe9BS3AXCdRbkVF1SQRZGDq7/CdYikawTuqNzzBrvDM0IKj+a/anDlSeG
         KleIQr+BbWRlAxnmH+nzyWdPtQR1gs8oY0g7943fWGp19LiGM/Viv1chrXgrpD0YXfiK
         FbrvL4oEkWM2H2z9Dz4jmcveLJkqPiDhPAGFIu+/VXf0eWosWgUn0fdVw7/DyHby/6tz
         zE1Muo9zNt9xQ6V/Er6QbtpyzBOEYlhQBOqcx56R/io9c+c3eE0+8HMzD4++A90Rs3h3
         83ov4ukoGpft5jZwnHOxOjfjJLlJT8PXTxnWkOB6uI3Wg5xNZHgPru9X1+DqtG9GDzY8
         Vjfw==
X-Gm-Message-State: APjAAAWrxzQR7MSM+lkbES33pidp68Bn+Tv8WZD7e3xKWKIdSRqC4C5T
        rBqTuLUdOe601TmKdR3YEbvehphL
X-Google-Smtp-Source: APXvYqw7oJCF36KZ2x/kdmp1OWY91RTptey4uJH0NJBk24+oQTzVTkmOurhEphqpyleKdqIjyqc/lQ==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr32565858wrv.77.1574820413161;
        Tue, 26 Nov 2019 18:06:53 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:52 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 04/12] arch: do not needlessly set bitness on 32-bit archs
Date:   Wed, 27 Nov 2019 03:06:35 +0100
Message-Id: <20191127020643.68629-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
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


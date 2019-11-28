Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 671CA10CF51
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfK1Umf (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:42:35 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37474 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK1Umf (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:42:35 -0500
Received: by mail-wm1-f67.google.com with SMTP id f129so12893659wmf.2
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PvpCRWLaPWjQBEhuIDU/X9mQh8xkhmKHbH0NFCUoHF4=;
        b=T4lBZ370GtT1ZJW9zt17X/BjeAnvFVWo+xOR2+Ary+Yb4H8xqIbOzTVXXbkWt8gTof
         KhJB0oFX/crNWkzVW0ljDYc79lMiC33auIqlH6xEMDuDUeh9M/vdQfd1fw9Sw3c4sj64
         MUrSjExPIuw9qSZu4dq5P2sddmlqAH79IlcYZdcRZHJKsgLPNXKGMJ5LQ8O2OrOPKAn4
         rL+A+t2MQ0Yxp/fhDQJGbyvPsbVni1ldhJ8JOM1RzPVw3ARGTGv/qw+t+rOV471BDJ28
         O92+B2qwDww3tH4oQdYsi2I3kSExpdkTh27JOteyZs+K4IdYH75kngPxkuadCZM4XDu8
         O4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PvpCRWLaPWjQBEhuIDU/X9mQh8xkhmKHbH0NFCUoHF4=;
        b=hWNb6Y0hD4wL/UH0WXrjPSWwHJAehMGKzOnid19U4DmBKttUQWv3eFzy9oQ5PZszdJ
         CoWXLi9ScPUnaJ4I3CJM0chTVsYPjttPeApOAxg2EFWGE74OKFXEVXQy3qF3cv4uwbj2
         rQ/uLdkyA6PJAUKul+eZ8YsWgJMqn1wCA/YUrObs+wktuqo5DedBrlBiuMGt34A3sT8W
         BnUHt29zBlhIPnlVYOKgNKophTshakOJ7EO+xBQItR1XyJir3cVnNGenmnxU1GHal1Qp
         GNkWt/XXSC5z0SfclpYa4bYm21E9OvEVLs8P17d6YluI6dirAlCNAFJQtqnKOs+U65MG
         lPbg==
X-Gm-Message-State: APjAAAW084uhM0EFhhhf2reO7QC6N5Yk4QJSD4LZrNY0tA04WOsjz0vk
        flUe284XMAs7PsmSxrPBKv7fvNGl
X-Google-Smtp-Source: APXvYqwlWEzLk176s05RxfdDKxikZfz4gbgCaB2Esn3BR7i2JIzYRjmCCnrA2Y0Z5U7i4XlgdDyAcg==
X-Received: by 2002:a1c:2e91:: with SMTP id u139mr4933071wmu.154.1574973753364;
        Thu, 28 Nov 2019 12:42:33 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id k16sm12290150wru.0.2019.11.28.12.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:42:32 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/7] alt definition for STANDARD_GNU89 & friends
Date:   Thu, 28 Nov 2019 21:42:21 +0100
Message-Id: <20191128204225.7002-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It may be useful to known the base standard and if we're using
the gnu extensions but as these are defined it can only be done
on a case-by-case basis.

Change these defines so that:
* the GNU extensions is the least significant bit
* the versions can be easily compared with <, >, <= and >=

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/lib.h b/lib.h
index 1eb455618..7958359c1 100644
--- a/lib.h
+++ b/lib.h
@@ -225,13 +225,16 @@ enum {
 extern int arch_cmodel;
 
 enum standard {
+	STANDARD_NONE,
+	STANDARD_GNU,
 	STANDARD_C89,
+	STANDARD_GNU89 = STANDARD_C89 | STANDARD_GNU,
 	STANDARD_C94,
+	STANDARD_GNU94 = STANDARD_C94 | STANDARD_GNU,
 	STANDARD_C99,
+	STANDARD_GNU99 = STANDARD_C99 | STANDARD_GNU,
 	STANDARD_C11,
-	STANDARD_GNU11,
-	STANDARD_GNU89,
-	STANDARD_GNU99,
+	STANDARD_GNU11 = STANDARD_C11 | STANDARD_GNU,
 };
 extern enum standard standard;
 
-- 
2.24.0


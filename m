Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13ADCFD248
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:14:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfKOBOJ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:14:09 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51451 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbfKOBOJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:14:09 -0500
Received: by mail-wm1-f65.google.com with SMTP id q70so8011834wme.1
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e0tjfkLzNzsPVTIGar3vbQw7rHX5SC9svfyDY0VDAcY=;
        b=UnXbSJpihhTettFlGd5YInKSv92VUASHZGG/O19i848AKfYHM4uHE/oDhBQzN0km2R
         6cQPcKDcZVGgQKBolF51yU18qtp6wAVVVyJBesKSU5k67MRxpyiRMJEVH092121iArGq
         CFubrNCGHzZEkEBJI6oBqVRd1dEq0uKLQqXDPXNjVDvbwXt0c3HRNPfOJm1RFbZ82oaC
         lNlOq91nUPs8f/Yr5IEst7AHQvynQhbKBt0HRd1H41UsXMPOzNm5Ooy6K+5vQ7wMAIiG
         3TdThVF50b8MPxlzPM5uy8709zJ0bBhjghUybaY+U5lVZpFToPfxBfDMqAjWZJgGEdRa
         saJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e0tjfkLzNzsPVTIGar3vbQw7rHX5SC9svfyDY0VDAcY=;
        b=OmzupB8nRKqnnI4etGNVampXYC72mBuyaKw0StZ6a3TL3VYZtRl9dblfjuaBScMTRV
         szvtq4HPwdT90Fru8wzkz4GCK3/B9xvzIAdC7UJkdkE472q6uUw5xvt8UZ83hQGIDEd2
         a61unYM6Te4g6nNT8fbdzJRamwvnd+5sGQQMo0l9+Ns864A7ihTp7w1ng4qHGvFa77Iz
         natU5Otip3WJqK+X5Fg6fLkqD5A95sOeSwsZ0NE1C5z2Mcuyy4cqqv38qcjbXVlznsjW
         Z85NtMOGKTVFwGCYzxCH2/LpiPFdJgF7uIdFFHruI2/dyOSn8OXthuZbwGeEMtXPT6hJ
         z4WQ==
X-Gm-Message-State: APjAAAWRgboQfhv6b3yKLkBFVVlGi7PwgfXVSKzrlzEfue6JdNfFds48
        ljGZLS74qAINvu+wCauCn1EilxGb
X-Google-Smtp-Source: APXvYqzyOOiZhFdvPX3y0SsjpGz6K8VqK3sZpsunsX38o+ayERYI5rx4e0OQWH59VGwHKXCRkLpvAw==
X-Received: by 2002:a1c:4606:: with SMTP id t6mr11434866wma.73.1573780446295;
        Thu, 14 Nov 2019 17:14:06 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id l4sm7918792wml.33.2019.11.14.17.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:14:05 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 7/8] arch: char32_t should be the same as uint32_t, not uint
Date:   Fri, 15 Nov 2019 02:13:54 +0100
Message-Id: <20191115011355.53495-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
References: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When the predefine for char32_t was added, it was made to
correspond 'unsigned int' with the commit message saying
some archs use 'unsigned long'. In fact, it appears that
there char32_t is always uint32_t (on the archs & OSes
I'm using to look at this).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib.c b/lib.c
index 57d2738bf..f9e7caf4a 100644
--- a/lib.c
+++ b/lib.c
@@ -1418,7 +1418,7 @@ static void predefined_macros(void)
 	predefined_ctype("WCHAR",      wchar_ctype, PTYPE_ALL_T|PTYPE_MIN|PTYPE_TYPE);
 	predefined_ctype("WINT",        wint_ctype, PTYPE_ALL_T|PTYPE_MIN|PTYPE_TYPE);
 	predefined_ctype("CHAR16",   &ushort_ctype, PTYPE_TYPE);
-	predefined_ctype("CHAR32",     &uint_ctype, PTYPE_TYPE);
+	predefined_ctype("CHAR32",    uint32_ctype, PTYPE_TYPE);
 
 	predefined_ctype("INT",         &int_ctype, PTYPE_ALL);
 	predefined_ctype("LONG",       &long_ctype, PTYPE_ALL);
-- 
2.24.0


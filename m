Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC0510A893
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfK0CG5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:06:57 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34091 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726529AbfK0CG5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:06:57 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so24802808wrr.1
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e0tjfkLzNzsPVTIGar3vbQw7rHX5SC9svfyDY0VDAcY=;
        b=Ey1p7sBRFTerBBv1jai5zhLyoX1L0/ozPaUccBoskjtgQYoFm7x4faOfLLur59tYsN
         HmDlUXBZZKefnTwgZ9Sgt5VM3zXjyXwgY6if1WoT9iSQJ5V6qpsvhDFDnRjn2m4qxNT6
         bMQxzSJfEI1NRGkug81tsgKMa7MRDPjthuUnbgRCgslMcUH7LzyeuMarZjCwk4Dr17R2
         +MDgWl19h89dIOlkxS/LhYY8f2bosjLXnGCYRpbwpNxAgdNprsnjWQNbXUjEEqFgiqiZ
         Gw1h9rG6YIX7OCl/LEX7J1fY7/fS2l+MeFTYL73Qju+KG9/VunBCdf+YRlwQlFLYEcH0
         Nf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e0tjfkLzNzsPVTIGar3vbQw7rHX5SC9svfyDY0VDAcY=;
        b=bDmY+aof/gXW0z50pYEWvMYrV4HrDejRMT6neQS8rxBEDZ6GNkudM5XApUFpiGkbP9
         G0x8YgRescKS+CZJDMYicvZowGSEDab0LE+CKUnxNVxPRD4Z1bF9rQzb2npPvSebD+JN
         viuZowR4fXZu7NkK0j2CaCpKG+Gho/qNx2XGu/4859W71tlct9WS4sQveZJr7Y6Q8DFF
         6B7Hg776yMrc/AvHGIsfKChRChCN7SnFOt/7fKg5SKmie1THGGOyACDkOvPR1ukNbt7F
         ToEaiOZCZW0WuGe1Sm7iMwrjOHeNQNiAiNBy+HdvYtReOu07xxE7Mye+5hmiglXTbIbg
         ewxw==
X-Gm-Message-State: APjAAAXRWawkAHEYcX6ZkD7ArbU5HbpXvqfns8dPSMuc7fKFmmSOhKRw
        QADRU+pks9ywcnJQz4H/8lmg+kvx
X-Google-Smtp-Source: APXvYqxNsEBU8v4i7iYbF6WJZ2oIkyi9SqcptG2JCgYI8HVaqUVbsu1he0+SQ2fCHmRoY3vEC/51Ew==
X-Received: by 2002:adf:f344:: with SMTP id e4mr8610024wrp.365.1574820414644;
        Tue, 26 Nov 2019 18:06:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:54 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 06/12] arch: char32_t should be the same as uint32_t, not uint
Date:   Wed, 27 Nov 2019 03:06:37 +0100
Message-Id: <20191127020643.68629-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
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


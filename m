Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2BC2FD267
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfKOBZW (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:25:22 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39540 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbfKOBZW (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:25:22 -0500
Received: by mail-wm1-f66.google.com with SMTP id t26so8591053wmi.4
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JygJrE+QX4XRy6OPBsf9HJtc8nOYUw+wbxODsBESOC4=;
        b=q+8Zhn8bbjWVAhfELHsjjuKVZJWHJpMvXR1JIrPVGLbgW3WVJfztY6eCV4r27UsOG7
         KJnJsIppxZeTt8IYciYdUjJh55e+D3OZW1CX20j8KD2W+LkKomn0RUwHSx2GBjtg5/gL
         lyVTuPxiJplRCCAC+sxSiuEcS4byx/XdogmaPfIWZWbNfqGeGgEYkLGuNTSiH83lfkrY
         vLk4jh43IRQHUV4geAUVwJZjQJdmz2tDIOORoK9Y7lDYYmpGUb97GPBR40d8efkmNQQ4
         KMx8pHvD5x8P156jzXybJXfQsVPSA30bTP1avRgH0DIhHgdff8SPerL8UXyg7dTVHL9W
         pLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JygJrE+QX4XRy6OPBsf9HJtc8nOYUw+wbxODsBESOC4=;
        b=K0VMMcIAmVugMVWNC9wgj2BcNpKy1SijL9fiA2WGa4ALNJfzZa0sIE6LBxkJyLRrBC
         2uoOoKeCwH4n7Jx3+ZW/j3dA7ZaJrai/GevdU30AspPjzrJ0SbYmhwoboRHYOOt91qb/
         MVFl602K5a2u7vSpn1ET7o/UxHus9GXuvYeFyg3m9bOu+7LpygetG+lNExxvTfecKnYW
         zk1JTtnnuOMcfHS9jGeCY9lsaxb3rv3EfDI0LSguiMz3FKruZZyGP5sxZv4EsT2s7CNj
         r2GG21/0Tiq4SQGB6q4FLvGdr0tSnN0BHTY/D5AVnfvvcxCDpj82BhEDHPs2G3JnLiQ+
         GMpQ==
X-Gm-Message-State: APjAAAVXD6Cm+yWkShgtB0J/pKWxUm12VuuX+kH8HicPrJE/ZJpDXFjA
        wva4iQGeo2Bw3BKmDtLFU50gVSct
X-Google-Smtp-Source: APXvYqz/2yrYdtdOPQgugfk3IkArKyk7nPb5bp2prX9FQEqCYKNHleEmgrbnfqOuxm5i6+pS/jFp1w==
X-Received: by 2002:a1c:7e0e:: with SMTP id z14mr12823335wmc.52.1573781119719;
        Thu, 14 Nov 2019 17:25:19 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id j22sm10736216wrd.41.2019.11.14.17.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:25:19 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/3] arch: keep cygwin specifics with i386/x86-64 specifics
Date:   Fri, 15 Nov 2019 02:25:13 +0100
Message-Id: <20191115012515.53725-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115012515.53725-1-luc.vanoostenryck@gmail.com>
References: <20191115012515.53725-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

No functional changes but it will help to reorganize
this code into arch-specific sections.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target.c b/target.c
index 647817a22..9ce21272d 100644
--- a/target.c
+++ b/target.c
@@ -89,6 +89,9 @@ void init_target(void)
 #endif
 #if defined(__FreeBSD__) || defined(__APPLE__)
 		wint_ctype = &int_ctype;
+#endif
+#if defined(__CYGWIN__)
+		wchar_ctype = &ushort_ctype;
 #endif
 		break;
 	case MACH_M68K:
@@ -196,8 +199,4 @@ void init_target(void)
 		pointer_alignment = 8;
 		break;
 	}
-
-#if defined(__CYGWIN__)
-	wchar_ctype = &ushort_ctype;
-#endif
 }
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBCDF73B6
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 13:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfKKMTv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 07:19:51 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39383 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfKKMTv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 07:19:51 -0500
Received: by mail-wm1-f67.google.com with SMTP id t26so12979890wmi.4
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 04:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7qI7HIoT+eBh/KXBHwZZngozR6BiyoV7cYljSmzycEc=;
        b=aDThBcSHVdyIXLkMM/M7O3qUSCgKwaR6UAsh5AsQmCexHGRlnFtUAgAZR3298kQSHJ
         RvuYN9xg9Ec3n9cXVZW/bEAdfSPnEadlWdVxbbXNJ8hKtRZ5Rn9dZ29HCz81PKWWpjiz
         bEjkCPmr/QruBa0tPoUV74kt99g64m43Sx1R5VVZxQ6/H2tuJQIH3qZww+JiNZzNK0SE
         piynLsfLIa2XFZk1HX5TeXcnuHSP08HRG1tGJKcl6Nt/356PtMkE+uM5FfmUakRfsNV5
         MfifZzEQTBMZxCr61ay3fixW3zjT7bEvzAxp5rznCn0IVncpcuBGrMW12a+Wd2PEvgu0
         zZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7qI7HIoT+eBh/KXBHwZZngozR6BiyoV7cYljSmzycEc=;
        b=E0lrfw4f7KqR2jhuAp+d8T72M6G4Jq5K9rMnWzNqWerMJ0S1QFCiBukBItRnx0NAsD
         3ZBNxKlaczWFBueK1I6g3r9VcbiRAq2WsCDuVMAh+FxtHJKHcKgrCMrXarRElEBFQUd0
         iCNd5e1ZitxNApXcvVtS9/PFoEyFGHInsto513sRso0eaStPbFm9TzS824w/TXXwdTQN
         GRUDsz+Dv/NYhTtV2DctOozF7bv8pZbthEBoot+zu2rpYDQBSxKkOR3DlztVFDYqFN7a
         5jpveTYCc9mSDhLBuO3nayYSFzPWsxGXYQifRXEQ12Xmd8kwDl9+l/Vw55G4uqbsDOUh
         f+xw==
X-Gm-Message-State: APjAAAXDaWKwhoxxBjGCzmx5RZeXslTDX3U9G+PLimnmqqqhzPXUzQ5M
        EMwy3f7fosQlLJc+JQI8qaFzDPfn
X-Google-Smtp-Source: APXvYqwA6RBBQBlCWzyNsBJqzLKyweKiGHWZPLvYrPFCqT4MMokcxA0xftqFJu/NlY8BxgsxP1ewkQ==
X-Received: by 2002:a7b:cc8c:: with SMTP id p12mr14561449wma.82.1573474788919;
        Mon, 11 Nov 2019 04:19:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id j14sm16256478wrp.16.2019.11.11.04.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 04:19:48 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/3] arch: keep cygwin specifics with i386/x86-64 specifics
Date:   Mon, 11 Nov 2019 13:19:42 +0100
Message-Id: <20191111121944.78498-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111121944.78498-1-luc.vanoostenryck@gmail.com>
References: <20191111121944.78498-1-luc.vanoostenryck@gmail.com>
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
 target.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target.c b/target.c
index 90097818f..17bdb2544 100644
--- a/target.c
+++ b/target.c
@@ -79,11 +79,15 @@ void init_target(void)
 	}
 
 	switch (arch_mach) {
+	case MACH_I386:
 	case MACH_X86_64:
+#if defined(__CYGWIN__)
+		wchar_ctype = &ushort_ctype;
+		break;
+#endif
 		if (arch_m64 == ARCH_LP64)
 			break;
 		/* fall through */
-	case MACH_I386:
 	case MACH_M68K:
 	case MACH_SPARC32:
 	case MACH_PPC32:
@@ -172,9 +176,6 @@ void init_target(void)
 		break;
 	}
 
-#if defined(__CYGWIN__)
-	wchar_ctype = &ushort_ctype;
-#endif
 #if defined(__FreeBSD__) || defined(__APPLE__)
 	wint_ctype = &int_ctype;
 #endif
-- 
2.24.0


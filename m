Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC30A10A897
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfK0CHB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:07:01 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36014 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbfK0CHB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:07:01 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so24782218wru.3
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iIPYh6O8ac+VuE0hhALxa8YRTiNuEaRPwAnoM1Du0eQ=;
        b=mm4LPeDjBuk1oEr7yD6KQrYDcr89E8fvG6Sq/TqwajlzYKMVbikWxIiPFA7mCJNDGR
         D310D1D8WCOA7Ev3rZQ3E10RKxL7nid+nlWPoWw8iCX+oLaIRBi8wMpXXir/X/dGbxXM
         I8JOqe18Zc1gheOf4XzeFC+4Y/in4Uc5oMk4cTKlkaHGfuSGin1bDXxbT79r8l0WbE8u
         mLBvjwFKjAt2aACr424Zeslbg7++/8loSi4fyP2oHKi7saHWFy5WXAApzNwgWt5u0NYq
         F6u5/yWjYJ6bqhJRaXnO83YBMyYHfpe+xU8arzdDtVlgZ8hCl/xlfzMQeTVapgY9i+cE
         QuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iIPYh6O8ac+VuE0hhALxa8YRTiNuEaRPwAnoM1Du0eQ=;
        b=Sq7GSJ9Z70mmDWc6Z7BjxT03ik/aqJCvEf2a/YLUh0RGcTSuZQ2oGSSyN5XJj6C3VH
         u0zcLliRuo8usS6Xfrs+jT3bZHEmbDH16aeBC3seD7ApxBwsH8pdVnRBVFHUroObvod4
         3cbX9/E0MdFHFEQJj7oBvrVdINFCY/UrbHvsc99HD5jmuBufmp2wbWktsLS10VTXtVCx
         RKoZsHPDl3gtip55ryIM+bU6qIgp1kiU0intBIDQl8b/F9iH6QEdTXX/4Sa3XgS5PLqQ
         qUc1gbsaTEs4AV/tb1VkdZZfN56K26RaCj2aX6H92fWQSCfr+fvOtxzQCvhQ8fUpSJ/m
         hGxg==
X-Gm-Message-State: APjAAAU3fR9LtAqug/SrdHp+dMj6ejmL7d2y2o+igiQuKLupA8F85cFz
        vadUYZXYU0vXDec+Fq6Wlspvc3iT
X-Google-Smtp-Source: APXvYqxW4t+sMv98yhZnlp4MVG50AFrZS6FtlZTn1H927l2wK4HqcyMERH+AHRf0jxO4RCJueTRY9g==
X-Received: by 2002:adf:c611:: with SMTP id n17mr41064018wrg.317.1574820419039;
        Tue, 26 Nov 2019 18:06:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:58 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 10/12] arch: fix wchar_t & wint_t on SunOS/Solaris
Date:   Wed, 27 Nov 2019 03:06:41 +0100
Message-Id: <20191127020643.68629-11-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 32-bit sparc running SunOS or Solaris, wchar_t and wint_t
are long, not uint or int.

Add a special case to handle this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target.c b/target.c
index c89bb07d2..64e6533f6 100644
--- a/target.c
+++ b/target.c
@@ -98,7 +98,6 @@ void init_target(void)
 		}
 		break;
 	case MACH_M68K:
-	case MACH_SPARC32:
 	case MACH_PPC32:
 		wchar_ctype = &long_ctype;
 		break;
@@ -106,6 +105,12 @@ void init_target(void)
 	case MACH_ARM64:
 		wchar_ctype = &uint_ctype;
 		break;
+	case MACH_SPARC32:
+		if (arch_os == OS_SUNOS) {
+			wint_ctype = &long_ctype;
+			wchar_ctype = &long_ctype;
+		}
+		break;
 	default:
 		break;
 	}
-- 
2.24.0


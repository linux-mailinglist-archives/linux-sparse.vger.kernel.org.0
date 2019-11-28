Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6347A10CF53
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbfK1Umh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:42:37 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42180 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK1Umg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:42:36 -0500
Received: by mail-wr1-f66.google.com with SMTP id a15so32578000wrf.9
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emsvhtNpLNm0jVmXH7eL5+Wsv9wsZR55Ks5MfmsU/QU=;
        b=BvMTaGIufc+mwjlzgeFYyYTIRoiszXbdnY+Y9RUVbSVIBCrS4CdcRb7e6a4Shi/cA3
         cbfdu7ZbxejNpFj+WSsHltrhdVZ7rTjn3NnXGzoFqRDpczLXuRY+4h75r8m/2QITfQ7w
         tb7272AeDCGDc4zxYRakULfQzbhnWxgacKGnnEZH6m5+K1Dy7Xpa44J/JZpZabWSqcat
         cpoeOtQU9ppe2z7ww0Usmbdep/Iz7OklijEVl7Fvqo0owchur/RPfyo4+ybkwx1HzGfh
         kAfke5DxciHv/ArdxvgPjHhsHtJYZv/uL9QACFOj+547ctI1KeLbyEAsqakgO18a2sty
         DOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emsvhtNpLNm0jVmXH7eL5+Wsv9wsZR55Ks5MfmsU/QU=;
        b=Oaqbfuwud8qG9PBYaPlqnYAh1MuTgcI5XZ1zIlptGDCVZD3VPdTFq/jv7+OM++4fuy
         mVme+tLoR0SAj0+SOY9033NKLPw1vvCJf3hWY0orZdLl7cvOxeLAf3BoAiCjWKRo4IHu
         nG/QlXH8X6D5PmbJk43FWLkWFi64e69DHfVWE5OU2FP6668DKsj0hs21OAt7RhkkedBm
         sOhX7FkdI/1QKrySUCk8JRoqiqcExqhSlghsoL8ZkhWQL/AJdJYqKP5Hoy1oexmguEXY
         olgQ/USWKxRVn6O2EFz5g5C0ZSTu83TKEV4gDzqPPM4bB2y3zvBFOyhYIowv5YluvZig
         Q3dA==
X-Gm-Message-State: APjAAAWtRw3W+wd6BEi2Dg0AH5M49COOWmJYFyjKn2j2KN5HJrtkVpoK
        EVDF8jjRbzqICw5Gyi3P0iehpMxb
X-Google-Smtp-Source: APXvYqwAmBP3K+SQcpH936djv/kbywUV2RndmwocEPKKq+DTLzOUMiYY+bEEYG4yyftbGfNW2akfOg==
X-Received: by 2002:a05:6000:1602:: with SMTP id u2mr53205440wrb.249.1574973754966;
        Thu, 28 Nov 2019 12:42:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id k16sm12290150wru.0.2019.11.28.12.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:42:34 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/7] simplify definition of __STRICT_ANSI__
Date:   Thu, 28 Nov 2019 21:42:23 +0100
Message-Id: <20191128204225.7002-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, the definition of __STRICT_ANSI__ is done in the same
switch statement used for __STDC_VERSION__. However, this lead to
some repetions that can be avoided if moved outside of the switch.

Move the definition of __STRICT_ANSI__ out of the switch statement
and guard it by testing the absence of STANDARD_GNU.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/lib.c b/lib.c
index 02f6231e2..d232b8cee 100644
--- a/lib.c
+++ b/lib.c
@@ -1408,24 +1408,16 @@ static void predefined_macros(void)
 	default:
 		break;
 
-	case STANDARD_C89:
-		predefine("__STRICT_ANSI__", 1, "1");
-	case STANDARD_GNU89:
-		break;
-
 	case STANDARD_C94:
-		predefine("__STRICT_ANSI__", 1, "1");
 		predefine("__STDC_VERSION__", 1, "199409L");
 		break;
 
 	case STANDARD_C99:
-		predefine("__STRICT_ANSI__", 1, "1");
 	case STANDARD_GNU99:
 		predefine("__STDC_VERSION__", 1, "199901L");
 		break;
 
 	case STANDARD_C11:
-		predefine("__STRICT_ANSI__", 1, "1");
 	case STANDARD_GNU11:
 		predefine("__STDC_NO_ATOMICS__", 1, "1");
 		predefine("__STDC_NO_COMPLEX__", 1, "1");
@@ -1433,6 +1425,8 @@ static void predefined_macros(void)
 		predefine("__STDC_VERSION__", 1, "201112L");
 		break;
 	}
+	if (!(standard & STANDARD_GNU) & (standard != STANDARD_NONE))
+		predefine("__STRICT_ANSI__", 1, "1");
 
 	predefine("__CHAR_BIT__", 1, "%d", bits_in_char);
 	if (funsigned_char)
-- 
2.24.0


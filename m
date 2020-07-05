Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF92214BCE
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 12:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgGEK3R (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 06:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgGEK3Q (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 06:29:16 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51261C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 03:29:16 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id n2so22998687edr.5
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 03:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rsn8uWDs3JKpXXEegpTRTegDMjbGcAsCCZncyAw2iWw=;
        b=ZYp6pzGhhO5wi7yWQMkbGFq1cQEfWpy9E4Wj0muJV3s1ycgpMM0qYzk3yZPlCuZ9rh
         FApRj7PdkxdNb6aGlnv0iPjZMJqOaNxxwvzCL3Yq7Jg+ZrWK3SkN1WmrbKd9Pfjv/mxK
         EM325niS8GCJlvOaiY3w54QFI679JOVeZrNNSRMcm2VDaZHcGSduMrDCz27QRK4uGcL8
         jwRRAOTcfi9N6xuRqwIBrQWVtuuNB8lf92KAfYD3aZDeI5lzty9SDWCwEjRBFPZMeFWD
         lPVgvyy/tBIJEP8QmRUHw1YPISUCPuOBUHaWTGcOiMeV2MTFImw8rYJO0vNX2iLMe3Of
         2ldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rsn8uWDs3JKpXXEegpTRTegDMjbGcAsCCZncyAw2iWw=;
        b=dLZ3DB+bzOIPtwDdUAPJeV0moXFJCo6gRTCmJJHARQRwG181k6E3r2kUEppy1hh0Pm
         m4qVCeI4ebAFDzdAGLEucSymFNWyfHiq3qU9bZahGUg49dcorUTCERiwU0qvzWdRM0aK
         mHfPbBkb5BzkkZpx6kHaeF8pQweDZdzibeba/QTIIfJHy5D9ox2TsEhAptWQqiGgDw4L
         NaYALCOMYI2aoD4v0PIJ72Y/RBGZLK5N9D5tyQzB+sJ3q6udRIeEGPWjSZe66BI2ULul
         6unI2m0PtMHW+zGiLoEOw2uuzeaw1eBNIysyK3TCOkxjHEXn9fO/Vvkw4IMZ0ud4PYch
         l5Dg==
X-Gm-Message-State: AOAM533rc4ejo3RC3c9zDfHC7krbDtSH0XmNedmVblNtNeOmaBjL8rKh
        Y/Us8z07NP482wanUszqBXCjGEwA
X-Google-Smtp-Source: ABdhPJwNEyoW/SF12wCoGS+fHLzeLq+3eYMVcSZ9XgCF2U5DUehJgwF0kCvnI3lVkYkrq6o1F1F9yQ==
X-Received: by 2002:aa7:da46:: with SMTP id w6mr39533260eds.261.1593944954803;
        Sun, 05 Jul 2020 03:29:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:689a:3e9f:d13e:7d51])
        by smtp.gmail.com with ESMTPSA id kt1sm13763323ejb.78.2020.07.05.03.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 03:29:14 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] predef: simplify add_pre_buffer()
Date:   Sun,  5 Jul 2020 12:29:10 +0200
Message-Id: <20200705102910.12851-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

pre_buffer_begin & pre_buffer_end are the head and the tail of
a singly chained list. As such, it's slightly easier to not
keep a pointer on the last element but a pointer where the
next element should be written.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/lib.c b/lib.c
index e56788260cb7..863900b54c3c 100644
--- a/lib.c
+++ b/lib.c
@@ -248,7 +248,7 @@ void die(const char *fmt, ...)
 }
 
 static struct token *pre_buffer_begin = NULL;
-static struct token *pre_buffer_end = NULL;
+static struct token **pre_buffer_next = &pre_buffer_begin;
 
 int Waddress = 0;
 int Waddress_space = 1;
@@ -348,11 +348,8 @@ void add_pre_buffer(const char *fmt, ...)
 	size = vsnprintf(buffer, sizeof(buffer), fmt, args);
 	va_end(args);
 	begin = tokenize_buffer(buffer, size, &end);
-	if (!pre_buffer_begin)
-		pre_buffer_begin = begin;
-	if (pre_buffer_end)
-		pre_buffer_end->next = begin;
-	pre_buffer_end = end;
+	*pre_buffer_next = begin;
+	pre_buffer_next = &end->next;
 }
 
 ////////////////////////////////////////////////////////////////////////////////
-- 
2.27.0


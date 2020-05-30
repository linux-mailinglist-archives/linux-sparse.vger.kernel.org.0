Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897321E9262
	for <lists+linux-sparse@lfdr.de>; Sat, 30 May 2020 17:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729063AbgE3Ptw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 30 May 2020 11:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbgE3Ptv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 30 May 2020 11:49:51 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86612C03E969
        for <linux-sparse@vger.kernel.org>; Sat, 30 May 2020 08:49:51 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g9so4012771edw.10
        for <linux-sparse@vger.kernel.org>; Sat, 30 May 2020 08:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2mKdorzHdg1zfAzwiPQJ7Wg5NC+xM/HsolBkJYeGg4Y=;
        b=hCogE2j5KzQyE5AaC0DfElFtp9ySfy+DDPl97t/FG8ub09tPSGm9NHjJk4X7dy8d7J
         rckiTYy3xUzJkgj02crqoDaWjdYBiuvRievb7C670fMyrTT95AqQeDHzH4rACQcokml5
         PtgoKu+xplm29Q7isq2uMZxp0Naz0xPbGOCUKtcX0blPX0vtLIOsUVblenjs+nxpEcGT
         lEuewxiXRSXHpkVULhNV0KUHKj5QBv5cmhsyAngBorJBaTXMAgmWZt8bdrjUUa06+l9s
         Xa+uGVgjU4cRrRsCyvQeiyW7PVJOS7FRu0DrIIjf9y6UnwTTQopxcjd5wEO4bDoXR2Th
         WT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2mKdorzHdg1zfAzwiPQJ7Wg5NC+xM/HsolBkJYeGg4Y=;
        b=afbZOKBg+Kg3K7ixwMXC7ZHJm60b+VorVUzz78rBFNYDG/bqWwTUqkcpQUR/coUff6
         DDVWZrsFVk6xEQ9o1ecGb6GcnUpF72MV5AEPWWeVdo6RoDZl8TJo9R9c3eEk3Lpvwe5S
         mfJ27JrEsP6NtQapTWq58PkkNa/scGOZHmFZ5WQadGvgKeE2oTzqK2Jai5Pv90sS1bu0
         bRg6Vw9ZLHq9aaKKwM5/nNlgt8YttGblh+fUUFBV8oZHGrPNSVA9T1VVu09wdSvOe0gW
         KW6eaP3nBfzt8inpx05tQ1PRSugSQ6zdWjsw9mA+NSs5k+Ehlqe3mw4zjEjeTgmMVuKT
         b5Bw==
X-Gm-Message-State: AOAM532Q84OeetsG+lR3NIWFCrIXBS5OTsyTnXn23JqdOAK4iiLwH6uB
        9wxFFRagc3j9dPz8VU4Nfi/+RIf7
X-Google-Smtp-Source: ABdhPJwQBa04mtAEejebNOjIqgr5k3QcGV9QKnJOe9e77RXVFSRCEh5C5Vp7/U6sA/YvspcW5CIn6g==
X-Received: by 2002:a05:6402:1604:: with SMTP id f4mr3206848edv.379.1590853790043;
        Sat, 30 May 2020 08:49:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:d1bf:eddd:8052:1a96])
        by smtp.gmail.com with ESMTPSA id b21sm10347670edt.15.2020.05.30.08.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 08:49:48 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Asher Gordon <AsDaGo@posteo.net>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] univ-init: set default to -Wno-universal-initializer
Date:   Sat, 30 May 2020 17:49:45 +0200
Message-Id: <20200530154945.44985-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

'{ 0 }' is the standard idiom for the universal zero initializer '{ }'.

But if the '0' is taken literally, warnings can be issued, for exemple
for 'using 0 as NULL pointer' or for 'using a positional initializer'
when the attribute 'designated_init' is used.
These warnings were not intended to be issued for this initializer
and are confusing and annoying when people have to use or want to
use standard code or ignore that '{ }' is fine to use with GCC,
clang or Sparse.

So, set sparse default to -Wno-universal-initializer, suppressing
any warnings caused by using '{ 0 }' instead of '{ }'.

Reference: https://lore.kernel.org/git/e6796c60-a870-e761-3b07-b680f934c537@ramsayjones.plus.com/
Reference: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95379
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib.c b/lib.c
index 9ee8d3cf6b21..37c09d914c56 100644
--- a/lib.c
+++ b/lib.c
@@ -295,7 +295,7 @@ int Wtransparent_union = 0;
 int Wtypesign = 0;
 int Wundef = 0;
 int Wuninitialized = 1;
-int Wuniversal_initializer = 1;
+int Wuniversal_initializer = 0;
 int Wunknown_attribute = 0;
 int Wvla = 1;
 
-- 
2.26.2


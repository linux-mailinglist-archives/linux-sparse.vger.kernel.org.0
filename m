Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F4410CFBB
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 23:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK1W1S (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 17:27:18 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46906 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfK1W1S (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 17:27:18 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so29341732wrl.13
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 14:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bwe1GO14Y8b9F9AJkP/+dWGSwkrcHkLWqDMA7YMWghs=;
        b=vbGRtffM2qTGP73xQxzEBgw8iCB5tyqkbkbss7u7djkkccoRQ5FymnFMkMJO7NY+ZL
         RFTxlpGO10Yg8v+SarmDVLruOqqkDNnFKxyArYSiJPWm/5R3pzKWMf6FVbmKH+uRIADr
         /iJr/EJQT96h1p+ld5nEUd4TdHsavon1QT4FJTPwFaNJrmXjKTbUal6kGxCWuSZNZObW
         cnQ/pQ3vbC1DLzoik9Kt5sCKgejI2g9aq794u2KJ/TWxDBrmp15cBo12bkv//IqzCPCe
         Dl3jNA/QeOXL8dhAXFl+VaNHxbBuoYUZNWaiB5dyxvgzqw/e7Gm+H08EQswk/gr2gCwJ
         WzpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bwe1GO14Y8b9F9AJkP/+dWGSwkrcHkLWqDMA7YMWghs=;
        b=MOwQS2Tkz1c7rVqL+1/TikgMfqIBsBI3miRile+pi+HHGkyfUJsOY6e9oYqQL3v5oj
         H5k//zQmmqPjUfYEsCZBPf7833kqqsdvXaqf+dEWLhVbT9iimaO90/dhNjrhHNstLszm
         P1u1J6nkLpZyrCImiFS1g8MEgTxNt+WMmBfFbUDK9FZdhHpxVPYRzeaRfTan+HNsZ//b
         tRS3oPPbtRSp8ioVTdyrCr0ng5FhfLV4bvruwYxeHRxlftpy7+ro1cNpkuAIFx5ZJrUj
         /FugEWlesQAB/mQBpz6aflWmwAg2+yemvE5Dl8mjuvfMmufpQlh4XlL9UIlvrfRqnKMF
         +6gw==
X-Gm-Message-State: APjAAAX5L/uODf+ooL5+gDZ9gsnq145DG83V+yAzJFlEm47hgChcMjz6
        EGloBcKL+1xN92Hcoj7BAcwJj9eN
X-Google-Smtp-Source: APXvYqxiEICU/bPDpWRrU5WJ2YDPp/a+PdSJEZBfpy2semxHVl5APGHWhAE4OVwNPGX4/11h8KRg3Q==
X-Received: by 2002:a05:6000:11c6:: with SMTP id i6mr481920wrx.178.1574980036206;
        Thu, 28 Nov 2019 14:27:16 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:5533:3e30:d93d:fd1e])
        by smtp.gmail.com with ESMTPSA id 205sm14625071wmb.3.2019.11.28.14.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 14:27:15 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] testsuite: avoid standard includes in the tests
Date:   Thu, 28 Nov 2019 23:27:12 +0100
Message-Id: <20191128222712.7972-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These headers are often complex and full of implementation
specificities. They have no place in the testsuite.

So, remove these includes and replace them by the prototype
of the function being used.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/backend/hello.c | 2 +-
 validation/backend/sum.c   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/validation/backend/hello.c b/validation/backend/hello.c
index b0e514be4..eb89846f0 100644
--- a/validation/backend/hello.c
+++ b/validation/backend/hello.c
@@ -1,4 +1,4 @@
-#include <stdio.h>
+int puts(const char *s);
 
 int main(int argc, char *argv[])
 {
diff --git a/validation/backend/sum.c b/validation/backend/sum.c
index fa51120e1..38ebf41ed 100644
--- a/validation/backend/sum.c
+++ b/validation/backend/sum.c
@@ -1,5 +1,4 @@
-#include <stdio.h>
-#include <stdlib.h>
+int printf(const char * fmt, ...);
 
 static int sum(int n)
 {
-- 
2.24.0


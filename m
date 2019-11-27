Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30E9510A8B4
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfK0CX6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:23:58 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34671 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfK0CX6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:23:58 -0500
Received: by mail-wr1-f65.google.com with SMTP id t2so24830603wrr.1
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rlz/ET4SBcU//s70nDmydTFSNbw1O4ihr744z5h9Cvo=;
        b=FOkA3qf3nHoK9v8GBUIpjZSYPEWJD3O3SCJDsim1Cp18Qv+r+jWa+Kw6eXsxGkzq7c
         TKdNAePq7h1VT3zqpAGkicqrUh50gbSCjGb8G93Up6Yy4/fA/w/+hFmvwuyioW3uDp1o
         /cAQu75zVfC23wP4c6BZe6Yw52h7QMNz5GJIKRrGWfb/2Thon0h/woPXsoH2SeQtkzSs
         nXN0L2ZHH8sCtscKvU5DFojX3QrE8+GyoDT957GyO202gcKvuLXCjFkjAlxf2IUywDcw
         zchtQ6l/Qe/zis+78W2reev6MR/XroydTgW3gZ9zmZ3ewRXTLHmq+A3WEs7pvITQhUdV
         FinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rlz/ET4SBcU//s70nDmydTFSNbw1O4ihr744z5h9Cvo=;
        b=EwK4J5FIgJbs8HjukjQ4+pAmFjv8BdvL32Ar4Zq528chTC9VaDEYgzVWn7SjkSBwyn
         rrgberzX3PCjWt/S4vBDgHDgqvD+SIn3FGjD1SbVIS/SePehk7V/gvpEfCruLEPLVMay
         sHaCcCa0P3n621OFqKgAtTQPODE8fdjy8D4Wjx4JX5HyBCG7B11yxP6jeBGwtCzxE2bJ
         MjOGvmGL1nMlaWzJseatiB2pWjkisdsvz6qevRav9y062FIkiiAStHZwGOjnnRxK0o3m
         ZDPDZmOBI/PkjcKlRN8F2oEJsTZSZ4pwWI7vpOXAhCQMjL7kkZlalz6pkUc/yPdt9si/
         Y4eg==
X-Gm-Message-State: APjAAAUqSglD8criv8VEWWMGzW+lxVqEsKVo7jdapTomhOP0rOn60kE6
        LD6/OoIe0O8ry95oVnDMej2UxHxv
X-Google-Smtp-Source: APXvYqxE3MAQJJuLIj7ZtPovRZRG9lA/wEQF1B2abYePA2jz6Ug+ID01DS4wJUR8ceZy63CYBsIJhg==
X-Received: by 2002:a5d:55c7:: with SMTP id i7mr41174294wrw.64.1574821436406;
        Tue, 26 Nov 2019 18:23:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id c1sm16690920wrs.24.2019.11.26.18.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:23:55 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/4] arch: add missing predfines: __amd64 & __amd64__
Date:   Wed, 27 Nov 2019 03:23:48 +0100
Message-Id: <20191127022351.68902-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These seems to be defined whenever s__x86_64 & __x86_64__
are defined.

So, do the same here too.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib.c b/lib.c
index 45402e51f..28ca49c7c 100644
--- a/lib.c
+++ b/lib.c
@@ -1609,6 +1609,8 @@ static void predefined_macros(void)
 		if (arch_m64 != ARCH_LP32) {
 			predefine("__x86_64__", 1, "1");
 			predefine("__x86_64", 1, "1");
+			predefine("__amd64__", 1, "1");
+			predefine("__amd64", 1, "1");
 			break;
 		}
 		/* fall-through */
-- 
2.24.0


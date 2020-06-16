Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE221FC0AC
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 23:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgFPVLE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 16 Jun 2020 17:11:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgFPVLD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 16 Jun 2020 17:11:03 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA83EC061573
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:11:03 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id x93so260012ede.9
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 14:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQJI9b7zyOVJcB2k2pfBRaZKzxXBQaJcP9YH4fv2B1Y=;
        b=S77zykDkKTM36wBjKmNnpW95d1kMieM++2iWQhyz2+PLwkRl/Z69mz3ZnOXz8JYLWg
         BCLoHHJifLMGxYW2j1MwEARFAlMOr9f4bwU4CPuUP5+lOkq+6TRDjkYWZQt8WXg8N2s/
         +zxsvKBX9xddh7TXcBqaO8iSrBZeRqB+l7XPB7Ir0rbAM90ysWztId4VmpOoL6Q+Kr3s
         Kny0+FlOBMj1UhaaGmO3WEkegKY3ynkQbKRWvGtlGUIH1kRf0aSGCIS6HMqHa/zEBTgA
         P2fEauEzu5X7/MT52yC1TM8KoHpBI+JWw9C0IyscG2C4hj0WBGHC2LswQUAGemTwpQQl
         SyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eQJI9b7zyOVJcB2k2pfBRaZKzxXBQaJcP9YH4fv2B1Y=;
        b=KSgfL9AW0oJnNBBQtVRpkTVVIvmb4RmphsvVsK1VcKyvEmwzZ9g8nZy9IqPa/rRW/0
         4VKwQnv7LruIx+sLtggUFWEk5r1pHnc7PZghVk/1GWdqgWii1ypCPjXYKTzAJELiVIE3
         Y6vRfB+jTD954VhdY34mQ8OucQGSEOOi4o4wsgbe1vPWS5FqXqC7K+IO1H2Wxo6uVRtX
         cKlq7wq1+KpBWftxCI2gWNtn+gAh3Hn0B9JB3qY1cK2ovQRjVuVgg5sYYVAoYjndKCBI
         uJePd4flUV1kUADqrlLSPcOYvSmgmot462t1LVk0VM2lRMB/LUocW4M4d5MZ09tYdwaD
         wrRQ==
X-Gm-Message-State: AOAM533/zqf4f+HKpJs3b7RWNJT3wvyaancSc8085lIyUGxV+LmL0u66
        IpTdCQcf3fRdoN5SVlpT83JmiiDe
X-Google-Smtp-Source: ABdhPJze6bI8b87oghi11T3E+pnM6vUDdYg41PUFByJx6yTHYz6Od7RiweAhNseGMDqv1fjKWhvGvA==
X-Received: by 2002:a05:6402:659:: with SMTP id u25mr4525726edx.124.1592341862216;
        Tue, 16 Jun 2020 14:11:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5034:6797:70f1:e20a])
        by smtp.gmail.com with ESMTPSA id a13sm11838748eju.59.2020.06.16.14.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 14:11:01 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] build: let the C++ compiler be configurable
Date:   Tue, 16 Jun 2020 23:10:58 +0200
Message-Id: <20200616211058.78202-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

By default, the C compiler is 'gcc' but it can be overridden
on the command line via 'make CC=...'.

However, the C++ compiler (only needed for sparse-llvm) is
hardcoded to 'g++'.

Fix this by allowing to specify the C++ compiler via 'CXX=...'
but keeping 'g++' as the default.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f46654e79642..07de0bc3226e 100644
--- a/Makefile
+++ b/Makefile
@@ -6,6 +6,7 @@ OS = linux
 
 
 CC = gcc
+CXX = g++
 LD = $(CC)
 AR = ar
 
@@ -189,7 +190,7 @@ LLVM_VERSION:=$(shell $(LLVM_CONFIG) --version)
 LLVM_VERSION_MAJOR:=$(firstword $(subst ., ,$(LLVM_VERSION)))
 ifeq ($(shell expr "$(LLVM_VERSION_MAJOR)" '>=' 3),1)
 LLVM_PROGS := sparse-llvm
-$(LLVM_PROGS): LD := g++
+$(LLVM_PROGS): LD := $(CXX)
 LLVM_LDFLAGS := $(shell $(LLVM_CONFIG) --ldflags)
 LLVM_CFLAGS := $(shell $(LLVM_CONFIG) --cppflags)
 LLVM_LIBS := $(shell $(LLVM_CONFIG) --libs)
-- 
2.27.0


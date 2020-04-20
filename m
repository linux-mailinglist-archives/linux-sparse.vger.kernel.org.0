Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFD61B10C6
	for <lists+linux-sparse@lfdr.de>; Mon, 20 Apr 2020 17:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgDTPyV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 20 Apr 2020 11:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725875AbgDTPyU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 20 Apr 2020 11:54:20 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74404C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 20 Apr 2020 08:54:20 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k13so11618614wrw.7
        for <linux-sparse@vger.kernel.org>; Mon, 20 Apr 2020 08:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xVgYhtfsS037oBTHaLOKwiOV8VQ1lAmSGdFUQ9cPWbo=;
        b=hOt2QlAkv3Ccb0i0ViJD4YjqFQCIKC8mCmueJcAHVhuklS9oO1W1K85O8qC0THBNA+
         f5lM2CyffIvk5ujpWaImVXnOf+93Qx1AYripKt8Bu7SJHFzHw7dcTzf34odjozf15JEF
         SM39fUdwU/cX2RFhU+yHKuHL3A6CF48NjgHbLa3m6Hyo1731bKBiw+274TEN8RJc9gFP
         D5odkzkAJjNYT0qn6Dd7DWVftYpg0DvgxzP/MY1X0udfTbA7Iwo/xpsFS2RHCR/xrXPx
         6NhqdfYPwOSvvCYj6dCseQcvjl4YTtKy7nJ4M/Ga1XVVcLUsWBrGlvOlxw0qDxiGe4B1
         j3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xVgYhtfsS037oBTHaLOKwiOV8VQ1lAmSGdFUQ9cPWbo=;
        b=twTygi3Hipd3VgQbKSYBqsiyiLn1YrnpSprZw+xWbFL/wifoU74gYS8Syy9AyHtndx
         e9NO+XO38BAsRRWLSL+Qd8kC4kUkc2fzfgJiWLFnC9mqasZ1aRUX9ykWC/p61agg+hM5
         HcepY4vXEPCaZAQP2P6Ei5IDXJpVzLAWrH4obL6OZcCp88lrIANSb4bXZAMKWc/AhoCP
         O6HKJXKWWeNWwiU+MHbjrGk504Ew6NopOWsj/roxfVctn4/21p2ePucFZgTzL1OCYQ5b
         3AjQqzpePBAfvU6Opx3czVjL7gZZ+t5D38lxKbMKZ4w7d8Ozmbf1akIyMM7m1lV931nV
         tFAg==
X-Gm-Message-State: AGi0PubCSjZRxEz94bRHOAlCrTVSo5Hw5Xw6tkWuWhmCphGJwQESTrhc
        ibUkHf8bQ+SaF3GBEr2ABM9NjJL4bcw=
X-Google-Smtp-Source: APiQypJMjFgTl75agMh4eFitf266zufZuTk/Y22N2IN9SVMkRJvE9TwfmLI4EMFiwCDfHlJhxV6dsA==
X-Received: by 2002:a5d:65d2:: with SMTP id e18mr19889711wrw.104.1587398058965;
        Mon, 20 Apr 2020 08:54:18 -0700 (PDT)
Received: from localhost.localdomain ([194.35.116.120])
        by smtp.gmail.com with ESMTPSA id h5sm1787471wrp.97.2020.04.20.08.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:54:18 -0700 (PDT)
From:   Quentin Monnet <quentin@isovalent.com>
To:     linux-sparse@vger.kernel.org
Cc:     Quentin Monnet <quentin@isovalent.com>
Subject: [PATCH] build: fix LLVM version detection
Date:   Mon, 20 Apr 2020 16:53:52 +0100
Message-Id: <20200420155352.11364-1-quentin@isovalent.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The regex match used for detecting the LLVM version works for versions
with a single-digit major number. Now that LLVM v10 is out, detection
can fail, resulting in sparse-llvm not being built.

Fix detection by extracting the major version number to compare with the
minimum supported.

Signed-off-by: Quentin Monnet <quentin@isovalent.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 85d15edca948..e93cfd66d0c9 100644
--- a/Makefile
+++ b/Makefile
@@ -183,7 +183,8 @@ arch := x32
 endif
 ifneq ($(filter ${arch},i386 i486 i586 i686 x86_64 amd64),)
 LLVM_VERSION:=$(shell $(LLVM_CONFIG) --version)
-ifeq ($(shell expr "$(LLVM_VERSION)" : '[3-9]\.'),2)
+LLVM_VERSION_MAJOR:=$(firstword $(subst ., ,$(LLVM_VERSION)))
+ifeq ($(shell expr "$(LLVM_VERSION_MAJOR)" '>=' 3),1)
 LLVM_PROGS := sparse-llvm
 $(LLVM_PROGS): LD := g++
 LLVM_LDFLAGS := $(shell $(LLVM_CONFIG) --ldflags)
-- 
2.20.1


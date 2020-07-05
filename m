Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE468214C93
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgGENCo (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgGENCo (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:02:44 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E77C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:02:44 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dp18so39584686ejc.8
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dgtvhZLfdp9O3gftKqMBNkndvT7e8+IujNOk46Vo20Q=;
        b=s8SH+BOdas6H+4zvjIcvB7RBDRScWq69MTq7953t6ZLFtRepY7oy7gSqgPTxcD1354
         YT/54NNWY1vmGuS0Oc/AjqUPzWaVLme+U7tlI0XTzD47OKDDbx2ECBE8eNRJpNzPcdH6
         CYkAosoB+N2U5e2V2sKqVvi6ZksaDiyx+LK6/JiOL1hlIZMb/GuKn2idhDJMNjB6pUqX
         2z0/KauJ/vFeywfXPyaxRBC7c3Rd9T0KQbpfKTsJSi77GcKKCL+BbAX2X6XUE7R5W9Y8
         b0HVUFpCSjtG/d+P50GpbfPJcAI8F2y4gW3XCmSuCt8MIygQVxEFUjYufesqVdSf74gl
         sk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dgtvhZLfdp9O3gftKqMBNkndvT7e8+IujNOk46Vo20Q=;
        b=i1RPzxwVwtQVOcczo3dFJdPnfmjYPErG9I1h3HDKEUrrSiFAhdkZqzxuNeJHhDwyKS
         a7SDhNjZGf/D+bKECa7e92ThRfHt2Zm8JYodf0xIBsEHtH7OQ2YfubeF0VdIBt0/luIU
         ssUaQipFolIgqxrtiD0yIlKMxSyJ3fx/2JutbJCFQ5qsNnC2pyuLfk5N7nVY4yHSkeDz
         39OvfzffHgoOszPPpKjWH/q38xg71Q7ru52RROrvBERzoB8ih+jegdy3n/uBqhwtxGwZ
         E8Z46clXPdqsAUrkiW2knETJFwjAMp17FbrZmWtRpbDeRoCmcUwVGyYvYDpVRKDsSWSn
         stEw==
X-Gm-Message-State: AOAM5315zdlj3bEC7HDZ80m3tcGwLfSD4ASS3tOzS/ONjMEXVKlPl9xw
        l/GJ/XeBUJCWuxJEhEgaUy2cMvpJ
X-Google-Smtp-Source: ABdhPJypwY8IYgrloAf/kuNKi4R9tjLflZLcdx30WRcdI8Fbp7ShLQ1rENx37+f8TJvKZo17iyIZPw==
X-Received: by 2002:a17:906:2a5b:: with SMTP id k27mr38424331eje.82.1593954162574;
        Sun, 05 Jul 2020 06:02:42 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id x16sm19535945edr.52.2020.07.05.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:02:42 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 15/15] cleanup: move hexval() to utils.c
Date:   Sun,  5 Jul 2020 15:02:20 +0200
Message-Id: <20200705130220.26230-16-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
References: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Now lib.c contains almost nothing else than library entrypoints.

Move a small utility, hexval(), to utils.c to complete this cleanup.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c   | 17 -----------------
 lib.h   |  2 --
 utils.c | 17 +++++++++++++++++
 utils.h |  4 ++++
 4 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/lib.c b/lib.c
index f512be2e1a43..57c89a16448e 100644
--- a/lib.c
+++ b/lib.c
@@ -50,23 +50,6 @@
 #include "bits.h"
 
 
-unsigned int hexval(unsigned int c)
-{
-	int retval = 256;
-	switch (c) {
-	case '0'...'9':
-		retval = c - '0';
-		break;
-	case 'a'...'f':
-		retval = c - 'a' + 10;
-		break;
-	case 'A'...'F':
-		retval = c - 'A' + 10;
-		break;
-	}
-	return retval;
-}
-
 static void do_warn(const char *type, struct position pos, const char * fmt, va_list args)
 {
 	static char buffer[512];
diff --git a/lib.h b/lib.h
index 81253a3e7ee5..46483f2bed5c 100644
--- a/lib.h
+++ b/lib.h
@@ -45,8 +45,6 @@
 #endif
 
 
-extern unsigned int hexval(unsigned int c);
-
 struct position {
 	unsigned int type:6,
 		     stream:14,
diff --git a/utils.c b/utils.c
index 094df3f9bf1c..72fff00ff91b 100644
--- a/utils.c
+++ b/utils.c
@@ -8,6 +8,23 @@
 #include <stdio.h>
 
 
+unsigned int hexval(unsigned int c)
+{
+	int retval = 256;
+	switch (c) {
+	case '0'...'9':
+		retval = c - '0';
+		break;
+	case 'a'...'f':
+		retval = c - 'a' + 10;
+		break;
+	case 'A'...'F':
+		retval = c - 'A' + 10;
+		break;
+	}
+	return retval;
+}
+
 void *xmemdup(const void *src, size_t len)
 {
 	return memcpy(__alloc_bytes(len), src, len);
diff --git a/utils.h b/utils.h
index 7bd14f467799..079fb02a3e94 100644
--- a/utils.h
+++ b/utils.h
@@ -8,6 +8,10 @@
 #include <stddef.h>
 #include <stdarg.h>
 
+///
+// return the value coresponding to an hexadecimal digit
+unsigned int hexval(unsigned int c);
+
 ///
 // duplicate a memory buffer in a newly allocated buffer.
 // @src: a pointer to the memory buffer to be duplicated
-- 
2.27.0


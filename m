Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACB7214EA1
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 20:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgGESvA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 14:51:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727931AbgGESvA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 14:51:00 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6AC1C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 11:50:59 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id di5so11382897qvb.11
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 11:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QDJADeECKg7tEkGDHdFaJk9Zd+F2vQ/lL3CJplFnwIg=;
        b=sagEVhod6V9wDCmBLpdDAlkr5/MUy8MPMm6vvk+/9IOXPW2xIaDW45ESErgAU+1IY2
         bcuGYUJTg4K2Rt+RVWz9F4kd51uQdzhcKgSSYt2EtgqGu0D8wLuVeN7JPOoHW4hZ1ZSb
         wtfJ7NWLdg2pEuVleQ8GPWuA9uTBdU1I6+gtAzkkXbb0ziAIYJKAE4QXyfMKMkdecxGj
         RdvNyyNrZpYwG45eOU9u7L9fLWhas9FJsQhIJD9T21MsVsBnIi773FkYylerPAVar1M0
         AFH5xyDGwJaDDvptdAeSoH+iSI46Q6eF53qEIiysl8Li6b5OG60DSCSOEprNGsPoBNMV
         Uqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QDJADeECKg7tEkGDHdFaJk9Zd+F2vQ/lL3CJplFnwIg=;
        b=KydCki14nEAfYrewYe4mZ8oqLktrkmxGc1kmTCMFIm1HtdkzRWTWFabxd+h/0HcSfv
         mJtccQSud0o85wWL197Xv0Lacz8nSG7QWK1b0/dwWcaSNC2mUTeaDpXYusZ3sh19f8T4
         hShRbEd2LEabBjUq7MBtluDepKzK2HVJ/S7CegpB8QDPyyOmGM3zKHc84BS23Psnpect
         n9deYxLDqNr9i/fVIR7zIstAV4ilgyLqxRxpTNR3CzIynAoYBe5523vwZTBp+uR1PrAo
         fIrr58ZhrgG7NzWG3br29bL5tAUsy4jLrvba5cJmtcmVuGjAapE31GG35niHIX888/L5
         ZTTQ==
X-Gm-Message-State: AOAM530fqcUczXZOkN4teCiNpkZWZgoI+ZeZbprB0KkYhXleNjYg7Nj1
        kXGD6XRbAdkGHdhe3a/Csl5fntJ0NOA=
X-Google-Smtp-Source: ABdhPJwytN4Ch8tirT32nSggqahzldE4dcgHT4EEv/0r2kkjiUV3cv7XOK5eEyZjwlC27vk1MLyNKA==
X-Received: by 2002:a0c:b246:: with SMTP id k6mr43632374qve.146.1593975058632;
        Sun, 05 Jul 2020 11:50:58 -0700 (PDT)
Received: from darkstar.. ([2804:d45:9905:9600:f66d:4ff:fe73:55f5])
        by smtp.googlemail.com with ESMTPSA id c27sm15590795qkl.125.2020.07.05.11.50.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jul 2020 11:50:57 -0700 (PDT)
From:   Davidson Francis <davidsondfgl@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Davidson Francis <davidsondfgl@gmail.com>
Subject: [PATCH] test-inspect: reset locale after gtk_init()
Date:   Sun,  5 Jul 2020 15:50:13 -0300
Message-Id: <20200705185013.8578-1-davidsondfgl@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The test-inspect tool uses GTK to visualize symbol nodes. It turns
out that gtk_init() implicitly sets the locale to the system locale,
and since Sparse uses strtod()/strtold() for parsing floating-point
numbers in expressions, parsing becomes locale-dependent.

Since the system's locale may be different from "C", test-inspect
may be unable to parse float numbers.

Steps to reproduce:
    $ echo "int main(void){3.14;}" > test.c
    $ LC_ALL="fr_FR.UTF-8" test-inspect test.c
Output:
    test.c:1:16: error: constant 3.14 is not a valid number

Fix this by resetting the locale right after gtk_init().

Signed-off-by: Davidson Francis <davidsondfgl@gmail.com>
---
 test-inspect.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/test-inspect.c b/test-inspect.c
index 63754cb3..a59cd902 100644
--- a/test-inspect.c
+++ b/test-inspect.c
@@ -6,6 +6,7 @@
 #include <ctype.h>
 #include <unistd.h>
 #include <fcntl.h>
+#include <locale.h>
 
 #include "lib.h"
 #include "allocate.h"
@@ -31,6 +32,7 @@ int main(int argc, char **argv)
 	struct symbol_list *view_syms = NULL;
 
 	gtk_init(&argc,&argv);
+	setlocale(LC_ALL, "C");
 	expand_symbols(sparse_initialize(argc, argv, &filelist));
 	FOR_EACH_PTR(filelist, file) {
 		struct symbol_list *syms = sparse(file);
-- 
2.11.0


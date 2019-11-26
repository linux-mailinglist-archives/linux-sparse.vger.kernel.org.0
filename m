Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5252110A575
	for <lists+linux-sparse@lfdr.de>; Tue, 26 Nov 2019 21:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfKZUa1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 15:30:27 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39664 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfKZUaZ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 15:30:25 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so20931319wrt.6
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 12:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ekH5LAUnp8870m09f07BwbDllCNeA0TuXY8qe5YNbDg=;
        b=ZfpF31IH49mR1Ed/pgsQeqCsQct7e5M9Mom7b9OBTI542OCuFb3CBgtUr/HiyXMskI
         MQnaZbr4/QTbA8tDlhy2IAmPe8N0S7i15R8uPVwpIwF+D9aOZfAvzCvn1jbCkXjbia47
         gmY4/hYBtKC7l0CTJ7jpCIf77RTr/Bni4/W7W/O3ZHzP+GeZtalLCt4Uqc9eUOdq49Q+
         fyOWYEoCKIYUVQOulW5oYpJnwcHHP26fPpBj8qrSyH4f1Mb5oBoT03jiyAsmztl16UC7
         ba0arcj0qYKkITzCXPwNFQyJn7h1qc3VF0eQ265V9XPF06tosg6nAXSM+O2x7NaYPmd0
         gjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ekH5LAUnp8870m09f07BwbDllCNeA0TuXY8qe5YNbDg=;
        b=j+weKAaOemP9URLXvvjZZ8b3WLmErwoCNyIGrS/ictyRElVxjIXNsj3WdXZ3BMMGvB
         2964XULD83SMejPEJgKMNgBTspF8K1B8En73WYue8G6opOi7XMTh3GfGTZjZwVqSgvYC
         7Cm9U2pgRBbm0iqwX2BIaZj784vDNDXAe+lLLVd03N9n/wmUK96DhUgeemIwRYk+eaS/
         aWBJ4Erso6/loUKSbuAN3MOpr/wBliypgk0kugHZbMC7kh+W7BK68B8PQA0VESgu/w+u
         pGQ9jb8eiglPdwky986cUFiSHJ8B72rTenmLeOw4btrPurVEPWs6whEiHFIFJVQaWx/+
         WgWA==
X-Gm-Message-State: APjAAAXk1wFGs6i1XQfWloxxKXP1u2PSZL4BnfXD7mOI2ZuKN+L64FP+
        WNJ5S6QL4MZth8idk/ynLWiPo3Vu
X-Google-Smtp-Source: APXvYqzvqDI+eZFGvwGXOdD8TuQZqGCiiggVZpojuHrgSHep46rz/0FLzWuYLlq/x8iY3CGK+634uQ==
X-Received: by 2002:adf:f80c:: with SMTP id s12mr4029427wrp.1.1574800222742;
        Tue, 26 Nov 2019 12:30:22 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id 17sm4229465wmg.19.2019.11.26.12.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 12:30:22 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] cgcc: filter-out -msize-long & -msize-llp64
Date:   Tue, 26 Nov 2019 21:30:18 +0100
Message-Id: <20191126203018.63627-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These options are sparse-specific and shouldn't be passed to GCC.

Reported-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 cgcc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/cgcc b/cgcc
index 40dea2a05..ef0375c50 100755
--- a/cgcc
+++ b/cgcc
@@ -131,6 +131,7 @@ sub check_only_option {
     return 1 if $arg =~ /^-v(no-?)?(entry|dead)$/;
     return 1 if $arg =~ /^-f(dump-ir|memcpy-max-count|diagnostic-prefix)(=\S*)?$/;
     return 1 if $arg =~ /^-f(mem2reg|optim)(-enable|-disable|=last)?$/;
+    return 1 if $arg =~ /^-msize-(long|llp64)$/;
     return 0;
 }
 
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71BAAF73B8
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 13:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfKKMTx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 07:19:53 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34078 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726843AbfKKMTx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 07:19:53 -0500
Received: by mail-wm1-f66.google.com with SMTP id j18so3037311wmk.1
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 04:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zC10vm6RRt/vQqyPNKJh5ESpLjl9zz8r38zeH3DScTk=;
        b=VkI+g490pq/Lus4UgTT0S4vIGaAqB5Obk9jQ7VwTBxcRhDL7B5jr3NLP1yZXw7acvM
         /CyVp/hRjl1sWYEqJFLEjWqi+WuCIUILqDfa30CCGbe1LWlNOGL9Rf7zopStxwBjhYIT
         dXtdy8K5PccsriQue5bQ6RYcFk74oLOFuj5u2yKA8BZYFA1qOgPSheVwBBVurV8U/egW
         DZBX6bLPceRZsXR5I0gNaDc6YzuhD06afjnd2tu8FhuPmIb+XJuxZgT4n3Hdal5FMnao
         R1+gMPcmraW7hQOlp8cYpFle4f7NgFYxdtuoIwIonkWOFPe5Yp7w3ALFuUW7gTLVaUU6
         ML+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zC10vm6RRt/vQqyPNKJh5ESpLjl9zz8r38zeH3DScTk=;
        b=QrsE0h3z0gnzr4IiXBiKagMb2Em9vaPRfLWteVduAOv7P4yLh+H/d8iMMJScikSdCV
         1GzwvkykRdU7lJeLUBtWTKp8RgCd8ewOQ4cW8cG8l2hNKDv9DZT1NR0BmQgcit82EBq7
         UyPU007n+aNn/Mr5M2NXyU0Te34QBblwiVpN0gVA2zVaHmnxE7putY8f5BtROW+TaV8j
         ju6l7+zs51gWHzmvmE0Onh1IEW+bm2R0k9ZAdpiVUi3KwEWZRLoVlt/4kGmaHeg0oqsQ
         mt4qpnDpuJALzSt72OdjFoq7dbedeZ4Lc/SBDBLUFHWCu7Hfa9jpSuvujY0HbBDHPFuH
         E1UA==
X-Gm-Message-State: APjAAAX3Jg0pNaDchtukCiq5aXpqH+gs9Fqw4WEd3AhWtSUNd+VojgH0
        Lyju4khvprKieZqTzutvSUvirpSH
X-Google-Smtp-Source: APXvYqzP/XoGSbdd3uDoMmQM+pg42FT+1yRZ4mbP61dJXTcLoKgqm9dC4n+ObmoNKSInCgmkvafjYA==
X-Received: by 2002:a1c:1fca:: with SMTP id f193mr18824271wmf.173.1573474791105;
        Mon, 11 Nov 2019 04:19:51 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id j14sm16256478wrp.16.2019.11.11.04.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 04:19:50 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/3] arch: do not unneedlessly set bitness on 32-bit archs
Date:   Mon, 11 Nov 2019 13:19:44 +0100
Message-Id: <20191111121944.78498-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111121944.78498-1-luc.vanoostenryck@gmail.com>
References: <20191111121944.78498-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The code at the start of init_target() already take care
of making the arch variants match their bitness. There is
no need to redo that while setting the type of [u]int32.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target.c b/target.c
index e1f2fd5d9..e886f7f0a 100644
--- a/target.c
+++ b/target.c
@@ -107,7 +107,6 @@ void init_target(void)
 	case MACH_PPC32:
 	case MACH_MIPS32:
 	case MACH_RISCV32:
-		arch_m64 = ARCH_LP32;
 		int32_ctype = &long_ctype;
 		uint32_ctype = &ulong_ctype;
 		break;
-- 
2.24.0


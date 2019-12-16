Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8883121E63
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 23:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfLPWiI (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 17:38:08 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43254 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727799AbfLPWiI (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 17:38:08 -0500
Received: by mail-wr1-f68.google.com with SMTP id d16so9207042wre.10
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 14:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ExTao6MRRk8ULSzLqgkvTeuMG6+oFxRP6Ip0CSuPkaI=;
        b=VqL7qjH/XCWlt69Q26mOJId95JMDasxf45Q//jpiRt6SlCnvdPmmamFnCbml/MBO60
         JLcUZjysBcPwUkK29B1qlN6byGCjw92F8Ba8iVDrBpVHIa09XtdQj1jkLr21lzS6n718
         H7j/M0HApXndkqQRIWvI/LFTBAkN984uNpWk7/Ndl9Sgv+Um8V70vXWAVrNWf/fkd5hI
         5Jy02G/Ji0U99y5GVMid/c3T0qsqdI039/r/xPMC0FcljZVx5jXgbo6CP893BUr3jvQS
         cnLxaoEqCUoVnUWdLxyuKfFQ/LvrghQPnfw8k4uQzdVijfDa4wzEOFKjyHJcBqRwKmS8
         uRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ExTao6MRRk8ULSzLqgkvTeuMG6+oFxRP6Ip0CSuPkaI=;
        b=apFgY5F98gtI9SQnDtPDSJNTIiDY9QwJ3PWvVwFtpOaRRWLpfuDlf/7xJ/NE1YR9dp
         ZTUS9Bt8ICn6+KOL596aOGMiO7iXDf1FiCZb4/jbJFoj1KwJ3xBgFOHwYTNHhllxrKgy
         C0qiwslzsbBLZICduJIg73GGiND0FrFhWRjzj3fgw1OhjmLVJ1ifmU+3ngx40JtEf7Jb
         x2GcFYLl/oLKHq1KDHGDIQUXhCF7Mzs8kcVxMYof4vA9vSnq2jXnci/kkfoGFdQyXaBt
         iw04HU6lu4S0zAD4/81Hn6ThP1v5HKRPdKcoOy5drmjBAXW9BRe8S7YE0V68H4IRQkOX
         l6IA==
X-Gm-Message-State: APjAAAVxQBvOyhtgblGYn4/F71+iGGnjYlwr1TxhkOOwnFazX7W92S+Q
        3fQbaiAj3FmJ7My7Z55TMig7ilh6
X-Google-Smtp-Source: APXvYqyeE3vI+x2x7dUzTTx4ZT61u06bb/qu1K6o5Nd1HIT1b4UiW+GFlL/uG/mjDHbM/XplQs6NNQ==
X-Received: by 2002:a05:6000:1142:: with SMTP id d2mr31164814wrx.253.1576535885853;
        Mon, 16 Dec 2019 14:38:05 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:21c4:7316:325b:dfe0])
        by smtp.gmail.com with ESMTPSA id h17sm24275709wrs.18.2019.12.16.14.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 14:38:05 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 06/10] arch: use an arch-specific default for -msize-long
Date:   Mon, 16 Dec 2019 23:37:52 +0100
Message-Id: <20191216223756.2428-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
References: <20191216223756.2428-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is for completeness and only useful for S390 which is not
exactly the most common arch. But since it's now easy to do
this kind of thing ...

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target-s390.c | 1 +
 target.c      | 2 +-
 target.h      | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target-s390.c b/target-s390.c
index 157779ce506b..277e0909024f 100644
--- a/target-s390.c
+++ b/target-s390.c
@@ -8,6 +8,7 @@ const struct target target_s390 = {
 	.bitness = ARCH_LP32,
 	.big_endian = 1,
 	.unsigned_char = 1,
+	.size_t_long = 1,
 
 	.bits_in_longdouble = 64,
 	.max_fp_alignment = 8,
diff --git a/target.c b/target.c
index 006292cc00ba..1c7a40836175 100644
--- a/target.c
+++ b/target.c
@@ -196,7 +196,7 @@ void target_init(void)
 	if (target->init)
 		target->init(target);
 
-	if (arch_msize_long) {
+	if (arch_msize_long || target->size_t_long) {
 		size_t_ctype = &ulong_ctype;
 		ssize_t_ctype = &long_ctype;
 	}
diff --git a/target.h b/target.h
index c6aef9592080..ebd8f1b15ce6 100644
--- a/target.h
+++ b/target.h
@@ -59,6 +59,7 @@ struct target {
 	enum bitness	bitness;
 	unsigned int	big_endian:1;
 	unsigned int	unsigned_char:1;
+	unsigned int	size_t_long:1;
 
 	struct symbol	*wchar;
 	struct symbol	*wint;
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D312FF6A3B
	for <lists+linux-sparse@lfdr.de>; Sun, 10 Nov 2019 17:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKJQh7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 10 Nov 2019 11:37:59 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:32908 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfKJQh7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 10 Nov 2019 11:37:59 -0500
Received: by mail-wr1-f66.google.com with SMTP id w9so5273992wrr.0
        for <linux-sparse@vger.kernel.org>; Sun, 10 Nov 2019 08:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ZUhRw//XI6O7G5yxWYQe3AchF3HjyhuxFl44yZIrsc=;
        b=TgHGrx3GL/uUCKey3O7/3sjqgZRt7M22keO2pzWw89TjZNG7tfGoqjJg7uO+5onYVV
         A805NSfp694sqeY/8cNcY0KNivYa882wsqLK3OmRCIhtGkgPG2YlircWP3fLntx69TJF
         PkmN9q1orboyl9l9ge+wDEZ4+UeVR3MeVYrsK4VU4Z4ZUhecbauVvdBqGM4Rx/r6OVmf
         xuL3p3+ky05j8e8YYoE0ZIbv7+wvqPcVjLzVd+RzlOZvjeiGGBp5+LPOl/TJGNpKXYz5
         0HzFYusqzw+YePYw+mBM/BHUTRfEkdJrVi4HZrnhni6UR4L8Bv8FsY6TMzcq3bW/HfLn
         YaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1ZUhRw//XI6O7G5yxWYQe3AchF3HjyhuxFl44yZIrsc=;
        b=Hvs8HO5Ck3IuVM6ySl5UVBtiGCwrrBKzLCrIIEgjXiL3CeyxSSMXM6t3zf76djovLX
         YD3swmkauuvHz1c+xkUPj3szg6UD1CjFdE+clUhr0YHvlgYKeb2Cqfk1PzhiKxse/VYG
         cgdP1Az762wcA7eu1lo/8z6yymAlci7L67dxZMIS6esanJRsTYxEUUgLkNiUvpUcolZj
         8kDAkKGYbjmJQbc4TibDZeBq50BW5Hrk58wb/iEljQQQTeGj6xAy3y5/VsQfrJI2vl0T
         WSGM5Wy/P4YeM3YzT35HfKC5oxFQbOtI1URTDYU/woEsiNGyWPqkFnPKBYumUv0OocNS
         JA1A==
X-Gm-Message-State: APjAAAWZs025FxPgRi2v6AxmaUWplBue6IQD3Se5GwQSsZrvYUzeyz2t
        NgniUczP/2aPlFeuDFyzwOT/LtUv
X-Google-Smtp-Source: APXvYqwxqJ4PEZcsQ4RwGEstl5XhMqLeEjqKSNln6WDKMFWxH4vRy63N/SDYEedsmeRFzgqMY1e6xg==
X-Received: by 2002:adf:afef:: with SMTP id y47mr16884477wrd.190.1573403876492;
        Sun, 10 Nov 2019 08:37:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:2dfe:6cc5:3ee4:81ef])
        by smtp.gmail.com with ESMTPSA id g8sm13145193wmk.23.2019.11.10.08.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2019 08:37:55 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] arch: fix the signedness of plain chars
Date:   Sun, 10 Nov 2019 17:37:43 +0100
Message-Id: <20191110163743.74588-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Some archichectures, like ARM or PPC, use unsigned for
plain chars while others, like the Intel's, use signed ones.

Sparse understand -funsigned-char but by default uses the
native signedness.

Fix this by setting the proper signedness of plain chars
for the archs that Sparse know about.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c     |  2 +-
 machine.h |  6 ------
 target.c  | 18 ++++++++++++++++++
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/lib.c b/lib.c
index fbf14282b..8bd1d1f98 100644
--- a/lib.c
+++ b/lib.c
@@ -312,7 +312,7 @@ unsigned long long fmemcpy_max_count = 100000;
 unsigned long fpasses = ~0UL;
 int fpic = 0;
 int fpie = 0;
-int funsigned_char = UNSIGNED_CHAR;
+int funsigned_char = -1;
 
 int preprocess_only;
 
diff --git a/machine.h b/machine.h
index e24822a7f..22b05d91a 100644
--- a/machine.h
+++ b/machine.h
@@ -70,10 +70,4 @@ enum machine {
 #define MACH_NATIVE	MACH_UNKNOWN
 #endif
 
-#if defined(__CHAR_UNSIGNED__)
-#define	UNSIGNED_CHAR	1
-#else
-#define UNSIGNED_CHAR	0
-#endif
-
 #endif
diff --git a/target.c b/target.c
index 90097818f..497ecdc5e 100644
--- a/target.c
+++ b/target.c
@@ -137,6 +137,24 @@ void init_target(void)
 		break;
 	}
 
+	switch (arch_mach) {
+	case MACH_ARM:
+	case MACH_ARM64:
+	case MACH_PPC32:
+	case MACH_PPC64:
+	case MACH_RISCV32:
+	case MACH_RISCV64:
+	case MACH_S390:
+	case MACH_S390X:
+		if (funsigned_char == -1)
+			funsigned_char = 1;
+		break;
+	default:
+		if (funsigned_char == -1)
+			funsigned_char = 0;
+		break;
+	}
+
 	switch (arch_m64) {
 	case ARCH_X32:
 		max_int_alignment = 8;
-- 
2.24.0


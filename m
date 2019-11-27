Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7000810A88E
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 03:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbfK0CGx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 21:06:53 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39309 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfK0CGw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 21:06:52 -0500
Received: by mail-wm1-f68.google.com with SMTP id t26so5599257wmi.4
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 18:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xuu9XKhLbPM+oQ0XQ9V4Jsei7mntlWfDn8S5g5MPrQM=;
        b=Ro23DoXBnnF9WDLJCAlPQTYvgcPNWEI3mxoNPBdq+3YCQSBk9mEAquCRav4/D6LLZ9
         O4Nd7Tkv+xdrzN/epok8gQDC17LLkNg/0zIQmWxDQvVuhc07ut9Vda3lpfxZ55nI5X40
         n5TBo661DJ8ykXUMp3TOvsipHxzQnUB/eKAG0UOYqKVa1dQsSI/kt1wcN4k8VIOiay70
         LrMfBgIRw4eK33fXYmf1+ldQCJyG1Kp+gq59k4iFlpBpB0eOSlVPhK4cmdbynVE9IwXM
         ViUNyYfUFLC9psKKow8EzrqOq8lXc6yGAezLlYuZuPJZS9ur+RJtOJDQ6rb8LvcV8x5Y
         c15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xuu9XKhLbPM+oQ0XQ9V4Jsei7mntlWfDn8S5g5MPrQM=;
        b=lOrkmEJBBA7wdazFmkzihxQtOuhheP+QnTxaz0a7rHlJZBweXIA/CY2/z+wDroaZjY
         qKUBNiYtiNGRRT9M9Lz7amlafQlUquGD2zEixKzujgCu3sYwDW0SYfj5KAbVFY5UInQ9
         tPO/vIx9m4YFjzH9esg9mvutoGEIQPCOpVkiB29UsiRkoP0LaTs6gTHKIJBaqKZdxu+c
         fqmt3OnJJT7oeLFnrmgYGpj3f8OoVmyfdGG2XG6TJSI1vgd1RV7z50qrcSu1g2C/ZOPW
         qSqCkVUEaFPh5ibuJwGKls73nwJpquwy+MsMd7DxkmsktIXUzcNCNSMF8aFU4WoHWHbB
         3bOg==
X-Gm-Message-State: APjAAAU/IMw2z8M5ZC2qQUjP7Ct1OXJ4MDR2MkdF8GzUtZjQ7e2Prg2f
        u/BWKfVTJ2GU53V3fnLR82GsiMHV
X-Google-Smtp-Source: APXvYqzI9h0PsSFTilo6veXMhcdMyn7AgjXgBINus3CnPGCUvzaQL05ooUIp0tOm7WnrXoJHpwg7tg==
X-Received: by 2002:a05:600c:2389:: with SMTP id m9mr1748614wma.65.1574820410428;
        Tue, 26 Nov 2019 18:06:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id o133sm5326573wmb.4.2019.11.26.18.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 18:06:49 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2 01/12] arch: fix the signedness of plain chars
Date:   Wed, 27 Nov 2019 03:06:32 +0100
Message-Id: <20191127020643.68629-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Some architectures, like ARM or PPC, use 'unsigned' for
plain chars while others, like the Intel's, use signed ones.

Sparse understands -funsigned-char but by default uses the
native signedness.

Fix this by setting the proper signedness of plain chars
for the archs that Sparse know about.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c                             |  2 +-
 machine.h                         |  6 ------
 target.c                          | 18 ++++++++++++++++++
 validation/char-signed-native.c   |  9 +++++++++
 validation/char-unsigned-native.c | 11 +++++++++++
 validation/char-unsigned.c        |  2 +-
 6 files changed, 40 insertions(+), 8 deletions(-)
 create mode 100644 validation/char-signed-native.c
 create mode 100644 validation/char-unsigned-native.c

diff --git a/lib.c b/lib.c
index 332eebebb..350d881a9 100644
--- a/lib.c
+++ b/lib.c
@@ -313,7 +313,7 @@ unsigned long long fmemcpy_max_count = 100000;
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
diff --git a/validation/char-signed-native.c b/validation/char-signed-native.c
new file mode 100644
index 000000000..5185fce9e
--- /dev/null
+++ b/validation/char-signed-native.c
@@ -0,0 +1,9 @@
+void foo(void)
+{
+	_Static_assert((char) -1 == -1, "plain char is not signed");
+}
+
+/*
+ * check-name: char-signed-native
+ * check-command: sparse --arch=i386 -Wno-decl $file
+ */
diff --git a/validation/char-unsigned-native.c b/validation/char-unsigned-native.c
new file mode 100644
index 000000000..b86458427
--- /dev/null
+++ b/validation/char-unsigned-native.c
@@ -0,0 +1,11 @@
+#define	MASK ((1 << __CHAR_BIT__) - 1)
+
+void foo(void)
+{
+	_Static_assert((char) -1 == (-1 & MASK), "plain char is not unsigned");
+}
+
+/*
+ * check-name: char-unsigned-native
+ * check-command: sparse --arch=arm -Wno-decl $file
+ */
diff --git a/validation/char-unsigned.c b/validation/char-unsigned.c
index 19cadbda3..354aa40d6 100644
--- a/validation/char-unsigned.c
+++ b/validation/char-unsigned.c
@@ -6,6 +6,6 @@ void foo(void)
 }
 
 /*
- * check-name: fsigned-char
+ * check-name: funsigned-char
  * check-command: sparse -funsigned-char -Wno-decl $file
  */
-- 
2.24.0


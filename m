Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FABBFD242
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfKOBOC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:14:02 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33904 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727080AbfKOBOC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:14:02 -0500
Received: by mail-wr1-f66.google.com with SMTP id e6so9153284wrw.1
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xuu9XKhLbPM+oQ0XQ9V4Jsei7mntlWfDn8S5g5MPrQM=;
        b=RffddZXyklbU5Lw8Jm3FDxBo7bpaQv6p/nLj21oCg7qjW1Ut+7jiN6gWz7wmLQQORY
         AuMPymcq5dmzu04TGeOCP9WfuObw3vEAEVZ8Bdxn4duMHLCCKOqSgkqrmf4CUcPU4zEL
         lLKZxy+8CA2+4BjK+HiWKEJKmpxQ/J2LHx2sJuXhJ8/IJ/7oZ0PgDYDoo7y5pSEAkWNk
         kb6ALJvUPxCW+BhPqV2Or6OwQliRCJ6YngCoJAjgWNzUxEzKzAAhCVs61sbZFMabSxXT
         gmz+38WFWGqGavWOHi5TPUtRp3w/DbPVDrT8UKLjanaiKh/D4aemzV99HBfuLBofLmRG
         iEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xuu9XKhLbPM+oQ0XQ9V4Jsei7mntlWfDn8S5g5MPrQM=;
        b=e6P3x9PnKlOoGfqJqxbk+aPTlU9Xt5KAdO0Hv9vUvDpQPblspyDFcfUugIFeYimWeV
         NF7NGvlPHE6QP1pSA5HvPOGUUxpMp2135NW7UW+rTh3pep+vuRqNATKtnd9qGwEqqHtW
         O6j1gozuwTU0SzRmgZZ1pfqZqUathzi6FGmZrR54j4e5s0Cq0nZa5qDh7bIHh6g2//by
         ZgDVqvqIMLAmUtAYUM3x3W/lzENQbMV657XvDHIK26MTNrRzS0OJqEONakeCeIZgTsST
         q/srZdI+DkEZg4lZymBwqaYnMYcJp4XngjbnPFmUbFajz6rW3xXRjD8ZrlH5dmEkrGok
         stoA==
X-Gm-Message-State: APjAAAWtdCAEgM5v+Z/rw/lnz7n1G7x+C4x1dQQLXh3BcnJm2Np0yVdC
        qoa7Q1zwNjUmh+dCqHLIOLRQL/sc
X-Google-Smtp-Source: APXvYqxyzY963qDJyHna88R0ZIKJ9LW03InZISPsIEIUEIhBVFfzep5X8JJ5HDy+3OJT1W00y+Dk5Q==
X-Received: by 2002:a5d:5404:: with SMTP id g4mr8757591wrv.359.1573780439706;
        Thu, 14 Nov 2019 17:13:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id l4sm7918792wml.33.2019.11.14.17.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:13:59 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/8] arch: fix the signedness of plain chars
Date:   Fri, 15 Nov 2019 02:13:48 +0100
Message-Id: <20191115011355.53495-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
References: <20191115011355.53495-1-luc.vanoostenryck@gmail.com>
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


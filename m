Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED05718A190
	for <lists+linux-sparse@lfdr.de>; Wed, 18 Mar 2020 18:31:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgCRRb0 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 18 Mar 2020 13:31:26 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42999 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbgCRRb0 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 18 Mar 2020 13:31:26 -0400
Received: by mail-wr1-f65.google.com with SMTP id v11so31527406wrm.9
        for <linux-sparse@vger.kernel.org>; Wed, 18 Mar 2020 10:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ne6oQI8a7eJWdEtHRAJFQ3/tNSmI1ubmcuR7vcqmsmE=;
        b=mlecvrE8NXyNqPcsHZKVMhQnBupDAEV91GyvqkPeFS4CeDTFi7ctOiMvmZvKgcW4g6
         quosAyEj26jtwMNb0ojXEP84ove84ab0ar0/QNQg+caLBU5/xA9Uonrv+bsI76XmgKCw
         +ZAqmAoBQ6jx70HJMAK39VUWunBkacjXc4QGAiSPWL1an/cuNT0Mx9Eqxpx0j+LZFaZB
         4JKUGPf9LxXfIjMVxjkbKkRf6PrDM9QmktNnsxxhPGbqx60Hcf8PKYaInudZl8drnctS
         K6aksI8gNlgVphAA/+UVCzyh7NQ9jS3PcnJwa275a6pkldNy+OzDZ6pfCyqfB84wJX16
         ZJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ne6oQI8a7eJWdEtHRAJFQ3/tNSmI1ubmcuR7vcqmsmE=;
        b=CASg/fQK9dJYc+/UV2yzDV6LDfpVXCrI0b+FIJyrX9HhTHQCd69pzL9Dqm+oShy+GT
         r/rEQQuwh+J2uR2lC/2/S7UgMpw6UxOtSQ0jVWMCsQBPMUsmlEuMH2hesl/9slmAYeEb
         +gHOs2Eztt+htlZ9/aFcv+pd4TV6LN2ahvePzWNE0qN7d+mwfsYMiYed37LKYvczGFg7
         Zds0CI3QumoVKyPvSpZChnR5BwBcMo9DCSyTuv9EZSK/l1Mbtgl7Q0xElzNxNmUlCl8U
         0GYYcBsXd84TY+NL1G6QUUBB3uTQXAMAULRvgbxwefulV4wGA+lukw9GEHjKbrHU4UYi
         h5zQ==
X-Gm-Message-State: ANhLgQ3D/sb1qHhDLr0l/hEYqBVFaVp/3eo/BFDoYGxK/gq14lgp9V0A
        uJLHgUzMUDHgBFtMXWJwz2QouzY/
X-Google-Smtp-Source: ADFU+vvO3EZISvWEMTlvPIy77luwaemkHLzzIInKTBKxU5XjoLb7KUGiXDvlOAtBkXGgDqjYCr/5LA==
X-Received: by 2002:adf:f8cf:: with SMTP id f15mr6575449wrq.79.1584552684275;
        Wed, 18 Mar 2020 10:31:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:81ce:3038:2a0a:bf02])
        by smtp.gmail.com with ESMTPSA id u17sm10268051wrm.43.2020.03.18.10.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:31:23 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/5] add testcases for OP_UNREACH
Date:   Wed, 18 Mar 2020 18:31:16 +0100
Message-Id: <20200318173120.63939-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
References: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/context-unreachable.c              | 16 ++++++++++
 validation/linear/builtin_unreachable0.c      | 30 +++++++++++++++++++
 ...n_unreachable.c => builtin_unreachable1.c} | 14 ++++-----
 validation/linear/noreturn-unreachable0.c     | 23 ++++++++++++++
 4 files changed, 76 insertions(+), 7 deletions(-)
 create mode 100644 validation/context-unreachable.c
 create mode 100644 validation/linear/builtin_unreachable0.c
 rename validation/linear/{builtin_unreachable.c => builtin_unreachable1.c} (65%)
 create mode 100644 validation/linear/noreturn-unreachable0.c

diff --git a/validation/context-unreachable.c b/validation/context-unreachable.c
new file mode 100644
index 000000000000..3e330403ce01
--- /dev/null
+++ b/validation/context-unreachable.c
@@ -0,0 +1,16 @@
+int fun(void);
+
+static void foo(void)
+{
+	__context__(1);
+	if (!fun()) {
+		__builtin_unreachable();
+		return;
+	}
+	__context__(-1);
+}
+
+/*
+ * check-name: context-unreachable
+ * check-known-to-fail
+ */
diff --git a/validation/linear/builtin_unreachable0.c b/validation/linear/builtin_unreachable0.c
new file mode 100644
index 000000000000..5da9d074ae5f
--- /dev/null
+++ b/validation/linear/builtin_unreachable0.c
@@ -0,0 +1,30 @@
+extern void die(void) __attribute__((noreturn));
+
+int foo(int p)
+{
+	if (p == 3)
+		__builtin_unreachable();
+	return p;
+}
+
+/*
+ * check-name: builtin_unreachable0
+ * check-command: test-linearize -Wno-decl $file
+ * check-known-to-fail
+ *
+ * check-output-start
+foo:
+.L0:
+	<entry-point>
+	seteq.32    %r2 <- %arg1, $3
+	cbr         %r2, .L1, .L3
+
+.L1:
+	unreach
+
+.L3:
+	ret.32      %arg1
+
+
+ * check-output-end
+ */
diff --git a/validation/linear/builtin_unreachable.c b/validation/linear/builtin_unreachable1.c
similarity index 65%
rename from validation/linear/builtin_unreachable.c
rename to validation/linear/builtin_unreachable1.c
index 4f13b892af54..280f853d8a07 100644
--- a/validation/linear/builtin_unreachable.c
+++ b/validation/linear/builtin_unreachable1.c
@@ -1,15 +1,15 @@
-void function_that_never_returns(void);
+extern void die(void);
 
 int foo(int c)
 {
 	if (c)
 		return 1;
-	function_that_never_returns();
+	die();
 	__builtin_unreachable();
 }
 
 /*
- * check-name: __builtin_unreachable()
+ * check-name: builtin_unreachable1
  * check-command: test-linearize -Wno-decl $file
  *
  * check-known-to-fail
@@ -19,13 +19,13 @@ foo:
 	<entry-point>
 	cbr         %arg1, .L3, .L2
 
-.L2:
-	call        function_that_never_returns
-	unreach
-
 .L3:
 	ret.32      $1
 
+.L2:
+	call        die
+	unreach
+
 
  * check-output-end
  */
diff --git a/validation/linear/noreturn-unreachable0.c b/validation/linear/noreturn-unreachable0.c
new file mode 100644
index 000000000000..b76319458e96
--- /dev/null
+++ b/validation/linear/noreturn-unreachable0.c
@@ -0,0 +1,23 @@
+extern void die(void) __attribute__((noreturn));
+
+int foo(void)
+{
+	die();
+	return 0;
+}
+
+/*
+ * check-name: noreturn-unreachable0
+ * check-command: test-linearize -Wno-decl $file
+ * check-known-to-fail
+ *
+ * check-output-start
+foo:
+.L0:
+	<entry-point>
+	call        die
+	unreach
+
+
+ * check-output-end
+ */
-- 
2.25.1


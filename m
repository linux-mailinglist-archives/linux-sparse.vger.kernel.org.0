Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E73620444E
	for <lists+linux-sparse@lfdr.de>; Tue, 23 Jun 2020 01:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731137AbgFVXOd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 22 Jun 2020 19:14:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730985AbgFVXOd (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 22 Jun 2020 19:14:33 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAD87C061573
        for <linux-sparse@vger.kernel.org>; Mon, 22 Jun 2020 16:14:32 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id rk21so3317915ejb.2
        for <linux-sparse@vger.kernel.org>; Mon, 22 Jun 2020 16:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tk23A3ftHkHipj6GBIlY8As6Ca7VD0Z5sO44wWq+jI=;
        b=ujwJRBnLb8Uhgeanusn4Nfn1A+8Mbx7soTAQhKxZE1yyohquKlqn9rOkwWsbXjrixc
         SUgKHaaDYdtF9w2HFh2dcK1IO5ee4VHm88EwMFMDbfYHkl9oIwmnOsLq7zHOFdPG7Fw0
         gK1hnxg1sjQ13ZTaeoT3M5Uq298SW459zIJbsllRLVwDLxV5lPU0gMJGoaeoXLYBcl4r
         IkrL/X6Verh/WCSO244YS6xGnO/+ec+kjbICgPtLR4DPEUEfHHLGiWCfC6UurszwXjxz
         bEDDPo2/MWxpD4GlyVTx6FWRrnO+aB+ydUpFXkM1ERiNKmHJtIT2uItwJgaLwVYNugT+
         VKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4tk23A3ftHkHipj6GBIlY8As6Ca7VD0Z5sO44wWq+jI=;
        b=lei6E4zZfFx0UKvfpBfcxKbH1lZiAKWX+FQygNZE9itQZ9esaKlfTfPXm8Es3UX+Uv
         cK0366xbqgn57rRhVhm5M+ZmSTVzBUzXifWV/XLQTWqlUO9k7HuEvYjZ1LyKtzuqcH8z
         b/mdQ3OYOA6TsrfUa+kcJVx8aERQkZp9s1/2o4is2tdAqNd4r7Z4H+NBKJ9FKQWyIcTd
         2VPovWnVN+5IE6L7MLJGueHYNV3XT0JvJ/OEqUmJSMnC6WgieavRAaJnZpMgXzuj0xg1
         qjtRSalY6lfAhShSSAJ3ExaZs/0c7v4ReLXrfV85wgi10JWO4WUguXKJ8ZTOaayvmAHz
         Fjfw==
X-Gm-Message-State: AOAM53343r4iTp7JNUU1XPaOevC5GrVC41JHteIXz/TrqybypdXFiPzy
        /blUnniC4vkhHx98rLyASQ1551QB
X-Google-Smtp-Source: ABdhPJyCd1v8rPu+Wz31aTiD67vaz3+/HlnPha+X8aJsilFHbyKhYSpdVQFQMWrKMUI56JUDiZC6ew==
X-Received: by 2002:a17:906:f98e:: with SMTP id li14mr11431759ejb.174.1592867671044;
        Mon, 22 Jun 2020 16:14:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:1000:aea:1de2:ed50])
        by smtp.gmail.com with ESMTPSA id i9sm12508879ejv.44.2020.06.22.16.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 16:14:30 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] teach sparse about __STDC_HOSTED__
Date:   Tue, 23 Jun 2020 01:12:26 +0200
Message-Id: <20200622231226.89625-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It seems that some system libraries expect __STDC_HOSTED__ to
be always defined.

So, teach sparse the options flags -f[no-]{hosted,freestanding}
and define __STDC_HOSTED__ accordingly.
---
 lib.c                                  |  4 ++++
 lib.h                                  |  1 +
 validation/preprocessor/freestanding.c | 11 +++++++++++
 validation/preprocessor/hosted.c       | 11 +++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 validation/preprocessor/freestanding.c
 create mode 100644 validation/preprocessor/hosted.c

diff --git a/lib.c b/lib.c
index 88bb31093deb..e56788260cb7 100644
--- a/lib.c
+++ b/lib.c
@@ -311,6 +311,7 @@ int dbg_ir = 0;
 int dbg_postorder = 0;
 
 unsigned long fdump_ir;
+int fhosted = 1;
 int fmem_report = 0;
 unsigned long long fmemcpy_max_count = 100000;
 unsigned long fpasses = ~0UL;
@@ -994,6 +995,8 @@ static int handle_fmax_warnings(const char *arg, const char *opt, const struct f
 static struct flag fflags[] = {
 	{ "diagnostic-prefix",	NULL,	handle_fdiagnostic_prefix },
 	{ "dump-ir",		NULL,	handle_fdump_ir },
+	{ "freestanding",	&fhosted, NULL, OPT_INVERSE },
+	{ "hosted",		&fhosted },
 	{ "linearize",		NULL,	handle_fpasses,	PASS_LINEARIZE },
 	{ "max-warnings=",	NULL,	handle_fmax_warnings },
 	{ "mem-report",		&fmem_report },
@@ -1300,6 +1303,7 @@ static void predefined_macros(void)
 	predefine("__GNUC_PATCHLEVEL__", 1, "%d", gcc_patchlevel);
 
 	predefine("__STDC__", 1, "1");
+	predefine("__STDC_HOSTED__", 0, fhosted ? "1" : "0");
 	switch (standard) {
 	default:
 		break;
diff --git a/lib.h b/lib.h
index e767840c1038..4f67958efdb9 100644
--- a/lib.h
+++ b/lib.h
@@ -202,6 +202,7 @@ extern int dbg_postorder;
 extern unsigned int fmax_warnings;
 extern int fmem_report;
 extern unsigned long fdump_ir;
+extern int fhosted;
 extern unsigned long long fmemcpy_max_count;
 extern unsigned long fpasses;
 extern int fpic;
diff --git a/validation/preprocessor/freestanding.c b/validation/preprocessor/freestanding.c
new file mode 100644
index 000000000000..7ee35354f711
--- /dev/null
+++ b/validation/preprocessor/freestanding.c
@@ -0,0 +1,11 @@
+__STDC_HOSTED__
+
+/*
+ * check-name: freestanding
+ * check-command: sparse -E -ffreestanding $file
+ *
+ * check-output-start
+
+0
+ * check-output-end
+ */
diff --git a/validation/preprocessor/hosted.c b/validation/preprocessor/hosted.c
new file mode 100644
index 000000000000..e6b3d3c1d6b7
--- /dev/null
+++ b/validation/preprocessor/hosted.c
@@ -0,0 +1,11 @@
+__STDC_HOSTED__
+
+/*
+ * check-name: hosted
+ * check-command: sparse -E -fhosted $file
+ *
+ * check-output-start
+
+1
+ * check-output-end
+ */
-- 
2.27.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25CF5119EE6
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfLJW7a (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:30 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35955 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727308AbfLJW7a (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:30 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so5007376wma.1
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mp4QZuCv/bRaTlgmXO+s2ke2zrCF1j1W/eYiBLPTEbw=;
        b=G82pAauuBu5s+uTvRRZ+Y+3G4/pRz1HbZbHLnnUzqZNKQOh8DPXNEU6Kni0RSKi32o
         QuEqMxh8RMh4ytG+YZKVokDqCuE6Ks5C4JwpNvlFDm1dtjfVe1WheCLBJL0KkBJfXtf9
         UUZpBaTP6W7t/cpeaB2BzpFKRkHfKLUzkulCF6/vLYLv6kGz4RAoXRCUsmyOOfnvQdQH
         LHXgIhdakagVlFUu+qwZE6xRWUcWo4HSJdvp3f7Lz4oybEpYWfk6n+EkO/g1/QGdDWlP
         Um03U7TkQ+lEZDfjELv2mck9pIEH43+m5DDUT2lXno0wqv2eV2EYwA91l4Md29NCujNo
         g3wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mp4QZuCv/bRaTlgmXO+s2ke2zrCF1j1W/eYiBLPTEbw=;
        b=M+BT36Py6VRw4VZry2Zc4MUvIqLHreZiBGJ7ZB8t+5AiIqO8YWa0bDAZcf0vH0+l+G
         ITyfnYOXrLd6spX0X5UIz/ifsti/yKWPgXJbLvo3vUNml5xA4zinsV6d6taKhLvWjHa2
         SVJ4BM7MGo3193SsnectdAT/+CK0GanEgM+syrfCQEAmy4RERvQHmJxjliAOTOcb/BPn
         OzE82GzLyram8j9NQHk7y0knRLqjc+L2ontQnglhl3cI9smuYL13qQroQy3WhdroxXDa
         RAkZ7Z5Ip+mAl6kr5+UcmTHu5B0HlWLsM2sO55Rz8HosomRmwXTJwj4Vsum1qs5ibqOP
         DSdg==
X-Gm-Message-State: APjAAAWwRVhCb2tpN6OSGoVHAi4/r4IZ8zllEe4F42hr6bBslgzM3tQg
        ICsN+AI5nbn/xfB9BV1cElc4qoe8
X-Google-Smtp-Source: APXvYqx6hvTcxHxx+e3cmPFzM/dUtNKhdyOo08nSJ0cL8Fou/qZ8Q8Z52PVPZoLm6WGHx/xMe2iUHw==
X-Received: by 2002:a1c:407:: with SMTP id 7mr7512264wme.29.1576018767516;
        Tue, 10 Dec 2019 14:59:27 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:26 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 01/17] split testcases for type punning & constant initializer expansion
Date:   Tue, 10 Dec 2019 23:59:05 +0100
Message-Id: <20191210225921.94897-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Several issues were covered by the same testcase.

Fix this by splitting the testcases.
Also, rename these testcases to a more descriptive name.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/expand/constant-union-flt2int.c    | 21 +++++++++++++++++++
 validation/expand/constant-union-int2flt.c    | 20 ++++++++++++++++++
 .../constant-union-size.c}                    |  6 +++---
 .../type-punning-flt2int.c}                   |  4 ++--
 validation/memops/type-punning-int2flt.c      | 20 ++++++++++++++++++
 5 files changed, 66 insertions(+), 5 deletions(-)
 create mode 100644 validation/expand/constant-union-flt2int.c
 create mode 100644 validation/expand/constant-union-int2flt.c
 rename validation/{bug-expand-union0.c => expand/constant-union-size.c} (60%)
 rename validation/{bug-expand-union1.c => memops/type-punning-flt2int.c} (68%)
 create mode 100644 validation/memops/type-punning-int2flt.c

diff --git a/validation/expand/constant-union-flt2int.c b/validation/expand/constant-union-flt2int.c
new file mode 100644
index 000000000000..1c8f480b6c81
--- /dev/null
+++ b/validation/expand/constant-union-flt2int.c
@@ -0,0 +1,21 @@
+union u {
+	int i;
+	float f;
+};
+
+static int foo(void)
+{
+	union u u = { .f = 0.123 };
+	return u.i;
+}
+
+/*
+ * check-name: constant-union-float-to-int
+ * check description: must not infer the int value from the float
+ * check-command: test-linearize -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-pattern(1): setfval\\.
+ * check-output-pattern(1): load\\.
+ */
diff --git a/validation/expand/constant-union-int2flt.c b/validation/expand/constant-union-int2flt.c
new file mode 100644
index 000000000000..ff0a642ad67d
--- /dev/null
+++ b/validation/expand/constant-union-int2flt.c
@@ -0,0 +1,20 @@
+union u {
+	int i;
+	float f;
+};
+
+static float foo(void)
+{
+	union u u = { .i = 3 };
+	return u.f;
+}
+
+/*
+ * check-name: constant-union-int-to-float
+ * check description: must not infer the float value from the int
+ * check-command: test-linearize -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-pattern(1): load\\.
+ */
diff --git a/validation/bug-expand-union0.c b/validation/expand/constant-union-size.c
similarity index 60%
rename from validation/bug-expand-union0.c
rename to validation/expand/constant-union-size.c
index dd6d60c3e291..b6c3ac75ae4b 100644
--- a/validation/bug-expand-union0.c
+++ b/validation/expand/constant-union-size.c
@@ -10,9 +10,9 @@ static int foo(void)
 }
 
 /*
- * check-name: bug-expand-union
- * check description: must not infer the value from the float
- * check-command: test-linearize $file
+ * check-name: constant-union-size
+ * check description: the size of the initializer doesn't match
+ * check-command: test-linearize -fdump-ir $file
  * check-known-to-fail
  *
  * check-output-ignore
diff --git a/validation/bug-expand-union1.c b/validation/memops/type-punning-flt2int.c
similarity index 68%
rename from validation/bug-expand-union1.c
rename to validation/memops/type-punning-flt2int.c
index 582a1f4f837e..a76c6c1da534 100644
--- a/validation/bug-expand-union1.c
+++ b/validation/memops/type-punning-flt2int.c
@@ -10,8 +10,8 @@ static int foo(void)
 }
 
 /*
- * check-name: bug-expand-union
- * check description: must not infer the value from the float
+ * check-name: type-punning-float-to-int
+ * check description: must not infer the int value from the float
  * check-command: test-linearize $file
  * check-known-to-fail
  *
diff --git a/validation/memops/type-punning-int2flt.c b/validation/memops/type-punning-int2flt.c
new file mode 100644
index 000000000000..c05ce252f305
--- /dev/null
+++ b/validation/memops/type-punning-int2flt.c
@@ -0,0 +1,20 @@
+union u {
+	int i;
+	float f;
+};
+
+static float foo(void)
+{
+	union u u = { .i = 3 };
+	return u.f;
+}
+
+/*
+ * check-name: type-punning-int-to-float
+ * check description: must not infer the float value from the int
+ * check-command: test-linearize $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-contains: load\\.
+ */
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2B66119EE8
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfLJW7c (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:32 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35470 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbfLJW7c (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:32 -0500
Received: by mail-wr1-f68.google.com with SMTP id g17so21976674wro.2
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eV6E9o4k7oQg2TyuMgE3WA+OQdQGPvJdxtLgTH97iWo=;
        b=KiLhcxTMRY9dAVR5yny7ARLWaobQCOcJpmtij1TKRFAxgj02lcYpRGhhv5OCA8Hshe
         lo5rNty27dHJCggW01TTwndNrbXUisYZty0TY0qC2Wv5bRW2uqybX2E05+aJsP8Ya5//
         0ry8xkUM5KCU0IAXYfDVkoksQ32c2vRqiothWpBxAQ+cSS9J+AVhmxOg7KmLszfkmj9P
         GLVwh8aadb9JtujTXfFF9UcoNgVpeSbZ+XgVkv5kEowXAP7fhvPzd9Z+N7HUzxpLo0hj
         VxzxHmijDRIEqGapZSga8GQ47zM/nrDcSaIJF10IIuV6bA+TkN/PrLCZCt9Czq1evAda
         mwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eV6E9o4k7oQg2TyuMgE3WA+OQdQGPvJdxtLgTH97iWo=;
        b=fV9po6pA0Rvvx7glnjUUH3NbVGVgzfZWnSOQtt1/bENFu5zw5TCR5V9QTRuAeDKZbw
         Bi7qTn0BqGaBlXJQOzc29GaowCjjJB+tCId85k6MqRBFJFyYm4ibXpmgVS4JD+MFh0+E
         muaxlnUYD/z6+J/V6yaulQrnKmPv3jW/7vi64bo7Lh8bn+JsA1Jbou1Iw6YBvxuToYyv
         0WonaK5nUBi/elmcYxqOr31Y1U8DWXdfuWp9j2LIDE8fmZCdQ+d3KrligLU95ASZmbyj
         B9UzKMKAnOt0Imsu/o1SkexpPw5kKWt6PPN61DzmCvYnXzuhkiHUG6szu8/Gtw3vaDZW
         ObTg==
X-Gm-Message-State: APjAAAWZnJw/pPQXeG41cMZpwf7a968r1HMRS569GYRAR6LicZf2ohi9
        vWzgyFQAtAE1G18QW76ltbgT28Nu
X-Google-Smtp-Source: APXvYqy/sqFHn9JDlFUzANqeK2NcPhZVMck35RopbUp3kEQSbGpsGCmyj0wte2ZB7wVNB5h2yp4GPg==
X-Received: by 2002:adf:9427:: with SMTP id 36mr12034wrq.166.1576018769554;
        Tue, 10 Dec 2019 14:59:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:28 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 02/17] add testcase for expansion of default initializers
Date:   Tue, 10 Dec 2019 23:59:06 +0100
Message-Id: <20191210225921.94897-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, constant_symbol_value() is doing the expansion
of a constant initializer when an explicit one is found
but nothing is done for the default/implicit ones.

Add a testcase to illustrate this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/expand/default-init-array.c  | 16 ++++++++++++++++
 validation/expand/default-init-struct.c | 23 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 validation/expand/default-init-array.c
 create mode 100644 validation/expand/default-init-struct.c

diff --git a/validation/expand/default-init-array.c b/validation/expand/default-init-array.c
new file mode 100644
index 000000000000..b372ea09534b
--- /dev/null
+++ b/validation/expand/default-init-array.c
@@ -0,0 +1,16 @@
+int test_array(int i)
+{
+	static const int a[3] = { [0] = 1, [2] = 3, };
+
+	return a[1];
+}
+
+/*
+ * check-name: default-init-array
+ * check-command: test-linearize -Wno-decl -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-contains: phisrc\\..*return.*\\$0
+ * check-output-excludes: load\\.
+ */
diff --git a/validation/expand/default-init-struct.c b/validation/expand/default-init-struct.c
new file mode 100644
index 000000000000..c843a1abb960
--- /dev/null
+++ b/validation/expand/default-init-struct.c
@@ -0,0 +1,23 @@
+struct s {
+	int a;
+	int b;
+	int c;
+};
+
+
+int test_struct(void)
+{
+	struct s s = { .a = 1, .c = 3, };
+
+	return s.b;
+}
+
+/*
+ * check-name: default-init-struct
+ * check-command: test-linearize -Wno-decl -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-contains: phisrc\\..*return.*\\$0
+ * check-output-excludes: load\\.
+ */
-- 
2.24.0


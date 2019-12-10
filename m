Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37777119EEE
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbfLJW7k (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:40 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37893 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJW7j (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:39 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so4987685wmi.3
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yCF2A/nCI7F9g6PGaQnvTgxRRJMrMi2/HrjXDmBgOnY=;
        b=CrmTGzTSTmKSrzMz9RLip72conwt43ZY3hzyPCDnhd5L0zG4L8tZZZtM3i8CmaG3cX
         Odt0vfzHT1u5YnfTVzrjEGHeGD45690HCexS2BfvsqNbBfg4QUC/TcT6fXtvNQvyIvku
         qVelnb4XfTGQ9fgD6/4Zm6bFGVoH0aLoPeFWq1sibMf4Drn2Ndpm6tCjBcqdShUSXobV
         kYG5RWbh+Ot6yz/b/9pdKf8/71ytP7Kz8nhurGle+szVIynd2KpTpn0pTdkxL1uYxryd
         C3CnbxyzJbakfSrxQPgq8HkuEh6VsEg3VDqCw0iAKTMjHpLiL/Cf1cwDHGV+y/XNZQwE
         7B6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yCF2A/nCI7F9g6PGaQnvTgxRRJMrMi2/HrjXDmBgOnY=;
        b=hGBsM4IuVrYhFEzJ+GfJSvSppg8SEnjjCiDF5GAtYtF8bB2b0M6sHMl34zODWSEK4E
         aA/rlXX0jzSo+iJt2GqejRGCbuJ9QJ/qPgwsId4me8r9gqqtAJKGbpL78pkGYJtWCF8b
         OxhXMX65bJYAMyLXA6DwWS1lWcxBrLVs4F+LWPCjlknxafnrl5/Eu4vEv3KLR8dmxdH4
         THTdGgS8mF673BGWysz6ho5lASYJCBBCaBTAwMcHz+7QHyoJTx9usx36e5f5LZtNJ1l2
         gICPqwYW4fET4BvausaHoNt6YwgD0v9KouDf4iaJIhyYFFOAVMROvIB3ps757k1iuZ0r
         Jugg==
X-Gm-Message-State: APjAAAXcxCTUpXKAY4XMxfCoLT3VYb/sJl4ZwcuHbcV+lBtq1082dU4c
        FaZbsvBKFnL6sVLGV76gS8XwMHi0
X-Google-Smtp-Source: APXvYqw/Mx6RchGfme8jkwplK/L4DyGyJxQRWRfPeflbdigCegkxh5OQc1XTYt4W884/Jj/ItQaQKw==
X-Received: by 2002:a7b:c761:: with SMTP id x1mr7518045wmk.37.1576018777463;
        Tue, 10 Dec 2019 14:59:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:36 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 07/17] add test for constant expansion of complex initializer
Date:   Tue, 10 Dec 2019 23:59:11 +0100
Message-Id: <20191210225921.94897-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Constant expansion of symbols with a complex type is not done
like for simpler ones. Only the first-level EXPR_INITIALIZER
is handled.

Add some testcases for this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 .../expand/constant-init-nested-array.c       | 15 ++++++++++++
 .../expand/constant-init-nested-struct.c      | 23 +++++++++++++++++++
 validation/expand/constant-init-string.c      | 15 ++++++++++++
 3 files changed, 53 insertions(+)
 create mode 100644 validation/expand/constant-init-nested-array.c
 create mode 100644 validation/expand/constant-init-nested-struct.c
 create mode 100644 validation/expand/constant-init-string.c

diff --git a/validation/expand/constant-init-nested-array.c b/validation/expand/constant-init-nested-array.c
new file mode 100644
index 000000000000..0d50d955287c
--- /dev/null
+++ b/validation/expand/constant-init-nested-array.c
@@ -0,0 +1,15 @@
+int foo(void)
+{
+	int a[2][3] = {{0, 1, 2},{3, 4, 5}};
+	return a[1][2];
+}
+
+/*
+ * check-name: constant-init-nested-array
+ * check-command: test-linearize -Wno-decl -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-contains: phisrc\\..*\\$5
+ * check-output-excludes: load\\.
+ */
diff --git a/validation/expand/constant-init-nested-struct.c b/validation/expand/constant-init-nested-struct.c
new file mode 100644
index 000000000000..f27de556f6c5
--- /dev/null
+++ b/validation/expand/constant-init-nested-struct.c
@@ -0,0 +1,23 @@
+struct s {
+	int a;
+	struct {
+		int b;
+		int c;
+	} s;
+};
+
+int foo(void)
+{
+	struct s s = {1, {2, 3}};
+	return s.s.c;
+}
+
+/*
+ * check-name: constant-init-nested-struct
+ * check-command: test-linearize -Wno-decl -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-contains: phisrc\\..*\\$3
+ * check-output-excludes: load\\.
+ */
diff --git a/validation/expand/constant-init-string.c b/validation/expand/constant-init-string.c
new file mode 100644
index 000000000000..42ae9bd3d8a4
--- /dev/null
+++ b/validation/expand/constant-init-string.c
@@ -0,0 +1,15 @@
+char foo(void)
+{
+	static const char s[] = "abc?";
+	return s[3];
+}
+
+/*
+ * check-name: constant-init-nested-array
+ * check-command: test-linearize -Wno-decl -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-contains: phisrc\\..*\\$63
+ * check-output-pattern(0,1): load\\.
+ */
-- 
2.24.0


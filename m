Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8DB8C0EA9
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728484AbfI0Xne (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:34 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35805 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbfI0Xne (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:34 -0400
Received: by mail-ed1-f66.google.com with SMTP id v8so3751880eds.2
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XutRhQUaApduDr3EyOX07z7ClYBMA3XDqFvjeJRpMMc=;
        b=QjSuHc62vJf9UiOkA7wmfB6shhUNrn8cQLzdMV3uIukgHFFdeV5m/45cJIowJFnEvU
         J8GwxOm2FzulXlcj/kKeskZEvqCfy+IxBEfPa7CsA/tR8lA5dP8R+FIijGh9hW8ZuivF
         ZydCs4vuBHtFxEcLE91K/AgCUIDLr1nbCVaNIXhRMkbCErF+FgEWHQ6ew2fAtIYWOeOM
         3YIdg6mw52YFbba7wewchVM/r7Dl03ctle+DqohGkA1kxGYimkiY+AYORtg4AY7olUqT
         kqFQPuzgRkMjG9ZaNy3mIYAFWdt80AZ0CcXm1kOdLjlE2WnXOXud+NFa/GbZde6C3Gba
         1Aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XutRhQUaApduDr3EyOX07z7ClYBMA3XDqFvjeJRpMMc=;
        b=OqwHC7QY6zzdX+hjUjzDc9TLv4krnx1XXGNdy7JF+CaTyDL3ZDs4+t2Gfem5vngVNJ
         Zk9I91Ta0jRLv2vK+CTfVtEGSkAB1nwcG6ZA54xZbgqnnNLeAIp+Eug4d9Xd4bX6TFBW
         o2AA6rHVTV92trrEWyBxtrmwtAObqDWS9wq+lrsKrME0ak5W3rlGGrOSLa3ZgjdRyt0w
         KSRS4vp8fbgjdyKAbQwPjGKTpSV92LlGppTrv0r36iMRNMHSJ1B+Fn9dl2lw81kcHj5r
         3FfnUDTQ54Lt55Qi0a9Wgzali8U+pkbo8vSEWOs0jNhoCmXsCBg07CnH4X7PPVXLgSL1
         bt4A==
X-Gm-Message-State: APjAAAWPDwUATaHyAIISK+YJy1/BY22jMnWW8mM8zaUazkelVw4ZE3qf
        e22WQ1MAGP4gw5mbq9sdNWlzZ4Qh
X-Google-Smtp-Source: APXvYqx5kLWPJr1HpPoijiSt0YMnzfOnTvA19AuBAhuef468vW1SGzhKXNXcohkPzRL02kWxKpi+Mg==
X-Received: by 2002:a50:a8a2:: with SMTP id k31mr7341231edc.79.1569627811479;
        Fri, 27 Sep 2019 16:43:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:31 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 08/18] asm: add test evaluation, expansion & linearization of ASM operands
Date:   Sat, 28 Sep 2019 01:43:12 +0200
Message-Id: <20190927234322.5157-11-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

ASM statements are quite complex.
Add some tests to catch some potential errors.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/asm-bad0.c         | 41 ++++++++++++++++++++++++++++++
 validation/eval/asm-degen.c   | 37 +++++++++++++++++++++++++++
 validation/eval/asm-memop.c   | 48 +++++++++++++++++++++++++++++++++++
 validation/expand/asm0.c      | 24 ++++++++++++++++++
 validation/linear/asm-memop.c | 24 ++++++++++++++++++
 5 files changed, 174 insertions(+)
 create mode 100644 validation/asm-bad0.c
 create mode 100644 validation/eval/asm-degen.c
 create mode 100644 validation/eval/asm-memop.c
 create mode 100644 validation/expand/asm0.c
 create mode 100644 validation/linear/asm-memop.c

diff --git a/validation/asm-bad0.c b/validation/asm-bad0.c
new file mode 100644
index 000000000..fcd9b1c4d
--- /dev/null
+++ b/validation/asm-bad0.c
@@ -0,0 +1,41 @@
+extern char string[];
+extern int *var;
+
+static void templ(void)
+{
+	asm(string);
+}
+
+static void ocons(void)
+{
+	asm("template" : [out] string (var) : [in] "r" (0));
+}
+
+static void icons(void)
+{
+	asm("template" : [out] "=r" (var): [in] string (0));
+}
+
+static void oexpr(oid)
+{
+	asm("template" : [out] "=" (var[) : [in] "r" (0));
+}
+
+static void iexpr(void)
+{
+	asm("template" : [out] "=r" (var) : [in] "r" (var[));
+}
+
+/*
+ * check-name: asm-bad0
+ *
+ * check-error-start
+asm-bad0.c:21:41: error: Expected ] at end of array dereference
+asm-bad0.c:21:41: error: got )
+asm-bad0.c:26:59: error: Expected ] at end of array dereference
+asm-bad0.c:26:59: error: got )
+asm-bad0.c:6:9: error: need constant string for inline asm
+asm-bad0.c:11:32: error: asm output constraint is not a string
+asm-bad0.c:16:49: error: asm input constraint is not a string
+ * check-error-end
+ */
diff --git a/validation/eval/asm-degen.c b/validation/eval/asm-degen.c
new file mode 100644
index 000000000..5f3191597
--- /dev/null
+++ b/validation/eval/asm-degen.c
@@ -0,0 +1,37 @@
+#ifdef __CHECKER__
+#define __percpu __attribute__((noderef))
+#else
+#define __percpu
+#endif
+
+static __percpu int var;
+static __percpu int arr[4];
+
+static void foo(void)
+{
+	asm("" :: "r" (var));
+}
+
+static void bar(void)
+{
+	asm("" :: "r" (arr));
+}
+
+static void baz(void)
+{
+	asm("" :: "m" (var));
+}
+
+static void qux(void)
+{
+	asm("" :: "m" (arr));
+}
+
+/*
+ * check-name: asm-degen
+ * check-known-to-fail
+ *
+ * check-error-start
+eval/asm-degen.c:12:24: warning: dereference of noderef expression
+ * check-error-end
+ */
diff --git a/validation/eval/asm-memop.c b/validation/eval/asm-memop.c
new file mode 100644
index 000000000..9bbb3a305
--- /dev/null
+++ b/validation/eval/asm-memop.c
@@ -0,0 +1,48 @@
+extern int g;
+
+void fo0(int *p) { asm volatile ("op %0" :: "p" (&g)); }
+void fo1(int *p) { asm volatile ("op %0" :: "m" (g)); }
+
+void fo2(int *p) { asm volatile ("op %0" :: "p" (p)); }
+void fo3(int *p) { asm volatile ("op %0" :: "m" (*p)); }
+
+/*
+ * check-name: eval-asm-memop
+ * check-command: test-linearize -Wno-decl $file
+ * check-known-to-fail
+ *
+ * check-output-start
+fo0:
+.L0:
+	<entry-point>
+	asm         "op %0"
+		in: "p" (g)
+	ret
+
+
+fo1:
+.L2:
+	<entry-point>
+	asm         "op %0"
+		in: "m" (g)
+	ret
+
+
+fo2:
+.L4:
+	<entry-point>
+	asm         "op %0"
+		in: "p" (%arg1)
+	ret
+
+
+fo3:
+.L6:
+	<entry-point>
+	asm         "op %0"
+		in: "m" (%arg1)
+	ret
+
+
+ * check-output-end
+ */
diff --git a/validation/expand/asm0.c b/validation/expand/asm0.c
new file mode 100644
index 000000000..0664b6224
--- /dev/null
+++ b/validation/expand/asm0.c
@@ -0,0 +1,24 @@
+static void foo(void)
+{
+	asm("" :: "i" (42 & 3));
+	asm("" :: "i" (__builtin_constant_p(0)));
+}
+
+/*
+ * check-name: expand-asm0
+ * check-command: test-linearize $file
+ * check-known-to-fail
+ *
+ * check-output-start
+foo:
+.L0:
+	<entry-point>
+	asm         ""
+		in: "i" ($2)
+	asm         ""
+		in: "i" ($1)
+	ret
+
+
+ * check-output-end
+ */
diff --git a/validation/linear/asm-memop.c b/validation/linear/asm-memop.c
new file mode 100644
index 000000000..97df98e22
--- /dev/null
+++ b/validation/linear/asm-memop.c
@@ -0,0 +1,24 @@
+static int foo(int *p)
+{
+	asm("op %0" : "=m" (p[0]));
+
+	return p[0];
+}
+
+/*
+ * check-name: linear-asm-memop
+ * check-command: test-linearize $file
+ * check-known-to-fail
+ *
+ * check-output-start
+foo:
+.L0:
+	<entry-point>
+	asm         "op %0"
+		out: "=m" (%arg1)
+	load.32     %r4 <- 0[%arg1]
+	ret.32      %r4
+
+
+ * check-output-end
+ */
-- 
2.23.0


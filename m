Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4C42BDB99
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2019 12:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732778AbfIYKAW (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 06:00:22 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:42953 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732929AbfIYKAW (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 06:00:22 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iD45o-00024C-SG; Wed, 25 Sep 2019 11:00:17 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iD45o-0008Ds-7W; Wed, 25 Sep 2019 11:00:16 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-sparse@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 5/5] tests: add varargs printf format tests
Date:   Wed, 25 Sep 2019 11:00:15 +0100
Message-Id: <20190925100015.31510-6-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add some tests for the new printf format checking code.
Note, these do not all pass yet.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 validation/varargs-format-addrspace1.c |  36 ++++++++
 validation/varargs-format-bad.c        |  18 ++++
 validation/varargs-format-checking.c   |  20 +++++
 validation/varargs-format-position.c   |  31 +++++++
 validation/varargs-format-prefix.c     |  19 ++++
 validation/varargs-format-tests.c      |  37 ++++++++
 validation/varargs-type-formattest.c   | 116 +++++++++++++++++++++++++
 7 files changed, 277 insertions(+)
 create mode 100644 validation/varargs-format-addrspace1.c
 create mode 100644 validation/varargs-format-bad.c
 create mode 100644 validation/varargs-format-checking.c
 create mode 100644 validation/varargs-format-position.c
 create mode 100644 validation/varargs-format-prefix.c
 create mode 100644 validation/varargs-format-tests.c
 create mode 100644 validation/varargs-type-formattest.c

diff --git a/validation/varargs-format-addrspace1.c b/validation/varargs-format-addrspace1.c
new file mode 100644
index 0000000..d431940
--- /dev/null
+++ b/validation/varargs-format-addrspace1.c
@@ -0,0 +1,36 @@
+
+extern int variadic(char *msg, ...) __attribute__((format (printf, 1, 2)));
+extern int variadic2(char *msg, int , ...) __attribute__((format (printf, 1, 3)));
+extern int variadic3(int, char *msg,  ...) __attribute__((format (printf, 2, 3)));
+
+static void test(void) {
+	void __attribute__((noderef, address_space(1))) *a;
+	void *b;
+
+	variadic("%s\n", a);
+	variadic("%s\n", b);
+	variadic("%s %s\n", b, a);
+	variadic2("%s %s\n", 1, b, a);
+	variadic3(1, "%s %s\n", b, a);
+	variadic3(1, "%s %p\n", b, a);
+}
+
+/*
+ * check-name: variadic formatting test with address-space to %s
+ * check-command: sparse -Wformat $file
+ *
+ * check-error-start
+varargs-format-addrspace1.c:10:26: warning: incorrect type in argument 2 (different address spaces)
+varargs-format-addrspace1.c:10:26:    expected char *
+varargs-format-addrspace1.c:10:26:    got void [noderef] <asn:1> *a
+varargs-format-addrspace1.c:12:32: warning: incorrect type in argument 3 (different address spaces)
+varargs-format-addrspace1.c:12:32:    expected char *
+varargs-format-addrspace1.c:12:32:    got void [noderef] <asn:1> *a
+varargs-format-addrspace1.c:13:36: warning: incorrect type in argument 4 (different address spaces)
+varargs-format-addrspace1.c:13:36:    expected char *
+varargs-format-addrspace1.c:13:36:    got void [noderef] <asn:1> *a
+varargs-format-addrspace1.c:14:36: warning: incorrect type in argument 4 (different address spaces)
+varargs-format-addrspace1.c:14:36:    expected char *
+varargs-format-addrspace1.c:14:36:    got void [noderef] <asn:1> *a
+ * check-error-end
+ */
diff --git a/validation/varargs-format-bad.c b/validation/varargs-format-bad.c
new file mode 100644
index 0000000..82ae357
--- /dev/null
+++ b/validation/varargs-format-bad.c
@@ -0,0 +1,18 @@
+
+extern int variadic(char *msg, ...) __attribute__((format (printf, 0, 0)));
+extern int variadic2(char *msg, int , ...) __attribute__((format (printf, 2, 2)));
+extern int variadic3(char *msg, int , ...) __attribute__((format (printf, 2, 1)));
+
+static void test(void) {
+}
+
+/*
+ * check-name: variadic formatting test with bad formatting parameters
+ * check-command: sparse -Wformat $file
+ *
+ * check-error-start
+varargs-format-bad.c:2:73: warning: bad format positions
+varargs-format-bad.c:3:80: warning: bad format positions
+varargs-format-bad.c:4:80: warning: format cannot be after va_args
+* check-error-end
+ */
diff --git a/validation/varargs-format-checking.c b/validation/varargs-format-checking.c
new file mode 100644
index 0000000..4444800
--- /dev/null
+++ b/validation/varargs-format-checking.c
@@ -0,0 +1,20 @@
+
+extern void pf(char *msg, ...) __attribute__((format (printf, 1, 2)));
+
+static void test(void) {
+	pf("%u %lu %llu\n", 1U, 1UL, 1ULL);
+	pf("%d %ld %lld\n", 1, 1L, 1LL);
+	pf("%x %lx %llx\n", 1U, 1UL, 1ULL);
+	pf("%d %ld %lld\n", 1, 1L, 1L);
+}
+
+/*
+ * check-name: variadic formatting test type checking
+ * check-command: sparse -Wformat $file
+ *
+ * check-error-start
+varargs-format-checking.c:8:36: warning: incorrect type in argument 4 (different types)
+varargs-format-checking.c:8:36:    expected long long
+varargs-format-checking.c:8:36:    got long
+ * check-error-end
+ */
diff --git a/validation/varargs-format-position.c b/validation/varargs-format-position.c
new file mode 100644
index 0000000..cb57f64
--- /dev/null
+++ b/validation/varargs-format-position.c
@@ -0,0 +1,31 @@
+
+extern void pf(char *msg, ...) __attribute__((format (printf, 1, 2)));
+
+static void test(void) {
+	pf("%2$d %u\n", 1U, 1L);
+	pf("%3$d %2$u\n", 1U, 1);
+	pf("%1$d %2$d\n", 1L, 1);
+}
+
+/*
+ * check-name: variadic formatting test position checking
+ * check-command: sparse -Wformat $file
+ *
+ * check-error-start
+varargs-format-position.c:5:29: warning: incorrect type in argument 3 (different types)
+varargs-format-position.c:5:29:    expected int
+varargs-format-position.c:5:29:    got long
+varargs-format-position.c:5:12: warning: format 3: position: no position specified
+varargs-format-position.c:5:29: warning: incorrect type in argument 3 (different types)
+varargs-format-position.c:5:29:    expected unsigned int
+varargs-format-position.c:5:29:    got long
+varargs-format-position.c:6:12: warning: no argument at position '4'
+varargs-format-position.c:6:31: warning: incorrect type in argument 3 (different types)
+varargs-format-position.c:6:31:    expected unsigned int
+varargs-format-position.c:6:31:    got int
+varargs-format-position.c:7:27: warning: incorrect type in argument 2 (different types)
+varargs-format-position.c:7:27:    expected int
+varargs-format-position.c:7:27:    got long
+ * check-error-end
+ *
+ */
diff --git a/validation/varargs-format-prefix.c b/validation/varargs-format-prefix.c
new file mode 100644
index 0000000..ff0f0b8
--- /dev/null
+++ b/validation/varargs-format-prefix.c
@@ -0,0 +1,19 @@
+
+extern int __attribute__((format (printf, 1, 2))) variadic(char *msg, ...);
+
+static int test(void) {
+	void __attribute__((noderef, address_space(1))) *a;
+
+	variadic("%s\n", a);
+}
+
+/*
+ * check-name: variadic formatting test prefix based __attribute__
+ * check-command: sparse -Wformat $file
+ *
+ * check-error-start
+varargs-format-prefix.c:7:26: warning: incorrect type in argument 2 (different address spaces)
+varargs-format-prefix.c:7:26:    expected char *
+varargs-format-prefix.c:7:26:    got void [noderef] <asn:1> *a
+ * check-error-end
+ */
diff --git a/validation/varargs-format-tests.c b/validation/varargs-format-tests.c
new file mode 100644
index 0000000..3154ec1
--- /dev/null
+++ b/validation/varargs-format-tests.c
@@ -0,0 +1,37 @@
+
+extern void pf(char *msg, ...) __attribute__((format (printf, 1, 2)));
+
+static int test(void)
+{
+	pf("%*d\n", 5, 10);		/* value 10, print width is 5 */
+	pf("%2$*1$d\n", 5, 10);		/* value 10, print width is 5 */
+	pf("%3$*2$d\n", 1, 5, 10);	/* ok, skipping the '1' */
+	pf("%3$-*2$d\n", 1, 5, 10);	/* ok, skipping the '1' */
+	pf("%3$*2$-d\n", 1, 5, 10);	/* bad, the "-" shouldn't be before the 'd' */
+	pf("%3$ *2$d\n", 1, 5, 10);	/* ok, skipping the '1' */
+	pf("%3$+*2$d\n", 1, 5, 10);	/* ok, skipping the '1' */
+	pf("%3$0+*2$d\n", 1, 5, 10);	/* ok, skipping the '1' */
+	pf("%3$+0*2$d\n", 1, 5, 10);	/* ok, skipping the '1' */
+	pf("%3$+#*2$d\n", 1, 5, 10);	/* ok, skipping the '1' */
+	pf("%3$+#*2$.5d\n", 1, 5, 10);	/* ok, skipping the '1' */
+
+	/* go with some precision as well as width strings */
+	pf("%2$+*1$.6d\n", 5, 10);	/* ok */
+	pf("%2$+*1$.*3$d\n", 5, 10, 6);	/* ok */
+	pf("%2$+*3$.*1$d\n", 6, 10, 5);	/* ok */
+	pf("%2$+*1$.*d\n", 5, 10, 6);	/* not ok */
+
+	pf("%s", "msg");
+	return 0;
+}
+
+/*
+ * check-name: variadic formatting tests for width/precisions
+ * check-command: sparse -Wformat $file
+ *
+ * check-error-start
+varargs-format-tests.c:10:12: warning: cannot evaluate type '%3$*2$-d'
+varargs-format-tests.c:10:12: warning: cannot evaluate format string
+varargs-format-tests.c:22:12: warning: format 3: position: no position specified
+ * check-error-end
+ */
diff --git a/validation/varargs-type-formattest.c b/validation/varargs-type-formattest.c
new file mode 100644
index 0000000..03a897a
--- /dev/null
+++ b/validation/varargs-type-formattest.c
@@ -0,0 +1,116 @@
+
+extern void pf1(char *msg, ...) __attribute__((format (printf, 1, 2)));
+extern void pf2(int m, char *msg, ...) __attribute__((format (printf, 2, 3)));
+
+/* run all the tests with both of these printf formatted types */
+#define pf(x...) do { pf1(x); pf2(1, x); } while(0);
+
+static void test(void) {
+	/* first two are valid */
+	pf("%*d", 5, 10);	/* value 10, print width is 5 */
+	pf("%2$*1$d", 5, 10);	/* value 10, print width is 5 */
+	pf("%2$*3$d", 5, 10);	/* value 10, print width is ?? */
+
+	pf("%*d", 5, 10);	/* value 10, print width is 5 */
+	pf("%*d", 5, 10L);	/* value 10, print width is 5 (bad type) */
+	pf("%*d", 5UL, 10L);	/* value 10, print width is 5 (bad type) */
+
+	pf("%3$*2$d", 1, 5, 10);	/* ok, skipping the '1' */
+	pf("%3$*2$d", 1, 5, 10L);	/* bad print type */
+	pf("%2$*3$d", 1UL, 10, 5);	/* ok, try with swapping width/val */
+	pf("%2$*3$d", 1UL, 10L, 5);	/* bad, try with swapping width/val */
+
+	/* and now try with precision specifiers */
+
+	pf("%*.6d", 5, 10);	/* value 10, print width is 5 */
+	pf("%*.6d", 5, 10L);	/* value 10, print width is 5 (bad type) */
+	pf("%*.6d", 5UL, 10L);	/* value 10, print width is 5 (bad type) */
+
+	pf("%*.*d", 5, 6, 10);	/* value 10, print width is 5 */
+	pf("%*.*d", 5, 6, 10L);	/* value 10, print width is 5 (bad type) */
+	pf("%*.*d", 5UL, 6, 10L); /* value 10, print width is 5 (bad type) */
+	pf("%*.*d", 5, 6UL, 10); /* value 10, print width is 5 (bad type) */
+}
+
+/*
+ * check-name: variadic formatting test position checking types
+ * check-command: sparse -Wformat $file
+ *
+ * check-error-start
+varargs-type-formattest.c:12:9: warning: width: no argument at position 4
+varargs-type-formattest.c:12:9: warning: width: no argument at position 5
+varargs-type-formattest.c:15:9: warning: incorrect type in argument 3 (different types)
+varargs-type-formattest.c:15:9:    expected int
+varargs-type-formattest.c:15:9:    got long
+varargs-type-formattest.c:15:9: warning: incorrect type in argument 4 (different types)
+varargs-type-formattest.c:15:9:    expected int
+varargs-type-formattest.c:15:9:    got long
+varargs-type-formattest.c:16:9: warning: incorrect type for width argument 2
+varargs-type-formattest.c:16:9:    expected int
+varargs-type-formattest.c:16:9:    got unsigned long
+varargs-type-formattest.c:16:9: warning: incorrect type in argument 3 (different types)
+varargs-type-formattest.c:16:9:    expected int
+varargs-type-formattest.c:16:9:    got long
+varargs-type-formattest.c:16:9: warning: incorrect type for width argument 3
+varargs-type-formattest.c:16:9:    expected int
+varargs-type-formattest.c:16:9:    got unsigned long
+varargs-type-formattest.c:16:9: warning: incorrect type in argument 4 (different types)
+varargs-type-formattest.c:16:9:    expected int
+varargs-type-formattest.c:16:9:    got long
+varargs-type-formattest.c:19:9: warning: incorrect type in argument 4 (different types)
+varargs-type-formattest.c:19:9:    expected int
+varargs-type-formattest.c:19:9:    got long
+varargs-type-formattest.c:19:9: warning: incorrect type in argument 5 (different types)
+varargs-type-formattest.c:19:9:    expected int
+varargs-type-formattest.c:19:9:    got long
+varargs-type-formattest.c:21:9: warning: incorrect type in argument 3 (different types)
+varargs-type-formattest.c:21:9:    expected int
+varargs-type-formattest.c:21:9:    got long
+varargs-type-formattest.c:21:9: warning: incorrect type in argument 4 (different types)
+varargs-type-formattest.c:21:9:    expected int
+varargs-type-formattest.c:21:9:    got long
+varargs-type-formattest.c:26:9: warning: incorrect type in argument 3 (different types)
+varargs-type-formattest.c:26:9:    expected int
+varargs-type-formattest.c:26:9:    got long
+varargs-type-formattest.c:26:9: warning: incorrect type in argument 4 (different types)
+varargs-type-formattest.c:26:9:    expected int
+varargs-type-formattest.c:26:9:    got long
+varargs-type-formattest.c:27:9: warning: incorrect type for width argument 2
+varargs-type-formattest.c:27:9:    expected int
+varargs-type-formattest.c:27:9:    got unsigned long
+varargs-type-formattest.c:27:9: warning: incorrect type in argument 3 (different types)
+varargs-type-formattest.c:27:9:    expected int
+varargs-type-formattest.c:27:9:    got long
+varargs-type-formattest.c:27:9: warning: incorrect type for width argument 3
+varargs-type-formattest.c:27:9:    expected int
+varargs-type-formattest.c:27:9:    got unsigned long
+varargs-type-formattest.c:27:9: warning: incorrect type in argument 4 (different types)
+varargs-type-formattest.c:27:9:    expected int
+varargs-type-formattest.c:27:9:    got long
+varargs-type-formattest.c:30:9: warning: incorrect type in argument 4 (different types)
+varargs-type-formattest.c:30:9:    expected int
+varargs-type-formattest.c:30:9:    got long
+varargs-type-formattest.c:30:9: warning: incorrect type in argument 5 (different types)
+varargs-type-formattest.c:30:9:    expected int
+varargs-type-formattest.c:30:9:    got long
+varargs-type-formattest.c:31:9: warning: incorrect type for width argument 2
+varargs-type-formattest.c:31:9:    expected int
+varargs-type-formattest.c:31:9:    got unsigned long
+varargs-type-formattest.c:31:9: warning: incorrect type in argument 4 (different types)
+varargs-type-formattest.c:31:9:    expected int
+varargs-type-formattest.c:31:9:    got long
+varargs-type-formattest.c:31:9: warning: incorrect type for width argument 3
+varargs-type-formattest.c:31:9:    expected int
+varargs-type-formattest.c:31:9:    got unsigned long
+varargs-type-formattest.c:31:9: warning: incorrect type in argument 5 (different types)
+varargs-type-formattest.c:31:9:    expected int
+varargs-type-formattest.c:31:9:    got long
+varargs-type-formattest.c:32:9: warning: incorrect type for position argument 3
+varargs-type-formattest.c:32:9:    expected int
+varargs-type-formattest.c:32:9:    got unsigned long
+varargs-type-formattest.c:32:9: warning: incorrect type for position argument 4
+varargs-type-formattest.c:32:9:    expected int
+varargs-type-formattest.c:32:9:    got unsigned long
+ * check-error-end
+ *
+ */
-- 
2.23.0


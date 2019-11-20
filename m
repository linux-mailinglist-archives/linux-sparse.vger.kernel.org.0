Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD67910308C
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 01:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfKTAKR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 19:10:17 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51701 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbfKTAKQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 19:10:16 -0500
Received: by mail-wm1-f66.google.com with SMTP id q70so5159233wme.1
        for <linux-sparse@vger.kernel.org>; Tue, 19 Nov 2019 16:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8jReT9B1FxEVkjrNKdCdn5Z7jb6wTBgsE6gEVemns1M=;
        b=ecKpdoLJGO3MGUX0fyKLSuKzKXmGh81vDhn1ZxIpL6dzwg+sDsdFfSu0lizjUND9PQ
         TpTNv8gB+3tOY4a7ij6e8PkPH+Dbz3ehLIxTCkO0oQomJuu14Ra+3YI20tHHM+3bpjl0
         QoI3ObKfIRWdJQZn1MhCbs1LxoxTukIghq/ZQN3It9vP064kuyZU8X+YyORMnMdvShPQ
         2QMxrm8XmlOie/UVr4i6Cmv/knhjzpoBHsujEVqDJNF+teRCf1lA6YzDhgLZWiBQL+7k
         ZWfQz5U5MwPQbpmUC6lzQo1zprNa9uh9PhS1vta2zlwCZHKfaInjiiX7wGB5psR4kVaX
         tRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8jReT9B1FxEVkjrNKdCdn5Z7jb6wTBgsE6gEVemns1M=;
        b=WFgBKNn+VCKUtNhYXtANcl/jFj9s2HxPqu26OB5r9mPkJej6aWlE68Zl18CyWKPrwc
         c6g1AicpPmSJosqRuIx/5vEwuRWaNVgXDBMPV19y6s2O0cRmQcx7klMO/RkAa5IRGieg
         JpNKG6kmWi/9I3/6l43+eopMJzqH1qbbCd9egFSyT9BjUIs8LVOK8x2mR4G7XEgfJdbi
         w28wHnLZpY2ViXnLMWk0Ln/nIB8WfTpUL/l/CB1y6M1BwGy3ZW8YpK5vm5Vh6A0gA3ly
         0X/1B3HMtwZhtZyObLWdFYLAphGcyVA4wrNcU3kHCUlzHicXrgZROt2Ty1vZNJLlxWCM
         YZEg==
X-Gm-Message-State: APjAAAXiWD1vzZuSJFb4KcW1al0+HUrdqrlhUPo0c2LrovF7YEYGnv6p
        mczEedEopHlbSieJQ9vVuA1zxrmi
X-Google-Smtp-Source: APXvYqy4yKd8dABxyTZ5yv+ipjeXqN0suQhDsWePWB0tszCRTczUF+x1JiWBVd5cLxdFC9ypIlSouA==
X-Received: by 2002:a1c:5415:: with SMTP id i21mr63616wmb.120.1574208613592;
        Tue, 19 Nov 2019 16:10:13 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:5dce:1599:e3b5:7d61])
        by smtp.gmail.com with ESMTPSA id c24sm33398808wrb.27.2019.11.19.16.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 16:10:12 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/5] add tests for function attributes
Date:   Wed, 20 Nov 2019 01:02:20 +0100
Message-Id: <20191120000224.30441-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Function attributes need to be parsed differently than
the usual specifiers. For example, in code like:
	#define __noreturn __attribute__((noreturn))
	__noreturn void foo(int a);
the __noreturn attribute should apply to the function type,
while a specifier like 'const' would apply to its return type.
It's even more clear when function pointers are involved:
	__noreturn void (*fptr)(void);
here too, the attribute should be applied to the function type,
not the its return type, nor to the declared pointer type.

Add some testcases to cover some of the situations concerning
the parsing of these function pointers.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/attr-visible.c                | 13 +++++++++
 validation/attr-visible2.c               | 10 +++++++
 validation/bitwise-function-pointer.c    | 17 ++++++++++++
 validation/function-attribute-inner.c    | 10 +++++++
 validation/function-attribute-omitted.c  | 14 ++++++++++
 validation/function-attribute-pointer.c  | 34 ++++++++++++++++++++++++
 validation/function-attribute-void-ptr.c | 14 ++++++++++
 validation/function-attribute.c          | 15 ++++++-----
 validation/pure-function.c               | 17 +++++++++---
 9 files changed, 134 insertions(+), 10 deletions(-)
 create mode 100644 validation/attr-visible.c
 create mode 100644 validation/attr-visible2.c
 create mode 100644 validation/bitwise-function-pointer.c
 create mode 100644 validation/function-attribute-inner.c
 create mode 100644 validation/function-attribute-omitted.c
 create mode 100644 validation/function-attribute-pointer.c
 create mode 100644 validation/function-attribute-void-ptr.c

diff --git a/validation/attr-visible.c b/validation/attr-visible.c
new file mode 100644
index 000000000..38ee85752
--- /dev/null
+++ b/validation/attr-visible.c
@@ -0,0 +1,13 @@
+#define __visible __attribute__((externally_visible))
+
+__visible void foo(void)
+{
+}
+
+int flag __visible;
+
+/*
+ * check-name: attr-visible
+ * check-command: sparse -Wdecl $file
+ * check-known-to-fail
+ */
diff --git a/validation/attr-visible2.c b/validation/attr-visible2.c
new file mode 100644
index 000000000..62949b479
--- /dev/null
+++ b/validation/attr-visible2.c
@@ -0,0 +1,10 @@
+#define __visible __attribute__((externally_visible))
+
+int flag __visible;
+int arr[2] __visible;
+
+/*
+ * check-name: attr-visible-after
+ * check-command: sparse -Wdecl $file
+ * check-known-to-fail
+ */
diff --git a/validation/bitwise-function-pointer.c b/validation/bitwise-function-pointer.c
new file mode 100644
index 000000000..544f2fc00
--- /dev/null
+++ b/validation/bitwise-function-pointer.c
@@ -0,0 +1,17 @@
+#define __bitwise __attribute__((bitwise))
+
+typedef unsigned int __bitwise t;
+
+unsigned int fun(void);
+
+static t (*ptr)(void) = fun;
+
+/*
+ * check-name: bitwise-function-pointer
+ *
+ * check-error-start
+bitwise-function-pointer.c:7:25: warning: incorrect type in initializer (different base types)
+bitwise-function-pointer.c:7:25:    expected restricted t ( *static [toplevel] ptr )( ... )
+bitwise-function-pointer.c:7:25:    got unsigned int ( * )( ... )
+ * check-error-end
+ */
diff --git a/validation/function-attribute-inner.c b/validation/function-attribute-inner.c
new file mode 100644
index 000000000..178c7c019
--- /dev/null
+++ b/validation/function-attribute-inner.c
@@ -0,0 +1,10 @@
+#define __noreturn __attribute__((__noreturn__))
+
+void __noreturn fun(void);
+
+_Static_assert([void (__noreturn *)(void)] == [typeof(&fun)], "");
+
+/*
+ * check-name: function-attribute-inner
+ * check-known-to-fail
+ */
diff --git a/validation/function-attribute-omitted.c b/validation/function-attribute-omitted.c
new file mode 100644
index 000000000..43b301d8f
--- /dev/null
+++ b/validation/function-attribute-omitted.c
@@ -0,0 +1,14 @@
+#define __pure		__attribute__((pure))
+#define __noreturn	__attribute__((noreturn))
+
+
+int __pure	p(int i);
+int		p(int i) { return i; }
+
+void __noreturn	n(void);
+void		n(void) { while (1) ; }
+
+/*
+ * check-name: function-attribute-omitted
+ * check-known-to-fail
+ */
diff --git a/validation/function-attribute-pointer.c b/validation/function-attribute-pointer.c
new file mode 100644
index 000000000..27f43bfb6
--- /dev/null
+++ b/validation/function-attribute-pointer.c
@@ -0,0 +1,34 @@
+#define __noreturn __attribute__((__noreturn__))
+
+void set_die(void (*)(void));
+void set_die_nr(__noreturn void (*)(void));
+
+void die(void);
+void __noreturn die_nr(void);
+
+static void foo(void)
+{
+	set_die(die);
+	set_die(die_nr);
+	set_die_nr(die_nr);
+	set_die_nr(die);
+
+	           void (*fptr0)(void) = die;
+	           void (*fptr1)(void) = die_nr;
+	__noreturn void (*fptr3)(void) = die_nr;
+	__noreturn void (*fptr2)(void) = die;
+}
+
+/*
+ * check-name: function-attribute-pointer
+ * check-known-to-fail
+ *
+ * check-error-start
+function-attribute-pointer.c:14:20: warning: incorrect type in argument 1 (different modifiers)
+function-attribute-pointer.c:14:20:    expected void ( [noreturn] * )( ... )
+function-attribute-pointer.c:14:20:    got void ( * )( ... )
+function-attribute-pointer.c:19:42: warning: incorrect type in initializer (different modifiers)
+function-attribute-pointer.c:19:42:    expected void ( [noreturn] *fptr2 )( ... )
+function-attribute-pointer.c:19:42:    got void ( * )( ... )
+ * check-error-end
+ */
diff --git a/validation/function-attribute-void-ptr.c b/validation/function-attribute-void-ptr.c
new file mode 100644
index 000000000..0092b63c3
--- /dev/null
+++ b/validation/function-attribute-void-ptr.c
@@ -0,0 +1,14 @@
+#define __noreturn __attribute__((__noreturn__))
+
+void fun(void *);
+void __noreturn die(void);
+
+static void foo(void)
+{
+	void *ptr = die;
+	fun(die);
+}
+
+/*
+ * check-name: function-attribute-void-ptr
+ */
diff --git a/validation/function-attribute.c b/validation/function-attribute.c
index 0f2c75922..2be180c42 100644
--- a/validation/function-attribute.c
+++ b/validation/function-attribute.c
@@ -1,17 +1,20 @@
 #define __pure __attribute__((pure))
 
-struct s {
-	int x;
-};
 
-static __pure struct s *grab(struct s *ptr)
+static __pure int funi(int val)
+{
+	return val;
+}
+
+static __pure int *funp(int *ptr)
 {
 	return ptr;
 }
 
-static void foo(struct s *ptr)
+static void foo(int val, int *ptr)
 {
-	struct s *ptr = grab(ptr);
+	int  nbr = funi(val);
+	int *res = funp(ptr);
 }
 
 /*
diff --git a/validation/pure-function.c b/validation/pure-function.c
index 04bb85e4d..9692cc842 100644
--- a/validation/pure-function.c
+++ b/validation/pure-function.c
@@ -1,16 +1,25 @@
 
-static __attribute__((__pure__)) int pure1(void)
+static __attribute__((__pure__)) int pure_int(int v)
 {
-	int i = 0;
+	int i = v;
 	return i;
 }
 
-static __attribute__((__pure__)) void *pure2(void)
+static __attribute__((__pure__)) void *pure_ptr(void *p)
 {
-    void *i = (void *)0;
+    void *i = p;
     return i;
 }
 
+static void foo(int v, void *p)
+{
+	int   val = pure_int(v);
+	void *ptr = pure_ptr(p);
+
+	(void)val;
+	(void)ptr;
+}
+
 /*
  * check-name: Pure function attribute
  */
-- 
2.24.0


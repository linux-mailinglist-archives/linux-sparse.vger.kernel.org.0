Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B685E119EF1
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfLJW7n (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:43 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43236 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbfLJW7n (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id d16so21928600wre.10
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cVO8dfyonfbXnmx4H8gCH0ESqVER87MBGefYj1Sr7rY=;
        b=HwetdMyC/5q8Iubx0H7f1YPSKCO9uHh9WJHaDpBVOAlhqvKQlHszFo+qp2QBi1fnLI
         dYgWogHw9L1EYgR2sL+tpTTaZCSwN4N5jJXgu/PGO5yv3IH75hGoCu7lcF6251NHlAZr
         rhi2AF4nkALcvFBDYkBcDInshIl8Ii/FooghxeSg5AQfuu7drbRF9snOM2PfHRyw9sSH
         4hhkZVDcb3hgcLzNUIDBHCfbQ5JzlMkFm+Bdqaw7ZnnkrvOo47kAoJi+F4AH0KSt03rB
         rEUdAKglm1MkfiBdWLIzu0n8PTsLvNGtFIAPl0UjXXUKj1FRaYm8DKlOmZEk+wZGw/D1
         qSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVO8dfyonfbXnmx4H8gCH0ESqVER87MBGefYj1Sr7rY=;
        b=E4OP7C77Q9zIc5yrtXiUKz7c6bOGZ5yzyXGKefPpLvspQsvxtrAgq0Fv2/WXWQfQAl
         f1QlsL25680fhENexvGRSUJ3gpzAN+rgl7GzFvR/ahy+m86eLEFYVU8I8bCGTVDBI8We
         XPKB99yNfLBoyQPs8t/NTOmjN9Ui7Xtj2sTyC+8aMmXLlQOL6T4nD79JbxU9ww7yKV4K
         MFzZUjyR7ld8AAbtZVRN9vnvbCHBS+o+KzvpLNBmbV5SOvSBiAwnKdWkr35fo8cnS0b0
         fskw3gmUe+jq3B4JFs89Xbnopt1CrbfxoHfwGwPsZZA0GspBMQ4lQ+8DuWPtOSXEIly4
         cBZA==
X-Gm-Message-State: APjAAAWdtjm8ipdprzUB9MiRWiD2c/NodexDGdDKDNXkuhrK3RX5Ih01
        tmcwCnO0VGv+VeUlrV9pwbc4xR6p
X-Google-Smtp-Source: APXvYqxMeK8eBNXy79SSPHOb1b6e8q1CovbjCfg/pePyhZPdHYANGiGNM+2skJ7S5of99lawH1ggZw==
X-Received: by 2002:adf:8041:: with SMTP id 59mr5650882wrk.257.1576018780663;
        Tue, 10 Dec 2019 14:59:40 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:39 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 10/17] degenerated arrays & functions are addressable too
Date:   Tue, 10 Dec 2019 23:59:14 +0100
Message-Id: <20191210225921.94897-11-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Symbols which have their address taken (with the 'addressof'
operator: &) are marked as such (with the modifier MOD_ADDRESSABLE).
But degenerated arrays and functions have their address implicitly
taken.

MOD_ADDRESSABLE is used to prevent to replace a symbol dereference
nto the value used to initialize to it. For example, in code like:
	static int foo(void)
	{
		int x[2] = { 1, 2 };
		return x[1];
	}

the return expression can be replaced by 2. This is not the case
case if the array is first passed in a function call, like here:
	extern void def(void *, unsigned int);
	static int bar(void)
	{
		int x[2] = { 1, 2 };
		def(x, sizeof(x));
		return x[1];
	}

Fix this by marking degenerated arrays (and functions) as also
being addressable.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                              |  1 +
 validation/eval/addressable-degen.c     |  1 -
 validation/expand/constant-init-array.c | 15 +++++++++++++++
 3 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 validation/expand/constant-init-array.c

diff --git a/evaluate.c b/evaluate.c
index c0281e9b10f2..11ad6a22c32f 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -1772,6 +1772,7 @@ static struct symbol *degenerate(struct expression *expr)
 		*expr = *expr->unop;
 		ctype = create_pointer(expr, ctype, 1);
 		expr->ctype = ctype;
+		mark_addressable(expr);
 	default:
 		/* nothing */;
 	}
diff --git a/validation/eval/addressable-degen.c b/validation/eval/addressable-degen.c
index e1dc51079079..d420927e0c71 100644
--- a/validation/eval/addressable-degen.c
+++ b/validation/eval/addressable-degen.c
@@ -11,7 +11,6 @@ static int bar(void)
 /*
  * check-name: eval/addressable-degen
  * check-command: test-linearize -fdump-ir $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: load\\.
diff --git a/validation/expand/constant-init-array.c b/validation/expand/constant-init-array.c
new file mode 100644
index 000000000000..94949be54244
--- /dev/null
+++ b/validation/expand/constant-init-array.c
@@ -0,0 +1,15 @@
+int test_array(int i)
+{
+	static const int a[3] = { 1, 2, 3, };
+
+	return a[1];
+}
+
+/*
+ * check-name: constant-init-array
+ * check-command: test-linearize -Wno-decl -fdump-ir $file
+ *
+ * check-output-ignore
+ * check-output-excludes: phisrc\\..*return.*\\$2
+ * check-output-contains: load\\.
+ */
-- 
2.24.0


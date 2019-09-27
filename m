Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E03C0EA5
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbfI0Xna (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:30 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36435 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbfI0Xn3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:29 -0400
Received: by mail-ed1-f67.google.com with SMTP id h2so3746148edn.3
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i48AorL/QX6PUj4RrX0pYJ7Oarrksg8nCzm7dmWkIq0=;
        b=svBQwg4aJmKMTDiaMRaJCUeZwwOsma/EVIvxQ++VyklJE2Ad+0gXZgL4O3+zR9ZlYF
         C5TUBaDKZhxyzo+WUGXFUQmrYFuHmIQiUNwGAkbyiVHPJX+4B0N1F+OxHfb2UUpF5H4k
         ZdC64k5688tvEJhhaG+9a5QYKrycSL2JnKonVAphASRcoGw6KkvztSi4tCBayP5dyl9c
         ZYvsvgAXUHazYZm0rQct0AFB1TM8YnwbsEhdUdBN2eqqPfQrSpbHIRjgWX7DmzjlCzR+
         jloWX1AGyEjHMYLcQ1MNpolqoGM0+dilRAl1AlC2jSvevDQGqFaTrMqaiC2UGQFBQOaG
         7I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i48AorL/QX6PUj4RrX0pYJ7Oarrksg8nCzm7dmWkIq0=;
        b=YZDBXCE7LIHceavAb56YeP6C3mpi2oTXI5eY3ct3JbjEnbShe5r1GMMZppnUIK9dVs
         Kv5FJ3BQOOgD8MDQ2KrX1Rzw6paVW3fHiBOovXD+UYQeWzxRV8zHO9hz9J3Sd25Sa5oM
         lBkcTMHTomEixfbdCP58FkucLCcauSPXwZdZ1Lh9wXmq/2oiTkpm3curQr1uw/4mrB+B
         57BJW5FIwY/kmGNcd/QHi1Uc7ToJZXjPiolFjH4Std+wbiYLPz5pywD58OKtEupf0IFk
         lQlObJLd19tWG73I/ir3H7rapAnMHbHQFw09tmquuHIc+KZabQzU65G+QFSjgJSBN2SM
         IcGA==
X-Gm-Message-State: APjAAAXAd0E6+Le5eaBzzi8TSvGg8r1FfHZYgpyGAQEPQWox/P1xcgGU
        gsrQml7ZewpdjPWG7VLoYsBhzytq
X-Google-Smtp-Source: APXvYqy54eVuj/KxCho1FND26t23WjEN/90/crKkr+12iYSwaG065bEWwziQvb7+1IwbVQonvMd/VA==
X-Received: by 2002:a50:9512:: with SMTP id u18mr7357786eda.182.1569627808029;
        Fri, 27 Sep 2019 16:43:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:27 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 03/18] expand: add test for expansion of compound literals
Date:   Sat, 28 Sep 2019 01:43:07 +0200
Message-Id: <20190927234322.5157-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Compound literals are currently not expanded.
Add a test for this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/expand/compound-literal.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 validation/expand/compound-literal.c

diff --git a/validation/expand/compound-literal.c b/validation/expand/compound-literal.c
new file mode 100644
index 000000000..7401b0191
--- /dev/null
+++ b/validation/expand/compound-literal.c
@@ -0,0 +1,27 @@
+#define SAME_TYPE(A, B)	\
+	__builtin_types_compatible_p(A, B)
+
+struct s {
+	int i;
+};
+
+static void foo(struct s *p)
+{
+	*p = (struct s) { .i = SAME_TYPE(int, int), };
+}
+
+/*
+ * check-name: compound-literal
+ * check-command: test-linearize $file
+ * check-known-to-fail
+ *
+ * check-output-start
+foo:
+.L0:
+	<entry-point>
+	store.32    $1 -> 0[%arg1]
+	ret
+
+
+ * check-output-end
+ */
-- 
2.23.0


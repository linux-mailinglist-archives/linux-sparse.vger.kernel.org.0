Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CDBC1A6997
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731397AbgDMQQP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731394AbgDMQQN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:13 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ACF8C0A3BE2
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:13 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o81so4243688wmo.2
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oA3sVehRVdHdWiiA/Q5zaM+EbHDkqSQ1EJpnp3n0pDs=;
        b=I3GENswmkd1t2ENAVTUj6G86rfCVZH1WdsYpr2Yu7luyzHL+5x3y6ANMXzdt+hXDnN
         OUrjTxyeWYvDH9ckbaSY00Otos6iduzyzBzeK9TVONXoNpFiYlbJtlfzAaqc2EPcW01m
         eTavn79+c5PPWxgDz8RU7dBX7B1VQnsge0oaziwJNTLYV+UvPPSdJoVumEif/yTt3BMo
         x5nmFAyrZvL9XMXRnbxI/XoQsUmrH0nHq5jzhm8dhz+cbGZgnEHWBMeheia2fmcX1RSy
         f9MlWNT9EuAF0RuO55po5bL5bo6eND/JarLilLPudFCmu3IHryHDTmhLW34LlEcc7m6u
         05bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oA3sVehRVdHdWiiA/Q5zaM+EbHDkqSQ1EJpnp3n0pDs=;
        b=BvFZVusTXKyxmfKJoIdwWLoz7/4Ir+VbYzBNUZs9npclb4L1nuMHxM/m4CR+w5AZA4
         /F46Kdfy3AYqBy4sLOcr/fZnsdj2Cj0i0uB735XVH6jzzkLFgsHQg/yCo9lq/wdukJwl
         6Qn9PGZOfJHItBupxJR2tRUO6qVqv6vw19eYqaM5ZfhP2ppsBsLryzRpGfaY50jGjc22
         kZqbUHZ/vah26jFVl/VFIuhwSSBoOSgzO7zPtUjCNXGIx+qjbSe55G4gXgmvDjfPuR9J
         Y0DspJ1LEIfIlyboDuo8rIE1gG35020RkLMNnA/6GNK+HjNBG62OcKS9nTnv/1c+U+A4
         YfkA==
X-Gm-Message-State: AGi0Puau40qdbnfbSe7i0RSvCuQ9Q0ES8tpIBfPTG1wBwlRu+35vBvWR
        qcUL/uO1RWhKFK354io+cVHXq/kL
X-Google-Smtp-Source: APiQypKnuQE4lo0Zine0zjNHIGAkwdCWZrRUMw2/ktvizifffrzCxO76ySehO0mW2pbq67EdBkwBTA==
X-Received: by 2002:a1c:7d90:: with SMTP id y138mr20595797wmc.121.1586794571612;
        Mon, 13 Apr 2020 09:16:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:11 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 01/17] bad-goto: add testcase for 'jump inside discarded expression statement'
Date:   Mon, 13 Apr 2020 18:15:49 +0200
Message-Id: <20200413161605.95900-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A goto done into an piece of code discarded at expand or
linearize time will produce an invalid IR.

Add a testcase for it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/label-stmt-expr1.c           | 30 +++++++++++++++++++++++++
 validation/linear/goto-and-expr-stmt0.c | 28 +++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 validation/label-stmt-expr1.c
 create mode 100644 validation/linear/goto-and-expr-stmt0.c

diff --git a/validation/label-stmt-expr1.c b/validation/label-stmt-expr1.c
new file mode 100644
index 000000000000..47ba54ae7305
--- /dev/null
+++ b/validation/label-stmt-expr1.c
@@ -0,0 +1,30 @@
+static int foo(void)
+{
+	goto l;
+	return	({
+l:
+		0;
+	});
+}
+
+static void bar(void)
+{
+	int r;
+	r = ({
+l:
+		0;
+	});
+	goto l;
+}
+
+/*
+ * check-name: label-stmt-expr1
+ * check-known-to-fail
+ *
+ * check-error-start
+label-stmt-expr1.c:3:9: error: goto into statement expression
+label-stmt-expr1.c:5:1:    label 'l' is defined here
+label-stmt-expr1.c:17:9: error: goto into statement expression
+label-stmt-expr1.c:14:1:    label 'l' is defined here
+ * check-error-end
+ */
diff --git a/validation/linear/goto-and-expr-stmt0.c b/validation/linear/goto-and-expr-stmt0.c
new file mode 100644
index 000000000000..548813531779
--- /dev/null
+++ b/validation/linear/goto-and-expr-stmt0.c
@@ -0,0 +1,28 @@
+int t(void)
+{
+	goto inside;
+	return 1 ? 2 : ({
+inside:
+			return 3;
+			4;
+		    });
+}
+
+void f(int x, int y)
+{
+	1 ? x : ({
+a:
+		 y;
+	});
+	goto a;
+}
+
+/*
+ * check-name: goto-and-expr-stmt0
+ * check-command: test-linearize -Wno-decl $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-excludes: END
+ * check-error-ignore
+ */
-- 
2.26.0


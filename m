Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2DDD119EED
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfLJW7i (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:38 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54964 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbfLJW7i (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:38 -0500
Received: by mail-wm1-f65.google.com with SMTP id b11so5016725wmj.4
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xOlHcyatID/+Hqqk50CoalJLN9Oe4eJ6EMLnj4fUfsE=;
        b=uFv0YYzXt2RQ90svAs2TRfJAx2Pb+2A75Sqctd5Zc3hiW723Jj+Vv2/317hjIBC9vN
         MlIh6X0YZSRvspXS4/By29t7Yc7vWFo0igMjyPUamwObVTtIyndYOwFQe6ecBbjKv5mU
         CK5MH7j1jdt5BQOZOOdFVpBvg1L/dbvETFp0wxjWJkTtCO6bsxdIPHGiwn9gccXSr31l
         zT0l4h82gDQqUPro6j0iHQH9VNSiQqTkMhxrQr4Weotd1z8XEI29rv7Mi8DATuX7i1TU
         0Lgd9OEVquaruIyBq5yifFO/CxORMpd0OfTmYWcNIEO43kZhB0NVNdnVnth4YfFeZAgk
         IFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xOlHcyatID/+Hqqk50CoalJLN9Oe4eJ6EMLnj4fUfsE=;
        b=LHRdBLBtrTi4eLBrIWgKd+Nb0yadl/op593Nt6n9EyNLUclacrEHywOcY/F3qdW+Th
         ZXbA5bM+2WjfYDcCU9BxWg2Zq3vKJRVlB5rF7cRTuzhVdERkhtevz388cNX5ms4OF1W8
         Sg+MNTbEV4IlwWDtUSg+2BE4y8dEnbOwldKtFnXDb1ClLUUr2xoNq8PAiNS8SWO4htZY
         edkNRJRqHoT4+TNiElXocihOanpzrogPTYNCJHmoUo0bX252HW4es5u6pnHJvNk2UnD5
         M1mLA7gm4beIKIhJCNRs/sYyLYQ7UxWrSrJEAsxqHyE1NbefRRPPBdBSibqoVfCQpXNw
         rP3g==
X-Gm-Message-State: APjAAAUF4UU05D5G/98+6t53//WJk7Y+Ck9MzWkm2c4TtuGJIabaYJOE
        eFjUPuikB+NxQlbwXuYad1HFaJ67
X-Google-Smtp-Source: APXvYqzfibM1F33Yyu5EkzpS8WA5NCmSqefWT0b/exfOUIw0jgo8FL7FoUC86zQnTFv25f1nitFL8w==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr1372285wmj.90.1576018776203;
        Tue, 10 Dec 2019 14:59:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:35 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 06/17] add test for dereference cost of symbol with complex type
Date:   Tue, 10 Dec 2019 23:59:10 +0100
Message-Id: <20191210225921.94897-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, in expand_dereference(), the dereference of a symbol with
a complex type is considered as costing as high as a non-symbol
because it's not recognised it's a symbol.

Add a testcase for this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/expand/cost-deref-nested.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 validation/expand/cost-deref-nested.c

diff --git a/validation/expand/cost-deref-nested.c b/validation/expand/cost-deref-nested.c
new file mode 100644
index 000000000000..b09602b6acc6
--- /dev/null
+++ b/validation/expand/cost-deref-nested.c
@@ -0,0 +1,21 @@
+struct s {
+	struct {
+		int u, v;
+	} a, b;
+};
+
+static const struct s s;
+
+static int foo(int c)
+{
+	return c && s.b.v;
+}
+
+/*
+ * check-name: cost-deref-nested
+ * check-command: test-linearize -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-excludes: cbr
+ */
-- 
2.24.0


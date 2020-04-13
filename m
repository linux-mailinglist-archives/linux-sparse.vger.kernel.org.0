Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E3FC1A6999
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731396AbgDMQQQ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731324AbgDMQQP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:15 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE0F4C0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:14 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y24so10521576wma.4
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3gTQK5nr6KgZgsX8qQ70Vd5hrdF5dKhg2go+8Fr0JTo=;
        b=cK8MUaJ8RGnNxvrIa0VzbDoQsWEuKUDjL2XqHCjfGmh5Z5eiPdLWnwom8pSqLrUrNL
         bQQuPQY7Vq+Xdzet3K1Vv6hiRm7MS9HUomkrgdHV3Obsklw9+s5Jhjf2G8ax01XxDkX4
         O9/cOoKgtAa1KqapWnk6//b1pTMoV/dNbMuqHsl2brI3Ulkyy6wwaxYJigsio99Mjswh
         1SFd4NIMuTvMBKxmKwpD+GrPPG7l66NhZCi95aPLQW+VM44gZ4ox1YwWo1x7laFLDKTM
         ak0m2RpuFwAgm794qSuUnYAkgEBVem75gY0UvGJuiR1jU+CnZu+egaZuzTdLbTbCXlo9
         etuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3gTQK5nr6KgZgsX8qQ70Vd5hrdF5dKhg2go+8Fr0JTo=;
        b=AxXr44J/2E+rllikoZvyWYX3ksYurp+bW6zO9jodlhY3tKbfPE6swAHKUFcyexp3n+
         /ySLj0vTiUI8999Xz5IbE4Ve1ghI/iQoU7HNI8ijQMKQ6yO+vaW2g4xoFIbFbP30LDOd
         IMotVA5YyQS52wiJsbS1aluqqnSew1DmK9msGIe2G5QN5IxH0mwtuEPYqu2r+NT87MJq
         VyQ9rM4RwGJsameEYtViWwjinUiWb//r1tBZLPlMlF7vZo+3JLp8abyrQAuB1d9SQGIC
         1XfHMYx26Uh3w9WWzZdOo3IDcyyu04M/9bq/XdA0ZyCkiBQrzdwDObHQnu7XO83XTL3Z
         7H3A==
X-Gm-Message-State: AGi0PubhMpvNg7W1xJXL3/TK14BqGfxsMQaIdcv938nsoW9suI6nkzhV
        ymdSbM+5Gi3PVyDroohUhy1uXF3i
X-Google-Smtp-Source: APiQypKycfRxx+IgDPaCqfaySJs1d0zFZLGjfCcKuEZPOa56DwuKHNVZ2bOHZNMWAisM7B+2QQlYDQ==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr18900682wml.20.1586794573433;
        Mon, 13 Apr 2020 09:16:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:12 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 03/17] bad-goto: add more testcases
Date:   Mon, 13 Apr 2020 18:15:51 +0200
Message-Id: <20200413161605.95900-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add some testcases for gotos with undeclared labels & __label__.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/label-scope1.c | 42 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 validation/label-scope1.c

diff --git a/validation/label-scope1.c b/validation/label-scope1.c
new file mode 100644
index 000000000000..f2b1ae9b158a
--- /dev/null
+++ b/validation/label-scope1.c
@@ -0,0 +1,42 @@
+static void ok_top(void)
+{
+	__label__ l;
+l:
+	goto l;
+}
+
+static void ko_undecl(void)
+{
+	__label__ l;
+	goto l;				// KO: undeclared
+}
+
+static void ok_local(void)
+{
+l:
+	{
+		__label__ l;
+l:
+		goto l;
+	}
+goto l;
+}
+
+static void ko_scope(void)
+{
+	{
+		__label__ l;
+l:
+		goto l;
+	}
+goto l;					// KO: undeclared
+}
+
+/*
+ * check-name: label-scope1
+ *
+ * check-error-start
+label-scope1.c:11:9: error: label 'l' was not declared
+label-scope1.c:32:1: error: label 'l' was not declared
+ * check-error-end
+ */
-- 
2.26.0


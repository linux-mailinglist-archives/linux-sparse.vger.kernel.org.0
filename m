Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2342D116418
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Dec 2019 00:22:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfLHXWD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 8 Dec 2019 18:22:03 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33198 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726806AbfLHXWD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 8 Dec 2019 18:22:03 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so14032536wrq.0
        for <linux-sparse@vger.kernel.org>; Sun, 08 Dec 2019 15:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nM2cY/nZ0vZX0CDjwQFWFuA33Wib4cyLP86V3mQgtsw=;
        b=jrLMyPfvMF8kCW5JfdgzN9SPz1gN0kkCWXYmE7MKBb1ekc/MvqYWBJwnepNQbOxuOM
         FGec+iTkFu2y2ug/aAqliLaBbJGYddAQL8PYrBEhHj9D8i9deCDUx7aV05HFqqIJBsXH
         Ucob1pc1lCxQdXEWBPwUUYwMQKVA/Xyy/kCHUP565+bA9odHK6MYLvjFAmDWYDL9vAM9
         jNe+khfoGt8XdVzLGXbBvYLkAMojK9BOIjpPmeUR7CttSQrRgEIawvKu8Qt1y3tuPc1T
         NmCP319HO500XFXyJTZoqior3c81dWjwvnqVxr1D5B9ErpzzEx9XL15/IeuLDu6lf0JH
         dl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nM2cY/nZ0vZX0CDjwQFWFuA33Wib4cyLP86V3mQgtsw=;
        b=oQDds4yVnpf4mqSRM8mL+4BRk8V8g5lYxcHSShXxljAQEe7MGvOCX2oKvo962bQjxa
         0tLuWqVF7zCloglQytzi2NDASMjf/6FbhgElu8TeUpDtm2Zwol50usB01dW6oe2CBz9U
         r9YGcfzBH8BvRPoxkOeXwJWTsELi5cXKiIHH0A4iMpOe4aXSIiFxfP8hryoRnSO4GqBE
         mrC5Qakf6beLFNB7YMsSLN4/2lRB4qsKA3ImSQf/jVqv/5uDdZN54yYBlE6/dj8QcKQO
         uy5Y64w8MtO6r5T33eBStdZ4dH/dWEdCWOOvJMgv7/Hzcnhg2zQ/OwdUHLeIU1y8MZ9E
         KgVQ==
X-Gm-Message-State: APjAAAXgnytiPZzgAsr6ysEJeymenD5g+/tHYmyQT1hCB47FuVTRasT8
        7/hgSCkSHNSjKKHU9oV4jM6mAi76
X-Google-Smtp-Source: APXvYqy9KFBmOJkFx1Lc2NkrS7EzdQHMXysVBgIqRhlkgDvEL8Z6z2+D3xfpX9iCMMUZP5ZfImntJQ==
X-Received: by 2002:adf:d184:: with SMTP id v4mr26250221wrc.76.1575847320912;
        Sun, 08 Dec 2019 15:22:00 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40d5:8a00:61ab:d604:b478:87a3])
        by smtp.gmail.com with ESMTPSA id w17sm25377996wrt.89.2019.12.08.15.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 15:22:00 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/5] bitfield: add testcases for invalid bitfield width
Date:   Mon,  9 Dec 2019 00:19:17 +0100
Message-Id: <20191208231921.49964-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
References: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add some testcases before making related changes.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/bitfield-sizes.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 validation/bitfield-sizes.c

diff --git a/validation/bitfield-sizes.c b/validation/bitfield-sizes.c
new file mode 100644
index 000000000000..e30a3e4c649c
--- /dev/null
+++ b/validation/bitfield-sizes.c
@@ -0,0 +1,31 @@
+struct a {
+	int  a:31;
+	int  b:32;
+	long c:63;
+	long d:64;
+	int  x:33;		// KO
+	long y:65;		// KO
+};
+static struct a a;
+
+struct b {
+	int m1:-1;		// KO
+	int x1:2147483648;	// KO
+	int :0;
+	int a0:0;		// KO
+};
+static struct b b;
+
+/*
+ * check-name: bitfield-sizes
+ * check-command: sparse -m64 $file
+ * check-known-to-fail
+ *
+ * check-error-start
+bitfield-sizes.c:12:18: error: invalid bitfield width, -1.
+bitfield-sizes.c:13:26: error: invalid bitfield width, 2147483648.
+bitfield-sizes.c:15:17: error: invalid named zero-width bitfield `a0'
+bitfield-sizes.c:6:15: error: impossible field-width, 33, for this type
+bitfield-sizes.c:7:15: error: impossible field-width, 65, for this type
+ * check-error-end
+ */
-- 
2.24.0


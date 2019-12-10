Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6061B119EEC
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbfLJW7h (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:37 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38231 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbfLJW7h (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:37 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so21976899wrh.5
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0GjbWAwcLKkqwmmp0UchlI/mK05K5fPhHLmCgtC5tzA=;
        b=sFmlIKYMETgux8y+wzlUxAhPX5tqo6WtRhAMKtFTH0vlXFMXbDOE1Rkem3o7S2S7nM
         GBy30tHtw8W2NWayM6a/y74dw3QClDtGOvdJTz4gvoRbccJVXrwuS+iGn+a21o7BPPRd
         cUEDZblZ966xH1N8i1GrBEJNP7KX8p08Lst6fxcQJF9G9my7dWAxwjImZDqn/s3/XyXr
         YoNRDppF5mmdswqCC0vWFJtOlVidwy0hCoOzfQwCgqIMvO5A8lv7EiIFT3svpIdpA+vU
         az8FGOWCwsvb3UK4rZR/QsxZ1Ks1Wr9J5kqNsHuhUZyV7M6IpYc8RO8SaHKT1P5u7z2E
         YVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0GjbWAwcLKkqwmmp0UchlI/mK05K5fPhHLmCgtC5tzA=;
        b=IVIYNzKfd3BU7MmK5aKHF10bptqFr6M4LGZNebg0IXGmywoJy23mjUH7YoBapMEJlU
         G5sy+uAQ1dwVFNdBgaIU2BEt1U+SOU43U+YmylrZJSxgfjEnogFTHr8ItQ5d5IEpH5Er
         hqc1gpcB+sTUba64nVZXQjj8ozplJr6ConSZO2mLG4cdcrQ+pZN7emd92v+oaiicPRXO
         tSYccQRZZwA0VQSoWqZ1+J4OtfHW/p16EMrY2hMK3NEmT45oheJDUojf3Mcf0lo4WUHL
         modmcss4n9StCsviegl8zI1n8QO/A9MOJSq03+bYsZGIEObYCxVUln7fNmFTv26ok0g1
         XxGQ==
X-Gm-Message-State: APjAAAXTn6whuSuhc3EdHctL+Dwksft5jrWNOfWcWVu0YlylrWA+fiiF
        UPw2GRI8nr6RccXgW2BsojLmlID1
X-Google-Smtp-Source: APXvYqzBiAoFtvC0usogovvZ3fSj/GXdHCDLI0VExs7IL9jz+fg3rTbz2YuVw9kSlYsWSLmMAPTxQw==
X-Received: by 2002:a05:6000:1044:: with SMTP id c4mr11155wrx.204.1576018774547;
        Tue, 10 Dec 2019 14:59:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:33 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 05/17] add test for union cast
Date:   Tue, 10 Dec 2019 23:59:09 +0100
Message-Id: <20191210225921.94897-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse can't do this yet.
So, add a testcase for it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/expand/union-cast.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 validation/expand/union-cast.c

diff --git a/validation/expand/union-cast.c b/validation/expand/union-cast.c
new file mode 100644
index 000000000000..a28d01f22b92
--- /dev/null
+++ b/validation/expand/union-cast.c
@@ -0,0 +1,27 @@
+union u {
+	int i;
+	struct s {
+		int a;
+	} s;
+};
+
+int foo(void)
+{
+	struct s s = { 3 };
+	union u u = (union u)s;
+	return u.s.a;
+}
+
+/*
+ * check-name: union-cast
+ * check-command: test-linearize -Wno-decl -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-excludes: load\\.
+ *
+ * check-error-start
+union-cast.c:11:22: warning: cast to non-scalar
+union-cast.c:11:22: warning: cast from non-scalar
+ * check-error-end
+ */
-- 
2.24.0


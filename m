Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE811FFCE8
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Jun 2020 22:49:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728045AbgFRUth (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jun 2020 16:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbgFRUtg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jun 2020 16:49:36 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9B0C06174E
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:36 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id w16so7866522ejj.5
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SieYJMlEAC8kQOoaHn8+5UpGllAa3M2K4e5BfirvRQY=;
        b=TG0ggL1ZM8Z0SgjAQAZ0GRS49ePodJ2/v52VkTATDKHVmUeBm/bJi5Bs+w006CEWpI
         E6jZOdiMSV1h1etDRxWrvLgm1Ijmlk/nL5NZKOeA5nq2IhEPWvRqHiUIUTZPRlpEDW5J
         eFg9ogFjDQZJC+YyQ9o8GMKCVg6NZ5ivJFo6sr/Ryl5oM4/KPrEiB0skP/WweQfAIA1x
         1XzkRiMTiBCZr0tyXd2gH5kw61LtXBBhHVo8/VZMZpretnHgKbwUhF1cn5uYzPByfrOM
         kOgDp8P7coh8tMev/TJQEnmaJQpr6LI7J2C+yIfWu65IL7h1FToDHQRBERW8VDqgI2oR
         UDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SieYJMlEAC8kQOoaHn8+5UpGllAa3M2K4e5BfirvRQY=;
        b=Y2RCbf0XcndOFp5rofS2gnHl5RmTECryFqoGkJJ6363oSWvY/ZEgQcWLUJCAh/w0aa
         Ys3dtXeyP0uMqzenInec7kVyiAOW2iAb9A5h7vgHaRAOQiMTVRRTwIYqkZWPL+4uV7kT
         1Iqtz7qECh8ZBX0jfguwlHxSVbDJio3pDwwoR1F65A7dNBvfZkwF/5FYnxBlQGyks04D
         +S+WDVhA/YJiI1R7RTB8VojhUR7ts+07w/Kxfzo22KvCnA9s60MPxnEZbx7SCOGdjRGY
         HEOOSKI4sQ1jkS2Z3Em0yFkrZ7jx7pTlA3ZABooWDdpOkC0m3IWMcsfgFxBksr3rQ6xm
         bhsA==
X-Gm-Message-State: AOAM530N2+Apr0OnYhN3EXSyFQIA4dH8bU9Z4675L+go2NNlxr1XzRWS
        dtYnKp3vOB52Lh3gRt2awHq8f94d
X-Google-Smtp-Source: ABdhPJyRuWnc5IftSCDml2wtXg2LGcRp6QxREWMydo78Sbv2f/PZV9eMNF+1gNzWZtT0lhmgJpDPLQ==
X-Received: by 2002:a17:906:d923:: with SMTP id rn3mr504716ejb.261.1592513374535;
        Thu, 18 Jun 2020 13:49:34 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4c3c:7f8a:3583:598e])
        by smtp.gmail.com with ESMTPSA id s15sm2913160edw.54.2020.06.18.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 13:49:34 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/5] pre-process: add testcases for __has_feature() & __has_extension()
Date:   Thu, 18 Jun 2020 22:47:12 +0200
Message-Id: <20200618204716.3896-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
References: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The support for these builtin macros is incoming.
So, add some testcases for them.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/preprocessor/has-feature.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 validation/preprocessor/has-feature.c

diff --git a/validation/preprocessor/has-feature.c b/validation/preprocessor/has-feature.c
new file mode 100644
index 000000000000..3ab7c3e039fa
--- /dev/null
+++ b/validation/preprocessor/has-feature.c
@@ -0,0 +1,21 @@
+#ifndef __has_feature
+__has_feature()??? Quesako?
+#define __has_feature(x) 0
+#else
+"has __has_feature(), yeah!"
+#endif
+
+#if __has_feature(not_a_feature)
+#error "not a feature!"
+#endif
+
+/*
+ * check-name: has-feature
+ * check-command: sparse -E $file
+ * check-known-to-fail
+ *
+ * check-output-start
+
+"has __has_feature(), yeah!"
+ * check-output-end
+ */
-- 
2.27.0


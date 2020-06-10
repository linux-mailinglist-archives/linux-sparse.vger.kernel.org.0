Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 606C51F5D46
	for <lists+linux-sparse@lfdr.de>; Wed, 10 Jun 2020 22:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgFJUhC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 10 Jun 2020 16:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgFJUhA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 10 Jun 2020 16:37:00 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680DCC03E96B
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:37:00 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id s28so306641edw.11
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3eS+VgaAlAvdSZLmUYMzkNMGuK8/qhMwQV+0WzUlx+4=;
        b=b8EjNXg2BYtZ6P0HFz9DoPbcGuSfO3aEzQbPeopC3IK7+6MHQm2rmxENQAdPRiR6OW
         kGCOgrQG28lY//6VebHw+mgW/SaIuMGWoSEPgLT+t5yDLUe2mNnbDL6/ofDsHuhaU9Ud
         1EBl6yJuoT0o9VyhiDWfhkTrtIBiUVEiMRzFN9jAXbkpZe0d/QEC5pmy5BVqEGudVQc1
         lxRN9izFrFuin2sio+T5e9Rx585HLDnPRzgzkycaunfBxhWCOxhXfiO76n36NItYLvVA
         2mPAashojt0z0OJu6KQRBsGWLwNn+/YKNBuWa3MzsdLpPQSfmdjdfW0lNGQ7ha7WMYkJ
         SVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3eS+VgaAlAvdSZLmUYMzkNMGuK8/qhMwQV+0WzUlx+4=;
        b=irTm50ez9qaJNUHQxFhSnuNYiMR4pipQxPwlTKesjLUdelcKUSWDRgw67XvVD1+I2I
         XSlbfdkmfBeKMi203WjUMmekXK+i49p/MvHgGLSThYNoTirCAb/fTdyqvS/+uvhMqC98
         7qWRqPkTRhiVHugFtqrQRIL/GfrK6hE48eP5kIBvAgaePRyOidRooqT5TWEbvIOOOePs
         o5gjxcQDuhyn7FTZgF6du5UaMpX1JZtL7+qdOMMa/HlLGfDi+fcDv8/RH1NKceDwVtYH
         YZgNkElqrw5YTLvutqv/Fcg9qgaxzZNHAE9jecEATQnh06V8EIVPeDHkoVif3hkBJ7QP
         +hbg==
X-Gm-Message-State: AOAM530j0uC0bZ9Tv50eA8lE5beswJUZUFoG4u39JWNSeLe3qiS5k9wc
        JbJGuFuLI8l3n5sACYsUMYEOXJHA
X-Google-Smtp-Source: ABdhPJwNbPzK/e2EZ7PSdYQJR8d1j127RYUqkykt5Jch6sjbS0DeY0pulAvd4Ip693sAWTWc2PMx0g==
X-Received: by 2002:a50:c181:: with SMTP id m1mr3922416edf.27.1591821418917;
        Wed, 10 Jun 2020 13:36:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4870:48de:5f59:675a])
        by smtp.gmail.com with ESMTPSA id y26sm402073edv.91.2020.06.10.13.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:36:58 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] testsuite: plain chars are never compatible with [un]signed chars
Date:   Wed, 10 Jun 2020 22:36:54 +0200
Message-Id: <20200610203654.85136-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In standard C, plain chars are either signed or unsigned but are only
compatible with themselves, not with signed chars nor with unsigned ones.

However, Sparse has this wrong and make them compatible with the
corresponding sign-qualified chars.

So, add a testcase for this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/plain-char-compatibility.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 validation/plain-char-compatibility.c

diff --git a/validation/plain-char-compatibility.c b/validation/plain-char-compatibility.c
new file mode 100644
index 000000000000..cdfe1a31574f
--- /dev/null
+++ b/validation/plain-char-compatibility.c
@@ -0,0 +1,19 @@
+static int sfoo(void)
+{
+	return __builtin_types_compatible_p(char, signed char);
+}
+
+static int ufoo(void)
+{
+	return __builtin_types_compatible_p(char, unsigned char);
+}
+
+/*
+ * check-name: plain-char-compatibility
+ * check-command: test-linearize $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-pattern(2): ret.*\\$0
+ * check-output-excludes: ret.*\\$1
+ */
-- 
2.27.0


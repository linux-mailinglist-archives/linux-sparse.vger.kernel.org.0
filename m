Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20CA4119EEB
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbfLJW7f (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:35 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39239 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbfLJW7f (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:35 -0500
Received: by mail-wm1-f65.google.com with SMTP id d5so3454977wmb.4
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=64dP83aiGdqIfmCSM9FR/z4wEbzzr4BTP8YXJumpLig=;
        b=OqJlOYlXnLVH/SfZXJ1nmyvLwZNEyQ3noRsM0I9VdL6KjlekQc0p4dC2Z/SuY3y+ML
         b0Owyh9ZBmuGvOo/3Q3w1rzsXl/CzS4p/jjPUuDXaeHxQ0FCht6LsU1ZWqmz+fL4Q34h
         TQW3qWSxRfcAbTg+kdVe0mpChfrhJsr6h5+i0BfL5bA+FzSF0RQV1q1TjBmCZQDRbgQK
         4Tcggb6o9HMiLHf8BBKvCVUZUsI1k4vTEq3fQD4EGimFMtV6GX4m9WkyryONmo3GE6ar
         kvepWAjCeyq5k6ffUmuOFzplhZKyUku52A72ZasJrCVGvOv96QcBMwx54LgD4LJdBvWl
         EYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=64dP83aiGdqIfmCSM9FR/z4wEbzzr4BTP8YXJumpLig=;
        b=pL2rK6DRLo6AvfTMi2CG77qC1dNevmd0pUqh2xKRwStUvft73dv6+EdeiLRnKyogsV
         81vfdaNgkRHh1MLqxen/lk108W05sObbJ6dNKbPZxPAioyi/DBeMNtOzToLlAk5XJWxR
         gVIzj3PSdxB8vE/91u2MAb0aYZIEQMloY6SN3oxQHjPi2yQJxbQtneGYOlc6AqzRracH
         Hxu9lJsrkyoZjW0gkyZlEHYAnZbb2n+k+Bis4ai2y28pz5O7u5invA4i0LPtBTe0sZ7e
         ui1DTPuVYZrXQHttQKFAl8uiMkyGaOcha5hyj8qVb/zrmx7SvcCEdZklPO8KAL18SPMv
         3+oQ==
X-Gm-Message-State: APjAAAWMFw+ZPM0Q8yNzDoQEJWVbo5OidOBP465Y/oWmWzZ8NPBRN1WD
        dGmaw3NBjawqynJFX23ik92oW2zo
X-Google-Smtp-Source: APXvYqyzs84161sWuXRM+4G/kZPBBeicceybmf5cgRWeO9nphHDmj4t9aO/e4ZXLMnR1APRsSpHtyg==
X-Received: by 2002:a1c:960c:: with SMTP id y12mr7718029wmd.9.1576018773188;
        Tue, 10 Dec 2019 14:59:33 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:32 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 04/17] add testcase for addressability of 'complex' symbols
Date:   Tue, 10 Dec 2019 23:59:08 +0100
Message-Id: <20191210225921.94897-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Once a symbol has its address taken, a lot of simplifications
must be avoided because the symbol can now be modified via
a pointer.

This is currently done but the symbol addressability
does not take in account the fact that a symbol can be
accessed via one of its subfields.

Add a testcase to illustrate this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/eval/addressable-complex.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 validation/eval/addressable-complex.c

diff --git a/validation/eval/addressable-complex.c b/validation/eval/addressable-complex.c
new file mode 100644
index 000000000000..62ab59f04cf9
--- /dev/null
+++ b/validation/eval/addressable-complex.c
@@ -0,0 +1,24 @@
+extern void def(void *);
+
+struct s1 {
+	int a;
+};
+
+int use1(void)
+{
+	struct s1 s = { 3 };
+
+	def(&s.a);
+
+	return s.a;
+}
+
+/*
+ * check-name: eval/addressable-complex
+ * check-command: test-linearize -Wno-decl -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-contains: load\\.
+ * check-output-excludes: return\\..*\\$3
+ */
-- 
2.24.0


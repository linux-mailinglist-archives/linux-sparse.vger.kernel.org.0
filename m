Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120221A6998
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731398AbgDMQQQ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731396AbgDMQQP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:15 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7984DC008748
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:14 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z6so10556144wml.2
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oCT6Db327aV43ERimWtGoeM2TD4le+UCu/05AAthQ0A=;
        b=GdiCAtzZIg6Os2STbxZ/8eLCwaMZgaPBDIdAN3USJINUHyBupAiLLJrpbgCLpbmkR3
         nHNPso8XjA3HwXz7PeZypcmZUFZqiT4AHXAV8SnTCup8y+IMP7EZC2z+RacwmA2eP5K5
         BrU8IkfbLLYlrrxpjJFjPW8EDVxPqBplY7s0aK8+I/BGO0BX7hy23BIC1yUe5yxTts7y
         2K/X7WzX4Pe4yPMuqMPXVoXVa6E7kL2BuSWSOL3IYhDEfIH2f61NDT6+BF1n1R5YaS6w
         csGp08+F4oHLEisWABBANyF+7M1B5DtTmCsMexvaVYr+yCt4nMvWDVY7+mrY7LnBCsbe
         Nofg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oCT6Db327aV43ERimWtGoeM2TD4le+UCu/05AAthQ0A=;
        b=XchVYZ6GYRbxoH0SspfuzM4Oelm8E5ZT7xqStB+Q25GQmQIh9ePZGB3PGACaThwnaF
         9bYlp0CVD7soVSryy0OCuslQil3F3e716bWNmgN3Ao8Hrnx8YyEUnyo3xiRN8OaKKBBG
         HI0J4BHxz9dKsgl6UumYk3d+XmOWZ3fWCHnNh/EKfpHTddg77pAO1IKUXYyfG8n9s7c5
         EceKP6ej0rAr0Uc1OETpGg1MoesmOHvRTHqQ0DOL8Y9hMXGlvMeNU1cR0M9RqnxOqkk7
         akUu746QHCmES1pblSi1WOD2E3YH/OJh1SIKbueHV0xF9+KmTc6f9lhqHUzb4FzkoCXr
         DZYQ==
X-Gm-Message-State: AGi0PuY3u0rbxyAVUUqgo5yJM6usBVJaP8XmqZhy7AVRKkYqb5Ezbu9e
        gW9cZ1rpWdUSkdKTQNjfLr4GW4r7
X-Google-Smtp-Source: APiQypL2L86sCz/fT+Jh4k7sjIZlX7GUTdOZAAdy4+OJF+xEB/j32EvZW3wxgKP6cayPTjX6bsbT4w==
X-Received: by 2002:a05:600c:295a:: with SMTP id n26mr20995999wmd.16.1586794572581;
        Mon, 13 Apr 2020 09:16:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:12 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 02/17] bad-goto: add testcases for linearization of invalid labels
Date:   Mon, 13 Apr 2020 18:15:50 +0200
Message-Id: <20200413161605.95900-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A goto to a reserved or a undeclared label will generate
an IR with a branch to a non-existing BB. Bad.

Add a testcase for these.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/linear/invalid-labels0.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 validation/linear/invalid-labels0.c

diff --git a/validation/linear/invalid-labels0.c b/validation/linear/invalid-labels0.c
new file mode 100644
index 000000000000..ae3bf7283fb8
--- /dev/null
+++ b/validation/linear/invalid-labels0.c
@@ -0,0 +1,19 @@
+static void foo(void)
+{
+	goto return;
+}
+
+void bar(void)
+{
+	goto neverland;
+}
+
+/*
+ * check-name: invalid-labels0
+ * check-command: test-linearize -Wno-decl $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-excludes: END
+ * check-error-ignore
+ */
-- 
2.26.0


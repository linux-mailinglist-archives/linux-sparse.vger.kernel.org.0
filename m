Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFD11D8CA6
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgESA5j (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgESA5j (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:39 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E643AC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:38 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id h16so10185372eds.5
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=25yzhLWvxz/yH1+fv3njTP/UXT3HfEshnyM2FXL1BHs=;
        b=tP0U7t9OTqXiwhf6GQC6W6YdZsnityA2xVkMALtblo8KvPE+xLwFZ1QmV/qYNYNipx
         j6iE63nytJVnaANf0Wzr98yaDxUv00+9GUzt8iiHSsSknFhHG7Ntz6c8Cwr/kUb4FiN3
         FdoL/m66AWnTA/voiyiaKE7ifGETsWZJ3iYuXJFNQocN27h930LPMHtuVKSFl5BRKhmR
         nNUHH1TNtyfg+sWeB3QKbCkZZCo2rCuBaQCseTYG7rigHqw1CbJdX7x8R8VQSnv+/he6
         Hw3FBrNIojm1pxJ2I3eR/ba6EZjucbPz+rgjfyPPizZDSERsaL0+q1tjsYQ71YdstrRQ
         OZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=25yzhLWvxz/yH1+fv3njTP/UXT3HfEshnyM2FXL1BHs=;
        b=JAM6mxbZ/J0Ou9h6drTDhj28Wl0UQqXy6iCFlXluCV7d0yaL19MihHB0XFuhCUWH4r
         CAZccF7Cu/Pn39BNZ3TiD0CZMDLppOECCTpy/oQJWg3u1kBANvHYCMwURnghVUjQj4Fz
         53piCkbLwmH8SbW5xEukGwEzbboFQqMVrptaDgx3hCeBthWa0T1zpBMj0h3NH2vexFCO
         FgL11J7uH9WIfA9p9RtZLK48TVbxZSblmb8wxP6Y2GjrOWp1eboEG1t119/euGlkF/3K
         Zc+IQ24zdwMljJ4lpBkXN/HF4xYnlEBpYH0zy/GllmQx86Q2npkQ1+RFEPPDCHGU7FXu
         4lFA==
X-Gm-Message-State: AOAM530P08wKDzhaRB4VikZGU2lTe319HsKjKZbhOjvEdWFn6zImxFJx
        RYKEWPzz+n2P5Uqr3CUwmPRcdrmw
X-Google-Smtp-Source: ABdhPJz+RGMEuKBbllT2VygCD2/gHzjlxDK47mqk73kqrCKG4jDcE++o4sYHJes3iK0a6GFdvEvfyg==
X-Received: by 2002:a05:6402:b91:: with SMTP id cf17mr6121038edb.148.1589849857447;
        Mon, 18 May 2020 17:57:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:36 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 05/28] bad-goto: add testcases for linearization of invalid labels
Date:   Tue, 19 May 2020 02:57:05 +0200
Message-Id: <20200519005728.84594-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
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
2.26.2


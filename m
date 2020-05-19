Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2065F1D8CA5
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgESA5i (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgESA5i (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:38 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51C4C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:37 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id j21so5695984ejy.1
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=foW//wf9IF0Xw7y9Cab7uS/6ZVMzS+fKqZhOrjNYdmQ=;
        b=IJh/2F7BphIBhj56BEG8UhFHsGedmeg2oT0RMRGU86LFEH6o/Tfd7TNaWkSrBgnz/b
         XmrE2kgqW5xl7+VTE+/llSOUF6ISPfuHG6pMdOzy9ZfGjsW3mazmpUqbM433vkhEaarY
         Oh4FrkOz9ARH4f/uWDATm5zd7+A3T9kFQJMLo8ki1Wx2W5+kCsiOcQJXs4SRgdes49eb
         IolirhQC5idCj4RPVOdwRtCQn9ihslJrEi77gawD5Q8iHS02CWTvlpvkPKEiyUVp790G
         96h1+yRd+QKO0tiscOwLj10h5iGg1sOQqgSjlvD8AZxOPeIIRkMSv/aFIdDUhdn1+jht
         Djmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=foW//wf9IF0Xw7y9Cab7uS/6ZVMzS+fKqZhOrjNYdmQ=;
        b=gmTha3XSk18Exda+qQdHofaomrSVMVv+VYkws+bXospJNkm4PrFLFr/MUYD203ruon
         +dFWUBD46pUM1Jc2AgH+HsNY2AAS42zAK4tp8C+AJ5MJLlcH922FNx8yqbQbHwMmoqxz
         a+ydG3V5Re66ix4XrZFztaSRdWEiRzqFd87Ez29JKDsgf5RUwx5tSmEK34cnHb9fUW6s
         NWRDGU6thYChwysODLXcnzFqznRMiUGNCANQ1rimevqoIiub4ikhXg0tDGkVCgj1aC+6
         lHEmSUKpQXBPCk0POHPC84HM1AFckQ5fL2XPoT5a3t4DzlTp62Q7ZsnZfubnxeVzvJBj
         5DvQ==
X-Gm-Message-State: AOAM533I7/TAcqqh2FO7WywLnAfhRcfDimc71YhxW9i/ZSw0uU1Qc6D7
        ZlJHTWS7fiv0JfNo5NFfJeXhRFnw
X-Google-Smtp-Source: ABdhPJyTQMZK803sXdBfK2t4sBQ13JUKLEXjjeDPkd9M+1wkBe4ntkp/bvcWCq56mHjJYlzPYUnkiQ==
X-Received: by 2002:a17:906:cd08:: with SMTP id oz8mr16671267ejb.90.1589849856217;
        Mon, 18 May 2020 17:57:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:35 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 04/28] bad-goto: add testcase for 'jump inside discarded expression statement'
Date:   Tue, 19 May 2020 02:57:04 +0200
Message-Id: <20200519005728.84594-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
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
 validation/label-stmt-expr1.c           | 29 +++++++++++++++++++++++++
 validation/linear/goto-and-expr-stmt0.c | 28 ++++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 validation/label-stmt-expr1.c
 create mode 100644 validation/linear/goto-and-expr-stmt0.c

diff --git a/validation/label-stmt-expr1.c b/validation/label-stmt-expr1.c
new file mode 100644
index 000000000000..339217dcb999
--- /dev/null
+++ b/validation/label-stmt-expr1.c
@@ -0,0 +1,29 @@
+static int foo(void)
+{
+	goto l;
+	({
+l:
+		0;
+	});
+}
+
+static void bar(void)
+{
+	({
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
+label-stmt-expr1.c:3:9: error: label 'l' used outside statement expression
+label-stmt-expr1.c:5:1:    label 'l' defined here
+label-stmt-expr1.c:16:9: error: label 'l' used outside statement expression
+label-stmt-expr1.c:13:1:    label 'l' defined here
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
2.26.2


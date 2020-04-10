Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8901A4A04
	for <lists+linux-sparse@lfdr.de>; Fri, 10 Apr 2020 20:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgDJStb (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 10 Apr 2020 14:49:31 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43171 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgDJStb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 10 Apr 2020 14:49:31 -0400
Received: by mail-wr1-f68.google.com with SMTP id i10so3237807wrv.10
        for <linux-sparse@vger.kernel.org>; Fri, 10 Apr 2020 11:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oCT6Db327aV43ERimWtGoeM2TD4le+UCu/05AAthQ0A=;
        b=gwkmkEfjOGThLF2a+sQQKDLACjx3YBKYd4zswgBm+F6umW3LqhVVkPus8KO4mpU17S
         S2thlXtwLIRdKvAogROuiUkk0RMgRptol+QqyEJB3TnkCXEtoUkdPdwpXJPPbV0/Bhno
         xG0Ih2kYpOhqDTaeFcEb0hYSgYUfyjX7Stb4awwMHfndtNYbbZSXCelZTSkcBNJfmTRK
         59t/pCIMHlhsnAE6+ijryZVyXLejYQ/8s7JNehmnRsKkGJ0af5sTAjSPmClHJQiIgDNe
         sZUUaok7ePWUud85/i0FyYQPj0hnecEaFAqEJSvgKw+DFzOnzqZ1t0Mr+inv/2Llee99
         zh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oCT6Db327aV43ERimWtGoeM2TD4le+UCu/05AAthQ0A=;
        b=kE13c+ON7ed5tp1Vd5d669er2ZZL+1QHldkYkv/8l8SHL9gVMnP++VyqIAWjrPYKYR
         BsWqvJLSZxN4vYY9Ys4p8KI+23v+mbLxLuPBb6baC6D6tYzHffZQ09oBetEF3FWiCJJi
         Y2InMjj0iK8j9ijyUBRPbjbdd4UNEEUiSI2HhC6dgDG6ELKVruNuvbsBI5CklYqfo/pW
         FdNqnsMRbWj2qxuCYhdQF0UnCD1NN/aWbardG/dfzfqt9Ls7bm5x1Ua8YkdIobyV0uvW
         Qpm5Hy3RuClNK+OMk+sdbXm/rEU+H7ItCouQhAU7XjJistaZA9gBuAripRN6RpNgxe3c
         xSXg==
X-Gm-Message-State: AGi0PubniJHkV7vG9vDYOoIcBKgwLgiXJpLzD8ah6PdSVMQHipocSexZ
        VfdhTpNQR3uXtN8lG0CBK91PUla3
X-Google-Smtp-Source: APiQypIQQ2USw5D3plM3MlmhokF8rHLpHPbhB+CdlGCyxgzX/7PJq7MZVlfz5EyQU63dp0gtKa6aVw==
X-Received: by 2002:a5d:4290:: with SMTP id k16mr5730085wrq.406.1586544570083;
        Fri, 10 Apr 2020 11:49:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:957f:f707:be30:7cd4])
        by smtp.gmail.com with ESMTPSA id u16sm3935364wro.23.2020.04.10.11.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 11:49:29 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [SPARSE PATCH 2/5] add testcases for linearization of invalid labels
Date:   Fri, 10 Apr 2020 20:49:15 +0200
Message-Id: <20200410184918.64692-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
References: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
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


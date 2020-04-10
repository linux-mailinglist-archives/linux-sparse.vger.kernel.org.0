Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3E51A4A02
	for <lists+linux-sparse@lfdr.de>; Fri, 10 Apr 2020 20:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgDJSta (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 10 Apr 2020 14:49:30 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:32832 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgDJSta (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 10 Apr 2020 14:49:30 -0400
Received: by mail-wr1-f65.google.com with SMTP id a25so3302795wrd.0
        for <linux-sparse@vger.kernel.org>; Fri, 10 Apr 2020 11:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B6whp1a/u4bvYd6RHbb3sgUQxAKtxp6AckcVtEogT9k=;
        b=GHc/nJYhi1FSI8X3j+1GN5DM87E6BgtKSs6QRujHSWyT/AhL1yn69P9LFqAzOJyVQt
         ZFXiQyuqbhjl3pZdE/pHhWKe5i4JFgfSdAVFo0N6L2Y9BUDjL6KNDq/e1DywH8mEmIKU
         fezIdwkDdhNG36CBcgkyH1XI+BUOKDh5Z61QFeenM5Ws2kI+qa3z5x/Bc8nNUENSarhf
         EILhPLWri+0s3qp9VpBNbleybjcpkDdmt5VNcAACOEwGXz9jqIawg8ZKbN7mDqO7bbTt
         ktBa0ek3ADEWfatMJjyxuDhxL/esOc8C7J7bLUwEYHVZrCdh6KE4kP4PzR+5tJE/u0Jy
         RzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B6whp1a/u4bvYd6RHbb3sgUQxAKtxp6AckcVtEogT9k=;
        b=De6qwzzUxGrz2435dCFH+tSov5twWEHOetcs/xsiygSGYOzlSqhidiYyiRzaDtn+Bj
         bv9+CofTvynwrPpRKexNnhSNBxNar+ZfPn2UtD2b7KIUQpZSz3sFCjBL2PDFToQ29uV6
         L3auxxGs3KHRChFAR33OQgTvExIz0Gs42CwhmtqZHkrCNhqfqchLDHa0lcbiUyP8dPN+
         U14zCi5ah2IS6rY3f1S2YDBDsViAUhQPaAgqv/d7/s1L+MIkzgxIetNBX44rynTIdMuw
         DHoFrwKEs6rrO56OBLhk9IbG+yqpw4hV0T7OaZUttgTvLQDPL/3TPiMRwqv/FZOUnEtf
         LI0A==
X-Gm-Message-State: AGi0PuZ5UU+2d4EKRACGDlgNEs3YwVPk1LsodJr/g0ZmfG7xx9dy0JvU
        6WHRKBb6UqvL0S/7wUS6kmS3mR0P
X-Google-Smtp-Source: APiQypIi0YW7OxQVHNW8E4gUtnkmaoo2dPoGkr6EGAYEef99uo9OTK2oA8T857GezsKTC/py3TbQZw==
X-Received: by 2002:adf:e48c:: with SMTP id i12mr5805931wrm.173.1586544569072;
        Fri, 10 Apr 2020 11:49:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:957f:f707:be30:7cd4])
        by smtp.gmail.com with ESMTPSA id u16sm3935364wro.23.2020.04.10.11.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 11:49:28 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [SPARSE PATCH 1/5] add testcase for 'jump inside discarded expression statement'
Date:   Fri, 10 Apr 2020 20:49:14 +0200
Message-Id: <20200410184918.64692-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
References: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
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
 validation/linear/goto-and-expr-stmt0.c | 28 +++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 validation/linear/goto-and-expr-stmt0.c

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
2.26.0


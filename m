Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DCDF1A69A4
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731405AbgDMQQc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731408AbgDMQQ3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:29 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DB9C008749
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:27 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id h9so10719090wrc.8
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=thiKmPiSIjuaeObfJw2bqe/nfYtVJ0eUB2rcRlZSWKc=;
        b=XSDQLlSvrxzK9ZVO4kc72CND6f9E/mBH/qiJaAslsd+tTq3H20tRKJ7/oM4hGSc7P3
         4dT/OUi70AA1L4gHo3srTUtwYu2EwFB00y9ukVwUzAYmaiDBmLe9JM9RMJwwIncVyTu5
         6WjgbdRb6ofAIwMIOPghdeHsDosMoe/CLV6pW7eUY0GtKn3EIPBZ2+Ea6BwvBCOTnDwI
         4welmNnq2HjWxmQRTvf1pn/ELUovT7TlYh+n/wiSYyIaKCwOKcjrlWhh91ePNNtddrtP
         ZmzEv44RDYo5jESYq+HfwU32OORGjLadUnMtF+eNTsA4RFCJUxvS83OCEReX5zwhUQoI
         iDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=thiKmPiSIjuaeObfJw2bqe/nfYtVJ0eUB2rcRlZSWKc=;
        b=a4gPhzSQzJtYOpwkb3vNvpKfjM7tJRMFx+n97wSU8GHwC6h1sj/Cj2cTap3Kt1qqIN
         KyFU0W+oRAF7P2ApBBfkIG/nLGTr9RW2lGx6lHCmvza+ffihET8+1wpLgfYUJ5nVg6mW
         1oBUBf3YQQoUnb0+kSp8MItRsQ7Cxm2Ip1Q4/zEyAHNbS3mVA5FPddHiU86KyNKo0AB0
         MKiNRkCi+wsQ1z4H+DcoGB0hePPwkrNkGZoiuySnQE3kj/Zx5AVGPUzNQPcVZc3+erDP
         fGIi1J27FAir/TJZuOFT5dSK+DKUQFZT6zAQ+Rn9RtHtZE4kxKgW8JfFGxxaxOf3oDTK
         G3nw==
X-Gm-Message-State: AGi0PuagNNuex5JHgdgsI0VZOOk6100JEKrEkaoxzqjBGOK43YYXIDDO
        6/hYYFeqAHeMnMKTdWzykQFCw4MG
X-Google-Smtp-Source: APiQypJ6WfefaaNiaHwN1S6x6RPu2OFNv07M968uFYTIHP6v9y2Kt53+6Q1/wNVyw1zhmner8+Dq0Q==
X-Received: by 2002:adf:f881:: with SMTP id u1mr13990531wrp.348.1586794586289;
        Mon, 13 Apr 2020 09:16:26 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:25 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 16/17] bad-goto: catch gotos inside expression statements
Date:   Mon, 13 Apr 2020 18:16:04 +0200
Message-Id: <20200413161605.95900-17-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's not allowed to do a goto into an expression statement.
For exemple, it's not well defined what should happen if such
an expression is not evaluated because unnneded and optimized
away at expand time.

For such situations GCC issues an error, clang doesn't and
produces a valid IR. Spare produces an invalid IR with branches
to unexisting BBs.

Fix this by:
*) detecting this situation at evaluation time
*) issue an error
*) mark the function to not be linearized.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                              | 9 +++++++++
 validation/label-stmt-expr1.c           | 1 -
 validation/linear/goto-and-expr-stmt0.c | 9 +++++++--
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 99a9ee72d11f..2b845a301d6b 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -42,6 +42,7 @@
 #include "symbol.h"
 #include "target.h"
 #include "expression.h"
+#include "scope.h"
 
 struct symbol *current_fn;
 
@@ -3751,6 +3752,14 @@ static void evaluate_goto_statement(struct statement *stmt)
 		sparse_error(stmt->pos, "label '%s' was not declared", show_ident(label->ident));
 		current_fn->bogus_linear = 1;
 	}
+	if (label->namespace == NS_LABEL && label->stmt) {
+		if (is_in_scope(label->label_scope, stmt->goto_scope))
+			return;
+		sparse_error(stmt->pos, "goto into statement expression");
+		info(label->stmt->pos,"   label '%s' is defined here",
+					show_ident(label->ident));
+		current_fn->bogus_linear = 1;
+	}
 	if (label->namespace == NS_NONE)
 		current_fn->bogus_linear = 1;
 }
diff --git a/validation/label-stmt-expr1.c b/validation/label-stmt-expr1.c
index 47ba54ae7305..f4f178c9d951 100644
--- a/validation/label-stmt-expr1.c
+++ b/validation/label-stmt-expr1.c
@@ -19,7 +19,6 @@ l:
 
 /*
  * check-name: label-stmt-expr1
- * check-known-to-fail
  *
  * check-error-start
 label-stmt-expr1.c:3:9: error: goto into statement expression
diff --git a/validation/linear/goto-and-expr-stmt0.c b/validation/linear/goto-and-expr-stmt0.c
index 548813531779..c6b6621a6a81 100644
--- a/validation/linear/goto-and-expr-stmt0.c
+++ b/validation/linear/goto-and-expr-stmt0.c
@@ -20,9 +20,14 @@ a:
 /*
  * check-name: goto-and-expr-stmt0
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-excludes: END
- * check-error-ignore
+ *
+ * check-error-start
+linear/goto-and-expr-stmt0.c:3:9: error: goto into statement expression
+linear/goto-and-expr-stmt0.c:5:1:    label 'inside' is defined here
+linear/goto-and-expr-stmt0.c:17:9: error: goto into statement expression
+linear/goto-and-expr-stmt0.c:14:1:    label 'a' is defined here
+ * check-error-end
  */
-- 
2.26.0


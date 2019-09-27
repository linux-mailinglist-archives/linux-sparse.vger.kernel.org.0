Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F83BC0EA8
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbfI0Xnd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:33 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:35802 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728519AbfI0Xnc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:32 -0400
Received: by mail-ed1-f67.google.com with SMTP id v8so3751843eds.2
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S1mmSASL+TWtdhYmO0Uno4xpJaj86uEFyNPETeHL3Cs=;
        b=IHO5r4QNFh3pKfjEEIgPFZW6Iqun9D1Njlxsp0a9shAkIAghvsyJAAvZuGvbnyiVWF
         coGF4R/XRXRqkJ/HugFpFuzw0iGQFDi/Qf0dA3AawvYdyf+dIlHuO3B+dr5WVVKtCCZg
         890uSIQMEX7hN3HY+JoRlYcECSTaOUyieo9iKd+Bpu2DdKFMu6xomsqaILwrIoHiRUEH
         zUEYuH8EIJgjFT7lGA/LCU5sfYLOumQ5hk3cq6Y3JX4pi13yRYVzteO2xIeLC8ACgWKu
         kUDLo2hiuQgEU2l/6p7LGDIWSRZd3nF/0gyQmqr33WBI243gRLxEJGfoxEIzyveYfFdU
         jyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S1mmSASL+TWtdhYmO0Uno4xpJaj86uEFyNPETeHL3Cs=;
        b=hno/a1daLiCaAuE5LJpficHwq4c6zCFhSZuOrM8TfnkKmSHZQv/vNyNs3a/otW/nAx
         d98OUY3QOTWaPIe6Eu8ZEnzi6kxPOlzeHZsN71JowSKa3t/oo+7ppM2YjHoNNZrPjEP1
         5eVfvatHs4SuNvVXSIzVUnqrxqt3YLREjWx6KxptVhfibdOoqo5hI9ZS0rwRw6FAW1A7
         Xjrot0avfAVEVZZPBWCZzMdUgb9pR/2ozjwrfI84u6hin1puj81ZG/C4po/6jzYDjRLC
         D/qaQH/2zrEBUPa526EIcsAO8TQtffBV7o/poliW/VcqTlW+PRsVcPXgRlmmSrGtjHWa
         L/Ng==
X-Gm-Message-State: APjAAAWYxSyFlOZI03NvGAYYwQ5wzQ7nrfq2e/0xxv2Hb0cE1tHw5rCg
        PNoL5jfum6h6qjCfaw8w/y4fFUki
X-Google-Smtp-Source: APXvYqyVh13byIIB9Cr5ymsji/S5qZP84fOLu1HFehx+j8a5gb1Jq9CuGHer7vtBsw7oAKCILoHvBA==
X-Received: by 2002:aa7:c614:: with SMTP id h20mr7258430edq.209.1569627808715;
        Fri, 27 Sep 2019 16:43:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:28 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 04/18] expand: add missing expansion of compound literals
Date:   Sat, 28 Sep 2019 01:43:08 +0200
Message-Id: <20190927234322.5157-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Compound literals, like all other expressions, need to be be
expanded before linearization, but this is currently not done.
As consequence, some builtins are unexpectedly still present,
same for EXPR_TYPEs, ... with error messages like:
	warning: unknown expression
at linearization.

Fix this by adding the missing expansion of compound literals.

Note: as explained in the code itself, it's not totally clear
      how compound literals can be identified after evaluation.
      The code here consider all anonymous symbols with an
      initializer as being a compound literal.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                             | 1 +
 expand.c                               | 8 ++++++++
 validation/expand/compound-literal.c   | 1 -
 validation/linear/compound-literal02.c | 1 -
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index f6dfcced7..70d76523e 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -2935,6 +2935,7 @@ static struct symbol *evaluate_cast(struct expression *expr)
 	 * initializer, in which case we need to pass
 	 * the type value down to that initializer rather
 	 * than trying to evaluate it as an expression
+	 * (cfr. compound literals: C99 & C11 6.5.2.5).
 	 *
 	 * A more complex case is when the initializer is
 	 * dereferenced as part of a post-fix expression.
diff --git a/expand.c b/expand.c
index e8e50b080..aba20b8cf 100644
--- a/expand.c
+++ b/expand.c
@@ -61,6 +61,14 @@ static int expand_symbol_expression(struct expression *expr)
 		expr->taint = 0;
 		return 0;
 	}
+
+	// expand compound literals (C99 & C11 6.5.2.5)
+	// FIXME: is this the correct way to identify them?
+	//	All compound literals are anonymous but is
+	//	the reverse true?
+	if (sym->initializer && !expr->symbol_name)
+		return expand_expression(sym->initializer);
+
 	/* The cost of a symbol expression is lower for on-stack symbols */
 	return (sym->ctype.modifiers & (MOD_STATIC | MOD_EXTERN)) ? 2 : 1;
 }
diff --git a/validation/expand/compound-literal.c b/validation/expand/compound-literal.c
index 7401b0191..034164bca 100644
--- a/validation/expand/compound-literal.c
+++ b/validation/expand/compound-literal.c
@@ -13,7 +13,6 @@ static void foo(struct s *p)
 /*
  * check-name: compound-literal
  * check-command: test-linearize $file
- * check-known-to-fail
  *
  * check-output-start
 foo:
diff --git a/validation/linear/compound-literal02.c b/validation/linear/compound-literal02.c
index 87b98d76b..6ed5809eb 100644
--- a/validation/linear/compound-literal02.c
+++ b/validation/linear/compound-literal02.c
@@ -13,7 +13,6 @@ int bar(void)
  * check-name: compound-literal02.c
  * check-command: test-linearize -Wno-decl $file
  *
- * check-known-to-fail
  * check-output-ignore
  * check-output-contains: ret\\..*\\$6
  */
-- 
2.23.0


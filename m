Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17031BE872
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 00:49:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbfIYWtY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 18:49:24 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34924 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729706AbfIYWtY (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 18:49:24 -0400
Received: by mail-ed1-f67.google.com with SMTP id v8so233911eds.2
        for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2019 15:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y5OsfRxFFwSoHN4V1gW0w6VqgjSEozZWDna8QzUOi1Y=;
        b=BjdEnGIkql4XTLTvOUyr6Wpqz1f5FabJXuuBaV90wwqDdpGlzB3CBRuaVbkS/v0KrE
         s9UWJDEeRGmvrBu6v5gtf8WYkX+ihpYZnqeltGtyMinK7qFy5sWjBhqwuufldQZVq9l2
         3D51B2ZtXSJ+G6x/10EF4LKhRIR1UxjPjIYyGzkLeCrPQyWQLIQ1YIdkXnfEg4lIoE/h
         rCe1KXBNNlus2qlVXBtyvVGX/VTWEJtnqLeEOo+bzQdzbMjtwOSmZbwBws+koFZ5AxkF
         fcPlqgxJFpvoyIZpr/beMe3envfZimYHZidIP8wDHIcosYR2oHbrl7quwmDw7nKePh0/
         mKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y5OsfRxFFwSoHN4V1gW0w6VqgjSEozZWDna8QzUOi1Y=;
        b=lkWmyHT0p6NXWMM0Xt0Yzu9gu1xyfZSqfJrXkt3tgU6VXUJnhtfhY1hfaekW2yVplU
         YIsYypSxXIIggdavPeF9E/83fPhIwcggWgu3WjMidaUZ2guP7ik2uKDQ59s/Vcq424Zy
         6RYjGcD6Kw5PYOoHzHZE9VfqPfa+ve3+KJxlEosbero0RrgNPDVUiAASULwhQuKtn5UG
         lFlSydVOlB1WLbhi7qZYk7pil4VydheVB5fP8SwSFCX7QW4i+2l7RhYj9rfH9OmRfA1/
         ZlmdUKl7wyLNsUzx/86FWDrJX4PE0biWP/vMXbcSFTpId/ZzrH+S/H1m5o7ReFwvw3OS
         U3KQ==
X-Gm-Message-State: APjAAAVrK/Or70fEbofnQPuBaKUAujdb7ZzOL2eGxSktwDAqVWl30Jn2
        nb8MDNeRa1zJaRZ4Kn/8oC6mBCXd
X-Google-Smtp-Source: APXvYqy0ZonilTUH/ekoLvWa9+BLbsl5S/mc+/jOWHdR6eZi+gfOSSX7f2g6eSpzgD925w1Uln4z4w==
X-Received: by 2002:a17:906:41a:: with SMTP id d26mr492018eja.17.1569451762101;
        Wed, 25 Sep 2019 15:49:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:553b:deac:4ba3:2b98])
        by smtp.gmail.com with ESMTPSA id jp14sm17057ejb.60.2019.09.25.15.49.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:49:21 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Oliver Hartkopp <socketcan@hartkopp.net>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Steve French <smfrench@gmail.com>,
        Nicolai Stange <nicstange@gmail.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] constexpr: relax constexprness of constant conditionals
Date:   Thu, 26 Sep 2019 00:49:13 +0200
Message-Id: <20190925224913.6056-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190807105042.GK1974@kadam>
References: <20190807105042.GK1974@kadam>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, sparse emits a warning when a conditional expression with a
constant condition is used where an "Integer Constant Expression" is
expected and only the false-side operand (which is not evaluated) is
not constant. The standard are especially unclear about this situation.

However, GCC silently accept those as ICEs when they evaluate to a compile-time
known value (in other words, when the conditional and the corresponding
true/false sub-expression are themselves constant). The standard are
especially unclear about the situation when the unevaluated side is non-constant.

So, relax sparse to match GCC's behaviour.

Reported-by: Oliver Hartkopp <socketcan@hartkopp.net>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                       | 28 +++++++++++++++-------------
 validation/constexpr-constcond.c | 10 ++++++++++
 validation/ioc-typecheck.c       |  4 ----
 3 files changed, 25 insertions(+), 17 deletions(-)
 create mode 100644 validation/constexpr-constcond.c

diff --git a/evaluate.c b/evaluate.c
index 3268333ab..d52fd9f99 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -1178,20 +1178,22 @@ static struct symbol *evaluate_conditional_expression(struct expression *expr)
 	expr->flags = (expr->conditional->flags & (*cond)->flags &
 			expr->cond_false->flags & ~CEF_CONST_MASK);
 	/*
-	 * A conditional operator yields a particular constant
-	 * expression type only if all of its three subexpressions are
-	 * of that type [6.6(6), 6.6(8)].
-	 * As an extension, relax this restriction by allowing any
-	 * constant expression type for the condition expression.
-	 *
-	 * A conditional operator never yields an address constant
-	 * [6.6(9)].
-	 * However, as an extension, if the condition is any constant
-	 * expression, and the true and false expressions are both
-	 * address constants, mark the result as an address constant.
+	 * In the standard, it is defined that an integer constant expression
+	 * shall only have operands that are themselves constant [6.6(6)].
+	 * While this definition is very clear for expressions that need all
+	 * their operands to be evaluated, for conditional expressions with a
+	 * constant condition things are much less obvious.
+	 * So, as an extension, do the same as GCC seems to do:
+	 *	Consider a conditional expression with a constant condition
+	 *	as having the same constantness as the argument corresponding
+	 *	to the truth value (including in the case of address constants
+	 *	which are defined more stricly [6.6(9)]).
 	 */
-	if (expr->conditional->flags & (CEF_ACE | CEF_ADDR))
-		expr->flags = (*cond)->flags & expr->cond_false->flags & ~CEF_CONST_MASK;
+	if (expr->conditional->flags & (CEF_ACE | CEF_ADDR)) {
+		int is_true = expr_truth_value(expr->conditional);
+		struct expression *arg = is_true ? *cond : expr->cond_false;
+		expr->flags = arg->flags & ~CEF_CONST_MASK;
+	}
 
 	lclass = classify_type(ltype, &ltype);
 	rclass = classify_type(rtype, &rtype);
diff --git a/validation/constexpr-constcond.c b/validation/constexpr-constcond.c
new file mode 100644
index 000000000..d98da3dc4
--- /dev/null
+++ b/validation/constexpr-constcond.c
@@ -0,0 +1,10 @@
+extern int var;
+
+static int a[] = {
+	[0 ? var : 1] = 0,
+	[1 ? 2 : var] = 0,
+};
+
+/*
+ * check-name: constexprness in constant conditionals
+ */
diff --git a/validation/ioc-typecheck.c b/validation/ioc-typecheck.c
index 34b37d310..7780773bc 100644
--- a/validation/ioc-typecheck.c
+++ b/validation/ioc-typecheck.c
@@ -4,8 +4,4 @@ static unsigned iocnrs[] = {
 };
 /*
  * check-name: integer constant & conditional expression
- * check-known-to-fail
- *
- * check-error-start
- * check-error-end
  */
-- 
2.23.0


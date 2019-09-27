Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC6F6C0EB5
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfI0Xnm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:42 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46377 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728526AbfI0Xnl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:41 -0400
Received: by mail-ed1-f65.google.com with SMTP id t3so3695792edw.13
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZjyMZuwrBy4r/LWYnbd1FBAyoOnRAHv6EWO7rzdfMR0=;
        b=eGthPUNlIkeWqgvyG0kOD2vSxoVlIsYxobZyYbkqjcDZuCT33cEFE06knkXWhk8D8k
         ixYo7BHJw86IJQGMXq0n8FQ57z0wB+2bsO7Pdu32XFre9xJkLNgN20t94I5o1oGzBt7r
         dkr9IfptE39UCOSlljYY3C2+00ZIUKiYzhMgcsCKXkWMviIZ7bvW/7H+XD6f79XeVaLg
         9Xg+mufsC1kxn9efP8yihBC9ihvlKlmbXQMAfjfm31oGRHZVr1qRnCwR5XT44y3hTVFn
         Bp2HEkB+uauyZvMspl3JrxpqqKa5akMUGj9JmKlG9wtmbrLoTzq8RyN8+nppcghy78Ty
         ItiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZjyMZuwrBy4r/LWYnbd1FBAyoOnRAHv6EWO7rzdfMR0=;
        b=KjONXTzAv368ACCTEfgwXCH8qxcMvWYLgYMEdC+e9MnAgq5Qc1LGp0QZnVym9EWYTQ
         iq0XayGY9rutBfzJcIHBW+yhvKgkUQc80uBsgk6AxsGMGfBcyiEJtORYVy09r1PL298S
         ciK25Sbf/9xrZ01jE0KkT/djxpA3Drn0hXnXgmYgUPD/uhYFQwxLWe5jDibJN5NJmKEt
         zE0bJAh21ZeSazKXiO6ozQ3OR3gtwHrmzZxyoEgTzQOk49tZ4tStZeEvJJJ5ik4OOF41
         A/1HtnkPKO/D/mHPL/rfSCB2nBpIEuJghgzHUKIeqUempcICUyGbGV5/kV3Gu8tPHrWu
         5AQA==
X-Gm-Message-State: APjAAAVYNs3b3WnonsmkF88dNvBdPDFiFj/plQCfHQFSFRPiLcCXIKTb
        NHamnzVWm2L7eo/BB3exPc5MIxwd
X-Google-Smtp-Source: APXvYqw5vXNRkcmagIiLuZswURb8tciATOUJgzXnDEIBEyk6iKCd/9o/1Oj5E1IzB638cyAHrTlA3w==
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr7359368edi.75.1569627818383;
        Fri, 27 Sep 2019 16:43:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:37 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 17/18] asm: fix missing expansion of asm statements
Date:   Sat, 28 Sep 2019 01:43:21 +0200
Message-Id: <20190927234322.5157-20-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The operands of extended ASM need to be expanded, exactly
like any other expression. For example, without this expansion
expressions with __builtin_compatible_types_p() can't be
linearized and will issue a 'warning unknown expression".

So, add the missing expansion of ASM operands.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expand.c                 | 18 +++++++++++++++++-
 validation/expand/asm0.c |  1 -
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/expand.c b/expand.c
index 487a44943..ac6686e45 100644
--- a/expand.c
+++ b/expand.c
@@ -1160,6 +1160,22 @@ static int expand_if_statement(struct statement *stmt)
 	return SIDE_EFFECTS;
 }
 
+static int expand_asm_statement(struct statement *stmt)
+{
+	struct asm_operand *op;
+	int cost = 0;
+
+	FOR_EACH_PTR(stmt->asm_outputs, op) {
+		cost += expand_expression(op->expr);
+	} END_FOR_EACH_PTR(op);
+
+	FOR_EACH_PTR(stmt->asm_inputs, op) {
+		cost += expand_expression(op->expr);
+	} END_FOR_EACH_PTR(op);
+
+	return cost;
+}
+
 /*
  * Expanding a compound statement is really just
  * about adding up the costs of each individual
@@ -1250,7 +1266,7 @@ static int expand_statement(struct statement *stmt)
 	case STMT_NONE:
 		break;
 	case STMT_ASM:
-		/* FIXME! Do the asm parameter evaluation! */
+		expand_asm_statement(stmt);
 		break;
 	case STMT_CONTEXT:
 		expand_expression(stmt->expression);
diff --git a/validation/expand/asm0.c b/validation/expand/asm0.c
index 0664b6224..568a4d198 100644
--- a/validation/expand/asm0.c
+++ b/validation/expand/asm0.c
@@ -7,7 +7,6 @@ static void foo(void)
 /*
  * check-name: expand-asm0
  * check-command: test-linearize $file
- * check-known-to-fail
  *
  * check-output-start
 foo:
-- 
2.23.0


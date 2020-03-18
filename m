Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB1618A195
	for <lists+linux-sparse@lfdr.de>; Wed, 18 Mar 2020 18:31:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgCRRbd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 18 Mar 2020 13:31:33 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55916 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgCRRbc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 18 Mar 2020 13:31:32 -0400
Received: by mail-wm1-f66.google.com with SMTP id 6so4371126wmi.5
        for <linux-sparse@vger.kernel.org>; Wed, 18 Mar 2020 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5X4qd+SLyN5QmOeHsqGfLnUDjVac6191xRqpIk6Hops=;
        b=pXJtOuH3CNNeaz4nDIUGce9cx2VnO2nCfiGTrO4gBzqk9YTtHzoWYathxe26aJoiqR
         NBTWZ3UZZzFltScvhjldT3mg1Eu0/dNCN4WeF3LModvF5HD9hWU5Gf9hhTrPQ8v+eNLB
         Mpv/Cs633C1N/8lBfrYt50cNG9Ym1fOT8BtVF6BNRcc08DAa/E+j/pZvq2n+25d01gOs
         nVn5XQrZkTW0YQKCyDj1cy4zoKI1a/A4UAUp4wjJQQRVoTMxXmqY6Im1eMv8ZYW9qJOh
         wlYIN/jVZ6n5AA9/6uHKtN3XYtIiZAxUsnS/GB+vHMx3P/vRPMuBhnDMwWhVD9pGWpSo
         FnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5X4qd+SLyN5QmOeHsqGfLnUDjVac6191xRqpIk6Hops=;
        b=YqKBWVlUuUNPOKDx+Al73iLG+nMejHgTq7QSk4Xw9k7QzoPG2lgmS4Ffmo+sVC/QYo
         PpZFSxz8dodRiAZgCxyebvB2fp1o9pFC45JW9l1O/0db7oCFTzlFQFZ7EQuh8fMn37tc
         z3WkK3EVeXv7IpqyeNOH8G4as8OkmJnHlLKk597IEagPBhPmmm7ExnJN7WjsQ5tUz+QC
         YJWNQICCdGvXQmFElRrg3mYksO7dS6ScY6muolOV7AZl3f4VmYeEG1X7FKbSiS7UWunX
         BDB7Frnobcsown8V3cR2v5qYP1PVUA6cbFbpZLNZj00SplzugicfzT7k6I/t7FBZ7p9N
         hX7g==
X-Gm-Message-State: ANhLgQ1InymA/EHsZT9Zl4QzRxzFqmzX2HE+kY5l9PXKEU74ht7DBp0w
        ZtaMoG7rVwKDxT3ARgPpBcTXtvWH
X-Google-Smtp-Source: ADFU+vtTCmXKzXlXy3ncg10ErCpePfyOhTPz86++57t1W/xsvSBqflPZTSQqavo5uwd2at9ixBeelA==
X-Received: by 2002:a1c:8097:: with SMTP id b145mr6608308wmd.159.1584552688929;
        Wed, 18 Mar 2020 10:31:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:81ce:3038:2a0a:bf02])
        by smtp.gmail.com with ESMTPSA id u17sm10268051wrm.43.2020.03.18.10.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 10:31:28 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/5] teach sparse to linearize __builtin_unreachable()
Date:   Wed, 18 Mar 2020 18:31:20 +0100
Message-Id: <20200318173120.63939-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
References: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

__builtin_unreachable() is one of the builtin that shouldn't
be ignored at IR level since it directly impact the CFG.

So, add the infrastructure put in place in the previous patch
to generate the OP_UNREACH instruction instead of generating
a call to a non-existing function "__builtin_unreachable()".

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c                              | 7 +++++++
 validation/context-unreachable.c         | 1 -
 validation/linear/builtin_unreachable0.c | 1 -
 validation/linear/builtin_unreachable1.c | 1 -
 4 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/linearize.c b/linearize.c
index 25d6327bf6f1..615636ed1f83 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2536,12 +2536,19 @@ struct entrypoint *linearize_symbol(struct symbol *sym)
  * Builtin functions
  */
 
+static pseudo_t linearize_unreachable(struct entrypoint *ep, struct expression *exp)
+{
+	add_unreachable(ep);
+	return VOID;
+}
+
 static struct sym_init {
 	const char *name;
 	pseudo_t (*linearize)(struct entrypoint *, struct expression*);
 	struct symbol_op op;
 } builtins_table[] = {
 	// must be declared in builtin.c:declare_builtins[]
+	{ "__builtin_unreachable", linearize_unreachable },
 	{ }
 };
 
diff --git a/validation/context-unreachable.c b/validation/context-unreachable.c
index 3e330403ce01..8664962ea088 100644
--- a/validation/context-unreachable.c
+++ b/validation/context-unreachable.c
@@ -12,5 +12,4 @@ static void foo(void)
 
 /*
  * check-name: context-unreachable
- * check-known-to-fail
  */
diff --git a/validation/linear/builtin_unreachable0.c b/validation/linear/builtin_unreachable0.c
index 5da9d074ae5f..fb59a3408987 100644
--- a/validation/linear/builtin_unreachable0.c
+++ b/validation/linear/builtin_unreachable0.c
@@ -10,7 +10,6 @@ int foo(int p)
 /*
  * check-name: builtin_unreachable0
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-start
 foo:
diff --git a/validation/linear/builtin_unreachable1.c b/validation/linear/builtin_unreachable1.c
index 280f853d8a07..a83da079a3c9 100644
--- a/validation/linear/builtin_unreachable1.c
+++ b/validation/linear/builtin_unreachable1.c
@@ -12,7 +12,6 @@ int foo(int c)
  * check-name: builtin_unreachable1
  * check-command: test-linearize -Wno-decl $file
  *
- * check-known-to-fail
  * check-output-start
 foo:
 .L0:
-- 
2.25.1


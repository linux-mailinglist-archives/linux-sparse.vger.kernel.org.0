Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A108AC0EA6
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbfI0Xnb (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:31 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:37994 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbfI0Xnb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:31 -0400
Received: by mail-ed1-f67.google.com with SMTP id l21so3731230edr.5
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DPwVNx+lPXox5W7VTjOmZAerlpPa/X711BI9OahrWUY=;
        b=cVYtARNZe+l5qcQq/o7F3qXkNKyctdkuffUUelYBYvdmXFHKeKXbP1K8DzRPoo05OE
         BZ5VFsUkUYjdsqgLBiNm939WRNHB6/BM+gzLgDWwA+mbOzc+Zqw353MPdBMLf1QaV9X3
         uQe+N75F9SJHT+r1ZCw96GaYOQS+T+9LEC5xGAOTRBAadnrBR4j1VsoR9ewdLX4+2NPg
         Et17hwEP5iT6W1fPPA5w00BKDrwnO/MBKIq5ZVYpBWLJVt051NUhB8vzvApoNFc+Hb3k
         IzkNBKE6gpCaTL7h0ELEIeydgYLhBf2mbC0UzjKkdLLTNTgrtT3N0Ryvx/bpDGAr0ttY
         JPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DPwVNx+lPXox5W7VTjOmZAerlpPa/X711BI9OahrWUY=;
        b=e3J00C0sUNEx4MSfEmc3WdqiQV9MCfw8VLhW2MnxsvDyanwxnrxesxUOmSFWjna/RP
         PEGHp6TGMO5YLFDLgiack4aXCgcked9tn8pnMUdJAz3Hsotosjm7mgzCn+kviZWot0w/
         8WvCnr4rIgOPJMRsGMwz5wFtpiGZbJgIV17LBjn4t5UIgT15dNvxvfE8TbRbJ7neUUo5
         /s/QJkd9iLkdO/gXivuC0LB7EVUFRNujwdYjqbGibNL8n6IUXJ8Uing5PhizI+N6Xb2+
         Q8t3KMGoS26XsD/yYhTiJTjMvUj3rbhVq6eXGTgXhklDSbrn9bJLgEzIFaG2XeWY4D1t
         uCYQ==
X-Gm-Message-State: APjAAAUzhuLB2GDUSf/9llH0pUSTaWP0KczqWWUH+hygk1wJcUs30otN
        +a8pUT9Iobm1Na0rRDmQ6N/0k8/z
X-Google-Smtp-Source: APXvYqzmjFfLCfsJdSR1wg2vdlztydpIRjMRxcPwbrh20R8hF6g4TPRKOGvHpss+OOAja7gdyOVv/Q==
X-Received: by 2002:a50:9625:: with SMTP id y34mr7350388eda.72.1569627809392;
        Fri, 27 Sep 2019 16:43:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:28 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 05/18] dissect: fix processing of ASM statements
Date:   Sat, 28 Sep 2019 01:43:09 +0200
Message-Id: <20190927234322.5157-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Before commit 756731e9 ("use a specific struct for asm operands"),
ASM operands ('name', 'constraint, 'expression') were stored as a
sequence of 3 expressions. After, they had their own expression
type: EXPR_ASM_OPERAND.

However, dissect.c:do_asm_xputs() was not adapated for this change.

Fix this in do_asm_xputs() by processing the 'expression' of
every entries (instead of only processing every third entries).

CC: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 dissect.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/dissect.c b/dissect.c
index 5f067eb4c..b50c268b9 100644
--- a/dissect.c
+++ b/dissect.c
@@ -452,11 +452,7 @@ again:
 
 static void do_asm_xputs(usage_t mode, struct expression_list *xputs)
 {
-	int nr = 0;
-
-	DO_LIST(xputs, expr,
-		if (++nr % 3 == 0)
-			do_expression(U_W_AOF | mode, expr));
+	DO_LIST(xputs, op, do_expression(U_W_AOF | mode, op->expr));
 }
 
 static struct symbol *do_statement(usage_t mode, struct statement *stmt)
-- 
2.23.0


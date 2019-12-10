Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C35A119EF6
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfLJW7t (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:49 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36726 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfLJW7s (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:48 -0500
Received: by mail-wr1-f65.google.com with SMTP id z3so21991865wru.3
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DFUyKwET9lwtSSv7M8XNv8rx6z+WBjnnOhRZq+THPkI=;
        b=DGek/RHXssskA2rZlKAaPeHw78SG1GnF77dAfG4y0UbjJh0By8cjVY4gNi26cDzFFj
         fNzenDq8SSH8sh8jYskdFYiRDwv9RewqiFpdv4/kqkTxh/n9GtDTZAvM7SAA+WV9aVEx
         z0jkcbTofDwEjhZtVf/ob9VDDyhlNopyFO+w8/JVsXMR/qufPwdXDEUvqmUTadnWDeVu
         I8j11jh4NZR/9/+oz0QmneJy9wrvuUcRRrJI0IL6A7utXYusz+88FVK/eYhhdyhTSLOB
         QZwFNIEYzYBkMXw84lp4nb/ZhMhUIiXBxlQDrT+Q5Vuj2SD1++Om28NWj+XSDChnONpe
         a0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DFUyKwET9lwtSSv7M8XNv8rx6z+WBjnnOhRZq+THPkI=;
        b=gHabg/MkENnu9TPK+6/laBzx223DymCDRXEWaH1WR56mfxR3hlgLKuFT7NvMuTY/P+
         pKQdnf+tQ5X5D5TFCncd3NXKUt6jhb2/SXkFRLPvXM+69QQ4C5LCw6Yt0JmHhNoHt70s
         zwGkojbd7WkSDUweEsSHCqKMnfU4chGpr+b+8a36ROsuX5fcN7by8IvDqCQMi5YE0jkY
         D0P85iMoMrxAZYP0kmvt2LIBXIdw8RKRa4CE5EtEPbo/1FNZI+p4/pdXwiU/z1jtzDnX
         Jul9pfL1Dw3tCgIZq3u8ilGfNuweazCuUPhmOHWuukTCD9gOzqh+BH25E5fyHOhyJuob
         I3+Q==
X-Gm-Message-State: APjAAAVrAUH4E6KVm4EQgXKz0TlEk9+jCeYJQOR3w6tTf0Y7mDMwjAm4
        02xd2eogTGdrSn9qCriXzjeZPswI
X-Google-Smtp-Source: APXvYqzQrbjiVIZ2xrQjSVE2s23pb8a7frp3WKl+9E9xON29ST0alT1pdKQsF5zPDt9VbZTcVKtvkw==
X-Received: by 2002:adf:f091:: with SMTP id n17mr6005043wro.387.1576018786766;
        Tue, 10 Dec 2019 14:59:46 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:46 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 15/17] fix cost of dereference of symbols with complex type
Date:   Tue, 10 Dec 2019 23:59:19 +0100
Message-Id: <20191210225921.94897-16-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, in expand_dereference(), the dereference of a symbol with
a complex type is considered as costing as high as a non-symbol
because it's not recognised it's a symbol.

However, both cases should have exactly the same cost since they
address calculation amounts to 'symbol + offset'.

So, instead of taking in account a single level of
	symbol + offset
let's use a loop for this in order to handle
	symbol [+ offset]*

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expand.c                              | 10 +++++-----
 validation/expand/cost-deref-nested.c |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/expand.c b/expand.c
index cd348bf5833e..36612c8672dd 100644
--- a/expand.c
+++ b/expand.c
@@ -737,12 +737,12 @@ static int expand_dereference(struct expression *expr)
 	 * Is it "symbol" or "symbol + offset"?
 	 */
 	offset = 0;
-	if (unop->type == EXPR_BINOP && unop->op == '+') {
+	while (unop->type == EXPR_BINOP && unop->op == '+') {
 		struct expression *right = unop->right;
-		if (right->type == EXPR_VALUE) {
-			offset = right->value;
-			unop = unop->left;
-		}
+		if (right->type != EXPR_VALUE)
+			break;
+		offset += right->value;
+		unop = unop->left;
 	}
 
 	if (unop->type == EXPR_SYMBOL) {
diff --git a/validation/expand/cost-deref-nested.c b/validation/expand/cost-deref-nested.c
index b09602b6acc6..d6b623961378 100644
--- a/validation/expand/cost-deref-nested.c
+++ b/validation/expand/cost-deref-nested.c
@@ -14,7 +14,6 @@ static int foo(int c)
 /*
  * check-name: cost-deref-nested
  * check-command: test-linearize -fdump-ir $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-excludes: cbr
-- 
2.24.0


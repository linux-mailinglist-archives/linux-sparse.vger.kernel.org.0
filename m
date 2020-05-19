Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80751D8CA4
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgESA5h (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgESA5g (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:36 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB43C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:36 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id l25so5517211edj.4
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4pWvkaY7AmvjjsIhWfGifrtoVE7kdnnfBuqGqX1759c=;
        b=GENKh4IadX978DTrzIG1/JNE5XERgPYcrptPqXDIta1/OSQ9VzvHIFjHXYSaN09igi
         4CRylbkfflYLzdtwGddtOHi4P/vlHSl0//FsMCzjYARckXqddGsGrwGR5hhuPCfHKGI/
         6fu8lxKkXPPl/hfDfK90pR75lvHUvucSHzFJISbR8+GReFTUeAIW9Q8qrpyQLEfS2a/O
         /ueLQrmV+SKFVf5R5pSWNHRrNblcOpr/G56p6Ao05TPGKn3cBIhNIsmCxjsYV2rfhLnC
         hB8bP8k3t5Xc2awm1yd0n42jWaeBo99ttm5aRUBWf80tekFCbED6jPtdjOybejzBMAOs
         cX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4pWvkaY7AmvjjsIhWfGifrtoVE7kdnnfBuqGqX1759c=;
        b=j/YlNsjo+1SESG3BgUBCweeS7T1XMf2qQAxE4aeOsI2eB4a4j1ajCZBjXTqleGq4+t
         yhVvc8JY7kEvVg/6LWoT71KrBnXTK86imV4t/kLuNwxBH5glk5ywo/hJGybe9irMGDiw
         5wu4SEcq0iHMvefQdCjNvVN8MR69pChAJkol+tKKKcShHfBgX1oPtDdGlDfnKYH+B5t8
         /eHL6k8SNkooRoE4lo9eaSrV7VgFhxRIoZy9u+18tOoJrc77tCWaSBMqFhXQVNIJN/5D
         I85pPQ6F5x3pdoduSarVBJt6pc4MHH5P4P3jieY3LX8HgkJTICDZ3Vs48S8vBabZnzl9
         OqfA==
X-Gm-Message-State: AOAM531WcUopu/F7sDXCYR3ThyBSy/vpgfNUhTJ3OMJDBm0BzFE91kIH
        SeeLqWbZPQOQG1dX1WQIA6lBdcQB
X-Google-Smtp-Source: ABdhPJwz+kOnQ8524ZOn1xVcq6E2UFTmrS9hx/6er9iJC8G+1Et22QSMplQK5LhRxftVd2+dLAOQnw==
X-Received: by 2002:a05:6402:8c7:: with SMTP id d7mr15685516edz.113.1589849855040;
        Mon, 18 May 2020 17:57:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:34 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 03/28] misc: always use the node for current_fn
Date:   Tue, 19 May 2020 02:57:03 +0200
Message-Id: <20200519005728.84594-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

At evaluation time and at expansion time, current_fn is set
to the function's base type (SYM_FN) but at parse time it's
set to its parent type (SYM_NODE).

Since current_fn is used to access the corresponding ident,
it should be set to the node type, not the base.

So, always set current_fn to the node type.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 4 ++--
 expand.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 54cd5fa136e6..c18ae81df5ad 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3422,7 +3422,7 @@ static struct symbol *evaluate_symbol(struct symbol *sym)
 		if (sym->definition && sym->definition != sym)
 			return evaluate_symbol(sym->definition);
 
-		current_fn = base_type;
+		current_fn = sym;
 
 		examine_fn_arguments(base_type);
 		if (!base_type->stmt && base_type->inline_stmt)
@@ -3453,7 +3453,7 @@ static struct symbol *evaluate_return_expression(struct statement *stmt)
 	struct symbol *fntype, *rettype;
 
 	evaluate_expression(expr);
-	fntype = current_fn;
+	fntype = current_fn->ctype.base_type;
 	rettype = fntype->ctype.base_type;
 	if (!rettype || rettype == &void_ctype) {
 		if (expr && expr->ctype != &void_ctype)
diff --git a/expand.c b/expand.c
index e75598781b6c..ab296c730efd 100644
--- a/expand.c
+++ b/expand.c
@@ -918,7 +918,7 @@ static int expand_symbol_call(struct expression *expr, int cost)
 			struct symbol *fn = def->ctype.base_type;
 			struct symbol *curr = current_fn;
 
-			current_fn = fn;
+			current_fn = def;
 			evaluate_statement(expr->statement);
 			current_fn = curr;
 
-- 
2.26.2


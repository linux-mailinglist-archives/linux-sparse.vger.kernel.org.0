Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAF71D8CA3
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgESA5g (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgESA5f (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:35 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B9F7C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:35 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id d24so2277077eds.11
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PfH3blhLQMIqm+mCPO+9CfeDIa1SdHzMMT4/wDfuPQI=;
        b=JMwhn2LQdNIwSuefOJBKJrCP4AHBzpdAvCIG3//0A3mAXMw8MxcHPhCf6NTZ7L3Jfm
         GWsdN5+ZyAQZc0IyBfSj+7oazWc+xE0voXgqfyxof2nQtPUwEmF7UgDtEGXMIB/Vvcin
         dxNn1OdUeaGoWhKckqFQRptrDFl7DxV90iAn/63e7Y+cTQZmcYW/+c8wfigPpsqkHU3C
         U26cAhGYetKjuH+aN4VZZPv/gp6FK+jUsze1Wo+/EIhr+dP4g/iNF8TTVFIj67i7hWCv
         NUzFF3sKuHRBpzmhQ7YNmRCMccmItKPnRQVDVVETJ7Ap+CSVU76iG32SuJO4H6BZeUsx
         ejjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PfH3blhLQMIqm+mCPO+9CfeDIa1SdHzMMT4/wDfuPQI=;
        b=oOJkatUV6q64tIqKP2tdYhFW33Hmw3jteHF2GkVouJyJ26IGgjSN7helChFUt6+bgd
         pHBgaQ4k72zQt0t9q0XV+0ehX2Sz+XyZKpw9rMXnErfW7H8uMw4Bqvrh5HUu8qPoDHxF
         PhL6xm+S1DtOZ9b6qJ9mTc4xaw8kY0PBerPHpnrCQFx62VORsxVOOlFo8MxH4S6CLGyQ
         FzWc+BdFwm9MZyD7bFfwtG3OrFwOwIVuJOMFpoMn6GpQShPV/pUIF2xmbdAy7ud2luNK
         YqW5ipiMtPEmJ2JBJj7iJoZ92nahf/LeTa7GoqxbEUXCn4VKM6KY0ju3mRk3DdK0kQdI
         6rGw==
X-Gm-Message-State: AOAM533BfRLI7CV828m1+3P8BmYfq9xM6tl2EInpxdOof0W5LMN/sDo/
        cbpg7+XrIWlNOfBSypAGEWj5XwZA
X-Google-Smtp-Source: ABdhPJxnpVwYNFGjwTC3UPdmf+eVwZjzh70KAX54gJw2PP0VlvkroGfEoj6Z6wosc28fTYn8c/W89w==
X-Received: by 2002:a05:6402:783:: with SMTP id d3mr15561073edy.295.1589849853938;
        Mon, 18 May 2020 17:57:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:33 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 02/28] misc: s/fntype/rettype/
Date:   Tue, 19 May 2020 02:57:02 +0200
Message-Id: <20200519005728.84594-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In evaluate_return_expression(), it's checked if the type of
the return statement match the function return type.

But, the variable used to hold this type is named 'fntype'
which is slightly confusing.

So, rename the variable holding the return type to 'rettype'
and only use 'fntype' for the one hoding the full function type.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index b7bb1f52aa91..54cd5fa136e6 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3450,13 +3450,14 @@ void evaluate_symbol_list(struct symbol_list *list)
 static struct symbol *evaluate_return_expression(struct statement *stmt)
 {
 	struct expression *expr = stmt->expression;
-	struct symbol *fntype;
+	struct symbol *fntype, *rettype;
 
 	evaluate_expression(expr);
-	fntype = current_fn->ctype.base_type;
-	if (!fntype || fntype == &void_ctype) {
+	fntype = current_fn;
+	rettype = fntype->ctype.base_type;
+	if (!rettype || rettype == &void_ctype) {
 		if (expr && expr->ctype != &void_ctype)
-			expression_error(expr, "return expression in %s function", fntype?"void":"typeless");
+			expression_error(expr, "return expression in %s function", rettype?"void":"typeless");
 		if (expr && Wreturn_void)
 			warning(stmt->pos, "returning void-valued expression");
 		return NULL;
@@ -3468,7 +3469,7 @@ static struct symbol *evaluate_return_expression(struct statement *stmt)
 	}
 	if (!expr->ctype)
 		return NULL;
-	compatible_assignment_types(expr, fntype, &stmt->expression, "return expression");
+	compatible_assignment_types(expr, rettype, &stmt->expression, "return expression");
 	return NULL;
 }
 
-- 
2.26.2


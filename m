Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AA61D8CAA
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgESA5n (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgESA5n (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:43 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B21C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:43 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id h16so10185526eds.5
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UG51ooTfaYv5vCoYOtf6ZhoFwnevEjq0nW8SAZ+myvY=;
        b=kqBz4MaNstPBAVOp08Hw72+7R+zHzxq4P8dW5uLL3F5YSAbDFRaPTbd5ueuOkBfui3
         xUHJ9YS/feTn1Ap46zJEPQjCu43UKiwzLkcvs0h/WdmnOzYGg8a1hisnVxv3Fe2oo4cI
         Spkpd5vd2GtpyrhzARlQgRl0i/2GNbo4KAIhDW39nevgAE1hVqxMPxig9Yuq+INfozsl
         SG9A7prNCTi/m3rqtcBDYDV1PbLydsa/ggiA03yP+6hkZgPwUesL9oKX9pV2GxgdV9ej
         o+hhQ/j8mzhC+wyvU0k+kSvoXDJmJpIzLKqDGO8gs7reNNTb6QKacgDAWmlYTQRzrjC1
         HOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UG51ooTfaYv5vCoYOtf6ZhoFwnevEjq0nW8SAZ+myvY=;
        b=Tx/F6MRNSjdI5xBrzYVG7G/kz3V10SjaMkDpFk/HQvGARHYoV3sVJvA1X+S6zOZm/m
         3+3qLs1BX6H1u0Ilt8GdJGv5xIoajIclBy1HS+dxgS1K/ZZnU/IIdYhIBpOd2uf/LrqV
         ux4a/k33NXSSEjQWlOdN/LlT5W+HquW++IaoZUcyFxZ1SDbxTzJlEFZ59DIkihEgfyhL
         XWbcARXNQxIbqrd2CytimH2+VkvsbSgqREBrElBxyOuadPMhxfaryUMzTGp09dAlvlWA
         XVOgwioLUNgmmS/n2DR2ZDJtdwg+EhBmMoGKcI+e18x0XNJ0Ca9rugQ5UJnYOPGl5TbC
         VOKA==
X-Gm-Message-State: AOAM530lgOIc+yHwLegM8IZrcU0usKxXp5efeTkzby85cjqoqV1N9zCC
        dH7rb6dy4zEMUaeoZ+p0XXtcbLO/
X-Google-Smtp-Source: ABdhPJztJ+Z6ppeUd5+dQ0alyjX/5+Gu3aFbgpVVV39sQO3SICNR2mOnKgeS1AVChzEd7AAVLTI3EQ==
X-Received: by 2002:aa7:d891:: with SMTP id u17mr3160699edq.129.1589849861852;
        Mon, 18 May 2020 17:57:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:41 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 09/28] bad-goto: simplify testing of undeclared labels
Date:   Tue, 19 May 2020 02:57:09 +0200
Message-Id: <20200519005728.84594-10-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

There is no need to do a lookup: checking if the label's
symbol is in the NS_LABEL namespace and is lacking an
associated statement is enough and much simpler.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index 4bdd5ed05842..d4b462274add 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3747,7 +3747,8 @@ static void evaluate_goto_statement(struct statement *stmt)
 		evaluate_expression(stmt->goto_expression);
 		return;
 	}
-	if (!label->stmt && label->ident && !lookup_keyword(label->ident, NS_KEYWORD)) {
+
+	if (label->namespace == NS_LABEL && !label->stmt) {
 		sparse_error(stmt->pos, "label '%s' was not declared", show_ident(label->ident));
 	}
 }
-- 
2.26.2


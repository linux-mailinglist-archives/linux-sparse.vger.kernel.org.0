Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F0CA1A699C
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731403AbgDMQQU (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731399AbgDMQQS (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:18 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0B2C0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:18 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x25so9832542wmc.0
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F824jb4J88AYNPTDOnnheb4eKNaMn/H59PLsX2WIh/Y=;
        b=tgjE3z99/a60eaV2l1M+82vipqGrkrDMtHtOJYjliBFYcNuxZNm3zQHevCSNIJ1PZ9
         gckcrZL++A27llW6ACidTutgLgEUHIYIwtwD5jQhUR38xHO+AkXnCBajGXj0WW+7X2H1
         6lhwspj4FyoQIFQcFL0MpjFSCUCRB4Gs8HerTCl85wWb8cNiBlHohsFVq//8AMipAe60
         d+opzjK15ypl8Ldy0X1c/CF+DEf48KnVM5pQfX04M5U59hnwfqccL/otM3nwXpwxy9tt
         /r7Ex3kcUD2+F9aIWeyk9hY3qU/i7Ie0qEdc38XlZTgImXkfGInqFx9tVwgHjtkuuFUI
         zWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F824jb4J88AYNPTDOnnheb4eKNaMn/H59PLsX2WIh/Y=;
        b=Qrd4/KGsHhQvYuJEWwcM7F+6QlejoTJEi19KkgEAW6E+6kLcgGkEZbP0GB6i6ZkqQh
         dgCEDhP+PaI7btp2utjKPdnM/+XeG4OV1tBiL33MAj+Fgysukyhq3caRhw3YyyQr1Kza
         cOuVE5Cf93CFgK1V8H7R6Lim2DiBlMRxqr7niVZ3qFhFlr/c4RUk0Ddqizlx9ChFmruY
         m5ozIXB7bu5IAtZEOTqGvNgV2uZsU8ZMk8Nx9fxG8M3fDrcLqIocKKdGIFYCCBtFg87Z
         RCCC5oC5oiaGu6oX82CBUJPkJqY8VEMgGTdWdp6MB4FFo9+Mu6NDoXxsYTrOENFLCZEJ
         vWHg==
X-Gm-Message-State: AGi0PuayRC6cjWslZ9rJ2rn0+XzqVlMHEdpJXyo5okUKKbaxyPz8oDyA
        0lfSa3cJEEReAka9krq/KsEs8aWr
X-Google-Smtp-Source: APiQypLcaA94c8RD3TIf287D/fDF1XzuMPbpDgAts1vsNkpjThnM5rKNdCgWxAeHh3Dbf7fM0nslDQ==
X-Received: by 2002:a05:600c:2314:: with SMTP id 20mr18912355wmo.35.1586794576504;
        Mon, 13 Apr 2020 09:16:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:15 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 06/17] bad-goto: simplify testing of undeclared labels
Date:   Mon, 13 Apr 2020 18:15:54 +0200
Message-Id: <20200413161605.95900-7-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
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
index a432d243610e..dc66b2e6ad9a 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3746,7 +3746,8 @@ static void evaluate_goto_statement(struct statement *stmt)
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
2.26.0


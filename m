Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4841A69A5
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731408AbgDMQQc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731409AbgDMQQ3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:29 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED341C0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:28 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id d27so1511487wra.1
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RQUD3AJC15CMc1LqksDSIJU0r2BzyqH9+NZCn6sEySY=;
        b=YrwXDGHCy/wP3wWZj63PxlRWv0KoIWbe+1xeOj6898lkGE7Sfgd6R6CJBpN+rNhitL
         LVCWHQVaUcmxuh4K1mnK5F5b4LXJ1KTQB34iIe3LkhLyP4dySxZfUbPkOEyMYJzCZDwG
         FA+vYCjRI/LbTz8Wc3l7TWHBBdfQO5Qs+4NxYgVPgunyjKifLd70IMbSaOWo4yiHDPPR
         n1ZQgkAqFR1dAw0YoqjHyy6tu8u+XiXufmWgx7aK1vKo+8+PZHbMujbAlN7O4yMiuVGj
         /XTHGWy1JZbeghW6b9ME8/BrmAl2hAO+OUkaC9nV4IXxBV6lGW4pTD2aM1c02DNS5ZMw
         QkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RQUD3AJC15CMc1LqksDSIJU0r2BzyqH9+NZCn6sEySY=;
        b=r3O5StasOjMXsZ9+CNKOZoRMtYYlBkbFPMWo6Vpmq4ihk2G2avq0wfTlmvnUM4ogzz
         TWZ//ja5pvu75Lxpo9xJZiuEbgciJ3Hckx2ZUlP54hYIgLXUoUv1iGkUbvpQQ44yI56F
         irLRkUdhWBNBAwgHghG++ccuksJaejV2v4l8/hbSPAZVpSAbJf7qRMa/xTZUarYukIE0
         1xuhePkgoAl2ZlxkAnd4LqYljgnKSfnrPhq3JZONXPTS/my4SOvWMW5q5M2FlZ61UaOo
         677DsyhvDVQG76E5HzDGSaZtvnV/KTRkSl9lA1CzvdFgA928AsTQTcXXffPshgi8VmFQ
         Doaw==
X-Gm-Message-State: AGi0PubYe1he1YFhIPAIxfkSToLyOx7Jg+Ruh8Xe9BqXSznRxjSvTCY/
        +vt5UKcQogl4VE+wNFEzzAQoEikt
X-Google-Smtp-Source: APiQypJ0vGd512TfFrfQaafXHFRiZNvjRxA6g2Sq+ge+kcTOZiME8znmuraOhuuUktBruvmb+CmN8g==
X-Received: by 2002:adf:e98a:: with SMTP id h10mr19612452wrm.370.1586794587399;
        Mon, 13 Apr 2020 09:16:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:26 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 17/17] bad-goto: cleanup evaluate_goto()
Date:   Mon, 13 Apr 2020 18:16:05 +0200
Message-Id: <20200413161605.95900-18-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Reorganize the code to not repeat the test of the
label's namespace.

Also, make all namespaces other than NS_LABEL & NS_ITERATOR
as bogus and add some comments.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 2b845a301d6b..663540ff6445 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3748,20 +3748,22 @@ static void evaluate_goto_statement(struct statement *stmt)
 		return;
 	}
 
-	if (label->namespace == NS_LABEL && !label->stmt) {
-		sparse_error(stmt->pos, "label '%s' was not declared", show_ident(label->ident));
-		current_fn->bogus_linear = 1;
-	}
-	if (label->namespace == NS_LABEL && label->stmt) {
-		if (is_in_scope(label->label_scope, stmt->goto_scope))
-			return;
-		sparse_error(stmt->pos, "goto into statement expression");
-		info(label->stmt->pos,"   label '%s' is defined here",
-					show_ident(label->ident));
+	switch (label->namespace) {
+	case NS_ITERATOR:	// break / continue
+		break;
+	case NS_LABEL:		// goto + ident
+		if (!label->stmt) {
+			sparse_error(stmt->pos, "label '%s' was not declared",
+						show_ident(label->ident));
+		} else if (!is_in_scope(label->label_scope, stmt->goto_scope)) {
+			sparse_error(stmt->pos, "goto into statement expression");
+			info(label->stmt->pos,"   label '%s' is defined here",
+						show_ident(label->ident));
+		} else
+			break;
+	default:
 		current_fn->bogus_linear = 1;
 	}
-	if (label->namespace == NS_NONE)
-		current_fn->bogus_linear = 1;
 }
 
 struct symbol *evaluate_statement(struct statement *stmt)
-- 
2.26.0


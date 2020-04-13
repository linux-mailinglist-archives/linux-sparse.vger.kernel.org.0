Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6011A699D
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731399AbgDMQQV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731400AbgDMQQT (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:19 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E37CC0A3BE2
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:19 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s8so10706610wrt.7
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfWuMuzf9ZBMIoZQTr8zywfDkJxF9+2Oq6AAWUwg2DM=;
        b=GX45IHfwXMGRUtCHRKy/JVV3s1itbMIDuJVNb707qywhm5nXC8E4TO25KMi0GcSmmx
         LxNQaFtIuCx+ukcHgEb8lCVbifpWWRRg2z+ZsrU/uXc5IszkrS23ChCiw4vKXVLwybcm
         fZBzg/o7jYF8Wmv2BrX4e8YYPPWyCXI/upHSWUJwuVnnDQ+Be3W94KVmHUwWw0pI1Q3j
         a3cBJ8qATtPrzFONHVt/eETH2ZeFqG/84aqCz1076v7Ffr7y5qOdNAK2MHVchtVaokSj
         dnzW+jiXaKY/g1RsQRMs7CJ0cJmxqJ76SwEfDDOI6TlrZc6fDWPIyBq5NyRDWxFpJB6c
         DSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfWuMuzf9ZBMIoZQTr8zywfDkJxF9+2Oq6AAWUwg2DM=;
        b=mR3M5tM5lzXUTKCZ0N+XtosUXdivQ/g6BudpbT+XSvS6+6uVz6uLmn+pLCQePe7AlS
         yGqJI++7Ud3J6S2OLDQHxo/SJGsj/rLX754kmygulR9sTSmrpp6TGAeVUtc/CEtF7Nkk
         m6Tdrt987eusy/W9BSb91ycv6LOzp8rqpY1uxSb5GlLftgWPImeT9TsxkaT+12loHQTj
         QJ7KCp5uAtepaAqwKQW1+zP8mH3LIksXd/8OoJxXo1R7S4oBB/eKaiQbXunORqrP3A32
         vCw+GibC67bNVkArLWI2yB44BwMbdR5T23l5Epzk6WhCw5bcSBPjROVQCDapqGCsBJti
         RUvQ==
X-Gm-Message-State: AGi0Pubb9o7rOoD6S74YF+AddFVwQdj88S+YUOdhLPdvhBKxU8CV1QnX
        rYI+/BtGT1ZI3yh5KRveRQA6SKgg
X-Google-Smtp-Source: APiQypJifwOjj+6Wd06zXb6Oc1IkLLrC1nCulDE6I4Ry4QHVCZ1ZOdsYtqjrHD+axDicgPKVxm2Jfw==
X-Received: by 2002:a05:6000:12c7:: with SMTP id l7mr4870373wrx.239.1586794577592;
        Mon, 13 Apr 2020 09:16:17 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:17 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 07/17] bad-goto: do not linearize function with undeclared labels
Date:   Mon, 13 Apr 2020 18:15:55 +0200
Message-Id: <20200413161605.95900-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's not possible to produce a valid & correct IR if
the function contains a goto to an undeclared label.

So, try to catch these situations and mark the function
as such, the linearization will then simply ignore it.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/evaluate.c b/evaluate.c
index dc66b2e6ad9a..14953f195fcc 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3749,6 +3749,7 @@ static void evaluate_goto_statement(struct statement *stmt)
 
 	if (label->namespace == NS_LABEL && !label->stmt) {
 		sparse_error(stmt->pos, "label '%s' was not declared", show_ident(label->ident));
+		current_fn->bogus_linear = 1;
 	}
 }
 
-- 
2.26.0


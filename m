Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40FDD201427
	for <lists+linux-sparse@lfdr.de>; Fri, 19 Jun 2020 18:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgFSPEQ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 19 Jun 2020 11:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391106AbgFSPEK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 19 Jun 2020 11:04:10 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298F2C0613EF
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:09 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id gl26so10525852ejb.11
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VPZTqo+mX5wZ3qcnzZnYgh66qqvLplWLA5vXy1evwAI=;
        b=Y4jZIP6EOoSo/A155xJy4/Brf3YeWPj0O+/Fg0fuZKfJD+zjeG7P+AOIY+eC7Ev0r/
         oQCKLr+mvqiAB17TDdaOcwUzjH6D3fviWzGS/WTXECDJsH+PfQVcHhHXbKBOxtKlr9zC
         4tffZ+mQJevRTk6zGt3vPJ84ouvrWoqojbWOHNfIbUNOG8lXtq5CHAzvI4TurTcXlj4y
         IdgV1I9GoCRUAmnfeosNQdBjirstabJp2j+FNShr+txipg1tkplBKFp68OmOWFoYtzZg
         MCddF87zMSdGdfyhRAAZLWBSJyoL8jtf0pd7iTEBCGqAxQggVBTodHDqX+kjteSolPmn
         VeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VPZTqo+mX5wZ3qcnzZnYgh66qqvLplWLA5vXy1evwAI=;
        b=dmSvyjaS0eFibgCrAmUuJUsSQGCUC/NPonbXTb5WXQp43yTAZ2AOO1slemYT5h0U9O
         +8tlZAw1DaNJWGRXECWVtkAeKmLATheTe5qrsQ1eR69oTxI5uw2QRBgZwNG+6n8kNiFz
         FteA9K0YLFfdikg0U7HeLtA9mMTTrsKgrdGKbFzSJ4wuFnsalCtdqXFg91LqosufRHeQ
         ayaVNQnl6sT6NSQRe9OFqQSE0CEkE2wiqavJU6X1LG2gNvzpdg/ptv2OHSFfgbgEVo3W
         GVfLfNGiTy+LikIRAPExgYGNApkiyZc6CKWjg42v+0mpuqDkkR9jGmi4Xs0ZyLkWCOk8
         lOyw==
X-Gm-Message-State: AOAM531F2vusLmd/nglFR4W4kYk4Lw7OawmxOPtb2EUWSkC08KeLqDmB
        uavkWBmZF0Eh8qBmqced4CfjOkGF
X-Google-Smtp-Source: ABdhPJxC3xW1PgIi3ZOW7QUoI4njP83FsWTfXnqdWNYeIqBSfH4pUI47kHkPaEIT73pbbCfUxWgxgQ==
X-Received: by 2002:a17:906:6403:: with SMTP id d3mr3942060ejm.386.1592579047706;
        Fri, 19 Jun 2020 08:04:07 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5db0:70:8732:dad2])
        by smtp.gmail.com with ESMTPSA id k22sm4852307edr.93.2020.06.19.08.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 08:04:07 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Marco Elver <elver@google.com>
Subject: [PATCH 4/5] gensel: controlling expression must be pointer-converted
Date:   Fri, 19 Jun 2020 17:02:59 +0200
Message-Id: <20200619150300.63695-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619150300.63695-1-luc.vanoostenryck@gmail.com>
References: <20200619150300.63695-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Following the resolution of DR481, the controlling expression
of a generic selection must be array-to-pointer converted and
function-to-pointer converted.

Do this by adding a call to degenerate().

Reported-by: Marco Elver <elver@google.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index d8615a894c0d..491dfa3c6b89 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3290,7 +3290,9 @@ static struct symbol *evaluate_generic_selection(struct expression *expr)
 	struct symbol source;
 	struct symbol *ctrl;
 
-	if (!(ctrl = evaluate_expression(expr->control)))
+	if (!evaluate_expression(expr->control))
+		return NULL;
+	if (!(ctrl = degenerate(expr->control)))
 		return NULL;
 
 	source = *ctrl;
-- 
2.27.0


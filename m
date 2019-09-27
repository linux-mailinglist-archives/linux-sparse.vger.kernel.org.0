Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E148FBFCC6
	for <lists+linux-sparse@lfdr.de>; Fri, 27 Sep 2019 03:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfI0BmB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 26 Sep 2019 21:42:01 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36633 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfI0BmB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 26 Sep 2019 21:42:01 -0400
Received: by mail-ed1-f66.google.com with SMTP id h2so931894edn.3
        for <linux-sparse@vger.kernel.org>; Thu, 26 Sep 2019 18:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmuuzwMyC9n9gTmj1mNjr2ZvhnC4ro6o+drJuhVwVUc=;
        b=h7HriNh9R2l21LxQrToh2J1FjtEiHTC+GgzMvAkD1VC0nBcJqz+EIA6eX20EPsxcaH
         7PnfOllkDnqX+XEGM8e8fXsmt1aKtjIj6W/slvjtNDQk6LN6HuMis2LFXZr5mT4b7vVP
         Vl82KeED3q5i9kW7juvxdx481b1B3Fy5ckeqBz2g+GA8wPg+2HeIuDFswNQboyE6iGrZ
         2PNVFZuTqxNN9UiLrY5ci5bhuJNFv+X3WCIopgyZm/ujX/T/U4NczpX3B7DXAjES/8Q/
         rOsDZ7Jk0OThh0lHphw+XztmgEvIf5A9l9Zihl9Z4Yj0vA2L7IzEStilZ/Ln3WDpamSp
         Mu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmuuzwMyC9n9gTmj1mNjr2ZvhnC4ro6o+drJuhVwVUc=;
        b=LYQSCaTD9WiFhD6IcmtHvdB9O5Z4SFGmC/WqAZSVfa1bHAP+J8a7fW/KI50UPFKOZS
         c1+TOQcpaUaIWKKUJQDr2iGyItUkBpppui3SBSQA6k2ZfIz3KANGH5P5BNmq9ZLQofid
         UO8lqFa3vhJhGG297jcPN0QFNOGF0CBW3wbWUGwI6OljSXe+mOiYTr6ngw5zqdcwMoq1
         UVeYD9dxYDMRNXPABDzodh6kwf+li0ScO8QPDJsxDigSqTtRsFW2YRNq85y5Q0Y/QgWw
         lp9W8o5H+5Efv01fjqt507/+8LKhZeQCVdOFEUMN49ZY5eXa5c7KaLEvHytFs1unF+Ub
         v0/w==
X-Gm-Message-State: APjAAAWfp7Wr59L/nYVBL4JSo7abaByyb7PlNa3CSIRG2y2dSDxkU00+
        2Xx3eajJWNZ+zVpzNtfDK8PT4CRa
X-Google-Smtp-Source: APXvYqz39zYJHDDDTtqBwgIFFWzH4C/gwZ0ZYGDjeSzXlMTU6j1wAHLCcAah05KGYyA+8eT0QugTUQ==
X-Received: by 2002:a50:9384:: with SMTP id o4mr2009031eda.8.1569548517882;
        Thu, 26 Sep 2019 18:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:5de2:f287:160f:22])
        by smtp.gmail.com with ESMTPSA id i1sm425312ejv.92.2019.09.26.18.41.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 18:41:57 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/2] do not linearize invalid expression
Date:   Fri, 27 Sep 2019 03:41:50 +0200
Message-Id: <20190927014150.38705-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927014150.38705-1-luc.vanoostenryck@gmail.com>
References: <20190927014150.38705-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Code like:
	int *r;
	r = ({ __builtin_types_compatible_p(long, long); });

triggers the following diagnostics:
	warning: incorrect type in assignment (different base types)
	   expected int *r
	   got long
	warning: unknown expression (4 0)
	warning: unknown expression (4 0)

The first warning is expected but the other two are bogus.

The origin of the problem could be considered as being how
type incompabilities are handled in assignment:
   If an incompatibility is found by compatible_assignment_types()
   - a warning is issued (not an error),
   - the source expression is casted to the destination type,
   - the returned value indicates a problem was detected.
   In the other uses of this function the returned value is simply
   ignored and normal processing continue. This seems logical since
   only a warning is issued and so (thanks to the cast) the
   resulting expression is at least type-coherent.
   However, in evaluate_assignment() the returned value is not
   ignored and the calling function directly returns. This leaves
   the resulting expression without a valid type, as if an error
   occured, unable to be correctly processed further.

However, the real problem is that an expression without a valid
type should never be linearized.

So, in linearize_expression(), refuse to linearize an expression
without a valid type.

Note: if one is interested in doing a maximum of processing,
      including expansion and linearization, check_assignment_types()
      should be modified to distinguish between recoverable and
      non-recoverable type error (those for which the forced
      cast make sense and those for which it doesn't) and
      compatible_assignment_types() modified accordingly (maybe
      issuing a warning in the first case and an error otherwise).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c                   | 2 +-
 validation/eval-bad-assign1.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/linearize.c b/linearize.c
index 415bf7e50..d705ffd59 100644
--- a/linearize.c
+++ b/linearize.c
@@ -1864,7 +1864,7 @@ static void linearize_argument(struct entrypoint *ep, struct symbol *arg, int nr
 
 static pseudo_t linearize_expression(struct entrypoint *ep, struct expression *expr)
 {
-	if (!expr)
+	if (!expr || !valid_type(expr->ctype))
 		return VOID;
 
 	current_pos = expr->pos;
diff --git a/validation/eval-bad-assign1.c b/validation/eval-bad-assign1.c
index bce4d3d38..57138c7af 100644
--- a/validation/eval-bad-assign1.c
+++ b/validation/eval-bad-assign1.c
@@ -5,7 +5,6 @@ static void kos(int *r, int a)
 
 /*
  * check-name: eval-bad-assign1
- * check-known-to-fail
  *
  * check-error-start
 eval-bad-assign1.c:3:11: warning: incorrect type in assignment (different base types)
-- 
2.23.0


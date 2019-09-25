Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7A1BE806
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 00:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726016AbfIYWDv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 18:03:51 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44199 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727197AbfIYWDu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 18:03:50 -0400
Received: by mail-ed1-f68.google.com with SMTP id r16so115313edq.11
        for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2019 15:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tLU20jS9bSMijJ7e5V5xsUkNoSBaF7nGHBjTbkvzoy8=;
        b=dwQdzfa4rKQsJ26i9JBDDRyDzm4HpASPW1s6zLt1i9LjRk18US6ZfjGoqllmLafyRR
         UMhEPHp3Isp6qR6XC/qJrkoIVhTxNtxzzAngAakDqrVKOYzNI7d7n0+/RX/wbaCgIrT9
         CY/KIVDZ57id0scPQJbcAqoiAFiF0aC9Krl27RwU5lig/9nALgjzCG1ghToVhvXHsO7u
         KHZZFy6kUy2jhQ3MndvHHdcJjpWmYCO1i57qSDxz9HrHua+2CsgDVmnFxT9exzuLJHjS
         Pe5W/LTfIv9sWQog2R28G9Eo4dJJ3stN41e0aJwdgEyeIBaJS/OEAn66x+3APmbBtUmg
         atRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tLU20jS9bSMijJ7e5V5xsUkNoSBaF7nGHBjTbkvzoy8=;
        b=r2iy8ZfvPjCaU1wYELhspvNX2BXgEniNVmcdgeLAGYZkXlkfWRekeZ6Fb/Fa2Su80f
         3OQZb8cfmz8BZxYjbamRh3U2q2nICSzdPxgO+7rz5pXRromoGcWIOkCW3jyT8lMdZvRy
         D5G/ONz5oi35JjvGh5GM30ZetAafmxpEVUnRt110pZijKJ1TTgfjsgDQoduY7vBoA8B3
         T1WN5yunDi2uBSsCtKq9iaFr+NXE6SI40APynYpgGFuljeHmGUeQC6d+zdvpTzprO+fL
         tm/m19SOlHCavY19CbcOmxd+MXswmqDgMwvHk4OymZTbxebQ+A58bkCv7cfT7UBYjNvA
         DZUg==
X-Gm-Message-State: APjAAAXQ+FGHHe/lDcViH+ORVI9qLUXGoowdiSXW+4HN9/j0xfBw4Utl
        vrqHlUesQCUXjhECrsjJSpP2sTUl
X-Google-Smtp-Source: APXvYqzFr/sAtftZ4u8MnQWYg4bvBoF60ufs3BNmhQdQzL0iKDiOCZmbrGLWtbfDgIZNNKFwPe2vQA==
X-Received: by 2002:a50:b884:: with SMTP id l4mr179814ede.295.1569449028691;
        Wed, 25 Sep 2019 15:03:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:553b:deac:4ba3:2b98])
        by smtp.gmail.com with ESMTPSA id f8sm56810eds.71.2019.09.25.15.03.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:03:48 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/3] fix sign extension in casting enums
Date:   Thu, 26 Sep 2019 00:03:40 +0200
Message-Id: <20190925220340.5128-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925220340.5128-1-luc.vanoostenryck@gmail.com>
References: <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
 <20190925220340.5128-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

The function cast_value() needs the exact type of the old expression
but when called via cast_enum_list() this type is incorrect because:
- the same struct is used for the new and the old expression
- the type of the new expression is adjusted before cast_value()
  is called.

Fix this by adjusting the type of the new expression only after
cast_value() has been called.

Fixes: 604a148a73af ("enum: fix cast_enum_list()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c                       | 2 +-
 validation/enum-sign-extend.c | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/parse.c b/parse.c
index 005eb1608..b01c876e7 100644
--- a/parse.c
+++ b/parse.c
@@ -897,8 +897,8 @@ static void cast_enum_list(struct symbol_list *list, struct symbol *base_type)
 			expr->ctype = &int_ctype;
 			continue;
 		}
-		expr->ctype = base_type;
 		cast_value(expr, base_type, expr, ctype);
+		expr->ctype = base_type;
 	} END_FOR_EACH_PTR(sym);
 }
 
diff --git a/validation/enum-sign-extend.c b/validation/enum-sign-extend.c
index 7f17debac..d1aee9419 100644
--- a/validation/enum-sign-extend.c
+++ b/validation/enum-sign-extend.c
@@ -8,5 +8,4 @@ _Static_assert(b == -1L,              "value");
 
 /*
  * check-name: enum-sign-extend
- * check-known-to-fail
  */
-- 
2.23.0


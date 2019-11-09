Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A245EF5F64
	for <lists+linux-sparse@lfdr.de>; Sat,  9 Nov 2019 14:35:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbfKINf3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 08:35:29 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54581 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbfKINf2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 08:35:28 -0500
Received: by mail-wm1-f65.google.com with SMTP id z26so8850700wmi.4
        for <linux-sparse@vger.kernel.org>; Sat, 09 Nov 2019 05:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mH8xGIhhlXhOz4T/W8DVlpSGvbi5y8jBXvDHl15KWsA=;
        b=N+UfE+x3IECrchrVhEJDoDPg+Xu9jYmqRpJvJYjMODTBkXNwLE15P69c2EPMhLRMnh
         +JAFIcw3E7lCzUnW9GmcNgwY7uDzpSMiCFHC60Fckz/B7BxDAItqz/gkvpgVIxMy83Ux
         uinGpi0KoxEwZdbnsUUKMzDY+inhrmjMS/UZN1p1B+hinijXKh/MssVNAwizFlvKsYhK
         gZ11QlNtLcEtSWgOp8xMuMlCxTBsonEI5v3rHgZklNXsWeRmfQs4UYU/h4BONEnWDP+a
         ACUJaEUdIivVb6XZTjmwz2ihP9/shUqtFgMdWe2pEcx5MUsH5MDFaPTgnrvijG7tQqPj
         t8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mH8xGIhhlXhOz4T/W8DVlpSGvbi5y8jBXvDHl15KWsA=;
        b=UoXy0Sl9vpQumvOyMaFXRVQkhB8Ih7GA9236RUCbYy/PRGCk9h6BD9+j+OGCWuR9ic
         MA6ay2/oNdItuhmUIWLp7KAKgHYf16DPIQUbl/5nyZWvw/fDwbFiTdVmLyHHfVMSSL0r
         Tp8Xrw8Qmd942BHB2oLWxEoRMGBwTzFMsSGIMEq7YYdm/LKXyQyhpayat1bYkzl5Y74A
         mlYy3CbLklEiOn5AhY7stttAxNTh+4UQwauD3AUzEst9cundS1KI6jzNUfXxfl/2pay3
         8taOFczpXyvO8i88phYiJqpLWu684jf8auK8fveGADj/hp+0+HcUG5pKEdha4FZR6CcH
         tErQ==
X-Gm-Message-State: APjAAAXnlbYufJOHdbk+FlNpRwiX3c6qZ+XyCAM9bAMVTm6wOD0U4Gdq
        9XCNu329BdUgYohVSIdcSBVoI9c4
X-Google-Smtp-Source: APXvYqylt3ZG1ts+Mb5I9rwna5+v/y/aIVqqCSOys8Y4lzpQf5qnRd7/NyGA1QQkjA3pD+7H3VrmZA==
X-Received: by 2002:a05:600c:22c3:: with SMTP id 3mr12253686wmg.139.1573306525648;
        Sat, 09 Nov 2019 05:35:25 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:417d:57dd:ed4c:6a6d])
        by smtp.gmail.com with ESMTPSA id j66sm8124422wma.19.2019.11.09.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 05:35:25 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/4] typeof: fix up comment in examine_pointer_type()
Date:   Sat,  9 Nov 2019 14:35:17 +0100
Message-Id: <20191109133519.63010-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
References: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The comment was added in commit c72032ad3 ("Add comment on what ...")
and explain why the size is set before recursing into the object
pointed to. But since commit 017034ed4 ("Fix up type examination.")
the object is nore examined.

Adjust the comment to remove posible confusion.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/symbol.c b/symbol.c
index 72ea2e4e7..334f9df29 100644
--- a/symbol.c
+++ b/symbol.c
@@ -436,10 +436,11 @@ static struct symbol *examine_enum_type(struct symbol *sym)
 static struct symbol *examine_pointer_type(struct symbol *sym)
 {
 	/*
-	 * We need to set the pointer size first, and
-	 * examine the thing we point to only afterwards.
-	 * That's because this pointer type may end up
-	 * being needed for the base type size evaluation.
+	 * Since pointers to incomplete types can be used,
+	 * for example in a struct-declaration-list,
+	 * the base type must *not* be examined here.
+	 * It thus means that it needs to be done later,
+	 * when the base type of the pointer is looked at.
 	 */
 	if (!sym->bit_size)
 		sym->bit_size = bits_in_pointer;
-- 
2.24.0


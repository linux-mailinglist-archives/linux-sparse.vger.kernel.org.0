Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7AC1FA540
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 02:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgFPAuT (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 15 Jun 2020 20:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgFPAuS (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 15 Jun 2020 20:50:18 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8327FC061A0E
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 17:50:18 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id t21so12947727edr.12
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 17:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f2a5tBdAjeqAnfGZO4lQjmwhtjugtdJXyBZTr2Xf5sY=;
        b=nFCRkr13s4NS78VeqrRyKrqJk6TL/SCtn1V7ca9c3TOWrCwp45BbBl0Mt6ykLOCrFW
         6nbJBiVaAT34hMS8ETSjmv0bapAm25zs6k6VRSoRaNyBQHiP1ie3XiFquPoHOES/Mwe2
         sZgdmzq1hSQ6HKjxkxS+jHC8QSG7mKbACBfcxT/qAZ0Dln7BUHgZ0dpbsdGAyQ8TFgjM
         3kbVR9GHEGbWNj3P/2XCJ/cBRHO8AUGRcBT/wzgClZBcVbjsFfXmiH/ROexRRDICPF39
         6b0ah/AOwrK8cbLiL3VQb1EkXQcYQ/yj9VOuSMGcOQBOzdpU1BIvOJzJC/YScTJcoID+
         O1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f2a5tBdAjeqAnfGZO4lQjmwhtjugtdJXyBZTr2Xf5sY=;
        b=STdUHOPytIugmLE/tq7OwUGHZ4hRfpwFivhxK6t5WXWzGfHJCu+AF6+7nqUby/UouE
         406croJ0y1iB2ItiqsVSnX59kQSZF5PgcMKAYVIlP1sVmWzzEWrjzv1P8trRMPzB6aEf
         5IzxFFC/tTRMqHqpVQHzjTZsyRyBSWXC3W/gkUHIewxpKIwRpKQhexjIv9n7+ADGnmPB
         Co3NyPoTSBeya6wSS0XzpjidE8lojROgONAUDa7x4AWzNRZAKwW/dEJtCWdMNQu292/4
         Ko6XqNKcHiave8kwn4dQ1BfmT/jPDFj5D3EHUUL7lsV6k+UCbci6U6+oD7SO4QOYpAPJ
         xGKw==
X-Gm-Message-State: AOAM532H1elmBHmYpVKsLZZatUuI82mnbHIrdPxOX2VlxbiA++KQkPPi
        rbOTJ8duYxtaBaKguW+clrdNaTUd
X-Google-Smtp-Source: ABdhPJxnWkWPPBUE74Ty1MDRG6T/GeRIXrxKd0FPZpSHas+weqgDDkssKjhkdyVpp7dRXIod8JE3Eg==
X-Received: by 2002:a50:8b44:: with SMTP id l62mr413351edl.72.1592268616825;
        Mon, 15 Jun 2020 17:50:16 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:edfe:3c23:b863:cb00])
        by smtp.gmail.com with ESMTPSA id s17sm9946101eju.80.2020.06.15.17.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 17:50:16 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] predefine: add a macro telling about named address spaces
Date:   Tue, 16 Jun 2020 02:50:12 +0200
Message-Id: <20200616005012.66141-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse supports named address spaces since v0.6.0-rc1.
This gives much nicer warnings ('... __user' instead of '... <asn:1>')
but this featres is not yet used in the kernel since it could be
a problem for people using an older version of Sparse.

So, add a define which can be used to check if named address spaces
are supported or not.

I should have done this a long time ago!

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib.c b/lib.c
index 951d400ea2fa..ebbcd3b150aa 100644
--- a/lib.c
+++ b/lib.c
@@ -1295,6 +1295,7 @@ static void predefined_ctype(const char *name, struct symbol *type, int flags)
 static void predefined_macros(void)
 {
 	predefine("__CHECKER__", 0, "1");
+	predefine("__SPARSE_HAS_NAMED_ADDRESS_SPACE__", 0, "1");
 	predefine("__GNUC__", 1, "%d", gcc_major);
 	predefine("__GNUC_MINOR__", 1, "%d", gcc_minor);
 	predefine("__GNUC_PATCHLEVEL__", 1, "%d", gcc_patchlevel);
-- 
2.27.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9D31F88A5
	for <lists+linux-sparse@lfdr.de>; Sun, 14 Jun 2020 13:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgFNLfm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 07:35:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgFNLfl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 07:35:41 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5FBC05BD43
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 04:35:41 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id l27so14467670ejc.1
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cxhNjp+kwieEXwXbGpHQPLN9yVfvGwm1uOn/wy14RM4=;
        b=f6OXeqcebdLkusWLLSxUoLGExGDR4V90tz1NQ2edL6k4RlG8LitqvTK9IJrk7Me8e6
         oitpFYCFULRtCZFUumLTbOIxVc1r09nnd09Em+W2kb/APVe+1rfSRzmvd6IjlJyXxQVm
         r3u5/cqS59IbU+nlg2Y9cimaZumBZM8lkPaBbJuI//vih9a8QdJCNIbjjoML4Fw6lVW+
         23UvwjgTsRlyYpa1ez57QuJiT7RosxYhsG6RbNZoLa+oKlJkptVkKp9kQqDa+QiBR83v
         f05UFncTWHMtSnRVlCiiai7kChBM0vYlnJL2mkkA9lbXxOUC7yJwvtvbWdDz0VoAXnfH
         Wteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cxhNjp+kwieEXwXbGpHQPLN9yVfvGwm1uOn/wy14RM4=;
        b=GzIVfjZJJ7Ae7byvNS6yeEuDBzipQnWsXwneuuSADiadEDXqD9wXc1wOxhxObdaR19
         tL9xu7JuKKzx5v3Ugj42BumCCRTeKS46BqFMnfjQI6qVCKSMsmL6PTJfUx2PMUelmM+6
         jpkNnIz+F/DlFPBHoacwDIFliqQ8wxpgz+6uY5mQhnBliNveNnd66PTu3NCSVDaEC8U6
         kAGVRm/zfXqSjdgP77CSOjSTxhAsveh4ggocQFHvjlPpdI1hftTCTAqjfhJjzdexDGfw
         wH9yTdL7HAONeTj8Wv+RTDNks/X6o97/ViOvZxHsNflbVtP+QRiIVCD+13xATSR3pgJv
         D1uw==
X-Gm-Message-State: AOAM530Owr4JjTEGpYXHiXTJ6qNzdr4wQXceasPkIpLBYm3ezdsYPefW
        TeF5EhOsxD7khDR2n4GeOuRSqt6Y
X-Google-Smtp-Source: ABdhPJyMbB/Lp5aAEEUdHBkWJ2TZ4lbMkp7W/DWQdz49SKuyZ0RRX/pFClFFabhuVA3cNsiubyUdyA==
X-Received: by 2002:a17:906:490f:: with SMTP id b15mr20526435ejq.180.1592134539987;
        Sun, 14 Jun 2020 04:35:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:3121:abf6:2daf:f274])
        by smtp.gmail.com with ESMTPSA id o24sm6871869ejb.72.2020.06.14.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 04:35:39 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>
Subject: [PATCH] sindex: use -stdc=gnu99
Date:   Sun, 14 Jun 2020 13:35:08 +0200
Message-Id: <20200614113508.19924-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

sindex use C99 for-loops:
	for (int i = 0, ....)

No problem with this but sparse doesn't use this elsewhere yet
and older compilers don't allow C99 by default.

Fix this by adding '-std=gnu99' to the sindex-specific CFLAGS.

Cc: Alexey Gladkov <gladkov.alexey@gmail.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index d1486a0ce373..4bf96f406e5a 100644
--- a/Makefile
+++ b/Makefile
@@ -153,6 +153,7 @@ INST_PROGRAMS += sindex
 INST_MAN1 += sindex.1
 sindex-ldlibs := $(shell $(PKG_CONFIG) --libs sqlite3)
 sindex-cflags := $(shell $(PKG_CONFIG) --cflags sqlite3)
+sindex-cflags += -std=gnu99
 else
 $(warning Your SQLite3 version ($(SQLITE_VERSION)) is too old, 3.24.0 or later is required.)
 endif
-- 
2.27.0


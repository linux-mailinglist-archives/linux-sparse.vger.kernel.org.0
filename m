Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3CC214C99
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgGENLw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgGENLw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:11:52 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D42C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:11:52 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id a8so31005065edy.1
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o2FDY+aEJLs+/Xw+gkTygZSt2UdrUsTOhfatGFYotSM=;
        b=r5jP5ez3KeVp3SLSPJewZNQUSfIBV7MvcvmWGbVAXUpYzG9z23lLJ2NfRvqfKmBqt0
         94mRZXDAM+sZeulSyKiUaECvaA6AeTvnXf4/vtGuyUEXLtJ6KvVaY5XbOO5VvNbASxDb
         a0tCSuThAb3SOm0JXDPHrio/fMC9Ceeoja/LRtvpERTQ0SyIRGYBTaNCR15J+eeTLuP1
         Q52AuMrjWqHKfuoOeFogf4EsrKP3aAc4Eh99by+naAgrd6OKhP+Wr7JqpLxPmH3Y6u2+
         t+Od/z9Ey7gQmJyCDpf5ZbJrDkcgATec/ZDoeTSOTeLDlbfE8A69QV/ZqrikfbTLjRYC
         cRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o2FDY+aEJLs+/Xw+gkTygZSt2UdrUsTOhfatGFYotSM=;
        b=lfjZQOLZwZ2ODc2l4bti/1E+UobvFXJVkR6ai6lkMF927eqGnD5WpLQ9RjQ3Cy7vJ+
         Xk1zsVxorWkYbogvXSqrLDH52hbb7jBcsp54tmQzIG36EkMpQ+IoEeS4j4EX4dqc1HSH
         wRbnCfaMZSMmqd2JbifYE6h171DDPkWpAnCrJUadvMB7Dmu/kuBYNzCO+gQrQQn2PMOW
         kCPNX96ljbY+77BznFJT3Y2mxiv3UFErFFo0COkzdok4Od7urrFffOsEGy0/7cL4G5ox
         P44JQEwwsz1SS1lbtmCE6eWpdH2YpFyhfLF5xM0/1oCiDMDR0bFmZlFkWRdp65iTIyr7
         oF4w==
X-Gm-Message-State: AOAM530TpQtfCg9Q4wlfFQImdP8uBIx2JohftU42J2RITQHw+hs0KuuZ
        OR4YZ81B6yN7PH6JYLKmSNwJre0W
X-Google-Smtp-Source: ABdhPJw4wrYK3OkTnBPSXaQw+hm81w5pO+mZfvlDIAOeOg/c3OR6vU9YIVI/miYqY+pf9ez/7u98zw==
X-Received: by 2002:a50:fe16:: with SMTP id f22mr43980618edt.315.1593954710792;
        Sun, 05 Jul 2020 06:11:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id b4sm19245250edx.96.2020.07.05.06.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:11:50 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/2] predefine: add testcase for multi-token predefines
Date:   Sun,  5 Jul 2020 15:11:45 +0200
Message-Id: <20200705131146.26439-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705131146.26439-1-luc.vanoostenryck@gmail.com>
References: <20200705131146.26439-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The function predefine() and its variants are only valid
if they define a single-token value.

Add a testcase for this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/preprocessor/predef-token.c | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 validation/preprocessor/predef-token.c

diff --git a/validation/preprocessor/predef-token.c b/validation/preprocessor/predef-token.c
new file mode 100644
index 000000000000..6df8ea407fc5
--- /dev/null
+++ b/validation/preprocessor/predef-token.c
@@ -0,0 +1,5 @@
+static __UINT8_TYPE__ u8;
+
+/*
+ * check-name: predef-token
+ */
-- 
2.27.0


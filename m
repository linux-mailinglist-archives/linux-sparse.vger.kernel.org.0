Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBB3214CA8
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgGENQP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:16:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgGENQO (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:16:14 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96794C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:16:14 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id w16so39610714ejj.5
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NkQ8ZbhRxOwIZeRF0qKRmpwYe5og8GovyDkKLP8K/TU=;
        b=doQhEDyu0Sy4u42dVKm8OwPqycIl2wE+Itew2VLTe4qNUPfTDJ/dWn6nkCDzXSKS6S
         U2+NfgifSwFOwLAaB5LhpGTSuY+n8vKiQy/XSyE3oYeFb8dRAjAPCqZYTLng4jH7UfWL
         +F0H3beAXbxt3jFu1wj/CsuMu8vjLypxTVQulWWSBgVEzsIpZxZ4U8v3o0NozGutejl9
         9qkxdcMykg+Dz9yzuxm5Jcxg3nJri1odHHtYqCddXacTxJUXr6+RZZVvuesJL4igAK2K
         Hpb04RioUWAqMhoydeYMF1DU8Bv08TxOfGJ/rY+knvzWdasUHRWG2UOGrMhC3cU+FkpT
         w12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NkQ8ZbhRxOwIZeRF0qKRmpwYe5og8GovyDkKLP8K/TU=;
        b=MFSiSgLS3jNEnAXUIXpyCB+CDKRCItNtAcwSQOLIxUzVYX1cOaNVdpqEhaoR8x1fi+
         98I9DRZD6IMOoHiPsGLXj/7mv9UoUxU0zqcXRC+SKlCGAyUaIMgR+hb1lDV1DZulKPVn
         qf4Xre+9cJ/bQGATg16GKvTKIW1l5uiqhEACvceBgGyP/51TkHGYe4s4e7RRdlLPHh8R
         BkXmChjHZVmhTVI8ivlOu0dOD3+OBqU5kqvb1xlKJ+CiF8B/opHPGJfD9qACw4C6CQ/l
         3/sVfmXvCKleqTS5xU+FL0uJHrA6wf/bSt+GazlmfAa4xQBVL3S/AGIMjqMYaPBxx6lL
         T01A==
X-Gm-Message-State: AOAM532NRqQ9NB6ElC3S3umvpEd6Uu7NJaHDMkBkG0bgY0av7+M07u9a
        okkdAkRHi9BF8ytMR/0nGVzGaaSt
X-Google-Smtp-Source: ABdhPJwSkCfA0gX/+264f9xuAKEJOy0psVd7pN3BQTgdKWeGU+qemRwNuQAfaNoopf/BqWXKe6FT0w==
X-Received: by 2002:a17:906:2a5b:: with SMTP id k27mr38471052eje.82.1593954973191;
        Sun, 05 Jul 2020 06:16:13 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id j21sm7915321edq.20.2020.07.05.06.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:16:12 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/2] predefine: avoid add_pre_buffer() for targets
Date:   Sun,  5 Jul 2020 15:16:04 +0200
Message-Id: <20200705131605.26551-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705131605.26551-1-luc.vanoostenryck@gmail.com>
References: <20200705131605.26551-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Avoid add_pre_buffer() and use one of the predefine...()
variant instead.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 target-arm64.c | 2 +-
 target-riscv.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-arm64.c b/target-arm64.c
index d491b65e5154..8619bd842f9b 100644
--- a/target-arm64.c
+++ b/target-arm64.c
@@ -21,7 +21,7 @@ static void predefine_arm64(const struct target *self)
 	predefine("__aarch64__", 1, "1");
 
 	if (cmodel)
-		add_pre_buffer("#define __AARCH64_CMODEL_%s__ 1\n", cmodel);
+		predefine_strong("__AARCH64_CMODEL_%s__", cmodel);
 }
 
 const struct target target_arm64 = {
diff --git a/target-riscv.c b/target-riscv.c
index 08d036ca04b7..d68fb585c254 100644
--- a/target-riscv.c
+++ b/target-riscv.c
@@ -24,7 +24,7 @@ static void predefine_riscv(const struct target *self)
 	predefine("__riscv_xlen", 1, "%d", ptr_ctype.bit_size);
 
 	if (cmodel)
-		add_pre_buffer("#define __riscv_cmodel_%s 1\n", cmodel);
+		predefine_strong("__riscv_cmodel_%s", cmodel);
 }
 
 const struct target target_riscv32 = {
-- 
2.27.0


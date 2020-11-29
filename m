Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4282C79A2
	for <lists+linux-sparse@lfdr.de>; Sun, 29 Nov 2020 15:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgK2OuN (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 29 Nov 2020 09:50:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgK2OuM (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 29 Nov 2020 09:50:12 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DA1C0613D4
        for <linux-sparse@vger.kernel.org>; Sun, 29 Nov 2020 06:49:31 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id m19so9979457ejl.11
        for <linux-sparse@vger.kernel.org>; Sun, 29 Nov 2020 06:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5PRiPKcB1AyORpScnS0YuvpCigQr/HDEuor6qNADadM=;
        b=VYTrHQS67lhB5ev7Q/bOizA3D0IegMYXjpL4chWIoWoqMKOIEFt5/TjxtXzqr29DoT
         EKejebeh9+j4/94ju+CugdaLAPQ1zHzQ6loAXUo+TbmYPbrZ9vhNqUfPKRE8UWJtBdRR
         2A5NrvdLxYddlAtWS6fDEgHFiQQ0KqzdVAISCbw6UyU8zZZoSMAKIkl8xeETkNPlMmE0
         BYw7hncVs4wr9jgyUu8b2w5Hc6vv+FtniF4L9SqU8O0UrFXhyqh8uxllTo6YN91EuisA
         cyE8dHFE7LwJs6AVKHduG21zjxLQLg4ib9rFPeuPmHc3FlE7XvOGdDUUx8spFp23TJ/A
         MzNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5PRiPKcB1AyORpScnS0YuvpCigQr/HDEuor6qNADadM=;
        b=H9hmxd+qd8ft+1DxHQz/lrMF2bOsYUjmE1Sqtp9jDTeVzfB5Tj3vH0RQOJuVl6KKbA
         LN1n1O9jY6gkeuZkXeTSkhAGtvlS/o0tkO1Ld7QBP5XVJu4shWPzka6NxP6gVNkXsj9k
         VVODTTmokWXVYYl1YYoeYkY+cTAdReN9QEeCLMqRFnyl/n8PsogQHeuuwfB1Gt0cToUX
         ieN1iT7TCaCNooM92g3ZepMRSd+1eAOHqavWBphhzfwVW2OWstvKRRewTd2rmDbJgd8R
         3TvR+7GoHlK8wMQgWq+7tBtfZ9W6mLSRLMxYMMEIkPzuikquY9rfhRRbX6M/Yi1WxGLB
         /4iQ==
X-Gm-Message-State: AOAM532GLuuhhpSBuvNXBxdWn12KEb3LjIlAXbuNXlQDwZ6NNvzMSiw0
        pyFQW0KhXRil/S0FdAqYyjYkHRxWUGI=
X-Google-Smtp-Source: ABdhPJyVx0lObo9rpNPOuugHDNO0jy/EYxb2D+RzomUt9oGksNQOvjiwl/yRYTajz1fzaBJV30pasQ==
X-Received: by 2002:a17:906:8617:: with SMTP id o23mr12186747ejx.274.1606661370502;
        Sun, 29 Nov 2020 06:49:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:b7fe:f700:149a:de72:e1c0:dd0f])
        by smtp.gmail.com with ESMTPSA id p25sm7435649eju.63.2020.11.29.06.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 06:49:29 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/5] make replace_with_pseudo() extern
Date:   Sun, 29 Nov 2020 15:49:20 +0100
Message-Id: <20201129144922.56209-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129144922.56209-1-luc.vanoostenryck@gmail.com>
References: <20201129144922.56209-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This function can be useful since it can be useful in other files,
for example in memops.c

So make it extern..

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 simplify.c | 2 +-
 simplify.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/simplify.c b/simplify.c
index 69eae4f8a5a1..2c587bea3a8a 100644
--- a/simplify.c
+++ b/simplify.c
@@ -443,7 +443,7 @@ static inline int replace_pseudo(struct instruction *insn, pseudo_t *pp, pseudo_
 	return REPEAT_CSE;
 }
 
-static int replace_with_pseudo(struct instruction *insn, pseudo_t pseudo)
+int replace_with_pseudo(struct instruction *insn, pseudo_t pseudo)
 {
 	convert_instruction_target(insn, pseudo);
 	return kill_instruction(insn);
diff --git a/simplify.h b/simplify.h
index 200d79c00a83..ed3dd9716a3e 100644
--- a/simplify.h
+++ b/simplify.h
@@ -5,4 +5,6 @@
 
 int simplify_instruction(struct instruction *insn);
 
+int replace_with_pseudo(struct instruction *insn, pseudo_t pseudo);
+
 #endif
-- 
2.29.2


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E24200E06
	for <lists+linux-sparse@lfdr.de>; Fri, 19 Jun 2020 17:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389003AbgFSPEO (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 19 Jun 2020 11:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391104AbgFSPEJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 19 Jun 2020 11:04:09 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08FFC0613EE
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:07 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id w16so10536550ejj.5
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f1tDaOPhLIPBbrMpWLxA+LoTZXoERFEHqSmTsj+iGTE=;
        b=f+hrRz0gkRpshBZFvN3rgqYVsvEnN7ke9DnHMXE31SVSJUk0ksXlLK7phzr5TqctMY
         Bb0cCT7FiUn3a476OpKeZDi8bHgQe/zasQX0jxemdOZiOGZYwoagw5msroXony6SBl85
         XT4YRRVkR66z5mUG69asVYAbHJ/8ngMefO1Q89YeUGKKWy8CjVWRTmThngiccfkvFSvx
         /cgV2/tqblTSafJaWq7gzG+mbzHrIqG8HlekzIzLO+U3SukRhKSGmzxB8AC5XtkWAtoD
         775neWAsLVHCQdFGeDHhAwo6nJhNSwX5jI8A6HfT2fUBzsV256w3rJuaTV6wTrPZkquc
         NpFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f1tDaOPhLIPBbrMpWLxA+LoTZXoERFEHqSmTsj+iGTE=;
        b=tPg3TpdJaUcf+hoMGNCdhqo7ZrTlmso4O1Hntoy5vlSR4E97tGvrQQWsJPYgHYrqW+
         VnOKFf8KSfvlTa9sW2lk1z5e0+VoFU3SZp6uoeDyc4bNVgU1en7v3/Aqmv52OH678YlR
         kF5irmFHA3fx/dA1klPGgrDA+FwaTLJuuEPi+9liKbnZgaVCwu/OiBzrl73Zr955Ht2I
         O2ci/dQ0aiebEaFad1Fu+KctH1ik2Thdz4ZcC/6DuwghFkksMmz6NiUf2UcWvTMJ1URy
         Gp4wIJs1kQiOL6fcsnB1PWyJjDIArs1/3IB4+dQ+y8ByrXObmG/W4NSi9mNkh3UacCTL
         jq1A==
X-Gm-Message-State: AOAM5339RWaGc7KE7uay3prOKtpqST9uosiJ45EK5O7g2NGrH5KT2Qs8
        6EJEhfwJF/95ums/8SeJ4XhGNhq9
X-Google-Smtp-Source: ABdhPJzop0Js4Nsr9jc2BOGSDWQWX8EUUWUKInX/IXPcCNmvXIutR/sqwK8a1g7/qG+85JdaTRmKVA==
X-Received: by 2002:a17:906:4e0a:: with SMTP id z10mr3937508eju.57.1592579046372;
        Fri, 19 Jun 2020 08:04:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5db0:70:8732:dad2])
        by smtp.gmail.com with ESMTPSA id k22sm4852307edr.93.2020.06.19.08.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 08:04:05 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Marco Elver <elver@google.com>
Subject: [PATCH 3/5] gensel: controlling expression must be lvalue converted
Date:   Fri, 19 Jun 2020 17:02:58 +0200
Message-Id: <20200619150300.63695-4-luc.vanoostenryck@gmail.com>
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
of a generic selection must be lvalue converted. In other words,
the qualifiers must be ignored.

Reported-by: Marco Elver <elver@google.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index cf40eed418b4..d8615a894c0d 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3287,17 +3287,20 @@ static struct symbol *evaluate_generic_selection(struct expression *expr)
 {
 	struct type_expression *map;
 	struct expression *res;
+	struct symbol source;
 	struct symbol *ctrl;
 
 	if (!(ctrl = evaluate_expression(expr->control)))
 		return NULL;
 
+	source = *ctrl;
+	source.ctype.modifiers &= ~(MOD_QUALIFIER|MOD_ATOMIC);
 	for (map = expr->map; map; map = map->next) {
 		struct symbol *stype = map->type;
 
 		if (!evaluate_symbol(stype))
 			continue;
-		if (!type_selection(ctrl, stype))
+		if (!type_selection(&source, stype))
 			continue;
 
 		res = map->expr;
-- 
2.27.0


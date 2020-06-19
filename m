Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD565201428
	for <lists+linux-sparse@lfdr.de>; Fri, 19 Jun 2020 18:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390458AbgFSPEQ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 19 Jun 2020 11:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391108AbgFSPEK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 19 Jun 2020 11:04:10 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E483C0613F0
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:10 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id p20so10485720ejd.13
        for <linux-sparse@vger.kernel.org>; Fri, 19 Jun 2020 08:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1PWnvqF7eagSXt/GJ1aE68oblIr3ILD869FOXO3TdxQ=;
        b=blkWU5ajHxvJdBZYODKTsH90AC6j5oLdXnSDjJS7PrdKWzDmhMXuaEUBOmr/nSh+GW
         wcFjZOXYq2E+G9olumZWVhQbYXgZDuQp/BGLTxN96/TY5LJnyxB6IM5jpmfRdgwKIlpR
         lFqsqZjkc4hpkdU40gWpW7DNiAwRyE6l5WjiQIlR9Y4ZIaWwIJ6ITFa4Zvm/Xv0/p4Ba
         F0ToN9L7opXndsNqFf4zxEySM+dVgADLvA+hTjUNbSm6RJQCJtJNbyye6h9y41EOVPkQ
         +seMdXOH1Elfqs+4EGvtI4LQ7boLSdEd+4d6G7mFFXVeNaLGnhn1RPCWBLhdXeB3VOwM
         xMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1PWnvqF7eagSXt/GJ1aE68oblIr3ILD869FOXO3TdxQ=;
        b=riXAjOGhAsNoTpxP6b7crSTh41xvnm0PvreOGHgCCja/52cukUvEJOsAAcOh9vUyEd
         qZFUDC807K13BExX9tan5q2szEnmqozNYWg/MQezbbyk79Da5aJ5jkLZRixp3mT0jlCM
         WTl1X/e0ZXalNSGgyQDmSUyR/hL/7Lib0k9KtAGoTm2r1HUfXdVJ8JgNjXBWyv+xqLjT
         7qOo/X62UBd7803/Azld3WVHPoceXWr4L221q2NCSLAitcjRKaEYCtmSOUgkbrcPE7uH
         5y8h71kfetCkGjmWIBXq+JcPQETkLaQ+OkXQx+e6j5CxHGs0MJ3kkA2HWsCg4a+MqeSs
         pZ8A==
X-Gm-Message-State: AOAM531MtyTJKADT6V9GRZDeXi1iM+Utg6ZOINsHIAhi6lE4fFYOUVdt
        CpOm6xD8F3Zb+VYIq9QxKzKleiNC
X-Google-Smtp-Source: ABdhPJygTT6pdkQzV6wigwYlaZq0sDJDRtAlr5JTXV1xt3jOJ/n6gkWwJsiAPTJwr+Diu///1aB8Cg==
X-Received: by 2002:a17:906:aec5:: with SMTP id me5mr4298812ejb.54.1592579048607;
        Fri, 19 Jun 2020 08:04:08 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:5db0:70:8732:dad2])
        by smtp.gmail.com with ESMTPSA id k22sm4852307edr.93.2020.06.19.08.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 08:04:08 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/5] gensel: validate the type of the associations
Date:   Fri, 19 Jun 2020 17:03:00 +0200
Message-Id: <20200619150300.63695-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619150300.63695-1-luc.vanoostenryck@gmail.com>
References: <20200619150300.63695-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The type in a generic association must correspond to a complete
type and not a variably modified type.

Add validation for this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/evaluate.c b/evaluate.c
index 491dfa3c6b89..aa0f208006bb 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3299,9 +3299,29 @@ static struct symbol *evaluate_generic_selection(struct expression *expr)
 	source.ctype.modifiers &= ~(MOD_QUALIFIER|MOD_ATOMIC);
 	for (map = expr->map; map; map = map->next) {
 		struct symbol *stype = map->type;
+		struct symbol *base;
 
 		if (!evaluate_symbol(stype))
 			continue;
+
+		if (stype->type == SYM_NODE)
+			base = stype->ctype.base_type;
+
+		if (base->type == SYM_ARRAY && base->array_size) {
+			get_expression_value_silent(base->array_size);
+			if (base->array_size->type == EXPR_VALUE)
+				continue;
+			sparse_error(stype->pos, "variable length array type in generic selection");
+			continue;
+		}
+		if (is_func_type(stype)) {
+			sparse_error(stype->pos, "function type in generic selection");
+			continue;
+		}
+		if (stype->bit_size <= 0 || is_void_type(stype)) {
+			sparse_error(stype->pos, "incomplete type in generic selection");
+			continue;
+		}
 		if (!type_selection(&source, stype))
 			continue;
 
-- 
2.27.0


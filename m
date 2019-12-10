Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAAA7119EF4
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbfLJW7q (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:46 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33748 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJW7q (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:46 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so21996417wrq.0
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kVioipiXHEmhP5HVeMLPs3PQdUVGvSb9ElSwxREjrH4=;
        b=RYPQfRpOADo33JWRCwPRF4McSH+Jrx7BL880FDqHsHQ+eiuDVW5YFws2DaRCRsT5KG
         PuoHslgLcVcITrtd3+ivXjh6VMjqORfkrZiEm0KSPZeF/Zr/CYYTk9OirqA9bFBCTKxA
         Aenm9Qe3/M1R9BKtNuCKk1Hwf/jPTfeYOcc63y5vTjf5ICRGEm2c6OIqG+2ZOdwSAoWd
         +gH8AAPvlk/0cyUXW79kZmir17I8qhhyo/T6LFihAoHZVXRgYF6CnnX+5naiGzXoEYq2
         BouiznK8ZZ39TrSRZJDM9NRiWppCdJhbseGusgqjwZe0NerAHiadHuGkfGM2z+DmrXdL
         DX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kVioipiXHEmhP5HVeMLPs3PQdUVGvSb9ElSwxREjrH4=;
        b=n/8FUd/NFxDyjWTF0RLmSa1kaoywE1O85qxMIyoRjJUJxt0iu4zwklAn6KKmXJOJ2b
         a1bU89XeeARDPfFKBzLzbtApHhAQ9utCxrW5vre++7RvjbdAUDHW5Vhe8yJbykAtA/7C
         /TbXrzHf0UJu2HBPZqhexXoy6qlUDI4A3TK0+hEuW7bNp8m4yHaY7XGtKKOtTrIyoYna
         6q0VJSwXibVfAABqm38QLRqFIe38icsES5AJKDcSxYgzshqO5TSHrKbBm05uEuO7XSbM
         f/2ZRVZ2AoGlvu/mPl7cggpWslaXrBo8vf2K7ZBesp+gPjWIcMMpWJ54lfAkLN1OOmNJ
         4T/Q==
X-Gm-Message-State: APjAAAXjrsReRJFeCRDMNd60A134xVaj90d/Q8J3uR/OXOs+5eGsgTd+
        pK3kdG2x/Kw6gHX/D94D3ZHycKuO
X-Google-Smtp-Source: APXvYqxWAkMOOj6eWc4BMZ945/oAGEezjKV7O2IDADZjt3v3k9Qi6w9r5M5kTg4jxq7ba3NMaeKKTQ==
X-Received: by 2002:adf:df03:: with SMTP id y3mr7075wrl.260.1576018784592;
        Tue, 10 Dec 2019 14:59:44 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:43 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 13/17] fix expansion of initializer (default)
Date:   Tue, 10 Dec 2019 23:59:17 +0100
Message-Id: <20191210225921.94897-14-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, constant_symbol_value() is doing the expansion
of a constant initializer when an explicit one is found
but nothing is done if the initilizer is an implicit one.

Fix this by:
* adding an helper to lookup the corresponding type from
  offset;
* using this helper to get the correct kind for the value:
  - a 0-valued EXPR_VALUE for integers
  - a 0.0-valued EXPR_FVALUE for floats.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expand.c                                | 65 ++++++++++++++++++++++++-
 validation/expand/default-init-struct.c |  1 -
 2 files changed, 63 insertions(+), 3 deletions(-)

diff --git a/expand.c b/expand.c
index 9ab259b13a82..cd348bf5833e 100644
--- a/expand.c
+++ b/expand.c
@@ -621,6 +621,66 @@ static int expand_addressof(struct expression *expr)
 	return expand_expression(expr->unop);
 }
 
+///
+// lookup the type of a struct's memeber at the requested offset
+static struct symbol *find_member(struct symbol *sym, int offset)
+{
+	struct ptr_list *head, *list;
+
+	head = (struct ptr_list *) sym->symbol_list;
+	list = head;
+	if (!head)
+		return NULL;
+	do {
+		int nr = list->nr;
+		int i;
+		for (i = 0; i < nr; i++) {
+			struct symbol *ent = (struct symbol *) list->list[i];
+			int curr = ent->offset;
+			if (curr == offset)
+				return ent;
+			if (curr > offset)
+				return NULL;
+		}
+	} while ((list = list->next) != head);
+	return NULL;
+}
+
+///
+// lookup a suitable default initializer value at the requested offset
+static struct expression *default_initializer(struct symbol *sym, int offset)
+{
+	static struct expression value;
+	struct symbol *type;
+
+redo:
+	switch (sym->type) {
+	case SYM_NODE:
+		sym = sym->ctype.base_type;
+		goto redo;
+	case SYM_STRUCT:
+		type = find_member(sym, offset);
+		if (!type)
+			return NULL;
+		break;
+	case SYM_ARRAY:
+		type = sym->ctype.base_type;
+		break;
+	default:
+		return NULL;
+	}
+
+	if (is_integral_type(type))
+		value.type = EXPR_VALUE;
+	else if (is_float_type(type))
+		value.type = EXPR_FVALUE;
+	else
+		return NULL;
+
+	value.ctype = type;
+	return &value;
+}
+
 /*
  * Look up a trustable initializer value at the requested offset.
  *
@@ -646,10 +706,11 @@ static struct expression *constant_symbol_value(struct symbol *sym, int offset)
 			if (entry->init_offset < offset)
 				continue;
 			if (entry->init_offset > offset)
-				return NULL;
+				break;
 			return entry->init_expr;
 		} END_FOR_EACH_PTR(entry);
-		return NULL;
+
+		value = default_initializer(sym, offset);
 	}
 	return value;
 }
diff --git a/validation/expand/default-init-struct.c b/validation/expand/default-init-struct.c
index c843a1abb960..085dd2d6dca9 100644
--- a/validation/expand/default-init-struct.c
+++ b/validation/expand/default-init-struct.c
@@ -15,7 +15,6 @@ int test_struct(void)
 /*
  * check-name: default-init-struct
  * check-command: test-linearize -Wno-decl -fdump-ir $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: phisrc\\..*return.*\\$0
-- 
2.24.0


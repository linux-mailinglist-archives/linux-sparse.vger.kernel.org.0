Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 687EC119EF8
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727137AbfLJW7v (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:51 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33752 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfLJW7u (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:50 -0500
Received: by mail-wr1-f68.google.com with SMTP id b6so21996532wrq.0
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KufPX5EofecYUyC20FIgVvuRL3M0cmrdIjd/soNFE2w=;
        b=tXlwLeaVU+h41uksU93X4kOPkh6eRgIxm4XrWRGZ2pR/ohXKD+dZUI9685vLNvnvVu
         wnOwzS/cIWHZX9uQOuZNqHqGHw6TehaVIdD2fE6PKFSE7OP2EUCtJe1t+T/I+QJkekKx
         QM8XJ1jrSoq+g3W4Je5ctpcPZQOrU1JnJCYy1y7l4iWxX+FzdOTp4C7Jwn6kW4MdYDaU
         ZlxLSksRsUc5uMiFKuA4VjrUGKDiBh32TR0QAoQ7iz5+dNOcerEVfETQLAfXp2kY/mAA
         flp/URIqNuJy6QgwhEw6WH5n4c3TjxfM0j/HEj97IbtWMAeUTLJvE6kSeWImh+eLl8gp
         iHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KufPX5EofecYUyC20FIgVvuRL3M0cmrdIjd/soNFE2w=;
        b=En1113aR0jURVitBp5z4NGY7N/v4qX+McjyvyT9zfzumBf+5av/3ZK8IFByr6qA3La
         D7zpW8P6TYhcC+WGJ7nUJvN1QLXXWkBm+vgncn7qNqz+EzgsRSV7rLv8oUPyssM+95J1
         LxZQOrWXIphWCbnYp1yBueoKql2g24+lHQ6+qh6uF2J3mEaPMXvUXSk8kfzcRPsAbImL
         CM5JkDLIWs+J7MNSVObVK5/nnr2wZQ+2BwdbISU3NxkxUAiDg5ATGQXAPexJA2A+gsBY
         09eINt26iWLYGxI+AUIAyDUwF1PouItzUzLWirK7IWSNGFiAD8oczEgQEJcXu/+D0oTh
         M+1g==
X-Gm-Message-State: APjAAAXr87FT4A4IqHa9gVDKDNsVnGRa2djXSlTc2cdXq/SwRRWblvED
        jbbr4WPtQtTb+GToYZOW0sLyz7rO
X-Google-Smtp-Source: APXvYqxxW1fCIW4hwuT+yds/0JQaRBY38N39D+x1qDqRRAp/cHECid7/dXxf6kgy85vc5HCXuuG4Tg==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr12690wrw.188.1576018789086;
        Tue, 10 Dec 2019 14:59:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:48 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 17/17] constant expansion of strings
Date:   Tue, 10 Dec 2019 23:59:21 +0100
Message-Id: <20191210225921.94897-18-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

EXPR_STRING can be considered as a kind of specialized
initializer for strings. Using EXPR_INITIALIZER for them
would be much more costly.

However, unlike EXPR_INITIALIZER, EXPR_STRING are not used
by constant_symbol_value() to expand dereferences of symbols
with constant value.

Change this by adding to constant_symbol_value() the code
needed to expand dereferences of strings. Two situations
need to be handled: one for string literals and another
for declared strings.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expand.c                                 | 30 ++++++++++++++++++++++++
 validation/expand/constant-init-string.c |  1 -
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/expand.c b/expand.c
index 1885a4eaad2a..eeddb633c9bf 100644
--- a/expand.c
+++ b/expand.c
@@ -681,6 +681,27 @@ redo:
 	return &value;
 }
 
+static struct expression *constant_string_value(struct expression *e, int offset)
+{
+	static struct expression value;
+	struct string *string;
+	struct symbol *ctype;
+
+	if (e->wide)
+		return NULL;
+	string = e->string;
+	if (offset >= string->length)
+		return NULL;
+	ctype = e->ctype;
+	if (!ctype)
+		return NULL;
+
+	value.type = EXPR_VALUE;
+	value.value = string->data[offset];
+	value.ctype = get_base_type(ctype->ctype.base_type);
+	return &value;
+}
+
 /*
  * Look up a trustable initializer value at the requested offset.
  *
@@ -714,6 +735,15 @@ static struct expression *constant_symbol_value(struct symbol *sym, int offset)
 		} END_FOR_EACH_PTR(entry);
 
 		value = default_initializer(sym, offset);
+	} else if (value->type == EXPR_STRING) {
+		value = constant_string_value(value, offset);
+	} else if (value->type == EXPR_PREOP && value->op == '*') {
+		if (value->unop->type == EXPR_SYMBOL) {
+			struct symbol *sym = value->unop->symbol;
+			struct expression *init = sym->initializer;
+			if (init && init->type == EXPR_STRING)
+				value = constant_string_value(init, offset);
+		}
 	}
 	return value;
 }
diff --git a/validation/expand/constant-init-string.c b/validation/expand/constant-init-string.c
index 42ae9bd3d8a4..033882a0bed9 100644
--- a/validation/expand/constant-init-string.c
+++ b/validation/expand/constant-init-string.c
@@ -7,7 +7,6 @@ char foo(void)
 /*
  * check-name: constant-init-nested-array
  * check-command: test-linearize -Wno-decl -fdump-ir $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: phisrc\\..*\\$63
-- 
2.24.0


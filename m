Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A076C1D8CAE
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbgESA5u (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgESA5s (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:48 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4188DC05BD09
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:48 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id s3so10397979eji.6
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iufauCBwe1knENexzBqbaCYKYlKly8wpPgwPrI9n+kU=;
        b=ZTBqJBjCbz6oN+Tx9zRIxrc7Vn93nKzEEqnrmviEYku2WViW4VUxWi2iSSt7PilcYQ
         0Dlf7ZgagFHezJdZEJkkn9H30kJ6+chJmIdTbx7gzzGDmxSK7EnT/vIoms2+S06p6J/Q
         oPEIN+48ARQppyjI1Z8wQ3ibcOYg90dIvNsjXp/G2mdu3bGHhaYN4IgP/fISpYNUbwEf
         9S2LQRzHKdp6C0M5jXXHKdAAZ8f6Tl4GDxDvev1HG5KDWk3JAtcQYkPFs9V9YHP2tkvy
         NqMLzL9N3TT/hvDMGlxrCGANSwkkqpA6TS0aopqXeQEOSfJxFjb2YBA7kFZfK41d25CG
         xjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iufauCBwe1knENexzBqbaCYKYlKly8wpPgwPrI9n+kU=;
        b=YEusBR+Qi6UuOkL4v46EvRCYso+9ZDLLTAryJh/27pvewxvGlD98ufC8t30g6KAX4U
         1zvQoIKbIOA+7g7KcTfcqHZRO095LZq4VpQRoYwMtnpa5ryFnpAD01foATUU8qtJNMcX
         6WVhIVjzOZ5UGRoFU73fmPBj/IgwDcMs5sKiALWvedNeoZqowptJPuM2qD+/qksHeMmj
         bNQSzcrJ4r9Rfn+wjIm9gDV+HuUqvhH3NUCTSrcyt2TEGi3LHnqIr9V4EaBIqnXdgLQn
         ZCiJZKCDvMgjqGiLqn++1FiSqyPyQ8tLhdZz2IpZTXz+KCV2eDSCMbuOU6tnN10jGnnJ
         Jx0Q==
X-Gm-Message-State: AOAM531YEZD/DfUwEIv3wdzG5ASgTVICOLS/0SdIsHBuy6T/ZhNcndrs
        LxaZhGq8tHB3bdcGstT9MePejZjd
X-Google-Smtp-Source: ABdhPJyZZbi4J0OrhDqz61u/g1ioJFTzezk61SgeomBqBYYdtplWSf/fwgXpNPYJkfehSznGG8yTJg==
X-Received: by 2002:a17:906:7e56:: with SMTP id z22mr16536399ejr.60.1589849866717;
        Mon, 18 May 2020 17:57:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:46 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 14/28] scope: extract bind_symbol_with_scope() from bind_symbol()
Date:   Tue, 19 May 2020 02:57:14 +0200
Message-Id: <20200519005728.84594-15-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In most cases, the scope that must be used for a symbol is
given by its namespace.

However, in some situations a different scope must be used.
This is then set, for exemple by doing the lookup with
the wrong namespace (but corresponding to the desired scope)
and changing it just after to its correct value.

To avoid these contortions, extract from bind_symbol() a version
where the scope can be explicitly given: bind_symbol_with_scope().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.c | 13 +++++++++----
 symbol.h |  1 +
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/symbol.c b/symbol.c
index c2e6f0b426b3..7044ab3f78ce 100644
--- a/symbol.c
+++ b/symbol.c
@@ -671,9 +671,8 @@ static void inherit_static(struct symbol *sym)
 	}
 }
 
-void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
+void bind_symbol_with_scope(struct symbol *sym, struct ident *ident, enum namespace ns, struct scope *scope)
 {
-	struct scope *scope;
 	if (sym->bound) {
 		sparse_error(sym->pos, "internal error: symbol type already bound");
 		return;
@@ -690,7 +689,6 @@ void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
 	sym->ident = ident;
 	sym->bound = 1;
 
-	scope = block_scope;
 	if (ns == NS_SYMBOL && toplevel(scope)) {
 		unsigned mod = MOD_ADDRESSABLE | MOD_TOPLEVEL;
 
@@ -704,11 +702,18 @@ void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
 		}
 		sym->ctype.modifiers |= mod;
 	}
+	bind_scope(sym, scope);
+}
+
+void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
+{
+	struct scope *scope = block_scope;;
+
 	if (ns == NS_MACRO)
 		scope = file_scope;
 	if (ns == NS_LABEL)
 		scope = function_scope;
-	bind_scope(sym, scope);
+	bind_symbol_with_scope(sym, ident, ns, scope);
 }
 
 struct symbol *create_symbol(int stream, const char *name, int type, int namespace)
diff --git a/symbol.h b/symbol.h
index 50dba78a654a..c297c778dfdf 100644
--- a/symbol.h
+++ b/symbol.h
@@ -332,6 +332,7 @@ extern void show_type_list(struct symbol *);
 extern void show_symbol_list(struct symbol_list *, const char *);
 extern void add_symbol(struct symbol_list **, struct symbol *);
 extern void bind_symbol(struct symbol *, struct ident *, enum namespace);
+extern void bind_symbol_with_scope(struct symbol *, struct ident *, enum namespace, struct scope *);
 
 extern struct symbol *examine_symbol_type(struct symbol *);
 extern struct symbol *examine_pointer_target(struct symbol *);
-- 
2.26.2


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC0B105341
	for <lists+linux-sparse@lfdr.de>; Thu, 21 Nov 2019 14:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfKUNhU (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 21 Nov 2019 08:37:20 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51150 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbfKUNhU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 21 Nov 2019 08:37:20 -0500
Received: by mail-wm1-f66.google.com with SMTP id l17so3764730wmh.0
        for <linux-sparse@vger.kernel.org>; Thu, 21 Nov 2019 05:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RA6dKY8Qi5BHZYfAwVsuEqak751WDOQTtqhWTnwuTRs=;
        b=UbREQCezr/ZKpARjCf/Ux+QfSsSKgbBRJ8kPKf+4GjKLIRLj22OGGXEWC4eiIIz6Jn
         FQyZwzXNZJAKMDjQHV414l73fQtttW6K++c5XMplrtUwVADvtcrMqMavOOwBaaGEkmkj
         EXLvIhqsXLuWezHn8Ty1eRS4Ryu2DyeUfNWstaErYGki9oSC5V7JYv7Ki0FYcXEGaWy4
         UVc4iORHgtjRH0/o9LF2rzdsTUnKtlpfC+czLsFqy8pD1M8IoQWCc4yO/k52nGb4yfxP
         dIEXEklLbDCU1d4dflY1vePN059DI84vWZNfPCaacZa1w8VH5O+7l6913TfqQ7WJVNLC
         lylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RA6dKY8Qi5BHZYfAwVsuEqak751WDOQTtqhWTnwuTRs=;
        b=UzMssST1LIlese0bHb0wfn/3TSJmyJthrWTR+nFYVXvJ9LO4P1op7nOozSVY13TFLs
         RsMSCj4iDaHncZow2SAvV9d2woWtRKjwxsrDIAoIa94PB1Pvz3Yut94bWDXTI44hm7nu
         CZ3i3mZe8MKThf/ooOlgwdMF0c08zW8DC1Gewq0VOqAxcyW9mjDUbfGrbGHfZ0okECWa
         jT4D5wpLkVq3ZTgYMmL9EMzXXWT5CrrDSmbCy9wd9i3bz4HFQpd1TftNip20jMuqRZFG
         T9XrRSvvdjyOb0m+ffQybIC22+W3JXcLhHpyLINGyhwj0H0kDET6fYnL5bl38OKnVHUo
         rZSA==
X-Gm-Message-State: APjAAAW13Hu/PPCrMyOKKIcXq9hYVA+CZ1ggCFmyOljohWsPskBCJ57c
        3QemOF81y93CdQm8weitLHZ957Jx
X-Google-Smtp-Source: APXvYqx6BTr5WvrbJM0/+HfoprJDNSNuoTEjj3MaelpQq9qLX712MKkwgy54/5PTGVnFAtFt6BFQcA==
X-Received: by 2002:a1c:6588:: with SMTP id z130mr9222991wmb.87.1574343438179;
        Thu, 21 Nov 2019 05:37:18 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:8828:fc8c:bd94:ae7f])
        by smtp.gmail.com with ESMTPSA id h16sm3268363wrs.48.2019.11.21.05.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 05:37:17 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] allow 'static' forward declaration
Date:   Thu, 21 Nov 2019 14:37:14 +0100
Message-Id: <20191121133714.8342-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A function or an object can be forward-declared as
'static' and then defining with the keyword 'static'
omitted. This is perfectly legal and relatively common.

However, Sparse complains that the definition is not
declared and asks to the dev if should not be static.
This is weird because the function or object *is*
declared and *is* static (or at least should be following
the standard or GCC's rules).

Fix this by letting a new declaration or definition
'inherit' the 'static-ness' of the previous declarations.
This is a bit more complicated than simply copying
MOD_STATIC and must be done when binding the new symbol
because static or extern objects have different scopes.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.c                         | 23 +++++++++++++++++++++++
 validation/static-forward-decl.c | 19 ++++++++++---------
 2 files changed, 33 insertions(+), 9 deletions(-)

diff --git a/symbol.c b/symbol.c
index 90149e5ae..90190eca1 100644
--- a/symbol.c
+++ b/symbol.c
@@ -618,6 +618,27 @@ void check_declaration(struct symbol *sym)
 	}
 }
 
+static void inherit_static(struct symbol *sym)
+{
+	struct symbol *prev;
+
+	// only 'plain' symbols are concerned
+	if (sym->ctype.modifiers & (MOD_STATIC|MOD_EXTERN))
+		return;
+
+	for (prev = sym->next_id; prev; prev = prev->next_id) {
+		if (prev->namespace != NS_SYMBOL)
+			continue;
+		if (prev->scope != file_scope)
+			continue;
+
+		sym->ctype.modifiers |= prev->ctype.modifiers & MOD_STATIC;
+
+		// previous declarations are already converted
+		return;
+	}
+}
+
 void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
 {
 	struct scope *scope;
@@ -641,6 +662,8 @@ void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
 	if (ns == NS_SYMBOL && toplevel(scope)) {
 		unsigned mod = MOD_ADDRESSABLE | MOD_TOPLEVEL;
 
+		inherit_static(sym);
+
 		scope = global_scope;
 		if (sym->ctype.modifiers & MOD_STATIC ||
 		    is_extern_inline(sym)) {
diff --git a/validation/static-forward-decl.c b/validation/static-forward-decl.c
index daad1ecb1..d25d8152a 100644
--- a/validation/static-forward-decl.c
+++ b/validation/static-forward-decl.c
@@ -1,13 +1,14 @@
-static int f(void);
+int fref(void);
+int fref(void) { return 0; }
+
+static
+int floc(void);
+int floc(void) { return 0; }
+
+static
+int oloc;
+int oloc = 0;
 
-int f(void)
-{
-	return 0;
-}
 /*
  * check-name: static forward declaration
- *
- * check-error-start
-static-forward-decl.c:3:5: warning: symbol 'f' was not declared. Should it be static?
- * check-error-end
  */
-- 
2.24.0


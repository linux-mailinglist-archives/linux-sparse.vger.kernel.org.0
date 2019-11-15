Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCDE2FD212
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 01:49:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbfKOAtZ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 19:49:25 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45281 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfKOAtY (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 19:49:24 -0500
Received: by mail-wr1-f65.google.com with SMTP id z10so9032903wrs.12;
        Thu, 14 Nov 2019 16:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmCybGZpCHtyHUH7QWC9xTBOg1KyXzMF3dATXMq1nc4=;
        b=V5LOS+zUiOrrsBd+047QWxdMTQjmdzf6VsrfTwF3iPL6+b9JTIwbPLs1njYT+FEDEt
         VjriyBXqQYqBplPDfqWB3wTAzmFJ+mN7zpNAflpIl9LMt4f8I3Zuult0OdEAwjwjLOCL
         ImVGsvnT9pfiEORz5qYqJ//i1HQbkPs2R47KASnohYlxpI3oWg112N65FNQTdyeYtkxq
         Uhi4pTDsxo3X4ata4qyTl0GDeM/vV6hYM/WGdVTsPWzIN8ELIrRaoCH7BChblohKWzDS
         wY0VeFUVY8uOl0ZT91Kqql4unh7aZU3C9/cpPJbq7ccaF0k89vWILuwfgoLRrwqMg8VA
         WfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tmCybGZpCHtyHUH7QWC9xTBOg1KyXzMF3dATXMq1nc4=;
        b=lqM/ErgwL5wNBlJWcUldcfomjkfT2GyQy9P51OS2nzhq5YBaIZbnZYUfDtgmpJKkxX
         fF67yKb72XWLBFEWUZj74SeMUvSbS3pV82xopcjZuOIP1QKyJsJtj5/HSkw050ojyIa9
         W9BSMpIgUM22aV+CRpBZUO0LxCNN7QuoeOMeFH6sld2q23tam1KadA8BOdK+VXpnxOuE
         wOUnL3mcYJXMGfVl3jX9gh6l2rNKF2jUCMCTCmScAGGOO5V63J0iWsP8/ej49veylDfY
         YTrdfVtqPi832Xe5QofJ+uOOldKbLu/c6q9M33kMp3b4V0HjqdxNIcUKfABWeD3YBs8w
         qopQ==
X-Gm-Message-State: APjAAAVYlyEY3UTeZKe10TmQTiCYTw3rHyENQzDIyl771qz2Yyrf1kpE
        JItjFAnBR9oZQ/OPM6qKF2wTIs7N
X-Google-Smtp-Source: APXvYqylCDz/qDPrM59U3BTHR2vXVtPqtgOSMDahLUioR6kqJpnFcLlqIF59nvzUMRH/fdyXz4eNwg==
X-Received: by 2002:a5d:55c5:: with SMTP id i5mr13053376wrw.385.1573778961863;
        Thu, 14 Nov 2019 16:49:21 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id y2sm8797026wmy.2.2019.11.14.16.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 16:49:21 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     smatch@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        John Levon <john.levon@joyent.com>,
        Alex Kogan <alex.kogan@oracle.com>
Subject: [PATCH] function attributes apply to the function declaration
Date:   Fri, 15 Nov 2019 01:49:13 +0100
Message-Id: <20191115004913.53104-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Function attributes relate to the function declaration they
appear in. Sparse ignore most these attributes but a few ones
have a semantic value: 'pure', 'noreturn' & 'externally_visible'.

Due to how Sparse parse attributes and how these attributes
are stored for functions, the attributes 'pure' & 'noreturn'
are applied not to the function itself but its return type
if the function returns a pointer.

Fix this by extracting these attributes from the declaration
context and ensure they're applied to the declarator.

Reported-by: John Levon <john.levon@joyent.com>
Reported-by: Alex Kogan <alex.kogan@oracle.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c                         | 17 ++++++++++++++++-
 symbol.h                        |  2 ++
 validation/function-attribute.c | 19 +++++++++++++++++++
 3 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 validation/function-attribute.c

diff --git a/parse.c b/parse.c
index fa92fae68..37ffede72 100644
--- a/parse.c
+++ b/parse.c
@@ -2900,6 +2900,21 @@ static struct token *toplevel_asm_declaration(struct token *token, struct symbol
 	return token;
 }
 
+static unsigned long declaration_modifiers(struct decl_state *ctx)
+{
+	unsigned long mods;
+
+	// Storage modifiers only relates to the declaration
+	mods = storage_modifiers(ctx);
+
+	// Function attributes also only relates to the declaration
+	// and must not be present in the function/return type.
+	mods |= ctx->ctype.modifiers & MOD_FUN_ATTR;
+	ctx->ctype.modifiers &=~ MOD_FUN_ATTR;
+
+	return mods;
+}
+
 struct token *external_declaration(struct token *token, struct symbol_list **list,
 		validate_decl_t validate_decl)
 {
@@ -2920,7 +2935,7 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
 
 	/* Parse declaration-specifiers, if any */
 	token = declaration_specifiers(token, &ctx);
-	mod = storage_modifiers(&ctx);
+	mod = declaration_modifiers(&ctx);
 	decl = alloc_symbol(token->pos, SYM_NODE);
 	/* Just a type declaration? */
 	if (match_op(token, ';')) {
diff --git a/symbol.h b/symbol.h
index 4e7e437bf..516b61361 100644
--- a/symbol.h
+++ b/symbol.h
@@ -251,6 +251,8 @@ struct symbol {
 #define MOD_PTRINHERIT	(MOD_QUALIFIER | MOD_NODEREF | MOD_NORETURN | MOD_NOCAST)
 /* modifiers preserved by typeof() operator */
 #define MOD_TYPEOF	(MOD_QUALIFIER | MOD_NOCAST | MOD_SPECIFIER)
+/* modifiers for funtion attributes */
+#define MOD_FUN_ATTR	(MOD_PURE|MOD_NORETURN)
 
 
 /* Current parsing/evaluation function */
diff --git a/validation/function-attribute.c b/validation/function-attribute.c
new file mode 100644
index 000000000..0f2c75922
--- /dev/null
+++ b/validation/function-attribute.c
@@ -0,0 +1,19 @@
+#define __pure __attribute__((pure))
+
+struct s {
+	int x;
+};
+
+static __pure struct s *grab(struct s *ptr)
+{
+	return ptr;
+}
+
+static void foo(struct s *ptr)
+{
+	struct s *ptr = grab(ptr);
+}
+
+/*
+ * check-name: function-attribute
+ */
-- 
2.24.0


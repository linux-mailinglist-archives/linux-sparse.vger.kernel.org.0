Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B64FD220
	for <lists+linux-sparse@lfdr.de>; Fri, 15 Nov 2019 02:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727437AbfKOBD2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 Nov 2019 20:03:28 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40699 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727168AbfKOBD2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 Nov 2019 20:03:28 -0500
Received: by mail-wm1-f65.google.com with SMTP id f3so8527353wmc.5
        for <linux-sparse@vger.kernel.org>; Thu, 14 Nov 2019 17:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wpQ+IRfjFWx6Ga6256RSK3FNc5uw9qS4mZK5yNCwwrA=;
        b=r54fidZl0TsCpHuJIDt6+L5tZwW11N309sGzEXr7EztcRS3czMwF6tp3RX0LUmA/Ki
         fn3Itijj0S9GcFCp4oTKOI+eWoIs4sBdqVHyXKmUrcWjrXTeDs/8qt77nLCoonw9aDiC
         wcnnUQddws8oXYQNtmnJSvqlUVzc2NDJo34Fc4tWe2XdyOWmc/WBVW/D8Esi+0db3RkY
         k4QeaWdEuRFd/iDL1x5cw0GJ5Rb1kdliTMVuwUuVYAQVQlSHjZyBez3UGJaCWNqJzvIj
         3MxIuvBtNUL7aKNaGgNEH0coW6Ptam5cbD1GhePV7lZGMp57M5TJtxFdgFrNdDNQjLJT
         fApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wpQ+IRfjFWx6Ga6256RSK3FNc5uw9qS4mZK5yNCwwrA=;
        b=CGtW90aHH0auv7vTJ1eeG3WVLtKPmAEkVLkWmf29DjYDy6GF6QNhql4K1VKsCm2Saw
         JwavjKtKl+BP+dp9V5oUEqd2QppZ8nCKTmihhGrazCfcodjmuw67ZSH50h96aY6lZI/Y
         mF+fOca9SjzHDkCtmEq+cyGRF+DhvX/9f2yPnSwowWjP/ppUyMKnBB5cZs45b8RRxK3U
         B7xS7GmouGbeSuGhpuQccKA2xd0XKAwFN+irs864yhSRFLThkhKjcoO0RsFR2DxCRzxz
         h15gPwC8XiNjVF5yPNgWF+7FUBUSU2jFfaPFdHbhZbT0ZUxcb1oSAVmjlRcLNZBfhhy6
         BnNA==
X-Gm-Message-State: APjAAAUEGcLQIBESarE2CeMy2hC72CG+umOP6cCiMPUf8iG9VKUKprpj
        jEyl/MVemS8DPH2wytRsVvc1PzeM
X-Google-Smtp-Source: APXvYqwJL07C9X6YHdMgrWcpO9hkg4dtrwaztzBkXJm4SgaKtnWlhCipdgxc5NWilxKNOypKmiWsjg==
X-Received: by 2002:a1c:7412:: with SMTP id p18mr11721652wmc.9.1573779805840;
        Thu, 14 Nov 2019 17:03:25 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:b41c:b7ad:6b56:89fb])
        by smtp.gmail.com with ESMTPSA id p4sm9652387wrx.71.2019.11.14.17.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 17:03:25 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] process MOD_EXT_VISIBLE like other MOD_FUN_ATTRs
Date:   Fri, 15 Nov 2019 02:03:18 +0100
Message-Id: <20191115010318.53315-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The function attribute 'externally_visible' is processed
like a sort of storage modifiers but there is no reason
for it (other than to avoid the problem with function
attributes when returning a pointer) and can now be
processed like the other function attributes.

Fix this by processing it like other attributes modifiers
and adding MOD_EXT_VISIBLE to MOD_FUN_ATTR.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c  | 18 +++---------------
 symbol.h |  3 +--
 2 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/parse.c b/parse.c
index 37ffede72..6cd420972 100644
--- a/parse.c
+++ b/parse.c
@@ -82,7 +82,6 @@ typedef struct token *attr_t(struct token *, struct symbol *,
 
 static attr_t
 	attribute_packed, attribute_aligned, attribute_modifier,
-	attribute_ext_visible,
 	attribute_bitwise,
 	attribute_address_space, attribute_context,
 	attribute_designated_init,
@@ -375,10 +374,6 @@ static struct symbol_op attr_mod_op = {
 	.attribute = attribute_modifier,
 };
 
-static struct symbol_op ext_visible_op = {
-	.attribute = attribute_ext_visible,
-};
-
 static struct symbol_op attr_bitwise_op = {
 	.attribute = attribute_bitwise,
 };
@@ -573,8 +568,8 @@ static struct init_keyword {
 	{"const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
 	{"__const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
 	{"__const__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
-	{"externally_visible",	NS_KEYWORD,	.op = &ext_visible_op },
-	{"__externally_visible__",	NS_KEYWORD,	.op = &ext_visible_op },
+	{"externally_visible",	NS_KEYWORD, MOD_EXT_VISIBLE, .op = &attr_mod_op },
+	{"__externally_visible__", NS_KEYWORD, MOD_EXT_VISIBLE, .op = &attr_mod_op },
 
 	{ "mode",	NS_KEYWORD,	.op = &mode_op },
 	{ "__mode__",	NS_KEYWORD,	.op = &mode_op },
@@ -1117,12 +1112,6 @@ static struct token *attribute_modifier(struct token *token, struct symbol *attr
 	return token;
 }
 
-static struct token *attribute_ext_visible(struct token *token, struct symbol *attr, struct decl_state *ctx)
-{
-	ctx->is_ext_visible = 1;
-	return token;
-}
-
 static struct token *attribute_bitwise(struct token *token, struct symbol *attr, struct decl_state *ctx)
 {
 	if (Wbitwise)
@@ -1360,8 +1349,7 @@ static unsigned long storage_modifiers(struct decl_state *ctx)
 		[SRegister] = MOD_REGISTER
 	};
 	return mod[ctx->storage_class] | (ctx->is_inline ? MOD_INLINE : 0)
-		| (ctx->is_tls ? MOD_TLS : 0)
-		| (ctx->is_ext_visible ? MOD_EXT_VISIBLE : 0);
+		| (ctx->is_tls ? MOD_TLS : 0);
 }
 
 static void set_storage_class(struct position *pos, struct decl_state *ctx, int class)
diff --git a/symbol.h b/symbol.h
index 516b61361..cc8ffd63b 100644
--- a/symbol.h
+++ b/symbol.h
@@ -108,7 +108,6 @@ struct decl_state {
 	struct ident **ident;
 	struct symbol_op *mode;
 	unsigned char prefer_abstract, is_inline, storage_class, is_tls;
-	unsigned char is_ext_visible;
 };
 
 struct symbol_op {
@@ -252,7 +251,7 @@ struct symbol {
 /* modifiers preserved by typeof() operator */
 #define MOD_TYPEOF	(MOD_QUALIFIER | MOD_NOCAST | MOD_SPECIFIER)
 /* modifiers for funtion attributes */
-#define MOD_FUN_ATTR	(MOD_PURE|MOD_NORETURN)
+#define MOD_FUN_ATTR	(MOD_PURE|MOD_NORETURN|MOD_EXT_VISIBLE)
 
 
 /* Current parsing/evaluation function */
-- 
2.24.0


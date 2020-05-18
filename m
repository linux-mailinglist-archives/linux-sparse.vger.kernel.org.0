Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F071D8BB8
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 01:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgERXmR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 19:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgERXmR (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 19:42:17 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7951C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 16:42:16 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id n18so1349313wmj.5
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 16:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6xVLtac67w/TckjMiNMuxNN3nLzum/ivg7kNavZ5o64=;
        b=vcgyzHnJvDiM/LwjdoAaO5wn1/LKm8iB59z94xtP1/JCYidMWBUS/5ftzIe8UlQkmM
         GGnpAo4sfFBINj7t0jw8IfWWcy6bE3DPIygVA/KSEglwdxezX4gYh2+S7t8CJ6Q1ODsq
         brB224M7FPXxk/itnUm74QiUVePnCENQGDu14YpioLApZzw3FzxAYbWhhZYhtRZKWv+L
         eidXwAqx8V4+MKPWADkUzBKm+pSqBkmjCehnEXFcpwxVuHCiMjB2tgEfQ1aEC+h7zCLU
         Ycm02FRhjGixy6C/uAkp3d19ASFo4mkGdDOVGpStoZNa+VeKhOG1B1cYa8fLLbA6n2D2
         4/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6xVLtac67w/TckjMiNMuxNN3nLzum/ivg7kNavZ5o64=;
        b=qk/s0b34yTk2pnewKe6fvcqemS81205kbrf8+VrG+uzjAD4HlrLIHzU0B6rm7bVz04
         rg//HlYYnDPhBfGyieceshb8xP1zS5lV7C6sd7n9z4EHWSAg5Vfx7pdKJZKR3RJZ5boE
         DebAfHul8oIUI5v6stNfs0p5RKPiENyUNOYMRIZBOXswoLWI9KwzOUYeT+1LFYT479zh
         GCH1pAxvci3Yl8DD//pYkiO79+HCNo79M7TB0D5ssPACtY4kcAVuMStdi6IzfOyVav6W
         zg7DryjSyodOUv94+q3e7Ig+fjsEzBIcObvuHVx76r5DyovXBrIX9rcupASliOvQyO4A
         HfNQ==
X-Gm-Message-State: AOAM533sCaJbJQyXNj2KLvyWmyDDnNH9TlWlW2iXHUPx7nOKdUQCXHzI
        R+L9NbpbmAh22oE5A1KzCxHijS0i
X-Google-Smtp-Source: ABdhPJz55EC/rFOCvfPURDrIj+Y3J1RHCd4oiKI+m2HXgTzj2cOZkRHtF7asBsny717fCtzz6SYglQ==
X-Received: by 2002:a1c:bbc5:: with SMTP id l188mr1816960wmf.163.1589845335160;
        Mon, 18 May 2020 16:42:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id l11sm1597264wmf.28.2020.05.18.16.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 16:42:14 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/3] attribute: 'externally_visible' is just another 'declaration' modifier
Date:   Tue, 19 May 2020 01:42:07 +0200
Message-Id: <20200518234207.84150-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518234207.84150-1-luc.vanoostenryck@gmail.com>
References: <20200518234207.84150-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Now that the distinction is made between type modifiers and
'declaration' modifiers, there is no more reasons to parse
this attribute differently than other attributes/modifiers.
Even more so because this special casing made this attribute
to be ignored when placed after the declarator.

So, use the the generic code for 'declaration modifiers'
to parse this attribute.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c                    | 18 +++---------------
 symbol.h                   |  1 -
 validation/attr-visible.c  |  1 -
 validation/attr-visible2.c |  1 -
 4 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/parse.c b/parse.c
index 8e4be227cec1..c1a72ae250d3 100644
--- a/parse.c
+++ b/parse.c
@@ -84,7 +84,6 @@ typedef struct token *attr_t(struct token *, struct symbol *,
 static attr_t
 	attribute_packed, attribute_aligned, attribute_modifier,
 	attribute_function,
-	attribute_ext_visible,
 	attribute_bitwise,
 	attribute_address_space, attribute_context,
 	attribute_designated_init,
@@ -389,10 +388,6 @@ static struct symbol_op attr_fun_op = {
 	.attribute = attribute_function,
 };
 
-static struct symbol_op ext_visible_op = {
-	.attribute = attribute_ext_visible,
-};
-
 static struct symbol_op attr_bitwise_op = {
 	.attribute = attribute_bitwise,
 };
@@ -573,6 +568,8 @@ static struct init_keyword {
 	{ "__safe__",	NS_KEYWORD,	MOD_SAFE, 	.op = &attr_mod_op },
 	{ "unused",	NS_KEYWORD,	MOD_UNUSED,	.op = &attr_mod_op },
 	{ "__unused__",	NS_KEYWORD,	MOD_UNUSED,	.op = &attr_mod_op },
+	{ "externally_visible",	NS_KEYWORD, MOD_EXT_VISIBLE,.op = &attr_mod_op },
+	{ "__externally_visible__", NS_KEYWORD,MOD_EXT_VISIBLE,.op = &attr_mod_op },
 	{ "force",	NS_KEYWORD,	.op = &attr_force_op },
 	{ "__force__",	NS_KEYWORD,	.op = &attr_force_op },
 	{ "bitwise",	NS_KEYWORD,	MOD_BITWISE,	.op = &attr_bitwise_op },
@@ -592,8 +589,6 @@ static struct init_keyword {
 	{"__const__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
 	{"gnu_inline",	NS_KEYWORD,	MOD_GNU_INLINE,	.op = &attr_fun_op },
 	{"__gnu_inline__",NS_KEYWORD,	MOD_GNU_INLINE,	.op = &attr_fun_op },
-	{"externally_visible",	NS_KEYWORD,	.op = &ext_visible_op },
-	{"__externally_visible__",	NS_KEYWORD,	.op = &ext_visible_op },
 
 	{ "mode",	NS_KEYWORD,	.op = &mode_op },
 	{ "__mode__",	NS_KEYWORD,	.op = &mode_op },
@@ -1155,12 +1150,6 @@ static struct token *attribute_function(struct token *token, struct symbol *attr
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
@@ -1399,8 +1388,7 @@ static unsigned long decl_modifiers(struct decl_state *ctx)
 	};
 	unsigned long mods = ctx->ctype.modifiers & MOD_DECLARE;
 	ctx->ctype.modifiers &= ~MOD_DECLARE;
-	return mod[ctx->storage_class]
-		| (ctx->is_ext_visible ? MOD_EXT_VISIBLE : 0) | mods;
+	return mod[ctx->storage_class] | mods;
 }
 
 static void set_storage_class(struct position *pos, struct decl_state *ctx, int class)
diff --git a/symbol.h b/symbol.h
index 26f92ca79492..92ccbddb2c04 100644
--- a/symbol.h
+++ b/symbol.h
@@ -109,7 +109,6 @@ struct decl_state {
 	struct symbol_op *mode;
 	unsigned long f_modifiers;		// function attributes
 	unsigned char prefer_abstract, storage_class;
-	unsigned char is_ext_visible;
 	unsigned char autotype;
 };
 
diff --git a/validation/attr-visible.c b/validation/attr-visible.c
index 38ee857522ca..ce35e4e53ac8 100644
--- a/validation/attr-visible.c
+++ b/validation/attr-visible.c
@@ -9,5 +9,4 @@ int flag __visible;
 /*
  * check-name: attr-visible
  * check-command: sparse -Wdecl $file
- * check-known-to-fail
  */
diff --git a/validation/attr-visible2.c b/validation/attr-visible2.c
index 62949b479aea..989181692107 100644
--- a/validation/attr-visible2.c
+++ b/validation/attr-visible2.c
@@ -6,5 +6,4 @@ int arr[2] __visible;
 /*
  * check-name: attr-visible-after
  * check-command: sparse -Wdecl $file
- * check-known-to-fail
  */
-- 
2.26.2


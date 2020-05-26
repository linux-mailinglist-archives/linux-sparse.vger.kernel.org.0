Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F046C1D8BB7
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 01:43:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgERXmQ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 19:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgERXmQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 19:42:16 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE68BC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 16:42:15 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id z72so1367922wmc.2
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 16:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sV/DS1/J9QjRIX7ZRotxk2KLRHajomK+z5I5VIt2HBg=;
        b=YjXQ63UYPMdh38w7r4BNFbEW6fxGBTO1rl161JD1O27EtmCDUn9zlvn9M/bC5ifgdI
         4HYEz4G3wtTADrhESn+PLK5QF7MiTwI6N0C2ab5tsGE5X/Qfwf9impOI0hI7LNuBz7u9
         Xlg9AZ06XkdmLUL3KcaJ9uE02oBn32omATSUuMFtAdqdc7qAA5R27gtNP4bV+CFyHx7+
         SMAv3fcuIBXmTW6JEMax0c1NuHZ8oF5oQkEeLST/6TKiWDS6/z0OIrAE8O+7/2ImeCN2
         stpl2KAW8F0SjfflLo0OvsTO87Rx8r8n0DLuOeU6NGq074JK1VRsxZF9r0sAKbPuqYHN
         xQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sV/DS1/J9QjRIX7ZRotxk2KLRHajomK+z5I5VIt2HBg=;
        b=Jh/mONpRbLqO7Uh8E1H2VRhAUaHOMYUFDJhRUZiRJv4dm40VWxrRhd85s7GaKm8jdo
         jNdvvPEzuvPZDOEFJw2bKhKwiXdIUV3zi6eM/1AoBQY9BUppT2L5w7IquYQpAq6Lwy4q
         FpB0ZPOBqBjt7clcQXtHYYGA2DLOoyRo/IFNfvbLtBBGBmtdH/poPUQWfaYciH4rRWRc
         d0rS95/ryf/4CUBXdjNji3D0KefRUUyWfpTF6syevZmDSpW9jnmpp6v9tM7PI9XDf8m3
         Np+0dV04wLETChrNQVYFaeD9ai1MX1ODvg7aXJCA4tfhiK2QlO0+/VWNINNROrh7mwWJ
         CGmw==
X-Gm-Message-State: AOAM531mlnIJ2z/8mnzMG+7A2MoY1DrADKp921mdVKz3RvYfJhArTl4e
        93pu4grgttxuYtA94oYrnJWj6ZGA
X-Google-Smtp-Source: ABdhPJxYEvA6ZxQ2MUiNaZNqc4RXWew3dz9MLRNO6HW0GMBFV0ERasoct5bmzibCUaVnioC6ajRYiQ==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr1886596wme.2.1589845334404;
        Mon, 18 May 2020 16:42:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id l11sm1597264wmf.28.2020.05.18.16.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 16:42:13 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/3] attribute: 'inline' is just another 'declaration' modifier
Date:   Tue, 19 May 2020 01:42:06 +0200
Message-Id: <20200518234207.84150-3-luc.vanoostenryck@gmail.com>
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

So, use the the generic code for 'declaration modifiers'
to parse this attribute.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c  | 4 ++--
 symbol.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parse.c b/parse.c
index 81b2116fcf8b..8e4be227cec1 100644
--- a/parse.c
+++ b/parse.c
@@ -1399,7 +1399,7 @@ static unsigned long decl_modifiers(struct decl_state *ctx)
 	};
 	unsigned long mods = ctx->ctype.modifiers & MOD_DECLARE;
 	ctx->ctype.modifiers &= ~MOD_DECLARE;
-	return mod[ctx->storage_class] | (ctx->is_inline ? MOD_INLINE : 0)
+	return mod[ctx->storage_class]
 		| (ctx->is_ext_visible ? MOD_EXT_VISIBLE : 0) | mods;
 }
 
@@ -1475,7 +1475,7 @@ static struct token *attribute_force(struct token *token, struct symbol *attr, s
 
 static struct token *inline_specifier(struct token *next, struct decl_state *ctx)
 {
-	ctx->is_inline = 1;
+	apply_qualifier(&next->pos, &ctx->ctype, MOD_INLINE);
 	return next;
 }
 
diff --git a/symbol.h b/symbol.h
index 95f90a5c33be..26f92ca79492 100644
--- a/symbol.h
+++ b/symbol.h
@@ -108,7 +108,7 @@ struct decl_state {
 	struct ident **ident;
 	struct symbol_op *mode;
 	unsigned long f_modifiers;		// function attributes
-	unsigned char prefer_abstract, is_inline, storage_class;
+	unsigned char prefer_abstract, storage_class;
 	unsigned char is_ext_visible;
 	unsigned char autotype;
 };
@@ -264,7 +264,7 @@ struct symbol {
 /* do not warn when these are duplicated */
 #define MOD_DUP_OK	(MOD_UNUSED|MOD_GNU_INLINE)
 /* must be part of the declared symbol, not its type */
-#define MOD_DECLARE	(MOD_STORAGE|MOD_TLS|MOD_GNU_INLINE|MOD_UNUSED|MOD_PURE|MOD_NORETURN|MOD_EXT_VISIBLE)
+#define MOD_DECLARE	(MOD_STORAGE|MOD_INLINE|MOD_TLS|MOD_GNU_INLINE|MOD_UNUSED|MOD_PURE|MOD_NORETURN|MOD_EXT_VISIBLE)
 
 
 
-- 
2.26.2


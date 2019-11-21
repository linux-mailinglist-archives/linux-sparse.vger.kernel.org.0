Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1784A1052BA
	for <lists+linux-sparse@lfdr.de>; Thu, 21 Nov 2019 14:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbfKUNLg (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 21 Nov 2019 08:11:36 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52756 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfKUNLg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 21 Nov 2019 08:11:36 -0500
Received: by mail-wm1-f65.google.com with SMTP id l1so3660243wme.2
        for <linux-sparse@vger.kernel.org>; Thu, 21 Nov 2019 05:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=06lU5GkV+WPSvelm/EQXEPzrKlcnYLCakKKQ2Y4wzOc=;
        b=SDfZK1itZc4FfDoJGVE0oqgeLvOINv8WhTTQyFbmOFORfLQ4CuAd0chXVRN51g6FBq
         oGAbxLkDpii6Wws2Rv4iDF13mkgGRMA6YBfhJqu/ilZM1m4WpJpmz8ZaW0luUJU2O1oJ
         xqKtMUKO/3l3aS4vg2dABde+xKf2rDDCmWIlJtFxNj6LxWcCA/CXoO4eFD5XVQMuI3A2
         aU1WFdfAFulsFrgoieJvlm6ybF2ek2UpsTHReZhVm+Nrd+0kpdm6islG52YfWVav9c1Y
         EJssNIexuRED732xQY+aoU6/AHK6NN11rpHBvGBhwB9wkHtA9h2LZYYsnkOTnhY04a1u
         D+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=06lU5GkV+WPSvelm/EQXEPzrKlcnYLCakKKQ2Y4wzOc=;
        b=CVSxleMYWwEMKS9uA1bwto/JqGmXP0UZcd83XMU9/mrF2PdjPkRFRv0/zLZVc95HRA
         LmJy7s+lG4fQf84EhJwK4h0epq440MczedlpiOyaYnPPPf4yiHRn3l8zi3JGIhV3gzJ2
         +Ao73PrhG8hpb2k/J3NHGnRWi4fVR/axZYsezP3KuhCjIZ05zDUPefq6E2dhb+rtLB5R
         K3zgcTTnMkpp22EALGO4dlZ7UIgm5Qc20EUY3lHm9A1Vw1fE7GKkTjow46sZKScDCy/H
         +m5f57HWNb8fFWFMqb5ETTxsSXWXOAk5AovXMcRj3fePAlVvOKSEL39kDeWM7SyQeudw
         OslQ==
X-Gm-Message-State: APjAAAXORfmv03pxoQ8Res/Vjve5Wwi8gjDgcSTi7FinadZuy2AEXzUV
        GBtwBBHMwrWDjlkuz1WsVFaryjBJ
X-Google-Smtp-Source: APXvYqzvv8g9Sy8Wwhn/pp1w8jLgEqlHKTvo4BcNa1k+lRmUp1a5oU6NHy2YR/9S2IJSRxdHECkiYw==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr10426371wmc.9.1574341893544;
        Thu, 21 Nov 2019 05:11:33 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:8828:fc8c:bd94:ae7f])
        by smtp.gmail.com with ESMTPSA id d11sm3210231wrn.28.2019.11.21.05.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 05:11:32 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2] let function definition inherit prototype attributes
Date:   Thu, 21 Nov 2019 14:11:28 +0100
Message-Id: <20191121131128.7563-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's common to declare a function with the attribute
'pure' or 'noreturn' and to omit the attribute in the
function definition. It mak somehow sense since the
information conveyed by these attributes are destined
to the function users not the function itself.

So, when checking declaration/definition, let the
current symbol inherit any function attributes present
in previous declarations.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---

The patch is also available for review & testing at:
	git://github.com/lucvoo/sparse-dev.git fun-attr-inherit

Changes since v1:
* the old name was 'allow omitted function attribute in definition'
* change the approach: instead of filtering out these attributes at
  check-time, let's inherit them at declaration-time.


 symbol.c                                                 | 9 +++++++++
 ...ion-attribute-omitted.c => function-redecl-funattr.c} | 3 +--
 validation/function-redecl2.c                            | 3 ---
 3 files changed, 10 insertions(+), 5 deletions(-)
 rename validation/{function-attribute-omitted.c => function-redecl-funattr.c} (75%)

diff --git a/symbol.c b/symbol.c
index 90149e5ae..bafa7c432 100644
--- a/symbol.c
+++ b/symbol.c
@@ -588,6 +588,14 @@ struct symbol *befoul(struct symbol *type)
 	return NULL;
 }
 
+static void inherit_declaration(struct symbol *sym, struct symbol *prev)
+{
+	unsigned long mods = prev->ctype.modifiers;
+
+	// inherit function attributes
+	sym->ctype.modifiers |= mods & MOD_FUN_ATTR;
+}
+
 void check_declaration(struct symbol *sym)
 {
 	int warned = 0;
@@ -598,6 +606,7 @@ void check_declaration(struct symbol *sym)
 			continue;
 		if (sym->scope == next->scope) {
 			sym->same_symbol = next;
+			inherit_declaration(sym, next);
 			return;
 		}
 		/* Extern in block level matches a TOPLEVEL non-static symbol */
diff --git a/validation/function-attribute-omitted.c b/validation/function-redecl-funattr.c
similarity index 75%
rename from validation/function-attribute-omitted.c
rename to validation/function-redecl-funattr.c
index 43b301d8f..b1e2fb195 100644
--- a/validation/function-attribute-omitted.c
+++ b/validation/function-redecl-funattr.c
@@ -9,6 +9,5 @@ void __noreturn	n(void);
 void		n(void) { while (1) ; }
 
 /*
- * check-name: function-attribute-omitted
- * check-known-to-fail
+ * check-name: function-redecl-funattr
  */
diff --git a/validation/function-redecl2.c b/validation/function-redecl2.c
index 3435aa00c..ef396137a 100644
--- a/validation/function-redecl2.c
+++ b/validation/function-redecl2.c
@@ -25,7 +25,4 @@ void func2(int a)
 
 /*
  * check-name: function-redecl2
- *
- * check-known-to-fail
- *
  */
-- 
2.24.0


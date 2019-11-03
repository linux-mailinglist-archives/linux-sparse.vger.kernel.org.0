Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69C7ED3DF
	for <lists+linux-sparse@lfdr.de>; Sun,  3 Nov 2019 17:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbfKCQ2q (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 3 Nov 2019 11:28:46 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53060 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfKCQ2q (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 3 Nov 2019 11:28:46 -0500
Received: by mail-wm1-f67.google.com with SMTP id c17so6788029wmk.2
        for <linux-sparse@vger.kernel.org>; Sun, 03 Nov 2019 08:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Dj9Qtj4gZeEY0g0DjyxvIVaSQaDOhfACTrK0MyjhP8=;
        b=pUDBAUFy6PEd054OpX2vzbUwJZFNr4ZkkwpW0ckOUmujou+U751aZRCjL6TXfeWLt3
         Swm1gbajJ1CpbSWkL86tvktCZJsfF21oE9a1FnxUWJ7X6sLWZjvdLDDx1Sn5CKlasvZ9
         FdU8NBnyhIIN5kkevjhRJGeTqaRwufzUmsKLR80UgbomMrRJsYiyOtwtlrZOSX7bQ3pd
         +6ugQJuuTM7KeHf76glbHlYFx7PHEMwqCcP+JUqgUIpLpC04plHFQGhn5xFHres7xBIc
         9AQdLWff/A4UgdtnbFmHuSWkScU4BPB3waYi1p9sRqXv0/zOOEWdRWf8CR6tPvC9LOry
         VWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Dj9Qtj4gZeEY0g0DjyxvIVaSQaDOhfACTrK0MyjhP8=;
        b=m57JN+bstjg0EXB3wh1RCMCOgOB8s0rETqV0c6wgw0L/duchEcygaZYz7txkgGYLBV
         fQlu6s7y75Ekwe7lfJOJf8BF4PNGYcfd0uFn614gyxrkyXHHcvgZtamIBNPSfg0zqLus
         hWRA1DWY9ISHt6Dv7ImwmwGP44Phyvr4wG9BVltbWj4lCAlNgI5nvI6USRZM20dtbrRC
         TuJg3b2fIbnYCPH9g0/x8pwf5K0QHBf2p7f8ARvQzwTrsLLNBGCfSQ5h/OAp5IAyi7QF
         Vv1RVXm0YwxyKjsIpZ+0/Vjykfgz7VjcZ/wRyTFK2i3CODEO+4ACv5G6NamKR5aRsSFg
         3sUA==
X-Gm-Message-State: APjAAAXKY/2eH1VPf4CAlXUp3E4mG5CSIV1vrL/JZZncUHcE1rvBtGhZ
        UwCxUtrL5lxMFLg6ha7GwiSQPjeG
X-Google-Smtp-Source: APXvYqxXkNGGCwqzMff0yEMSHxxMLGKBKjeOLAMBeuK4LYSVNVf68wReHedMotlRk7tpP9o004nKiQ==
X-Received: by 2002:a1c:e386:: with SMTP id a128mr20013478wmh.52.1572798523794;
        Sun, 03 Nov 2019 08:28:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:d83d:1405:3788:2299])
        by smtp.gmail.com with ESMTPSA id o189sm20902060wmo.23.2019.11.03.08.28.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2019 08:28:43 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/4] remove unneeded MOD_TYPE
Date:   Sun,  3 Nov 2019 17:26:35 +0100
Message-Id: <20191103162635.66442-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
References: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

MOD_TYPE is used for the sparse extension which allow
to directly compare types with each others.

Expressions for direct type are EXPR_TYPE with the type in
expr->symbol and the expression itself having it's type
(expr->ctype) set to &type_ctype. This is one of the few
base/builtin types and is the only one which van have MOD_TYPE.

Howver, the MOD_TYPE is not needed (like bad_ctype doesn't need
a MOD_BAD, or incomplete_ctype ....). There is also a single
place where MOD_TYPE is tested: is_type_ctype(), itself used
a single time.

So:
* rewrite the unique test using is_type_ctype() by directly
  comparing with &type_ctype instead.
* remove now unused is_type_ctype()
* remove MOD_TYPE from type_ctype's definition
* remove MOD_TYPE's definition.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 gdbhelpers   | 3 ---
 show-parse.c | 1 -
 symbol.c     | 2 +-
 symbol.h     | 4 ++--
 4 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/gdbhelpers b/gdbhelpers
index 2fe9336dd..8d186cee7 100644
--- a/gdbhelpers
+++ b/gdbhelpers
@@ -152,9 +152,6 @@ define gdb_show_ctype
 	if ($arg0->modifiers & MOD_ASSIGNED)
 		printf "MOD_ASSIGNED "
 	end
-	if ($arg0->modifiers & MOD_TYPE)
-		printf "MOD_TYPE "
-	end
 	if ($arg0->modifiers & MOD_SAFE)
 		printf "MOD_SAFE "
 	end
diff --git a/show-parse.c b/show-parse.c
index 7b65ba679..68b3e7186 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -140,7 +140,6 @@ const char *modifier_string(unsigned long mod)
 		{MOD_NODEREF,		"[noderef]"},
 		{MOD_TOPLEVEL,		"[toplevel]"},
 		{MOD_ASSIGNED,		"[assigned]"},
-		{MOD_TYPE,		"[type]"},
 		{MOD_SAFE,		"[safe]"},
 		{MOD_USERTYPE,		"[usertype]"},
 		{MOD_NORETURN,		"[noreturn]"},
diff --git a/symbol.c b/symbol.c
index a410af43a..116b1040f 100644
--- a/symbol.c
+++ b/symbol.c
@@ -742,7 +742,7 @@ static const struct ctype_declare {
 } ctype_declaration[] = {
 	{ &bool_ctype,	    SYM_BASETYPE, MOD_UNSIGNED,		    &bits_in_bool,	     &max_int_alignment, &int_type },
 	{ &void_ctype,	    SYM_BASETYPE, 0,			    NULL,	     NULL,		 NULL },
-	{ &type_ctype,	    SYM_BASETYPE, MOD_TYPE,		    NULL,		     NULL,		 NULL },
+	{ &type_ctype,	    SYM_BASETYPE, 0,			    NULL,	     NULL,		 NULL },
 	{ &incomplete_ctype,SYM_BASETYPE, 0,			    NULL,		     NULL,		 NULL },
 	{ &bad_ctype,	    SYM_BASETYPE, 0,			    NULL,		     NULL,		 NULL },
 
diff --git a/symbol.h b/symbol.h
index ee7088718..fd536ed6e 100644
--- a/symbol.h
+++ b/symbol.h
@@ -222,7 +222,7 @@ struct symbol {
 #define MOD_UNSIGNED		0x00004000
 #define MOD_EXPLICITLY_SIGNED	0x00008000
 
-#define MOD_TYPE		0x00010000
+//      UNUSED			0x00010000
 #define MOD_USERTYPE		0x00020000
 #define MOD_CHAR		0x00040000
 #define MOD_SHORT		0x00080000
@@ -373,7 +373,7 @@ static inline int is_signed_type(struct symbol *sym)
 
 static inline int is_type_type(struct symbol *type)
 {
-	return (type->ctype.modifiers & MOD_TYPE) != 0;
+	return type == &type_ctype;
 }
 
 static inline int is_ptr_type(struct symbol *type)
-- 
2.23.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 947DC10A578
	for <lists+linux-sparse@lfdr.de>; Tue, 26 Nov 2019 21:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbfKZUaf (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 15:30:35 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56231 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbfKZUaf (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 15:30:35 -0500
Received: by mail-wm1-f66.google.com with SMTP id a131so362843wme.5
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 12:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vYX/AAT2yfQ8E6kYvuQL6ebfOTh49Y4rP14ced6l/R8=;
        b=txCAW0QpCZ9si7sFyj6IviwOgxFOrrGJLCRQvCWDbdnB8VwARWISPZcE+3UDAlMxAZ
         4NbGySkxpzTvm5lyC8XWaYNAjrLNlOvKkMtGQDY91gHXbSBxUoe5YHK6TK/3LP5uhWXD
         CD8JxX9KOiyhYxRiJnBP7BncnqBX0QBVDDirrLIt6aF/TeRSAird6bR+EFfZBJmS/s0X
         uzGP5hP4XKCbVBCdMxTtSC4NAkHSy6LjBaoRIFLX2RMjU3XtU+BXqTWl6W/I94AgLIia
         yl4XaMPuX4ph4sSqDoPFYvUFU142WLam0Raoq17kdc7BjqRbmngv7xR6vFrSQoPjaFkC
         fGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vYX/AAT2yfQ8E6kYvuQL6ebfOTh49Y4rP14ced6l/R8=;
        b=SLIpXoOIg3V9cbMvdkDfBzr9wfpgzOtofJGryAf2J7yYaTZutpnkN9toIyv8WsLAWd
         ee4MfsuAzdmjTPJt4T3LOtAD0P7VaSutIlVrxRwWlELsMDw1bL/fooCc9pO5yNmoGav3
         siHuCcJkYWCgv3a8lva8MFrWAdafmMJrBuvsLxFZxQkqGpmTQnG8qDutYrLwgRwAHBQE
         PghcKHj2q1QckM+QoVeCF8vOf7kQvRym87O0QsaLJSIp7iAP0nTQn678FD78ADpy/103
         /VrtIP8C5XZicV1hysyYHE1vn2Hv5JfQJrgcmhO/DOlKEo3OdLzDjWfbuJGSlPSTnBYh
         emlA==
X-Gm-Message-State: APjAAAXZRKAw5yo+FdT7BoDKNz/+ZLeSDr4/xl/D2ShPENn7DKceNrMA
        WZTRDE3D7BSvnl0mUiIpqh3E8BVJ
X-Google-Smtp-Source: APXvYqx5wsIL7Hp5vTgoWVTw+g3k/iercilhhkvJ0/+komjy38cGuzBtgGfJVThjaFcrjsxyDLzAzA==
X-Received: by 2002:a1c:720b:: with SMTP id n11mr810269wmc.60.1574800232010;
        Tue, 26 Nov 2019 12:30:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id z6sm2802381wrw.36.2019.11.26.12.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 12:30:31 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ramsay Jones <ramsay@ramsayjones.plus.com>
Subject: [PATCH] spec: replace lllong_ctype by int128_ctype
Date:   Tue, 26 Nov 2019 21:30:29 +0100
Message-Id: <20191126203029.63676-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Sparse knows about __int128_t, __uint128_t & __int128.

However, internally, these types are treated as a kind of 128-bit
'long long long' type. It's mainly a question of variable naming,
but these types are also displayed by show_typename() as
'long long long' which can't be parsed back, neither by GCC,
nor even  by sparse itself.

So, rename the variables to use 'int128' and let show_typename()
display these types as '[signed|unsigned] __int128'.

Reported-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c      | 14 +++++++-------
 show-parse.c |  6 +++---
 symbol.c     |  8 ++++----
 symbol.h     |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/parse.c b/parse.c
index 4f7ba0c9a..6db3cba73 100644
--- a/parse.c
+++ b/parse.c
@@ -493,8 +493,8 @@ static struct init_keyword {
 	/* Predeclared types */
 	{ "__builtin_va_list", NS_TYPEDEF, .type = &ptr_ctype, .op = &spec_op },
 	{ "__builtin_ms_va_list", NS_TYPEDEF, .type = &ptr_ctype, .op = &spec_op },
-	{ "__int128_t",	NS_TYPEDEF, .type = &lllong_ctype, .op = &spec_op },
-	{ "__uint128_t",NS_TYPEDEF, .type = &ulllong_ctype, .op = &spec_op },
+	{ "__int128_t",	NS_TYPEDEF, .type = &sint128_ctype, .op = &spec_op },
+	{ "__uint128_t",NS_TYPEDEF, .type = &uint128_ctype, .op = &spec_op },
 	{ "_Float32",	NS_TYPEDEF, .type = &float32_ctype, .op = &spec_op },
 	{ "_Float32x",	NS_TYPEDEF, .type = &float32x_ctype, .op = &spec_op },
 	{ "_Float64",	NS_TYPEDEF, .type = &float64_ctype, .op = &spec_op },
@@ -1229,8 +1229,8 @@ static struct symbol *to_TI_mode(struct symbol *ctype)
 {
 	if (ctype->ctype.base_type != &int_type)
 		return NULL;
-	return ctype->ctype.modifiers & MOD_UNSIGNED ? &ulllong_ctype
-						     : &slllong_ctype;
+	return ctype->ctype.modifiers & MOD_UNSIGNED ? &uint128_ctype
+						     : &sint128_ctype;
 }
 
 static struct symbol *to_pointer_mode(struct symbol *ctype)
@@ -1569,13 +1569,13 @@ Catch_all:
 }
 
 static struct symbol * const int_types[] =
-	{&char_ctype, &short_ctype, &int_ctype, &long_ctype, &llong_ctype, &lllong_ctype};
+	{&char_ctype, &short_ctype, &int_ctype, &long_ctype, &llong_ctype, &int128_ctype};
 static struct symbol * const signed_types[] =
 	{&schar_ctype, &sshort_ctype, &sint_ctype, &slong_ctype, &sllong_ctype,
-	 &slllong_ctype};
+	 &sint128_ctype};
 static struct symbol * const unsigned_types[] =
 	{&uchar_ctype, &ushort_ctype, &uint_ctype, &ulong_ctype, &ullong_ctype,
-	 &ulllong_ctype};
+	 &uint128_ctype};
 static struct symbol * const real_types[] =
 	{&float_ctype, &double_ctype, &ldouble_ctype};
 static struct symbol * const * const types[] = {
diff --git a/show-parse.c b/show-parse.c
index a0436cbe0..f0ea9caea 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -235,9 +235,9 @@ static struct ctype_name {
 	{ & llong_ctype, "long long", "LL" },
 	{ &sllong_ctype, "signed long long", "LL" },
 	{ &ullong_ctype, "unsigned long long", "ULL" },
-	{ & lllong_ctype, "long long long", "LLL" },
-	{ &slllong_ctype, "signed long long long", "LLL" },
-	{ &ulllong_ctype, "unsigned long long long", "ULLL" },
+	{ & int128_ctype, "__int128", "" },
+	{ &sint128_ctype, "signed __int128", "" },
+	{ &uint128_ctype, "unsigned __int128", "" },
 
 	{ &void_ctype,   "void", "" },
 	{ &bool_ctype,   "bool", "" },
diff --git a/symbol.c b/symbol.c
index 79951a076..53ea037a5 100644
--- a/symbol.c
+++ b/symbol.c
@@ -694,7 +694,7 @@ struct symbol	bool_ctype, void_ctype, type_ctype,
 		int_ctype, sint_ctype, uint_ctype,
 		long_ctype, slong_ctype, ulong_ctype,
 		llong_ctype, sllong_ctype, ullong_ctype,
-		lllong_ctype, slllong_ctype, ulllong_ctype,
+		int128_ctype, sint128_ctype, uint128_ctype,
 		float_ctype, double_ctype, ldouble_ctype,
 		string_ctype, ptr_ctype, lazy_ptr_ctype,
 		incomplete_ctype, label_ctype, bad_ctype,
@@ -774,9 +774,9 @@ static const struct ctype_declare {
 	{ &llong_ctype,        T__INT( 2, longlong) },
 	{ &sllong_ctype,       T_SINT( 2, longlong) },
 	{ &ullong_ctype,       T_UINT( 2, longlong) },
-	{ &lllong_ctype,       T__INT( 3, longlonglong) },
-	{ &slllong_ctype,      T_SINT( 3, longlonglong) },
-	{ &ulllong_ctype,      T_UINT( 3, longlonglong) },
+	{ &int128_ctype,       T__INT( 3, type128) },
+	{ &sint128_ctype,      T_SINT( 3, type128) },
+	{ &uint128_ctype,      T_UINT( 3, type128) },
 
 	{ &float_ctype,        T_FLOAT(-1, float) },
 	{ &double_ctype,       T_FLOAT( 0, double) },
diff --git a/symbol.h b/symbol.h
index ad65a9044..e60d91365 100644
--- a/symbol.h
+++ b/symbol.h
@@ -272,7 +272,7 @@ extern struct symbol	bool_ctype, void_ctype, type_ctype,
 			int_ctype, sint_ctype, uint_ctype,
 			long_ctype, slong_ctype, ulong_ctype,
 			llong_ctype, sllong_ctype, ullong_ctype,
-			lllong_ctype, slllong_ctype, ulllong_ctype,
+			int128_ctype, sint128_ctype, uint128_ctype,
 			float_ctype, double_ctype, ldouble_ctype,
 			string_ctype, ptr_ctype, lazy_ptr_ctype,
 			incomplete_ctype, label_ctype, bad_ctype,
-- 
2.24.0


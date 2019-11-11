Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5525F7554
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbfKKNsB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:48:01 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50783 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbfKKNsA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:48:00 -0500
Received: by mail-wm1-f67.google.com with SMTP id l17so12591370wmh.0
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yv6AnQIr2AbJ5TC1yXbtGHvaFQBFGMuEA59a53Ejk4g=;
        b=jX6ONkEIqzaKi1ilpruWI+Dc98I6Y3MH56uCaT7dFpMtQFJeC7plmD2t7IVJRYpkf9
         VOcPS3Z1yHex9/VJmHof6UJUF4vaTUpsEdBU7hgDqIp4/G2T897ielccuGKX+2g9Hev0
         aUjY3e/rtGsB84iAt+MXjPRvXc5sG6yB7L7poHQNzet8NtECeEZc/9p5g7pkm1DCk1ll
         Zek6qkeufSIFqwpB6B2puGi0vf6DMSNHUTm2x0dhUdbzI+RINvFKe0oBqQd/sSdSigNa
         2iOVI6dc3Z5IoTEcxyN1ySgvIbn1tMxp4NRZAtv791M/23VsbsCcBWM/4Q9vNc4NTHuf
         MH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yv6AnQIr2AbJ5TC1yXbtGHvaFQBFGMuEA59a53Ejk4g=;
        b=r83Hva8gyrURrgJQKmTfG8e/FjNMYNZ7jOrpXkFdJ25Xe1xHhZe45ATn5ucSysyVGf
         zIIUtDseEvITMnEx/v+MR8pC8IMXEDSj5Wgn6RjVGfA+JkEo653furDQmFk16ibEBzoh
         6GupEHkrfb6ZJTj47yXrqtVR6dCeg7aIAhBt/y9FAuazI+stbJKhurJ9QIZV7QzDLhpw
         Uf1Smrv4XYrT2JFkAkFKu0bU8TL0KnJftmTyoLqEQik4Xj+phdN1EmvrDp4u6U62DChl
         bqTjvp+bohTToiqV2YKKLkz//h2FRdP4k3toh4l4QRqC8OnKhtsBZor0OAt3fVhME/QO
         Tjxw==
X-Gm-Message-State: APjAAAW6WHIsTb9Cywr9TOIoZ2Yy5lI4xKR/mnoVKqy4qJW0qiCY0CfU
        y37pW1iNCrLjnhEfxLPnzUEvTWgT
X-Google-Smtp-Source: APXvYqzNwOWguTy2Y0waOD+TJzQQCqEW7CzuTFp0o9E2uEgxQGtHy67ONfCCMPQmsK54UE65q5Y+bg==
X-Received: by 2002:a1c:1b06:: with SMTP id b6mr20003619wmb.3.1573480078829;
        Mon, 11 Nov 2019 05:47:58 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:58 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 8/9] types: use llong instead of longlong, ldouble for ...
Date:   Mon, 11 Nov 2019 14:47:46 +0100
Message-Id: <20191111134747.79516-9-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
References: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

These shortened names are used elsewhere too but the may
reason for the change is to try to make ctype_declare[]
more readable.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expression.c |  2 +-
 lib.c        |  2 +-
 symbol.c     | 16 ++++++++--------
 target.c     | 10 +++++-----
 target.h     |  6 +++---
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/expression.c b/expression.c
index ffb6cb9dc..e1720f194 100644
--- a/expression.c
+++ b/expression.c
@@ -325,7 +325,7 @@ static void get_number_value(struct expression *expr, struct token *token)
 		size = 2;
 		do_warn |= 1;
 	}
-	bits = bits_in_longlong - 1;
+	bits = bits_in_llong - 1;
 	if (value & (~1ULL << bits))
 		goto Eoverflow;
 	if (!(value & (1ULL << bits)))
diff --git a/lib.c b/lib.c
index fd45da5d1..74a01a83c 100644
--- a/lib.c
+++ b/lib.c
@@ -1443,7 +1443,7 @@ static void predefined_macros(void)
 
 	predefined_sizeof("FLOAT", "", bits_in_float);
 	predefined_sizeof("DOUBLE", "", bits_in_double);
-	predefined_sizeof("LONG_DOUBLE", "", bits_in_longdouble);
+	predefined_sizeof("LONG_DOUBLE", "", bits_in_ldouble);
 
 	predefine("__ORDER_LITTLE_ENDIAN__", 1, "1234");
 	predefine("__ORDER_BIG_ENDIAN__", 1, "4321");
diff --git a/symbol.c b/symbol.c
index 90149e5ae..a7cbe08b4 100644
--- a/symbol.c
+++ b/symbol.c
@@ -759,21 +759,21 @@ static const struct ctype_declare {
 	{ &long_ctype,	    SYM_BASETYPE, MOD_SIGNED | MOD_LONG,    &bits_in_long,	     &max_int_alignment, &int_type },
 	{ &slong_ctype,	    SYM_BASETYPE, MOD_ESIGNED | MOD_LONG,   &bits_in_long,	     &max_int_alignment, &int_type },
 	{ &ulong_ctype,	    SYM_BASETYPE, MOD_UNSIGNED | MOD_LONG,  &bits_in_long,	     &max_int_alignment, &int_type },
-	{ &llong_ctype,	    SYM_BASETYPE, MOD_SIGNED | MOD_LL,	    &bits_in_longlong,       &max_int_alignment, &int_type },
-	{ &sllong_ctype,    SYM_BASETYPE, MOD_ESIGNED | MOD_LL,	    &bits_in_longlong,       &max_int_alignment, &int_type },
-	{ &ullong_ctype,    SYM_BASETYPE, MOD_UNSIGNED | MOD_LL,    &bits_in_longlong,       &max_int_alignment, &int_type },
-	{ &lllong_ctype,    SYM_BASETYPE, MOD_SIGNED | MOD_LLL,	    &bits_in_longlonglong,   &max_int_alignment, &int_type },
-	{ &slllong_ctype,   SYM_BASETYPE, MOD_ESIGNED | MOD_LLL,    &bits_in_longlonglong,   &max_int_alignment, &int_type },
-	{ &ulllong_ctype,   SYM_BASETYPE, MOD_UNSIGNED | MOD_LLL,   &bits_in_longlonglong,   &max_int_alignment, &int_type },
+	{ &llong_ctype,	    SYM_BASETYPE, MOD_SIGNED | MOD_LL,	    &bits_in_llong,       &max_int_alignment, &int_type },
+	{ &sllong_ctype,    SYM_BASETYPE, MOD_ESIGNED | MOD_LL,	    &bits_in_llong,       &max_int_alignment, &int_type },
+	{ &ullong_ctype,    SYM_BASETYPE, MOD_UNSIGNED | MOD_LL,    &bits_in_llong,       &max_int_alignment, &int_type },
+	{ &lllong_ctype,    SYM_BASETYPE, MOD_SIGNED | MOD_LLL,	    &bits_in_lllong,   &max_int_alignment, &int_type },
+	{ &slllong_ctype,   SYM_BASETYPE, MOD_ESIGNED | MOD_LLL,    &bits_in_lllong,   &max_int_alignment, &int_type },
+	{ &ulllong_ctype,   SYM_BASETYPE, MOD_UNSIGNED | MOD_LLL,   &bits_in_lllong,   &max_int_alignment, &int_type },
 
 	{ &float_ctype,	    SYM_BASETYPE,  0,			    &bits_in_float,          &max_fp_alignment,  &fp_type },
 	{ &double_ctype,    SYM_BASETYPE, MOD_LONG,		    &bits_in_double,         &max_fp_alignment,  &fp_type },
-	{ &ldouble_ctype,   SYM_BASETYPE, MOD_LONG | MOD_LONGLONG,  &bits_in_longdouble,     &max_fp_alignment,  &fp_type },
+	{ &ldouble_ctype,   SYM_BASETYPE, MOD_LONG | MOD_LONGLONG,  &bits_in_ldouble,     &max_fp_alignment,  &fp_type },
 
 	{ &float32_ctype,   SYM_BASETYPE,  0,			    &bits_in_type32,          &max_fp_alignment, &fp_type },
 	{ &float32x_ctype,  SYM_BASETYPE, MOD_LONG,		    &bits_in_double,         &max_fp_alignment,  &fp_type },
 	{ &float64_ctype,   SYM_BASETYPE,  0,			    &bits_in_type64,          &max_fp_alignment, &fp_type },
-	{ &float64x_ctype,  SYM_BASETYPE, MOD_LONG | MOD_LONGLONG,  &bits_in_longdouble,     &max_fp_alignment,  &fp_type },
+	{ &float64x_ctype,  SYM_BASETYPE, MOD_LONG | MOD_LONGLONG,  &bits_in_ldouble,     &max_fp_alignment,  &fp_type },
 	{ &float128_ctype,  SYM_BASETYPE,  0,			    &bits_in_type128,         &max_alignment,    &fp_type },
 
 	{ &string_ctype,    SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &char_ctype },
diff --git a/target.c b/target.c
index 90097818f..4ec736258 100644
--- a/target.c
+++ b/target.c
@@ -28,8 +28,8 @@ int bits_in_char = 8;
 int bits_in_short = 16;
 int bits_in_int = 32;
 int bits_in_long = 32;
-int bits_in_longlong = 64;
-int bits_in_longlonglong = 128;
+int bits_in_llong = 64;
+int bits_in_lllong = 128;
 
 int max_int_alignment = 4;
 
@@ -38,7 +38,7 @@ int max_int_alignment = 4;
  */
 int bits_in_float = 32;
 int bits_in_double = 64;
-int bits_in_longdouble = 128;
+int bits_in_ldouble = 128;
 
 int max_fp_alignment = 16;
 
@@ -121,7 +121,7 @@ void init_target(void)
 	case MACH_S390:
 	case MACH_S390X:
 	case MACH_SPARC32:
-		bits_in_longdouble = 64;
+		bits_in_ldouble = 64;
 		max_fp_alignment = 8;
 		break;
 	case MACH_X86_64:
@@ -130,7 +130,7 @@ void init_target(void)
 		/* fall through */
 	case MACH_I386:
 	case MACH_M68K:
-		bits_in_longdouble = 96;
+		bits_in_ldouble = 96;
 		max_fp_alignment = 4;
 		break;
 	default:
diff --git a/target.h b/target.h
index 8bbe494f8..36e7610a0 100644
--- a/target.h
+++ b/target.h
@@ -25,8 +25,8 @@ extern int bits_in_char;
 extern int bits_in_short;
 extern int bits_in_int;
 extern int bits_in_long;
-extern int bits_in_longlong;
-extern int bits_in_longlonglong;
+extern int bits_in_llong;
+extern int bits_in_lllong;
 
 extern int max_int_alignment;
 
@@ -35,7 +35,7 @@ extern int max_int_alignment;
  */
 extern int bits_in_float;
 extern int bits_in_double;
-extern int bits_in_longdouble;
+extern int bits_in_ldouble;
 
 extern int max_fp_alignment;
 
-- 
2.24.0


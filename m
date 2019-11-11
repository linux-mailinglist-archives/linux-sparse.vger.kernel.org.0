Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC256F7558
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfKKNsD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:48:03 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41340 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbfKKNsB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:48:01 -0500
Received: by mail-wr1-f67.google.com with SMTP id p4so14695124wrm.8
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1eMwrBna0llc9tyi8DkD9f4Iu/JvMA18j4Z7XZ5ahqk=;
        b=rwzTkYEkFLesK1v5wtAxAR0Gly+cv6u5o5t/Lmg6KxaauesOuTqdExzrRE9UZ6kwcL
         7wnDXNMms7ipYHSRoLz8o5HlBmwFRvHYGOGCfcKXElv3zzp42eVcSPX2eZhJp4UfWSjT
         1XeIjRYKnn1N7RUq/BRvkrUlVIsceEzya4oAEOdWHCl1k9pD3AuoBuqFARehTmFzdTzk
         lV0YLT+nYrjQTvDztMCe12jvMt4vKR1MYkkYP5dBko9XHbnmpEXaKMCfELpOupVyzayN
         lhVPgzdrefpIOI8lcPGu4bEJFzWnz8oi5p5YVoSihJO+vPOJQNiJllXJG0EtOM1nXhKR
         deMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1eMwrBna0llc9tyi8DkD9f4Iu/JvMA18j4Z7XZ5ahqk=;
        b=J3qTvlxjmfGhC95GxMv/9JKwG1c3dwxe+Rk+0OxU6G29BtLcO5j8TKJQSCqwlOTQfD
         BakVcQF/056snnROrTK1RKl1KEDyPf5NiBG7YFkeVIha3zFfK42WHTQu/fKlQk8l8nqX
         SCuda+yOAiv/R3cHQ2Q9Jw3oy0DhR+0+JiAbtwoVoyq2RHjWiMxHo9qTV3o5pGNJsUDX
         X+LHOCTRtG+lr7M3yE3ASAvqJxkWSjJfIAABwgJ79zLzPT+q6NcckXkeT+bj4G0aHqwa
         oinhNO2uRZ2oKKcKGHpKh7nqnG+Mm6XVWyFrVyh3L75bJrtyRVzn+2Grnt3AD2ptP669
         EOVA==
X-Gm-Message-State: APjAAAXtMyMYX4SfHPSka9dmabfvEBmO1iTO6ZAWkXXRXZOhMofkkNDc
        AT/CF/58NM+7iausiYIGPBvXCG/5
X-Google-Smtp-Source: APXvYqybdRVLSi90DoQ8D+eoHSfANtUYa3o6D3WcB3Z9WOFaQd2N8GaGabnlxR4myhMqxkI96eTQkQ==
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr8028209wrj.102.1573480079827;
        Mon, 11 Nov 2019 05:47:59 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:59 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 9/9] spec: make ctype_declare[] more readable
Date:   Mon, 11 Nov 2019 14:47:47 +0100
Message-Id: <20191111134747.79516-10-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
References: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The table ctype_declare[] is used to initialize the builtin types.
It contains quite a bit information and is thus quite large and
is difficult to read.

Fix this by using some macros to abstract the specificities of
the different kind of types, making the table narrower and much
more readable.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 symbol.c | 114 ++++++++++++++++++++++++++++++-------------------------
 1 file changed, 63 insertions(+), 51 deletions(-)

diff --git a/symbol.c b/symbol.c
index a7cbe08b4..c032d6d90 100644
--- a/symbol.c
+++ b/symbol.c
@@ -733,6 +733,18 @@ static int bits_in_type128 = 128;
 #define MOD_ESIGNED (MOD_SIGNED | MOD_EXPLICITLY_SIGNED)
 #define MOD_LL (MOD_LONG | MOD_LONGLONG)
 #define MOD_LLL MOD_LONGLONGLONG
+
+#define T_BASETYPE      SYM_BASETYPE, 0, NULL, NULL, NULL
+#define T_INT(R, S, M)  SYM_BASETYPE, (R|M), &bits_in_##S, &max_int_alignment, &int_type
+#define T__INT(R, S)    T_INT(R, S, MOD_SIGNED)
+#define T_SINT(R, S)    T_INT(R, S, MOD_ESIGNED)
+#define T_UINT(R, S)    T_INT(R, S, MOD_UNSIGNED)
+#define T_FLOAT_(R,S,A) SYM_BASETYPE, R, &bits_in_##S, A, &fp_type
+#define T_FLOAT(R, S)   T_FLOAT_(R, S, &max_fp_alignment)
+#define T_PTR(B)        SYM_PTR, 0, &bits_in_pointer, &pointer_alignment, B
+#define T_NODE(M,B,S,A) SYM_NODE, M, S, A, B
+#define T_CONST(B,S,A)  T_NODE(MOD_CONST, B, S, A)
+
 static const struct ctype_declare {
 	struct symbol *ptr;
 	enum type type;
@@ -741,57 +753,57 @@ static const struct ctype_declare {
 	int *maxalign;
 	struct symbol *base_type;
 } ctype_declaration[] = {
-	{ &bool_ctype,	    SYM_BASETYPE, MOD_UNSIGNED,		    &bits_in_bool,	     &max_int_alignment, &int_type },
-	{ &void_ctype,	    SYM_BASETYPE, 0,			    NULL,	     NULL,		 NULL },
-	{ &type_ctype,	    SYM_BASETYPE, 0,			    NULL,	     NULL,		 NULL },
-	{ &incomplete_ctype,SYM_BASETYPE, 0,			    NULL,		     NULL,		 NULL },
-	{ &bad_ctype,	    SYM_BASETYPE, 0,			    NULL,		     NULL,		 NULL },
-
-	{ &char_ctype,	    SYM_BASETYPE, MOD_SIGNED | MOD_CHAR,    &bits_in_char,	     &max_int_alignment, &int_type },
-	{ &schar_ctype,	    SYM_BASETYPE, MOD_ESIGNED | MOD_CHAR,   &bits_in_char,	     &max_int_alignment, &int_type },
-	{ &uchar_ctype,	    SYM_BASETYPE, MOD_UNSIGNED | MOD_CHAR,  &bits_in_char,	     &max_int_alignment, &int_type },
-	{ &short_ctype,	    SYM_BASETYPE, MOD_SIGNED | MOD_SHORT,   &bits_in_short,	     &max_int_alignment, &int_type },
-	{ &sshort_ctype,    SYM_BASETYPE, MOD_ESIGNED | MOD_SHORT,  &bits_in_short,	     &max_int_alignment, &int_type },
-	{ &ushort_ctype,    SYM_BASETYPE, MOD_UNSIGNED | MOD_SHORT, &bits_in_short,	     &max_int_alignment, &int_type },
-	{ &int_ctype,	    SYM_BASETYPE, MOD_SIGNED,		    &bits_in_int,	     &max_int_alignment, &int_type },
-	{ &sint_ctype,	    SYM_BASETYPE, MOD_ESIGNED,		    &bits_in_int,	     &max_int_alignment, &int_type },
-	{ &uint_ctype,	    SYM_BASETYPE, MOD_UNSIGNED,		    &bits_in_int,	     &max_int_alignment, &int_type },
-	{ &long_ctype,	    SYM_BASETYPE, MOD_SIGNED | MOD_LONG,    &bits_in_long,	     &max_int_alignment, &int_type },
-	{ &slong_ctype,	    SYM_BASETYPE, MOD_ESIGNED | MOD_LONG,   &bits_in_long,	     &max_int_alignment, &int_type },
-	{ &ulong_ctype,	    SYM_BASETYPE, MOD_UNSIGNED | MOD_LONG,  &bits_in_long,	     &max_int_alignment, &int_type },
-	{ &llong_ctype,	    SYM_BASETYPE, MOD_SIGNED | MOD_LL,	    &bits_in_llong,       &max_int_alignment, &int_type },
-	{ &sllong_ctype,    SYM_BASETYPE, MOD_ESIGNED | MOD_LL,	    &bits_in_llong,       &max_int_alignment, &int_type },
-	{ &ullong_ctype,    SYM_BASETYPE, MOD_UNSIGNED | MOD_LL,    &bits_in_llong,       &max_int_alignment, &int_type },
-	{ &lllong_ctype,    SYM_BASETYPE, MOD_SIGNED | MOD_LLL,	    &bits_in_lllong,   &max_int_alignment, &int_type },
-	{ &slllong_ctype,   SYM_BASETYPE, MOD_ESIGNED | MOD_LLL,    &bits_in_lllong,   &max_int_alignment, &int_type },
-	{ &ulllong_ctype,   SYM_BASETYPE, MOD_UNSIGNED | MOD_LLL,   &bits_in_lllong,   &max_int_alignment, &int_type },
-
-	{ &float_ctype,	    SYM_BASETYPE,  0,			    &bits_in_float,          &max_fp_alignment,  &fp_type },
-	{ &double_ctype,    SYM_BASETYPE, MOD_LONG,		    &bits_in_double,         &max_fp_alignment,  &fp_type },
-	{ &ldouble_ctype,   SYM_BASETYPE, MOD_LONG | MOD_LONGLONG,  &bits_in_ldouble,     &max_fp_alignment,  &fp_type },
-
-	{ &float32_ctype,   SYM_BASETYPE,  0,			    &bits_in_type32,          &max_fp_alignment, &fp_type },
-	{ &float32x_ctype,  SYM_BASETYPE, MOD_LONG,		    &bits_in_double,         &max_fp_alignment,  &fp_type },
-	{ &float64_ctype,   SYM_BASETYPE,  0,			    &bits_in_type64,          &max_fp_alignment, &fp_type },
-	{ &float64x_ctype,  SYM_BASETYPE, MOD_LONG | MOD_LONGLONG,  &bits_in_ldouble,     &max_fp_alignment,  &fp_type },
-	{ &float128_ctype,  SYM_BASETYPE,  0,			    &bits_in_type128,         &max_alignment,    &fp_type },
-
-	{ &string_ctype,    SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &char_ctype },
-	{ &ptr_ctype,	    SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &void_ctype },
-	{ &null_ctype,	    SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &void_ctype },
-	{ &label_ctype,	    SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &void_ctype },
-	{ &lazy_ptr_ctype,  SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &void_ctype },
-	{ &int_ptr_ctype,   SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &int_ctype },
-	{ &uint_ptr_ctype,  SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &uint_ctype },
-	{ &long_ptr_ctype,  SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &long_ctype },
-	{ &ulong_ptr_ctype, SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &ulong_ctype },
-	{ &llong_ptr_ctype, SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &llong_ctype },
-	{ &ullong_ptr_ctype,SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &ullong_ctype },
-
-	{ &const_void_ctype, SYM_NODE,	  MOD_CONST,		    NULL, NULL, &void_ctype },
-	{ &const_char_ctype, SYM_NODE,	  MOD_CONST,		    &bits_in_char, &max_int_alignment, &char_ctype },
-	{ &const_ptr_ctype, SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &const_void_ctype },
-	{ &const_string_ctype,SYM_PTR,	  0,			    &bits_in_pointer,        &pointer_alignment, &const_char_ctype },
+	{ &bool_ctype,         T_INT(0,          bool, MOD_UNSIGNED) },
+	{ &void_ctype,         T_BASETYPE },
+	{ &type_ctype,         T_BASETYPE },
+	{ &incomplete_ctype,   T_BASETYPE },
+	{ &bad_ctype,          T_BASETYPE },
+
+	{ &char_ctype,         T__INT(MOD_CHAR,  char) },
+	{ &schar_ctype,        T_SINT(MOD_CHAR,  char) },
+	{ &uchar_ctype,        T_UINT(MOD_CHAR,  char) },
+	{ &short_ctype,        T__INT(MOD_SHORT, short) },
+	{ &sshort_ctype,       T_SINT(MOD_SHORT, short) },
+	{ &ushort_ctype,       T_UINT(MOD_SHORT, short) },
+	{ &int_ctype,          T__INT(0,         int) },
+	{ &sint_ctype,         T_SINT(0,         int) },
+	{ &uint_ctype,         T_UINT(0,         int) },
+	{ &long_ctype,         T__INT(MOD_LONG,  long) },
+	{ &slong_ctype,        T_SINT(MOD_LONG,  long) },
+	{ &ulong_ctype,        T_UINT(MOD_LONG,  long) },
+	{ &llong_ctype,        T__INT(MOD_LL,    llong) },
+	{ &sllong_ctype,       T_SINT(MOD_LL,    llong) },
+	{ &ullong_ctype,       T_UINT(MOD_LL,    llong) },
+	{ &lllong_ctype,       T__INT(MOD_LLL,   lllong) },
+	{ &slllong_ctype,      T_SINT(MOD_LLL,   lllong) },
+	{ &ulllong_ctype,      T_UINT(MOD_LLL,   lllong) },
+
+	{ &float_ctype,        T_FLOAT(0,        float) },
+	{ &double_ctype,       T_FLOAT(MOD_LONG, double) },
+	{ &ldouble_ctype,      T_FLOAT(MOD_LL,   ldouble) },
+
+	{ &float32_ctype,      T_FLOAT(0,        type32) },
+	{ &float32x_ctype,     T_FLOAT(MOD_LONG, double) },
+	{ &float64_ctype,      T_FLOAT(MOD_LONG, type64) },
+	{ &float64x_ctype,     T_FLOAT(MOD_LONG, ldouble) },
+	{ &float128_ctype,     T_FLOAT_(MOD_LL,  type128, &max_alignment) },
+
+	{ &string_ctype,       T_PTR(&char_ctype) },
+	{ &ptr_ctype,          T_PTR(&void_ctype) },
+	{ &null_ctype,         T_PTR(&void_ctype) },
+	{ &label_ctype,        T_PTR(&void_ctype) },
+	{ &lazy_ptr_ctype,     T_PTR(&void_ctype) },
+	{ &int_ptr_ctype,      T_PTR(&int_ctype) },
+	{ &uint_ptr_ctype,     T_PTR(&uint_ctype) },
+	{ &long_ptr_ctype,     T_PTR(&long_ctype) },
+	{ &ulong_ptr_ctype,    T_PTR(&ulong_ctype) },
+	{ &llong_ptr_ctype,    T_PTR(&llong_ctype) },
+	{ &ullong_ptr_ctype,   T_PTR(&ullong_ctype) },
+	{ &const_ptr_ctype,    T_PTR(&const_void_ctype) },
+	{ &const_string_ctype, T_PTR(&const_char_ctype) },
+
+	{ &const_void_ctype,   T_CONST(&void_ctype, NULL, NULL) },
+	{ &const_char_ctype,   T_CONST(&char_ctype, &bits_in_char, &max_int_alignment)},
 	{ NULL, }
 };
 #undef MOD_LLL
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937611F5D2A
	for <lists+linux-sparse@lfdr.de>; Wed, 10 Jun 2020 22:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgFJU1t (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 10 Jun 2020 16:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726988AbgFJU1s (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 10 Jun 2020 16:27:48 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085E7C03E96B
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:47 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id g1so2354113edv.6
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NMYfcbmUSyc3eYMPryOU6A5sp46LtbktYk98kJXgeuE=;
        b=g4RuYOYNCV1Zzi85iSRaaurP+Gclunl0Z6nC07r7PEIiloGQmVL5qJMiOREN/yO9sT
         APA0fcx3yfYnH5WV+dCqbXp31GXxQSJCSl6qpBqTEu+QO5Ry/2gJDs7XPaskF1WeoCPv
         Xqz5ECFF4oXQHGOMg9QXfIGsLLAOm6B7052bDTVutx1Lcgl+Zl7oIQ6KMdOqLzxBkn5/
         sC5tSMOr3HYULqDQ+gsebNNJ1EVpR+8yqyQxPCOSwKKgU5nXu4VHV4zMd+O9jG3Yx5NE
         UsoZwZcxRj0ZEaCKzfY/Pmy13bl9StXFWD47+T9HlcvsODh3jbLgjU9QfibyHFZVP4r2
         mTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NMYfcbmUSyc3eYMPryOU6A5sp46LtbktYk98kJXgeuE=;
        b=C21EDVOg72rbhLjfnwHmeedGgMvJ50VIh6M9xySpNQUBWVT0HE7m9PGUgy44q5lmPL
         yNPOYCJy0nJjU41jYuMsFrFISt0kS7HbwnSnDuQdXfJb3nVejLwlGToUZP+f6eJsg8r/
         2P52IhfldW/Koi2922UwqgUrfL07BtXGbRkuiC8KmhHPbRnvL0EmRANGwUDasE40dUfB
         RMZbmBsHY+dUttX2kXYZS9LPkYmYFLo6BaJQFbD5O+Btzca5rhouQ/bZplk6r15PEoDn
         SfSrFiKErw4NI/4SVdy6v/abAEii1Y5bxSW526uTIxgshP2XH46cQpnhzHV7YBEVFggD
         UN5A==
X-Gm-Message-State: AOAM532jt4U5yvKXzh70sVcmlAmEcxP2csQg3tnDACvLQGYBGMpr1s79
        SABpSX6c/4R6n4NoEiuzXXxzhLW+
X-Google-Smtp-Source: ABdhPJy3hukmzciUkfjgKZpAA5yYIfpZ9FiZxAlgNkpnPgmLtNq3xadiTeqUC36JgWBY29no2Y/Drw==
X-Received: by 2002:aa7:d2d6:: with SMTP id k22mr4121657edr.109.1591820865181;
        Wed, 10 Jun 2020 13:27:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4870:48de:5f59:675a])
        by smtp.gmail.com with ESMTPSA id m91sm391895ede.96.2020.06.10.13.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:27:44 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/7] builtin: unify the 2 tables of builtins
Date:   Wed, 10 Jun 2020 22:27:31 +0200
Message-Id: <20200610202735.84968-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
References: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Till now, 2 tables are used to initialize builtin functions:
* an older, small one, without type information, used to set
  a symbol_op to evaluate and/or expand the ones that have
  effectively an effect.
* a newer and bigger one which only contains what is effectively
  the prototype for these builtins in order to avoid warnings
  about undeclared functions.

It's kinda annoying to have 2 tables for this, even more so
because most entries in the first table also need to be in the
second one (for arguments type & number checking).

Fix this by:
* adding a field in the second table for the symbol_op
* merging or moving the entries in the first table into
  the second one.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 builtin.c | 145 +++++++++++++++++++-----------------------------------
 builtin.h |   1 +
 2 files changed, 51 insertions(+), 95 deletions(-)

diff --git a/builtin.c b/builtin.c
index aa9ce09c0f40..bb9ec65b2d20 100644
--- a/builtin.c
+++ b/builtin.c
@@ -377,6 +377,7 @@ static void declare_one_builtin(const struct builtin_fn *entry)
 	sym->ctype.base_type = fun;
 	sym->ctype.modifiers = MOD_TOPLEVEL;
 	sym->builtin = 1;
+	sym->op = entry->op;
 
 	fun->ctype.base_type = get_ctype(entry->ret_type);
 	fun->variadic = entry->variadic;
@@ -397,39 +398,39 @@ static void declare_builtins(const struct builtin_fn tbl[])
 static const struct builtin_fn builtins_common[] = {
 #define size_t_ctype	&size_t_alias
 #define va_list_ctype	&ptr_ctype
+	{ "__builtin_choose_expr", NULL, 1, .op = &choose_op },
+	{ "__builtin_constant_p", NULL, 1, .op = &constant_p_op },
+	{ "__builtin_expect", &long_ctype, 0, { &long_ctype ,&long_ctype }, .op = &expect_op },
+	{ "__builtin_safe_p", NULL, 1, .op = &safe_p_op },
+	{ "__builtin_warning", NULL, 1, .op = &warning_op },
+
 	{ "__builtin_abort", &void_ctype, 0 },
 	{ "__builtin_abs", &int_ctype , 0, { &int_ctype }},
+	{ "__builtin_add_overflow", &bool_ctype, 1, .op = &overflow_op },
+	{ "__builtin_add_overflow_p", &bool_ctype, 1, .op = &overflow_p_op },
 	{ "__builtin_alloca", &ptr_ctype, 0, { size_t_ctype }},
-	{ "__builtin_alpha_cmpbge", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_extbl", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_extwl", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_insbl", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_inslh", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_insql", &long_ctype, 0, { &long_ctype, &long_ctype }},
-	{ "__builtin_alpha_inswl", &long_ctype, 0, { &long_ctype, &long_ctype }},
 	{ "__builtin_bcmp", &int_ctype , 0, { &const_ptr_ctype, &const_ptr_ctype, size_t_ctype }},
 	{ "__builtin_bcopy", &void_ctype, 0, { &const_ptr_ctype, &ptr_ctype, size_t_ctype }},
-	{ "__builtin_bswap16", &ushort_ctype, 0, { &ushort_ctype }},
-	{ "__builtin_bswap32", &uint_ctype, 0, { &uint_ctype }},
-	{ "__builtin_bswap64", &ullong_ctype, 0, { &ullong_ctype }},
+	{ "__builtin_bswap16", &ushort_ctype, 0, { &ushort_ctype }, .op = &bswap_op },
+	{ "__builtin_bswap32", &uint_ctype, 0, { &uint_ctype }, .op = &bswap_op },
+	{ "__builtin_bswap64", &ullong_ctype, 0, { &ullong_ctype }, .op = &bswap_op },
 	{ "__builtin_bzero", &void_ctype, 0, { &ptr_ctype, size_t_ctype }},
 	{ "__builtin_calloc", &ptr_ctype, 0, { size_t_ctype, size_t_ctype }},
-	{ "__builtin_clrsb", &int_ctype, 0, { &int_ctype }},
-	{ "__builtin_clrsbl", &int_ctype, 0, { &long_ctype }},
-	{ "__builtin_clrsbll", &int_ctype, 0, { &llong_ctype }},
-	{ "__builtin_clz", &int_ctype, 0, { &int_ctype }},
-	{ "__builtin_clzl", &int_ctype, 0, { &long_ctype }},
-	{ "__builtin_clzll", &int_ctype, 0, { &llong_ctype }},
-	{ "__builtin_ctz", &int_ctype, 0, { &int_ctype }},
-	{ "__builtin_ctzl", &int_ctype, 0, { &long_ctype }},
-	{ "__builtin_ctzll", &int_ctype, 0, { &llong_ctype }},
+	{ "__builtin_clrsb", &int_ctype, 0, { &int_ctype }, .op = &clrsb_op },
+	{ "__builtin_clrsbl", &int_ctype, 0, { &long_ctype }, .op = &clrsb_op },
+	{ "__builtin_clrsbll", &int_ctype, 0, { &llong_ctype }, .op = &clrsb_op },
+	{ "__builtin_clz", &int_ctype, 0, { &int_ctype }, .op = &clz_op },
+	{ "__builtin_clzl", &int_ctype, 0, { &long_ctype }, .op = &clz_op },
+	{ "__builtin_clzll", &int_ctype, 0, { &llong_ctype }, .op = &clz_op },
+	{ "__builtin_ctz", &int_ctype, 0, { &int_ctype }, .op = &ctz_op },
+	{ "__builtin_ctzl", &int_ctype, 0, { &long_ctype }, .op = &ctz_op },
+	{ "__builtin_ctzll", &int_ctype, 0, { &llong_ctype }, .op = &ctz_op },
 	{ "__builtin_exit", &void_ctype, 0, { &int_ctype }},
-	{ "__builtin_expect", &long_ctype, 0, { &long_ctype ,&long_ctype }},
 	{ "__builtin_extract_return_addr", &ptr_ctype, 0, { &ptr_ctype }},
 	{ "__builtin_fabs", &double_ctype, 0, { &double_ctype }},
-	{ "__builtin_ffs", &int_ctype, 0, { &int_ctype }},
-	{ "__builtin_ffsl", &int_ctype, 0, { &long_ctype }},
-	{ "__builtin_ffsll", &int_ctype, 0, { &llong_ctype }},
+	{ "__builtin_ffs", &int_ctype, 0, { &int_ctype }, .op = &ffs_op },
+	{ "__builtin_ffsl", &int_ctype, 0, { &long_ctype }, .op = &ffs_op },
+	{ "__builtin_ffsll", &int_ctype, 0, { &llong_ctype }, .op = &ffs_op },
 	{ "__builtin_frame_address", &ptr_ctype, 0, { &uint_ctype }},
 	{ "__builtin_free", &void_ctype, 0, { &ptr_ctype }},
 	{ "__builtin_huge_val", &double_ctype, 0 },
@@ -439,16 +440,16 @@ static const struct builtin_fn builtins_common[] = {
 	{ "__builtin_inf", &double_ctype, 0 },
 	{ "__builtin_inff", &float_ctype, 0 },
 	{ "__builtin_infl", &ldouble_ctype, 0 },
-	{ "__builtin_isfinite", &int_ctype, 1 },
+	{ "__builtin_isfinite", &int_ctype, 1, .op = &fp_unop_op },
 	{ "__builtin_isgreater", &int_ctype, 0, { &float_ctype, &float_ctype }},
 	{ "__builtin_isgreaterequal", &int_ctype, 0, { &float_ctype, &float_ctype }},
-	{ "__builtin_isinf", &int_ctype, 1 },
-	{ "__builtin_isinf_sign", &int_ctype, 1 },
+	{ "__builtin_isinf", &int_ctype, 1, .op = &fp_unop_op },
+	{ "__builtin_isinf_sign", &int_ctype, 1, .op = &fp_unop_op },
 	{ "__builtin_isless", &int_ctype, 0, { &float_ctype, &float_ctype }},
 	{ "__builtin_islessequal", &int_ctype, 0, { &float_ctype, &float_ctype }},
 	{ "__builtin_islessgreater", &int_ctype, 0, { &float_ctype, &float_ctype }},
-	{ "__builtin_isnan", &int_ctype, 1 },
-	{ "__builtin_isnormal", &int_ctype, 1 },
+	{ "__builtin_isnan", &int_ctype, 1, .op = &fp_unop_op },
+	{ "__builtin_isnormal", &int_ctype, 1, .op = &fp_unop_op },
 	{ "__builtin_isunordered", &int_ctype, 0, { &float_ctype, &float_ctype }},
 	{ "__builtin_labs", &long_ctype, 0, { &long_ctype }},
 	{ "__builtin_llabs", &llong_ctype, 0, { &llong_ctype }},
@@ -459,16 +460,18 @@ static const struct builtin_fn builtins_common[] = {
 	{ "__builtin_memmove", &ptr_ctype, 0, { &ptr_ctype, &const_ptr_ctype, size_t_ctype }},
 	{ "__builtin_mempcpy", &ptr_ctype, 0, { &ptr_ctype, &const_ptr_ctype, size_t_ctype }},
 	{ "__builtin_memset", &ptr_ctype, 0, { &ptr_ctype, &int_ctype, size_t_ctype }},
+	{ "__builtin_mul_overflow", &bool_ctype, 1, .op = &overflow_op },
+	{ "__builtin_mul_overflow_p", &bool_ctype, 1, .op = &overflow_p_op },
 	{ "__builtin_nan", &double_ctype, 0, { &const_string_ctype }},
 	{ "__builtin_nanf", &float_ctype, 0, { &const_string_ctype }},
 	{ "__builtin_nanl", &ldouble_ctype, 0, { &const_string_ctype }},
 	{ "__builtin_object_size", size_t_ctype, 0, { &const_ptr_ctype, &int_ctype }},
-	{ "__builtin_parity", &int_ctype, 0, { &uint_ctype }},
-	{ "__builtin_parityl", &int_ctype, 0, { &ulong_ctype }},
-	{ "__builtin_parityll", &int_ctype, 0, { &ullong_ctype }},
-	{ "__builtin_popcount", &int_ctype, 0, { &uint_ctype }},
-	{ "__builtin_popcountl", &int_ctype, 0, { &ulong_ctype }},
-	{ "__builtin_popcountll", &int_ctype, 0, { &ullong_ctype }},
+	{ "__builtin_parity", &int_ctype, 0, { &uint_ctype }, .op = &parity_op },
+	{ "__builtin_parityl", &int_ctype, 0, { &ulong_ctype }, .op = &parity_op },
+	{ "__builtin_parityll", &int_ctype, 0, { &ullong_ctype }, .op = &parity_op },
+	{ "__builtin_popcount", &int_ctype, 0, { &uint_ctype }, .op = &popcount_op },
+	{ "__builtin_popcountl", &int_ctype, 0, { &ulong_ctype }, .op = &popcount_op },
+	{ "__builtin_popcountll", &int_ctype, 0, { &ullong_ctype }, .op = &popcount_op },
 	{ "__builtin_prefetch", &void_ctype, 1, { &const_ptr_ctype }},
 	{ "__builtin_printf", &int_ctype, 1, { &const_string_ctype }},
 	{ "__builtin_puts", &int_ctype, 0, { &const_string_ctype }},
@@ -478,7 +481,7 @@ static const struct builtin_fn builtins_common[] = {
 	{ "__builtin_sadd_overflow", &bool_ctype, 0, { &int_ctype, &int_ctype, &int_ptr_ctype }},
 	{ "__builtin_saddl_overflow", &bool_ctype, 0, { &long_ctype, &long_ctype, &long_ptr_ctype }},
 	{ "__builtin_saddll_overflow", &bool_ctype, 0, { &llong_ctype, &llong_ctype, &llong_ptr_ctype }},
-	{ "__builtin_signbit", &int_ctype, 1 },
+	{ "__builtin_signbit", &int_ctype, 1 , .op = &fp_unop_op },
 	{ "__builtin_smul_overflow", &bool_ctype, 0, { &int_ctype, &int_ctype, &int_ptr_ctype }},
 	{ "__builtin_smull_overflow", &bool_ctype, 0, { &long_ctype, &long_ctype, &long_ptr_ctype }},
 	{ "__builtin_smulll_overflow", &bool_ctype, 0, { &llong_ctype, &llong_ctype, &llong_ptr_ctype }},
@@ -508,6 +511,8 @@ static const struct builtin_fn builtins_common[] = {
 	{ "__builtin_strrchr", &string_ctype, 0, { &const_string_ctype, &int_ctype }},
 	{ "__builtin_strspn", size_t_ctype, 0, { &const_string_ctype, &const_string_ctype }},
 	{ "__builtin_strstr", &string_ctype, 0, { &const_string_ctype, &const_string_ctype }},
+	{ "__builtin_sub_overflow", &bool_ctype, 1, .op = &overflow_op },
+	{ "__builtin_sub_overflow_p", &bool_ctype, 1, .op = &overflow_p_op },
 	{ "__builtin_trap", &void_ctype, 0 },
 	{ "__builtin_uadd_overflow", &bool_ctype, 0, { &uint_ctype, &uint_ctype, &uint_ptr_ctype }},
 	{ "__builtin_uaddl_overflow", &bool_ctype, 0, { &ulong_ctype, &ulong_ctype, &ulong_ptr_ctype }},
@@ -556,6 +561,15 @@ static const struct builtin_fn builtins_common[] = {
 	{ "__sync_val_compare_and_swap", &int_ctype, 1, { &ptr_ctype }},
 	{ "__sync_xor_and_fetch", &int_ctype, 1, { &ptr_ctype }},
 
+	// Alpha-specific
+	{ "__builtin_alpha_cmpbge", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_extbl", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_extwl", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_insbl", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_inslh", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_insql", &long_ctype, 0, { &long_ctype, &long_ctype }},
+	{ "__builtin_alpha_inswl", &long_ctype, 0, { &long_ctype, &long_ctype }},
+
 	// Blackfin-specific stuff
 	{ "__builtin_bfin_csync", &void_ctype, 0 },
 	{ "__builtin_bfin_ssync", &void_ctype, 0 },
@@ -569,68 +583,9 @@ static const struct builtin_fn builtins_common[] = {
 	{ }
 };
 
-static struct symbol builtin_fn_type = { .type = SYM_FN /* , .variadic =1 */ };
-static struct sym_init {
-	const char *name;
-	struct symbol *base_type;
-	unsigned int modifiers;
-	struct symbol_op *op;
-} builtins_table[] = {
-	{ "__builtin_constant_p", &builtin_fn_type, MOD_TOPLEVEL, &constant_p_op },
-	{ "__builtin_safe_p", &builtin_fn_type, MOD_TOPLEVEL, &safe_p_op },
-	{ "__builtin_warning", &builtin_fn_type, MOD_TOPLEVEL, &warning_op },
-	{ "__builtin_expect", &builtin_fn_type, MOD_TOPLEVEL, &expect_op },
-	{ "__builtin_choose_expr", &builtin_fn_type, MOD_TOPLEVEL, &choose_op },
-	{ "__builtin_bswap16", &builtin_fn_type, MOD_TOPLEVEL, &bswap_op },
-	{ "__builtin_bswap32", &builtin_fn_type, MOD_TOPLEVEL, &bswap_op },
-	{ "__builtin_bswap64", &builtin_fn_type, MOD_TOPLEVEL, &bswap_op },
-	{ "__builtin_clrsb", &builtin_fn_type, MOD_TOPLEVEL, &clrsb_op },
-	{ "__builtin_clrsbl", &builtin_fn_type, MOD_TOPLEVEL, &clrsb_op },
-	{ "__builtin_clrsbll", &builtin_fn_type, MOD_TOPLEVEL, &clrsb_op },
-	{ "__builtin_clz", &builtin_fn_type, MOD_TOPLEVEL, &clz_op },
-	{ "__builtin_clzl", &builtin_fn_type, MOD_TOPLEVEL, &clz_op },
-	{ "__builtin_clzll", &builtin_fn_type, MOD_TOPLEVEL, &clz_op },
-	{ "__builtin_ctz", &builtin_fn_type, MOD_TOPLEVEL, &ctz_op },
-	{ "__builtin_ctzl", &builtin_fn_type, MOD_TOPLEVEL, &ctz_op },
-	{ "__builtin_ctzll", &builtin_fn_type, MOD_TOPLEVEL, &ctz_op },
-	{ "__builtin_ffs", &builtin_fn_type, MOD_TOPLEVEL, &ffs_op },
-	{ "__builtin_ffsl", &builtin_fn_type, MOD_TOPLEVEL, &ffs_op },
-	{ "__builtin_ffsll", &builtin_fn_type, MOD_TOPLEVEL, &ffs_op },
-	{ "__builtin_isfinite", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
-	{ "__builtin_isinf", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
-	{ "__builtin_isinf_sign", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
-	{ "__builtin_isnan", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
-	{ "__builtin_isnormal", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
-	{ "__builtin_parity", &builtin_fn_type, MOD_TOPLEVEL, &parity_op },
-	{ "__builtin_parityl", &builtin_fn_type, MOD_TOPLEVEL, &parity_op },
-	{ "__builtin_parityll", &builtin_fn_type, MOD_TOPLEVEL, &parity_op },
-	{ "__builtin_popcount", &builtin_fn_type, MOD_TOPLEVEL, &popcount_op },
-	{ "__builtin_popcountl", &builtin_fn_type, MOD_TOPLEVEL, &popcount_op },
-	{ "__builtin_popcountll", &builtin_fn_type, MOD_TOPLEVEL, &popcount_op },
-	{ "__builtin_signbit", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
-	{ "__builtin_add_overflow", &builtin_fn_type, MOD_TOPLEVEL, &overflow_op },
-	{ "__builtin_sub_overflow", &builtin_fn_type, MOD_TOPLEVEL, &overflow_op },
-	{ "__builtin_mul_overflow", &builtin_fn_type, MOD_TOPLEVEL, &overflow_op },
-	{ "__builtin_add_overflow_p", &builtin_fn_type, MOD_TOPLEVEL, &overflow_p_op },
-	{ "__builtin_sub_overflow_p", &builtin_fn_type, MOD_TOPLEVEL, &overflow_p_op },
-	{ "__builtin_mul_overflow_p", &builtin_fn_type, MOD_TOPLEVEL, &overflow_p_op },
-	{ NULL,		NULL,		0 }
-};
-
 void init_builtins(int stream)
 {
-	struct sym_init *ptr;
-
-	builtin_fn_type.variadic = 1;
-	for (ptr = builtins_table; ptr->name; ptr++) {
-		struct symbol *sym;
-		sym = create_symbol(stream, ptr->name, SYM_NODE, NS_SYMBOL);
-		sym->ctype.base_type = ptr->base_type;
-		sym->ctype.modifiers = ptr->modifiers;
-		sym->op = ptr->op;
-		sym->builtin = 1;
-	}
 
-	init_linearized_builtins(stream);
 	declare_builtins(builtins_common);
+	init_linearized_builtins(stream);
 }
diff --git a/builtin.h b/builtin.h
index 233cf2806760..d0d3fd2ccf87 100644
--- a/builtin.h
+++ b/builtin.h
@@ -9,6 +9,7 @@ struct builtin_fn {
 	unsigned int variadic:1;
 	struct symbol *args[6];
 	struct symbol *_args_null_tail;
+	struct symbol_op *op;
 };
 
 #endif
-- 
2.27.0


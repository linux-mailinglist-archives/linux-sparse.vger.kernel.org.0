Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED115C9568
	for <lists+linux-sparse@lfdr.de>; Thu,  3 Oct 2019 02:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfJCAOt (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 20:14:49 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40334 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbfJCAOt (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 20:14:49 -0400
Received: by mail-ed1-f65.google.com with SMTP id v38so772618edm.7
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 17:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X7dmKOOnHMsmenKSpCpDa3NQkLiwYrEZ73937NUOvBI=;
        b=JCZp/842sqPFrWzC53aZPGHwGRXgcGsB4e3NruMDv9x3/hahRLZI95nJQm18SYMIII
         HC7ZbLVW24yK3pMlNwFFIJiM6yQJKEizNIxqUy3ynQpwkBXrFqL2vifnpGNZbifyFU+P
         FPtj1b2vCBgXZsysOppS7HUg+eM2NzmU77IggINppNL8ODXMi/Qp9IA48S6E2kGKwfO3
         V55cEtNUEZBAXA9gysj6MMJy67FnLt9QtrLTdnhX+RdFd1NfWb1cHSjMi4O17jWMy3C9
         LYpt5LeyNYHp9Mgjsvr7KvR1VH2W8gEWZowSLiINeYpaF3/KL2U1qJOOgyR0IT10WNcT
         ikuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X7dmKOOnHMsmenKSpCpDa3NQkLiwYrEZ73937NUOvBI=;
        b=rGcb7sU8ASzEcU1ave95cebcYZqundunx8L/v9zXikvudk32eElQY1jdC9V/jaa1DK
         W7x0whoysqZ/zt/WDxwAsfTSxii4nq/aswOI57TYXIrqVsZfd+4N7wfnEcunX/f27Y5w
         vTTd/cXGFdrGuk3I13cdYmmXgQLfsQmzxRCCZJG6VrSxFWAzIbsRZSN53DlPZR+uZ9NY
         WrXLbIX4dHvky74tx8cHaBDkbiwc/cXlv/CgkAf+as1UMb58lbW5lfFlFXeaoHrdRbYh
         Wd9EFtXAy3YB/P2nXLDYnsDHkF3thSAKOSWj4ycofagnmKauqJoB3VA6I9eM1iC3Jdkd
         9tgQ==
X-Gm-Message-State: APjAAAWAgk6vs2PFD5rVg8LqrMXr0NrS7krOQ3ddq4KZtMaEKAVt4goa
        YSA3OGPvDcaDt+Otj8dBEKJzbCbG
X-Google-Smtp-Source: APXvYqwf7/JM3Uc/i79dJoWP0C17SHoVy71zctUZUMvPZ9vBCbKMW2pObvNJANBQtZ3mzSTTnhiWGA==
X-Received: by 2002:a17:906:b259:: with SMTP id ce25mr5204340ejb.229.1570061686942;
        Wed, 02 Oct 2019 17:14:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:3985:a315:dc4f:6706])
        by smtp.gmail.com with ESMTPSA id ch11sm63992ejb.48.2019.10.02.17.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 17:14:46 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] expand more builtins like __builtin_ffs()
Date:   Thu,  3 Oct 2019 02:14:37 +0200
Message-Id: <20191003001437.76038-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

GCC expands at compile time builtins like __builtin_ffs()
when their argument is constant.

A driver in the kernel uses such a builtin in a case statement,
causing sparse to report:
	error: Expected constant expression in case statement

So, let sparse also expand such builtins, somehow like it was
done for bswap16/32/64 but now for ffs/ffsl/ffsll, clz, ctz,
clrsb, popcount & parity.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 builtin.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/builtin.c b/builtin.c
index 221c98991..3e2d77e75 100644
--- a/builtin.c
+++ b/builtin.c
@@ -230,6 +230,44 @@ static struct symbol_op bswap_op = {
 };
 
 
+#define EXPAND_FINDBIT(name)					\
+static int expand_##name(struct expression *expr, int cost)	\
+{								\
+	struct expression *arg;					\
+	long long val;						\
+								\
+	if (cost)						\
+		return cost;					\
+								\
+	arg = first_expression(expr->args);			\
+	val = get_expression_value_silent(arg);			\
+	switch (expr->ctype->bit_size) {			\
+	case sizeof(int) * 8:					\
+		val = __builtin_##name(val); break;		\
+	case sizeof(long long) * 8:				\
+		val = __builtin_##name##ll(val); break;		\
+	default: /* impossible error */				\
+		return SIDE_EFFECTS;				\
+	}							\
+								\
+	expr->value = val;					\
+	expr->type = EXPR_VALUE;				\
+	expr->taint = 0;					\
+	return 0;						\
+}								\
+								\
+static struct symbol_op name##_op = {				\
+	.evaluate = evaluate_pure_unop,				\
+	.expand = expand_##name,				\
+}
+
+EXPAND_FINDBIT(clz);
+EXPAND_FINDBIT(ctz);
+EXPAND_FINDBIT(clrsb);
+EXPAND_FINDBIT(ffs);
+EXPAND_FINDBIT(parity);
+EXPAND_FINDBIT(popcount);
+
 static int evaluate_fp_unop(struct expression *expr)
 {
 	struct expression *arg;
@@ -334,11 +372,29 @@ static struct sym_init {
 	{ "__builtin_bswap16", &builtin_fn_type, MOD_TOPLEVEL, &bswap_op },
 	{ "__builtin_bswap32", &builtin_fn_type, MOD_TOPLEVEL, &bswap_op },
 	{ "__builtin_bswap64", &builtin_fn_type, MOD_TOPLEVEL, &bswap_op },
+	{ "__builtin_clrsb", &builtin_fn_type, MOD_TOPLEVEL, &clrsb_op },
+	{ "__builtin_clrsbl", &builtin_fn_type, MOD_TOPLEVEL, &clrsb_op },
+	{ "__builtin_clrsbll", &builtin_fn_type, MOD_TOPLEVEL, &clrsb_op },
+	{ "__builtin_clz", &builtin_fn_type, MOD_TOPLEVEL, &clz_op },
+	{ "__builtin_clzl", &builtin_fn_type, MOD_TOPLEVEL, &clz_op },
+	{ "__builtin_clzll", &builtin_fn_type, MOD_TOPLEVEL, &clz_op },
+	{ "__builtin_ctz", &builtin_fn_type, MOD_TOPLEVEL, &ctz_op },
+	{ "__builtin_ctzl", &builtin_fn_type, MOD_TOPLEVEL, &ctz_op },
+	{ "__builtin_ctzll", &builtin_fn_type, MOD_TOPLEVEL, &ctz_op },
+	{ "__builtin_ffs", &builtin_fn_type, MOD_TOPLEVEL, &ffs_op },
+	{ "__builtin_ffsl", &builtin_fn_type, MOD_TOPLEVEL, &ffs_op },
+	{ "__builtin_ffsll", &builtin_fn_type, MOD_TOPLEVEL, &ffs_op },
 	{ "__builtin_isfinite", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
 	{ "__builtin_isinf", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
 	{ "__builtin_isinf_sign", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
 	{ "__builtin_isnan", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
 	{ "__builtin_isnormal", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
+	{ "__builtin_parity", &builtin_fn_type, MOD_TOPLEVEL, &parity_op },
+	{ "__builtin_parityl", &builtin_fn_type, MOD_TOPLEVEL, &parity_op },
+	{ "__builtin_parityll", &builtin_fn_type, MOD_TOPLEVEL, &parity_op },
+	{ "__builtin_popcount", &builtin_fn_type, MOD_TOPLEVEL, &popcount_op },
+	{ "__builtin_popcountl", &builtin_fn_type, MOD_TOPLEVEL, &popcount_op },
+	{ "__builtin_popcountll", &builtin_fn_type, MOD_TOPLEVEL, &popcount_op },
 	{ "__builtin_signbit", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
 	{ "__builtin_add_overflow", &builtin_fn_type, MOD_TOPLEVEL, &overflow_op },
 	{ "__builtin_sub_overflow", &builtin_fn_type, MOD_TOPLEVEL, &overflow_op },
-- 
2.23.0


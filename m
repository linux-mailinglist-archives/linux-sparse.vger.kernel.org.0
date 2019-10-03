Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FC67C9640
	for <lists+linux-sparse@lfdr.de>; Thu,  3 Oct 2019 03:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfJCBig (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 21:38:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59150 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbfJCBig (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 21:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=J/4u2EMGh4j61tqdufADBdXK53e2Y02g7K01X3n4UWo=; b=itS54z9Q3x7PGbM3AWgZWfPdg
        6qIb41g6x0th82WPfYCMRXlOB3VxcdsI/DwocrPtgMBy+2z5Fkzz/PxXsNb5JYvmqyU/bhTv3rkLZ
        uADDSwQeUgZtzzRBG/I7xE2bHpNf3KAvIuDUULl44sLVG4+pxjMfnyWcwu5jJ0XCWKIwLCy1b0RlU
        QcmoR2rliTIIVmWSg+a5laiOKw/5GSpto/+J0KyuvQ+bpI8ZFf/5XPX/qT7ZnNrOP52ux5zlrjoEk
        H6SYHiJqEgE0RBlyJ+qweGTkE2RU9xkY9S7L8HKpJt0/N9sjKWToeqaA1ByW3jqoZBMl1dvETyY0O
        nKffbQ/MA==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFq4i-0001wH-3n; Thu, 03 Oct 2019 01:38:36 +0000
Subject: Re: [PATCH] expand more builtins like __builtin_ffs()
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191003001437.76038-1-luc.vanoostenryck@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ce2fd152-91cb-e7ce-94b9-3cc022259195@infradead.org>
Date:   Wed, 2 Oct 2019 18:38:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003001437.76038-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 10/2/19 5:14 PM, Luc Van Oostenryck wrote:
> GCC expands at compile time builtins like __builtin_ffs()
> when their argument is constant.
> 
> A driver in the kernel uses such a builtin in a case statement,
> causing sparse to report:
> 	error: Expected constant expression in case statement
> 
> So, let sparse also expand such builtins, somehow like it was
> done for bswap16/32/64 but now for ffs/ffsl/ffsll, clz, ctz,
> clrsb, popcount & parity.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  builtin.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/builtin.c b/builtin.c
> index 221c98991..3e2d77e75 100644
> --- a/builtin.c
> +++ b/builtin.c
> @@ -230,6 +230,44 @@ static struct symbol_op bswap_op = {
>  };
>  
>  
> +#define EXPAND_FINDBIT(name)					\
> +static int expand_##name(struct expression *expr, int cost)	\
> +{								\
> +	struct expression *arg;					\
> +	long long val;						\
> +								\
> +	if (cost)						\
> +		return cost;					\
> +								\
> +	arg = first_expression(expr->args);			\
> +	val = get_expression_value_silent(arg);			\
> +	switch (expr->ctype->bit_size) {			\
> +	case sizeof(int) * 8:					\
> +		val = __builtin_##name(val); break;		\
> +	case sizeof(long long) * 8:				\
> +		val = __builtin_##name##ll(val); break;		\
> +	default: /* impossible error */				\
> +		return SIDE_EFFECTS;				\
> +	}							\
> +								\
> +	expr->value = val;					\
> +	expr->type = EXPR_VALUE;				\
> +	expr->taint = 0;					\
> +	return 0;						\
> +}								\
> +								\
> +static struct symbol_op name##_op = {				\
> +	.evaluate = evaluate_pure_unop,				\
> +	.expand = expand_##name,				\
> +}
> +
> +EXPAND_FINDBIT(clz);
> +EXPAND_FINDBIT(ctz);
> +EXPAND_FINDBIT(clrsb);
> +EXPAND_FINDBIT(ffs);
> +EXPAND_FINDBIT(parity);
> +EXPAND_FINDBIT(popcount);
> +
>  static int evaluate_fp_unop(struct expression *expr)
>  {
>  	struct expression *arg;
> @@ -334,11 +372,29 @@ static struct sym_init {
>  	{ "__builtin_bswap16", &builtin_fn_type, MOD_TOPLEVEL, &bswap_op },
>  	{ "__builtin_bswap32", &builtin_fn_type, MOD_TOPLEVEL, &bswap_op },
>  	{ "__builtin_bswap64", &builtin_fn_type, MOD_TOPLEVEL, &bswap_op },
> +	{ "__builtin_clrsb", &builtin_fn_type, MOD_TOPLEVEL, &clrsb_op },
> +	{ "__builtin_clrsbl", &builtin_fn_type, MOD_TOPLEVEL, &clrsb_op },
> +	{ "__builtin_clrsbll", &builtin_fn_type, MOD_TOPLEVEL, &clrsb_op },
> +	{ "__builtin_clz", &builtin_fn_type, MOD_TOPLEVEL, &clz_op },
> +	{ "__builtin_clzl", &builtin_fn_type, MOD_TOPLEVEL, &clz_op },
> +	{ "__builtin_clzll", &builtin_fn_type, MOD_TOPLEVEL, &clz_op },
> +	{ "__builtin_ctz", &builtin_fn_type, MOD_TOPLEVEL, &ctz_op },
> +	{ "__builtin_ctzl", &builtin_fn_type, MOD_TOPLEVEL, &ctz_op },
> +	{ "__builtin_ctzll", &builtin_fn_type, MOD_TOPLEVEL, &ctz_op },
> +	{ "__builtin_ffs", &builtin_fn_type, MOD_TOPLEVEL, &ffs_op },
> +	{ "__builtin_ffsl", &builtin_fn_type, MOD_TOPLEVEL, &ffs_op },
> +	{ "__builtin_ffsll", &builtin_fn_type, MOD_TOPLEVEL, &ffs_op },
>  	{ "__builtin_isfinite", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
>  	{ "__builtin_isinf", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
>  	{ "__builtin_isinf_sign", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
>  	{ "__builtin_isnan", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
>  	{ "__builtin_isnormal", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
> +	{ "__builtin_parity", &builtin_fn_type, MOD_TOPLEVEL, &parity_op },
> +	{ "__builtin_parityl", &builtin_fn_type, MOD_TOPLEVEL, &parity_op },
> +	{ "__builtin_parityll", &builtin_fn_type, MOD_TOPLEVEL, &parity_op },
> +	{ "__builtin_popcount", &builtin_fn_type, MOD_TOPLEVEL, &popcount_op },
> +	{ "__builtin_popcountl", &builtin_fn_type, MOD_TOPLEVEL, &popcount_op },
> +	{ "__builtin_popcountll", &builtin_fn_type, MOD_TOPLEVEL, &popcount_op },
>  	{ "__builtin_signbit", &builtin_fn_type, MOD_TOPLEVEL, &fp_unop_op },
>  	{ "__builtin_add_overflow", &builtin_fn_type, MOD_TOPLEVEL, &overflow_op },
>  	{ "__builtin_sub_overflow", &builtin_fn_type, MOD_TOPLEVEL, &overflow_op },
> 


-- 
~Randy

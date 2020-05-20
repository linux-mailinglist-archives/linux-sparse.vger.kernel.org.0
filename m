Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9810F1DA6AE
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 02:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgETAhG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 20:37:06 -0400
Received: from avasout02.plus.net ([212.159.14.17]:60705 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETAhG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 20:37:06 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bCjIjxVjUU8CkbCjJjjRzL; Wed, 20 May 2020 01:37:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1589935025; bh=eV/OGpEityrxFkjtQJaY2H65Rb4VictGD8lx+jXSBfw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=bfYl8LbeTPypEWVVidjCMj+40fdlu/NEM02i+uPX2rT7FW47UwgU4iiFYCRHoBjg/
         H+bpfdsgIapacYwVE09sxV3CaVhz//BC64Qg0dY5OLvyIIEIb0w0BaAgoJo4RUT+7t
         Gdipm3s+t9/tys7d0ux5HWam3FiMtG41YWzLmMOc2d06eQ8XrDJa3AiuwzeQ51PjQe
         6cjx1445LatiDqTiGl1W9aRYnK6T6vzQFIJsrIEdTzmLGNA1L3t8XOqCcPZgiIjj7v
         qvdj9YKX7ZVBkMu9R/u1cG9DKUpgThfhBsm6vlxFvR84uMC4+UUvr8Z2HOKFuk6CU7
         +P9uVVa38/HqA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=33cvvYJdE7E_9u47BhcA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v1 03/28] misc: always use the node for current_fn
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-4-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <0883c784-5ad0-e536-239e-6ed086cf624d@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 01:37:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519005728.84594-4-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFibggz241SWHsIKH9sRLkSENtW8/c/CppFvrTphav91/OPpTjo3BkiMmCR8YAbB0ABQzixy9lealrI0Umm4FaGBikbiBDYgb2xTat3hwWzNg2QdDC/6
 Q1gd5yWeBN80PT90WzDKxvOZxVLQisWEvkbXOskccR/+7iSX7d6F4JW8xs2Q2S7W89gSNZa/TeFZ2A==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> At evaluation time and at expansion time, current_fn is set
> to the function's base type (SYM_FN) but at parse time it's
> set to its parent type (SYM_NODE).
> 
> Since current_fn is used to access the corresponding ident,
> it should be set to the node type, not the base.
> 
> So, always set current_fn to the node type.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  evaluate.c | 4 ++--
>  expand.c   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/evaluate.c b/evaluate.c
> index 54cd5fa136e6..c18ae81df5ad 100644
> --- a/evaluate.c
> +++ b/evaluate.c
> @@ -3422,7 +3422,7 @@ static struct symbol *evaluate_symbol(struct symbol *sym)
>  		if (sym->definition && sym->definition != sym)
>  			return evaluate_symbol(sym->definition);
>  
> -		current_fn = base_type;
> +		current_fn = sym;
>  
>  		examine_fn_arguments(base_type);
>  		if (!base_type->stmt && base_type->inline_stmt)
> @@ -3453,7 +3453,7 @@ static struct symbol *evaluate_return_expression(struct statement *stmt)
>  	struct symbol *fntype, *rettype;
>  
>  	evaluate_expression(expr);
> -	fntype = current_fn;
> +	fntype = current_fn->ctype.base_type;

Ah, OK, question answered!

ATB,
Ramsay Jones

>  	rettype = fntype->ctype.base_type;
>  	if (!rettype || rettype == &void_ctype) {
>  		if (expr && expr->ctype != &void_ctype)
> diff --git a/expand.c b/expand.c
> index e75598781b6c..ab296c730efd 100644
> --- a/expand.c
> +++ b/expand.c
> @@ -918,7 +918,7 @@ static int expand_symbol_call(struct expression *expr, int cost)
>  			struct symbol *fn = def->ctype.base_type;
>  			struct symbol *curr = current_fn;
>  
> -			current_fn = fn;
> +			current_fn = def;
>  			evaluate_statement(expr->statement);
>  			current_fn = curr;
>  
> 

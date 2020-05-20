Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47E751DA6C1
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 02:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgETAra (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 20:47:30 -0400
Received: from avasout02.plus.net ([212.159.14.17]:33069 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgETAra (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 20:47:30 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bCtLjxW9xU8CkbCtMjjS9G; Wed, 20 May 2020 01:47:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1589935649; bh=C1t0cu+TMwIiYjjbqry1CIanNoaVbndprY7lCynZ6qk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=GueSV0Ew31Xc7OIAa0Lg+l1nUlz1myKhuJXPk7IG1BzO9nJ1TfdKJN6tT4quHm1Nh
         WxsrpOaHfvL2hH3/0CRf2oP/jUzPj39O4Yoq6/silCfSpEvO8AaALUcq2/YFKtzHnp
         3gC7gwv4izN2zg8NJ/bygRxezCQtjsk1LRvCj2izWv8B0ZzVNdFoC3JLMSS2NOW5+j
         CUk61RUrMMEWfEqDLPYQNuAjW6C7UTSSnQVJZgPQrcSfItq9XGkAAVqnPiRjhhGeg6
         iiJUFcjoHUyUdlTtacc/BMpLfoEzM1reabvZJnooeO92OYrCzt3NtbepctIAws9slY
         PV58lUb2dL5TQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=tnOg-Hp3dCQt5_B6Xr4A:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v1 16/28] scope: __label__ is special
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-17-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <92c02efb-7733-cca8-981d-b3d0c5b7909e@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 01:47:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519005728.84594-17-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLHE7adZFaZVvnCyYGgHYHFbmPOuk9jNq3IuKNCpQ6ahj2Wlo0/xa3Ay58q4B3MJW3NgtGrJ3EDkvgSOwPVbpgJz6+ulPW5aCTPhFMOaHSjRQDEOAMRe
 dJmq/EiHgHGzcMddlWE7cL+Q5VTC0nhKTzaNDVxhi+vW8E4+y4ncucwhzV2Cjk+lb616xIWZVfHE5A==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> Labels declared wth __label__ are special because they must follow
> the block scope normally used for variables instad of using the

s/instad/instead/

> scope used for labels.
> 
> So, use bind_symbol_scoped() instead of first using bind_symbol()

s/bind_symbol_scoped/bind/symbol_with_scope/

ATB,
Ramsay Jones

> and then changing the namespace.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  parse.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/parse.c b/parse.c
> index e23c5b64e8be..29e3f939166d 100644
> --- a/parse.c
> +++ b/parse.c
> @@ -2569,8 +2569,7 @@ static struct token *label_statement(struct token *token)
>  	while (token_type(token) == TOKEN_IDENT) {
>  		struct symbol *sym = alloc_symbol(token->pos, SYM_LABEL);
>  		/* it's block-scope, but we want label namespace */
> -		bind_symbol(sym, token->ident, NS_SYMBOL);
> -		sym->namespace = NS_LABEL;
> +		bind_symbol_with_scope(sym, token->ident, NS_LABEL, block_scope);
>  		fn_local_symbol(sym);
>  		token = token->next;
>  		if (!match_op(token, ','))
> 

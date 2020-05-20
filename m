Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD8751DA6AC
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 02:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgETAfS (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 20:35:18 -0400
Received: from avasout02.plus.net ([212.159.14.17]:60631 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726352AbgETAfR (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 20:35:17 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bChWjxVflU8CkbChXjjRyg; Wed, 20 May 2020 01:35:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1589934915; bh=vMkI7LZ6XytEXML5ekKDFj7JRpaCzNormmdINEPVTP0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=bOnwd0D0y8DdbcL6NZM8oytO7mxCBLKHW70YDaS/TGjWmg1hjme4ZiR3+erwGqB1a
         bQ/7rHzv81aqxk2C7Hessf3kUhVPFDm/ibsnq9Q1KTQie9498r+/4tqmC7vaL+EMM7
         t+mjV84NqoKhcpka2kIOgZu1WJz9AplVT/vy1lHqiRkr/wbwg2YXR2JdpbAsff+XuO
         aE1g6mesw7qD0/G2hRhjD7pgrCu0eA6KLiSIRb5aktJXBQTNNYQHMDCLoC13ye1iOx
         3Xf8+MrcA8405r+ANCmSnGeOudGmehR7TG5f5/hGMYN0i/f5PYJlDP7y5B1oKwsc4y
         KWlf1WewmpHgg==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=p_hTeksWfo1M6BtvpLMA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v1 02/28] misc: s/fntype/rettype/
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-3-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <0556fd1c-566d-3b3a-d760-418fecf115c0@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 01:35:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519005728.84594-3-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIWkCsnuhOOpdfjJqZF5olD1OhAGdZqerCo/LnNBonZkYdKkvvYcfZmGZbDC1V54Mh1V1cqvfTeVEhnAciSLJTkB7SIZmDsWKjZ3PSeQNRtM2Bky8eDg
 2QcgYrSZvSxzZZ0P8msLDY7ZLCa1Y7etIQNI7r2+Hlem+RZfEUHnOTzaudSVLrNB4zFJNypMmF5dpg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> In evaluate_return_expression(), it's checked if the type of
> the return statement match the function return type.
> 
> But, the variable used to hold this type is named 'fntype'
> which is slightly confusing.
> 
> So, rename the variable holding the return type to 'rettype'
> and only use 'fntype' for the one hoding the full function type.

s/hoding/holding/

> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  evaluate.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/evaluate.c b/evaluate.c
> index b7bb1f52aa91..54cd5fa136e6 100644
> --- a/evaluate.c
> +++ b/evaluate.c
> @@ -3450,13 +3450,14 @@ void evaluate_symbol_list(struct symbol_list *list)
>  static struct symbol *evaluate_return_expression(struct statement *stmt)
>  {
>  	struct expression *expr = stmt->expression;
> -	struct symbol *fntype;
> +	struct symbol *fntype, *rettype;
>  
>  	evaluate_expression(expr);
> -	fntype = current_fn->ctype.base_type;
> -	if (!fntype || fntype == &void_ctype) {
> +	fntype = current_fn;
> +	rettype = fntype->ctype.base_type;

So, do you need to keep the 'fntype' variable?

ATB,
Ramsay Jones

> +	if (!rettype || rettype == &void_ctype) {
>  		if (expr && expr->ctype != &void_ctype)
> -			expression_error(expr, "return expression in %s function", fntype?"void":"typeless");
> +			expression_error(expr, "return expression in %s function", rettype?"void":"typeless");
>  		if (expr && Wreturn_void)
>  			warning(stmt->pos, "returning void-valued expression");
>  		return NULL;
> @@ -3468,7 +3469,7 @@ static struct symbol *evaluate_return_expression(struct statement *stmt)
>  	}
>  	if (!expr->ctype)
>  		return NULL;
> -	compatible_assignment_types(expr, fntype, &stmt->expression, "return expression");
> +	compatible_assignment_types(expr, rettype, &stmt->expression, "return expression");
>  	return NULL;
>  }
>  
> 

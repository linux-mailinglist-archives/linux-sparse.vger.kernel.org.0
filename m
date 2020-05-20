Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A0AA1DA6BF
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 02:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgETApy (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 20:45:54 -0400
Received: from avasout02.plus.net ([212.159.14.17]:32933 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETApx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 20:45:53 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bCrmjxW58U8CkbCrnjjS7C; Wed, 20 May 2020 01:45:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1589935552; bh=GhFm6Hgld0vImgHD+M7PXyAnNKNe80ioKGLoFnU8vLY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=o7kfBOV4QDxPomFvp8XJwikui1wr4JyOKVuZAsAx8x/bhK1M+Xf1I04IAg315N6JV
         WUAsueac12Jr0DB/ojyPJRUzvZwCA9gEsjMaGDWqsyfYRxEvdtWnGmeBW+O0jnvgwV
         y/DE8IfyNvPoSrpcT68SWG0KAL2ki9wIh0I8phvAGPQx2W1WnPReC25HkWetoC0t5O
         F9VmJn1UuihwwC9QJvBz1mgpVldv3i9TvEXdoYTWvGG1bvowkH/DthkqQhvfNB76im
         XmzrTmn3sHrtc+xsGgcwIDnkaWuRQkTA/ctqzFY8Yk5f338PsJGzAxvQqQqN82kZtb
         3PdtmSWNL015Q==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=iaJHp8L9BLmbSu1TwIcA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v1 15/28] scope: __func__ is special
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-16-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <cbeaeb8a-698b-56e2-6e31-90547de54e89@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 01:45:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519005728.84594-16-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfET0LPyZU3EHMovmmQ6uxBKaY0NRyTg6ywFfX8Zacvs9xfEfE+TfIeU1ySndODSEwSTYcKKAF9B/NP+4z/bjU3ilF/nCbHhLk1UZKt6hB19ZuLhS6m+K
 kM2Reu7pVV92jpURRuCAL8cTmh7ascvb/JeHHEZE+CmnAwypn0ED1rvAQGKy580HjPEcd1tlq624LQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> __func__ needs to be in the namepsace for symbols: NS_SYMBOL
> but doesn't follow the usual scope rules of them: it always
> needs to be declared in the function scope.
> 
> So, use bind_symbol_scoped() instead of first using bind_symbol()

s/bind_symbol_scoped/bind_symbol_with_scope/

ATB,
Ramsay Jones

> and then changing the namespace.
> Also change the comment to better express that it's the scope
> that is the unusual thing.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  expression.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/expression.c b/expression.c
> index 78e577cf10a1..ffb3c2dce4d5 100644
> --- a/expression.c
> +++ b/expression.c
> @@ -122,9 +122,8 @@ static struct symbol *handle_func(struct token *token)
>  	decl->ctype.modifiers = MOD_STATIC;
>  	decl->endpos = token->pos;
>  
> -	/* function-scope, but in NS_SYMBOL */
> -	bind_symbol(decl, ident, NS_LABEL);
> -	decl->namespace = NS_SYMBOL;
> +	/* NS_SYMBOL but in function-scope */
> +	bind_symbol_with_scope(decl, ident, NS_SYMBOL, function_scope);
>  
>  	len = current_fn->ident->len;
>  	string = __alloc_string(len + 1);
> 

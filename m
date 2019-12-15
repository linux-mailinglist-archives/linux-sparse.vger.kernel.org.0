Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D33911FAB9
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 20:20:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfLOTUi (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 14:20:38 -0500
Received: from avasout04.plus.net ([212.159.14.19]:50983 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfLOTUh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 14:20:37 -0500
Received: from [10.0.2.15] ([87.115.253.35])
        by smtp with ESMTPA
        id gZRSiUceA4Al0gZRTiECTd; Sun, 15 Dec 2019 19:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1576437635; bh=peNVrdBuZSmyhHe2XK1gVhYBJFrzbxq0EZLs6UFXcmc=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=P9i5Ay4aQGGabG4GdemthN7CWDAoXq4vCU1kK9l8OoCHJS+wEVPMSVzpprAnRRYxs
         xq092Y5VPgfUM5JoxtwzQiGQM3BKpkAfgWgpxfxuu2ZkjORzjZMPoT6V3+S+shXriU
         kOrFbPxR3qk3nbgEF7vnOQPXrs1PuJlx70MoqaJsXMvClePKAfzbOPUafIkcNpAF93
         5PG70HFtJ83ezfU7OzZSN1XQWiG1AzFOiJjb7d4wtPD7MTbyLcNEUMLlevvSLSMZZD
         GWF2GSzqLVn4uIa4HEp0t1pFPrllvtRX9+1LiY6AF3waM1qzt5DrVac8KF5gZqf9hb
         V5Zh9alpyKAsg==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=VLDPgNmCULccAgTy/RRLiQ==:117 a=VLDPgNmCULccAgTy/RRLiQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=0thmUIKOXvl-7YHC6kUA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 3/4] typeof: extract examine_typeof() from
 examine_symbol_type()
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
 <20191215110425.76533-4-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <c76acb9e-ab0d-23d2-06dc-361187851468@ramsayjones.plus.com>
Date:   Sun, 15 Dec 2019 19:20:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191215110425.76533-4-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDXzPDt3MNjgsU8z9N+0of5vs9GOSP2plkQYVU19Funw3/Xx/2jPBVPt7d+y+sVdXp8xZ5I6o/c8BCWfhLMrvjiOa6rpLU8ePkFvGt48VZEPVAy06tPu
 yzKpONBAqXqqaPQbiGrVFvDzEJE2fPQfnjUzh6m5AxYUfOxjv1VhgGe9Nidui1pEopNf0owg2pwiEg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 15/12/2019 11:04, Luc Van Oostenryck wrote:
> No functional changes here, just moving the code for the
> conversion of SYM_TYPEOFs in its own function, in preparation
> for some further changes.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  symbol.c | 41 +++++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/symbol.c b/symbol.c
> index 3655cbb78913..46fe740b4cc1 100644
> --- a/symbol.c
> +++ b/symbol.c
> @@ -453,6 +453,25 @@ static struct symbol *examine_pointer_type(struct symbol *sym)
>  	return sym;
>  }
>  
> +static struct symbol *examine_typeof(struct symbol *sym)
> +{
> +	struct symbol *base = evaluate_expression(sym->initializer);
> +	unsigned long mod = 0;
> +
> +	if (!base)
> +		base = &bad_ctype;
> +	if (is_bitfield_type(base))
> +		warning(base->pos, "typeof applied to bitfield type");
> +	if (base->type == SYM_NODE) {
> +		mod |= base->ctype.modifiers & MOD_TYPEOF;
> +		base = base->ctype.base_type;
> +	}
> +	sym->type = SYM_NODE;
> +	sym->ctype.modifiers = mod;
> +	sym->ctype.base_type = base;
> +	return examine_node_type(sym);
> +}
> +
>  /*
>   * Fill in type size and alignment information for
>   * regular SYM_TYPE things.
> @@ -486,26 +505,8 @@ struct symbol *examine_symbol_type(struct symbol * sym)
>  	case SYM_BASETYPE:
>  		/* Size and alignment had better already be set up */
>  		return sym;
> -	case SYM_TYPEOF: {
> -		struct symbol *base = evaluate_expression(sym->initializer);
> -		if (base) {
> -			unsigned long mod = 0;
> -
> -			if (is_bitfield_type(base))
> -				warning(base->pos, "typeof applied to bitfield type");
> -			if (base->type == SYM_NODE) {
> -				mod |= base->ctype.modifiers & MOD_TYPEOF;
> -				base = base->ctype.base_type;
> -			}
> -			sym->type = SYM_NODE;
> -			sym->ctype.modifiers = mod;
> -			sym->ctype.base_type = base;
> -			return examine_node_type(sym);
> -		}
> -		sym->type = SYM_NODE;
> -		sym->ctype.base_type = &bad_ctype;
> -		return sym;

Hmm, it was not immediately clear that the '!base' path did not
introduce an (effective) functional change. I suspect that it
does not, but I wasn't sure if examine_node_type(sym) for the
above 'bad_ctype' symbol would add alignment, bit_size or rank
to the symbol (and even if it did, would it matter?).

ATB,
Ramsay Jones

> -	}
> +	case SYM_TYPEOF:
> +		return examine_typeof(sym);
>  	case SYM_PREPROCESSOR:
>  		sparse_error(sym->pos, "ctype on preprocessor command? (%s)", show_ident(sym->ident));
>  		return NULL;
> 

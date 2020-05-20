Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676BC1DA6BA
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 02:44:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgETAoR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 20:44:17 -0400
Received: from avasout02.plus.net ([212.159.14.17]:32814 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETAoQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 20:44:16 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bCqDjxW0dU8CkbCqEjjS4r; Wed, 20 May 2020 01:44:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1589935455; bh=bDA25GRDIhULB8pYd45VTwk7YLzQPFzxr+YnMSz5PYQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=k3zTgDnyURSEH9OO3cJRZD//NW6YsO1/k+8Vi0JRSMA4kyyaneJFKiAR7MbNVg5uT
         zsVBkz2nGceGa3hgsfb5jhdUy9ypOsfkyxl8pQ2btNclaWlKbel0UfkpRRp9jmyosR
         +lAM/SLHWBqBkJCyK53rf/hIWqTkeixnJK4uI1pHpJ+f6X39dTw556hgPqKPvhzORr
         Zz0iBui959f5VBm+iFoYVbttcdgvLLzr6cn4IAUMOE42TW1iaSjO96hA84vwuG6vMU
         +U184DkY33YSFw8m/IQsJ2FJB/Qdcqx1Ng2tPSa1sFcSzZyGdatJTk6Dpfxl3IZSKz
         6kyC4IPYbGQbw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=WjOqeF7SBlhIr3EU0vgA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v1 14/28] scope: extract bind_symbol_with_scope() from
 bind_symbol()
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-15-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <94c72b94-814a-ee32-b107-523f43ad9299@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 01:44:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519005728.84594-15-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO0zfUpEPoYIXMdto7yBBuHTKoDhjWTlSIca/4gxyEbU6kEQdZuCQNklvFyan4wDtv3KCrp3wYBnPTGyGj59rt0EV71AAEWRUDjKNpg4gCybfspWKn0V
 10+gzRAFPVlSTHLFMCWl6TVQa5IZ6GEubheXFIfFN+TgzmW64mqY0fEi+67XYizR/66b/6Ax5awHPg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> In most cases, the scope that must be used for a symbol is
> given by its namespace.
> 
> However, in some situations a different scope must be used.
> This is then set, for exemple by doing the lookup with

s/exemple/example/

ATB,
Ramsay Jones

> the wrong namespace (but corresponding to the desired scope)
> and changing it just after to its correct value.
> 
> To avoid these contortions, extract from bind_symbol() a version
> where the scope can be explicitly given: bind_symbol_with_scope().
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  symbol.c | 13 +++++++++----
>  symbol.h |  1 +
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/symbol.c b/symbol.c
> index c2e6f0b426b3..7044ab3f78ce 100644
> --- a/symbol.c
> +++ b/symbol.c
> @@ -671,9 +671,8 @@ static void inherit_static(struct symbol *sym)
>  	}
>  }
>  
> -void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
> +void bind_symbol_with_scope(struct symbol *sym, struct ident *ident, enum namespace ns, struct scope *scope)
>  {
> -	struct scope *scope;
>  	if (sym->bound) {
>  		sparse_error(sym->pos, "internal error: symbol type already bound");
>  		return;
> @@ -690,7 +689,6 @@ void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
>  	sym->ident = ident;
>  	sym->bound = 1;
>  
> -	scope = block_scope;
>  	if (ns == NS_SYMBOL && toplevel(scope)) {
>  		unsigned mod = MOD_ADDRESSABLE | MOD_TOPLEVEL;
>  
> @@ -704,11 +702,18 @@ void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
>  		}
>  		sym->ctype.modifiers |= mod;
>  	}
> +	bind_scope(sym, scope);
> +}
> +
> +void bind_symbol(struct symbol *sym, struct ident *ident, enum namespace ns)
> +{
> +	struct scope *scope = block_scope;;
> +
>  	if (ns == NS_MACRO)
>  		scope = file_scope;
>  	if (ns == NS_LABEL)
>  		scope = function_scope;
> -	bind_scope(sym, scope);
> +	bind_symbol_with_scope(sym, ident, ns, scope);
>  }
>  
>  struct symbol *create_symbol(int stream, const char *name, int type, int namespace)
> diff --git a/symbol.h b/symbol.h
> index 50dba78a654a..c297c778dfdf 100644
> --- a/symbol.h
> +++ b/symbol.h
> @@ -332,6 +332,7 @@ extern void show_type_list(struct symbol *);
>  extern void show_symbol_list(struct symbol_list *, const char *);
>  extern void add_symbol(struct symbol_list **, struct symbol *);
>  extern void bind_symbol(struct symbol *, struct ident *, enum namespace);
> +extern void bind_symbol_with_scope(struct symbol *, struct ident *, enum namespace, struct scope *);
>  
>  extern struct symbol *examine_symbol_type(struct symbol *);
>  extern struct symbol *examine_pointer_target(struct symbol *);
> 

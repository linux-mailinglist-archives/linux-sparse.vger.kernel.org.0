Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A696ED44A
	for <lists+linux-sparse@lfdr.de>; Sun,  3 Nov 2019 20:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfKCTKX (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 3 Nov 2019 14:10:23 -0500
Received: from avasout07.plus.net ([84.93.230.235]:38204 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727322AbfKCTKX (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 3 Nov 2019 14:10:23 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id RLGXicozthD3wRLGYiARx6; Sun, 03 Nov 2019 19:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1572808222; bh=dzVF0g3pYtoZAFabBZ3wDwvniRknhkyAHC0x24Sd54I=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=QBYl+r8yyJUHy4gsQyflycN0QBNlrFe1NCxetQkRu7bQKDDizMdGnfJVqpYE65rUZ
         HbDjCS3jP6NQWNT0FvsAUggEWtRvTLe6X9LndggPdwrPgA72m2Dqfg2q/0gbKENH/S
         3QBK4JAvzj8pmylQFp+DJJp2Wbikvxz9zEo1u+zQg9+Lg57ec9RhPX/gWap7EtqZsZ
         fs8CTcwakKDA8hoYp/gD9GQsW6pRWcTcBMpavSqav00MDsTOUPZyyGheJCxF9BMryN
         oafC4rhs+OAJkyKHhlhdBBSrvTBeK/WwxoafCE4xU8O43hHXyqdMW0RWCs4LoZpOVe
         e/we74RUnH/qw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Tb3oSiYh c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=9dNB8VPzQmrTjBSp4_0A:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 4/4] remove unneeded MOD_TYPE
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
 <20191103162635.66442-5-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <863ff559-21b0-10bf-4449-53d80a3989fc@ramsayjones.plus.com>
Date:   Sun, 3 Nov 2019 19:10:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191103162635.66442-5-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIveEAxObiGO5SaUM2y7Oew69nuV9YRWoEWFPWTpcUD8li6LpDRenweBNDaLIp/EAx0V6HAvR9//gZaRsHk0G0oL6mWY4G2vYDPZSu9goq2HRAQpSKnu
 DR/SIOLw4Cpp1j0U0FBYA/n4hQuZl1d7Yn+z3M7XleTY3KZ3QdF0PzF870EhRs+28JsR7gYpf+u89A==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 03/11/2019 16:26, Luc Van Oostenryck wrote:
> MOD_TYPE is used for the sparse extension which allow
> to directly compare types with each others.
> 
> Expressions for direct type are EXPR_TYPE with the type in
> expr->symbol and the expression itself having it's type
> (expr->ctype) set to &type_ctype. This is one of the few
> base/builtin types and is the only one which van have MOD_TYPE.

s/van/can/?

> 
> Howver, the MOD_TYPE is not needed (like bad_ctype doesn't need

s/Howver/However/

> a MOD_BAD, or incomplete_ctype ....). There is also a single

s/..../.../

> place where MOD_TYPE is tested: is_type_ctype(), itself used
> a single time.
> 
> So:
> * rewrite the unique test using is_type_ctype() by directly
>   comparing with &type_ctype instead.
> * remove now unused is_type_ctype()
> * remove MOD_TYPE from type_ctype's definition
> * remove MOD_TYPE's definition.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  gdbhelpers   | 3 ---
>  show-parse.c | 1 -
>  symbol.c     | 2 +-
>  symbol.h     | 4 ++--
>  4 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/gdbhelpers b/gdbhelpers
> index 2fe9336dd..8d186cee7 100644
> --- a/gdbhelpers
> +++ b/gdbhelpers
> @@ -152,9 +152,6 @@ define gdb_show_ctype
>  	if ($arg0->modifiers & MOD_ASSIGNED)
>  		printf "MOD_ASSIGNED "
>  	end
> -	if ($arg0->modifiers & MOD_TYPE)
> -		printf "MOD_TYPE "
> -	end
>  	if ($arg0->modifiers & MOD_SAFE)
>  		printf "MOD_SAFE "
>  	end

Hmm, why had I not noticed gdbhelpers before! :-D

> diff --git a/show-parse.c b/show-parse.c
> index 7b65ba679..68b3e7186 100644
> --- a/show-parse.c
> +++ b/show-parse.c
> @@ -140,7 +140,6 @@ const char *modifier_string(unsigned long mod)
>  		{MOD_NODEREF,		"[noderef]"},
>  		{MOD_TOPLEVEL,		"[toplevel]"},
>  		{MOD_ASSIGNED,		"[assigned]"},
> -		{MOD_TYPE,		"[type]"},
>  		{MOD_SAFE,		"[safe]"},
>  		{MOD_USERTYPE,		"[usertype]"},
>  		{MOD_NORETURN,		"[noreturn]"},
> diff --git a/symbol.c b/symbol.c
> index a410af43a..116b1040f 100644
> --- a/symbol.c
> +++ b/symbol.c
> @@ -742,7 +742,7 @@ static const struct ctype_declare {
>  } ctype_declaration[] = {
>  	{ &bool_ctype,	    SYM_BASETYPE, MOD_UNSIGNED,		    &bits_in_bool,	     &max_int_alignment, &int_type },
>  	{ &void_ctype,	    SYM_BASETYPE, 0,			    NULL,	     NULL,		 NULL },
> -	{ &type_ctype,	    SYM_BASETYPE, MOD_TYPE,		    NULL,		     NULL,		 NULL },
> +	{ &type_ctype,	    SYM_BASETYPE, 0,			    NULL,	     NULL,		 NULL },
>  	{ &incomplete_ctype,SYM_BASETYPE, 0,			    NULL,		     NULL,		 NULL },
>  	{ &bad_ctype,	    SYM_BASETYPE, 0,			    NULL,		     NULL,		 NULL },
>  
> diff --git a/symbol.h b/symbol.h
> index ee7088718..fd536ed6e 100644
> --- a/symbol.h
> +++ b/symbol.h
> @@ -222,7 +222,7 @@ struct symbol {
>  #define MOD_UNSIGNED		0x00004000
>  #define MOD_EXPLICITLY_SIGNED	0x00008000
>  
> -#define MOD_TYPE		0x00010000
> +//      UNUSED			0x00010000

Hmm, you used /* ... */ for a similar thing in patch #1.

>  #define MOD_USERTYPE		0x00020000
>  #define MOD_CHAR		0x00040000
>  #define MOD_SHORT		0x00080000
> @@ -373,7 +373,7 @@ static inline int is_signed_type(struct symbol *sym)
>  
>  static inline int is_type_type(struct symbol *type)
>  {
> -	return (type->ctype.modifiers & MOD_TYPE) != 0;
> +	return type == &type_ctype;
>  }
>  
>  static inline int is_ptr_type(struct symbol *type)
> 

This whole series looks obviously good.

Thanks.

ATB,
Ramsay Jones


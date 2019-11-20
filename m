Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20571103171
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 03:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbfKTCNz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 21:13:55 -0500
Received: from avasout04.plus.net ([212.159.14.19]:43571 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfKTCNz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 21:13:55 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id XFVAir4FP4Al0XFVBiyITd; Wed, 20 Nov 2019 02:13:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574216034; bh=vBtHSO/B6MxoSi0DeDqsqksEe6waqPDwO1dkLw9hVow=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=GgcyejFbyBziafnwfH/Pj4hwiyF1fubsd3Wc0W9LnAmPeDdrRbttRtX4wuFZADdzz
         JyRMjKQ4XRsyeqItLIfJ/pL9bWLpGiMWO/WyflQ5Bs49nTt4CvKWHhboLfYSHRML/G
         A+D5L8F98NpzKwitzL4kPLI++tasHWxeLp4kMA+XXbWMtGDNUxLTg0kBRcuXn0RkNr
         ODair5ZnrLzwyHyxJ6cWvsBMLX9G0H2eLbz9mCDZqshwkUakk46lKZhMnfM2PgvxgI
         69iBdkop/3pfmbE6xDz5vpHt6n3UsA4M6ws4Vv7P2BEF/YsbSc6Q2ulkBqDslO1VyW
         FFVP22iHFy58Q==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8
 a=pGLkceISAAAA:8 a=bDlFDvaDmHgyw6Df_b4A:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 4/5] propagate function modifiers only to functions
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
 <20191120000224.30441-5-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <b9aa0b5c-7e65-25ac-898a-a87c5fcaee98@ramsayjones.plus.com>
Date:   Wed, 20 Nov 2019 02:13:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120000224.30441-5-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGDShZBfSXLCXVYPWm6VvAmk8kngJDzFR3Uofrnlzl/b17Y4epXlppC8zy1FUVk+97stRcaE0HDmtj2+rlIzFZQSS5hD4Dv9p63xnTsHTnqzG3p/Ln6p
 nGMG5dncQoxlDKjnoQeRM7PiByBHcgKlTLjk9kdQXn4uXost+tbc4F/W0KMW+QVDxZwJKFXaV8J6EQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 20/11/2019 00:02, Luc Van Oostenryck wrote:
> Function attributes need to be parsed differently
> than the usual specifiers: For example, in code like:
> 	#define __noreturn __attribute__((noreturn))
> 	__noreturn void foo(int a);
> the __noreturn attribute should apply to the function type
> while a specifier like 'const' would apply to its return type.
> 
> The situation is quite similar to how storage specifiers
> must not be handled by alloc_indirect_symbol().
> However, the solution used for storage specifiers (apply the
> modifier bits only after the declarator is reached: cfr.commit
> 233d4e17c ("function attributes apply to the function declaration"))
> can't be used here (because the storage modifiers can be applied
> to the outermost declarator and function attributes may be
> applied more deeper if function pointers are present).

s/deeper/deeply/

> 
> Fix this by:
> 1) reverting the previous storage-specifier-like solution
> 2) collect function specifiers MODs in a new separate
>    field in the declaration context (f_modifiers)
> 3) apply these modifiers when the declarator for the
>    function type is reached (note: it must not be
>    applied to the SYM_FN itself since this correspond
>    to the function's return type; it must be applied to
>    the parent node which can be a SYM_NODE or a SYM_PTR).
> 4) also apply these modifiers to the declarated symbol,

s/declarated/declared/

>    if this symbol is a function declaration, to take
>    into account attributes which are placed at the end
>    of the declaration and not in front.
> 
> Reported-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
> Fixes: 233d4e17c544e1de252aed8f409630599104dbc7
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  parse.c                                 | 49 +++++++++++++------------
>  symbol.h                                |  3 +-
>  validation/function-attribute-inner.c   |  1 -
>  validation/function-attribute-pointer.c |  1 -
>  4 files changed, 28 insertions(+), 26 deletions(-)
> 
> diff --git a/parse.c b/parse.c
> index 37ffede72..acae63af2 100644
> --- a/parse.c
> +++ b/parse.c
> @@ -82,6 +82,7 @@ typedef struct token *attr_t(struct token *, struct symbol *,
>  
>  static attr_t
>  	attribute_packed, attribute_aligned, attribute_modifier,
> +	attribute_function,
>  	attribute_ext_visible,
>  	attribute_bitwise,
>  	attribute_address_space, attribute_context,
> @@ -375,6 +376,10 @@ static struct symbol_op attr_mod_op = {
>  	.attribute = attribute_modifier,
>  };
>  
> +static struct symbol_op attr_fun_op = {
> +	.attribute = attribute_function,
> +};
> +
>  static struct symbol_op ext_visible_op = {
>  	.attribute = attribute_ext_visible,
>  };
> @@ -566,13 +571,13 @@ static struct init_keyword {
>  	{ "__designated_init__",	NS_KEYWORD,	.op = &designated_init_op },
>  	{ "transparent_union",	NS_KEYWORD,	.op = &transparent_union_op },
>  	{ "__transparent_union__",	NS_KEYWORD,	.op = &transparent_union_op },
> -	{ "noreturn",	NS_KEYWORD,	MOD_NORETURN,	.op = &attr_mod_op },
> -	{ "__noreturn__",	NS_KEYWORD,	MOD_NORETURN,	.op = &attr_mod_op },
> -	{ "pure",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
> -	{"__pure__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
> -	{"const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
> -	{"__const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
> -	{"__const__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_mod_op },
> +	{ "noreturn",	NS_KEYWORD,	MOD_NORETURN,	.op = &attr_fun_op },
> +	{ "__noreturn__",	NS_KEYWORD,	MOD_NORETURN,	.op = &attr_fun_op },
> +	{ "pure",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
> +	{"__pure__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },

Hmm, shouldn't these:

> +	{"const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
> +	{"__const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
> +	{"__const__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },

... be attr_mod_op? (I'm just reading this in my email client, so I
haven't given it much thought, but it just seems wrong ...)

ATB,
Ramsay Jones


>  	{"externally_visible",	NS_KEYWORD,	.op = &ext_visible_op },
>  	{"__externally_visible__",	NS_KEYWORD,	.op = &ext_visible_op },
>  
> @@ -1117,6 +1122,15 @@ static struct token *attribute_modifier(struct token *token, struct symbol *attr
>  	return token;
>  }
>  
> +static struct token *attribute_function(struct token *token, struct symbol *attr, struct decl_state *ctx)
> +{
> +	unsigned long mod = attr->ctype.modifiers;
> +	if (ctx->f_modifiers & mod)
> +		warning(token->pos, "duplicate %s", modifier_string(mod));
> +	ctx->f_modifiers |= mod;
> +	return token;
> +}
> +
>  static struct token *attribute_ext_visible(struct token *token, struct symbol *attr, struct decl_state *ctx)
>  {
>  	ctx->is_ext_visible = 1;
> @@ -1862,6 +1876,7 @@ static struct token *direct_declarator(struct token *token, struct decl_state *c
>  		enum kind kind = which_func(token, p, ctx->prefer_abstract);
>  		struct symbol *fn;
>  		fn = alloc_indirect_symbol(token->pos, ctype, SYM_FN);
> +		ctype->modifiers |= ctx->f_modifiers;
>  		token = token->next;
>  		if (kind == K_R)
>  			token = identifier_list(token, fn);
> @@ -2900,21 +2915,6 @@ static struct token *toplevel_asm_declaration(struct token *token, struct symbol
>  	return token;
>  }
>  
> -static unsigned long declaration_modifiers(struct decl_state *ctx)
> -{
> -	unsigned long mods;
> -
> -	// Storage modifiers only relates to the declaration
> -	mods = storage_modifiers(ctx);
> -
> -	// Function attributes also only relates to the declaration
> -	// and must not be present in the function/return type.
> -	mods |= ctx->ctype.modifiers & MOD_FUN_ATTR;
> -	ctx->ctype.modifiers &=~ MOD_FUN_ATTR;
> -
> -	return mods;
> -}
> -
>  struct token *external_declaration(struct token *token, struct symbol_list **list,
>  		validate_decl_t validate_decl)
>  {
> @@ -2935,7 +2935,7 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
>  
>  	/* Parse declaration-specifiers, if any */
>  	token = declaration_specifiers(token, &ctx);
> -	mod = declaration_modifiers(&ctx);
> +	mod = storage_modifiers(&ctx);
>  	decl = alloc_symbol(token->pos, SYM_NODE);
>  	/* Just a type declaration? */
>  	if (match_op(token, ';')) {
> @@ -2988,6 +2988,9 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
>  				show_ident(decl->ident));
>  			base_type->ctype.base_type = &int_ctype;
>  		}
> +		/* apply attributes placed after the declarator */
> +		decl->ctype.modifiers |= ctx.f_modifiers;
> +
>  		/* K&R argument declaration? */
>  		if (lookup_type(token))
>  			return parse_k_r_arguments(token, decl, list);
> diff --git a/symbol.h b/symbol.h
> index 2465d6d88..d8a4f3b68 100644
> --- a/symbol.h
> +++ b/symbol.h
> @@ -107,6 +107,7 @@ struct decl_state {
>  	struct ctype ctype;
>  	struct ident **ident;
>  	struct symbol_op *mode;
> +	unsigned long f_modifiers;		// function attributes
>  	unsigned char prefer_abstract, is_inline, storage_class, is_tls;
>  	unsigned char is_ext_visible;
>  };
> @@ -251,7 +252,7 @@ struct symbol {
>  #define MOD_PTRINHERIT	(MOD_QUALIFIER | MOD_NODEREF | MOD_NORETURN | MOD_NOCAST)
>  /* modifiers preserved by typeof() operator */
>  #define MOD_TYPEOF	(MOD_QUALIFIER | MOD_NOCAST | MOD_SPECIFIER)
> -/* modifiers for funtion attributes */
> +/* modifiers for function attributes */
>  #define MOD_FUN_ATTR	(MOD_PURE|MOD_NORETURN)
>  /* like cvr-qualifiers but 'reversed' (OK: source <= target) */
>  #define MOD_REV_QUAL	(MOD_PURE|MOD_NORETURN)
> diff --git a/validation/function-attribute-inner.c b/validation/function-attribute-inner.c
> index 178c7c019..3a8a8407f 100644
> --- a/validation/function-attribute-inner.c
> +++ b/validation/function-attribute-inner.c
> @@ -6,5 +6,4 @@ _Static_assert([void (__noreturn *)(void)] == [typeof(&fun)], "");
>  
>  /*
>   * check-name: function-attribute-inner
> - * check-known-to-fail
>   */
> diff --git a/validation/function-attribute-pointer.c b/validation/function-attribute-pointer.c
> index 27f43bfb6..fd08ac710 100644
> --- a/validation/function-attribute-pointer.c
> +++ b/validation/function-attribute-pointer.c
> @@ -21,7 +21,6 @@ static void foo(void)
>  
>  /*
>   * check-name: function-attribute-pointer
> - * check-known-to-fail
>   *
>   * check-error-start
>  function-attribute-pointer.c:14:20: warning: incorrect type in argument 1 (different modifiers)
> 

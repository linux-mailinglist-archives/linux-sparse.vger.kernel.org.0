Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63D9010A76D
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 01:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfK0AVD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 19:21:03 -0500
Received: from avasout04.plus.net ([212.159.14.19]:47333 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfK0AVD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 19:21:03 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id Zl4ni0tcM4Al0Zl4oi2nbL; Wed, 27 Nov 2019 00:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574814062; bh=6+W36wLX4TjuqvhkzOvIiLRcOW3DKlMHUqC1R+9ribQ=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=qc4iBE6bUHaWli/FhLjoPmJlkgiKmJ7h8XbUgS8ZM93CEOiB2XH3RReU8zCQkFWi7
         e5W1Lo24DhTa8d8SXxfyA8fINVJZlLqiYZnnJEgfQeyG1+S98UqCZGtqsIg4lOYAgK
         hjwy0vLROGWvkXKueaUiJM9gfSLsq963HP1uDap5lK3OBcthZhy4kYSFcRKa4kA9iQ
         amJQRSQ2BwViKlpp9uFva3uCHcyiLMJcuNZ7JLZtazLddG/diUhHqRSPyjLbIqv0Bf
         E0sOV1Z0vNbscqypEwHmhuTYDUe3PVIzUlYK9bUVCuwszN0XaY2MHvdPp8R1ZAnAio
         YJkZM7pUqexBA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8
 a=pGLkceISAAAA:8 a=DuCSXAeyd9ta_lLYh3cA:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] spec: replace lllong_ctype by int128_ctype
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191126203029.63676-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <015e3edd-3eba-2e02-13e6-d88d879f45f0@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 00:21:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191126203029.63676-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP/a8bJfemmWbIaZRUqYpf6vIzY/A44jotEQr1OgZ105IfE5p/C7fN2402lSPssgMUpMCR1J2aGHxmcCaQ1N1ohHFTjeoqCP9U8O5QlKggMOb9KtBR1l
 gWY+e1Kr4O5yVzHDTKIPqxWAlw0FZJ2SEyfbztb2I9FZvKQluaIGLuzQDPp0t9DTxo1R0xNi+Lmd9w==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 26/11/2019 20:30, Luc Van Oostenryck wrote:
> Sparse knows about __int128_t, __uint128_t & __int128.
> 
> However, internally, these types are treated as a kind of 128-bit
> 'long long long' type. It's mainly a question of variable naming,
> but these types are also displayed by show_typename() as
> 'long long long' which can't be parsed back, neither by GCC,
> nor even  by sparse itself.
> 
> So, rename the variables to use 'int128' and let show_typename()
> display these types as '[signed|unsigned] __int128'.
> 
> Reported-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>

Hmm, where does this patch apply? I tried 'master' along with
(on a hunch) 'luc/parse-spec', but could not get it to 'git-am'
correctly.

ATB,
Ramsay Jones

> ---
>  parse.c      | 14 +++++++-------
>  show-parse.c |  6 +++---
>  symbol.c     |  8 ++++----
>  symbol.h     |  2 +-
>  4 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/parse.c b/parse.c
> index 4f7ba0c9a..6db3cba73 100644
> --- a/parse.c
> +++ b/parse.c
> @@ -493,8 +493,8 @@ static struct init_keyword {
>  	/* Predeclared types */
>  	{ "__builtin_va_list", NS_TYPEDEF, .type = &ptr_ctype, .op = &spec_op },
>  	{ "__builtin_ms_va_list", NS_TYPEDEF, .type = &ptr_ctype, .op = &spec_op },
> -	{ "__int128_t",	NS_TYPEDEF, .type = &lllong_ctype, .op = &spec_op },
> -	{ "__uint128_t",NS_TYPEDEF, .type = &ulllong_ctype, .op = &spec_op },
> +	{ "__int128_t",	NS_TYPEDEF, .type = &sint128_ctype, .op = &spec_op },
> +	{ "__uint128_t",NS_TYPEDEF, .type = &uint128_ctype, .op = &spec_op },
>  	{ "_Float32",	NS_TYPEDEF, .type = &float32_ctype, .op = &spec_op },
>  	{ "_Float32x",	NS_TYPEDEF, .type = &float32x_ctype, .op = &spec_op },
>  	{ "_Float64",	NS_TYPEDEF, .type = &float64_ctype, .op = &spec_op },
> @@ -1229,8 +1229,8 @@ static struct symbol *to_TI_mode(struct symbol *ctype)
>  {
>  	if (ctype->ctype.base_type != &int_type)
>  		return NULL;
> -	return ctype->ctype.modifiers & MOD_UNSIGNED ? &ulllong_ctype
> -						     : &slllong_ctype;
> +	return ctype->ctype.modifiers & MOD_UNSIGNED ? &uint128_ctype
> +						     : &sint128_ctype;
>  }
>  
>  static struct symbol *to_pointer_mode(struct symbol *ctype)
> @@ -1569,13 +1569,13 @@ Catch_all:
>  }
>  
>  static struct symbol * const int_types[] =
> -	{&char_ctype, &short_ctype, &int_ctype, &long_ctype, &llong_ctype, &lllong_ctype};
> +	{&char_ctype, &short_ctype, &int_ctype, &long_ctype, &llong_ctype, &int128_ctype};
>  static struct symbol * const signed_types[] =
>  	{&schar_ctype, &sshort_ctype, &sint_ctype, &slong_ctype, &sllong_ctype,
> -	 &slllong_ctype};
> +	 &sint128_ctype};
>  static struct symbol * const unsigned_types[] =
>  	{&uchar_ctype, &ushort_ctype, &uint_ctype, &ulong_ctype, &ullong_ctype,
> -	 &ulllong_ctype};
> +	 &uint128_ctype};
>  static struct symbol * const real_types[] =
>  	{&float_ctype, &double_ctype, &ldouble_ctype};
>  static struct symbol * const * const types[] = {
> diff --git a/show-parse.c b/show-parse.c
> index a0436cbe0..f0ea9caea 100644
> --- a/show-parse.c
> +++ b/show-parse.c
> @@ -235,9 +235,9 @@ static struct ctype_name {
>  	{ & llong_ctype, "long long", "LL" },
>  	{ &sllong_ctype, "signed long long", "LL" },
>  	{ &ullong_ctype, "unsigned long long", "ULL" },
> -	{ & lllong_ctype, "long long long", "LLL" },
> -	{ &slllong_ctype, "signed long long long", "LLL" },
> -	{ &ulllong_ctype, "unsigned long long long", "ULLL" },
> +	{ & int128_ctype, "__int128", "" },
> +	{ &sint128_ctype, "signed __int128", "" },
> +	{ &uint128_ctype, "unsigned __int128", "" },
>  
>  	{ &void_ctype,   "void", "" },
>  	{ &bool_ctype,   "bool", "" },
> diff --git a/symbol.c b/symbol.c
> index 79951a076..53ea037a5 100644
> --- a/symbol.c
> +++ b/symbol.c
> @@ -694,7 +694,7 @@ struct symbol	bool_ctype, void_ctype, type_ctype,
>  		int_ctype, sint_ctype, uint_ctype,
>  		long_ctype, slong_ctype, ulong_ctype,
>  		llong_ctype, sllong_ctype, ullong_ctype,
> -		lllong_ctype, slllong_ctype, ulllong_ctype,
> +		int128_ctype, sint128_ctype, uint128_ctype,
>  		float_ctype, double_ctype, ldouble_ctype,
>  		string_ctype, ptr_ctype, lazy_ptr_ctype,
>  		incomplete_ctype, label_ctype, bad_ctype,
> @@ -774,9 +774,9 @@ static const struct ctype_declare {
>  	{ &llong_ctype,        T__INT( 2, longlong) },
>  	{ &sllong_ctype,       T_SINT( 2, longlong) },
>  	{ &ullong_ctype,       T_UINT( 2, longlong) },
> -	{ &lllong_ctype,       T__INT( 3, longlonglong) },
> -	{ &slllong_ctype,      T_SINT( 3, longlonglong) },
> -	{ &ulllong_ctype,      T_UINT( 3, longlonglong) },
> +	{ &int128_ctype,       T__INT( 3, type128) },
> +	{ &sint128_ctype,      T_SINT( 3, type128) },
> +	{ &uint128_ctype,      T_UINT( 3, type128) },
>  
>  	{ &float_ctype,        T_FLOAT(-1, float) },
>  	{ &double_ctype,       T_FLOAT( 0, double) },
> diff --git a/symbol.h b/symbol.h
> index ad65a9044..e60d91365 100644
> --- a/symbol.h
> +++ b/symbol.h
> @@ -272,7 +272,7 @@ extern struct symbol	bool_ctype, void_ctype, type_ctype,
>  			int_ctype, sint_ctype, uint_ctype,
>  			long_ctype, slong_ctype, ulong_ctype,
>  			llong_ctype, sllong_ctype, ullong_ctype,
> -			lllong_ctype, slllong_ctype, ulllong_ctype,
> +			int128_ctype, sint128_ctype, uint128_ctype,
>  			float_ctype, double_ctype, ldouble_ctype,
>  			string_ctype, ptr_ctype, lazy_ptr_ctype,
>  			incomplete_ctype, label_ctype, bad_ctype,
> 

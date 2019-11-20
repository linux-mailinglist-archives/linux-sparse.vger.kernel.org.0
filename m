Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F302710317F
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 03:19:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbfKTCTm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 21:19:42 -0500
Received: from avasout04.plus.net ([212.159.14.19]:43816 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbfKTCTm (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 21:19:42 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id XFalir4SO4Al0XFamiyIWN; Wed, 20 Nov 2019 02:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574216380; bh=DtKyNJZQoPb+hgrouY28EZuLU74RkF9upZCTec5xR6g=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=i9iDh0HSfSfWe6RgSS+tevflC41XmtRKoYhXUur0Wb82gp9M/AfFl45/cBWKSBKnj
         Pllq71TeJmuVx9x/FRPzpSznCN5YK4AZcAP7//okIvWMQXbwKhq5I1vsAYthk4cR9f
         IIrXpGL5wTH5ax7BujY3tt7vgdOt3HdP9bri97Ne0V5XCsAvcLQ1fPlvVIgmIZTOD1
         3elPS7AD2ALzCTbfpA9jSH5jQGeTPDZjEOxntmjckeH7cGlkycPUGFCAyJLl7rsgFB
         RzmHYmUV3BC0lSLFv1nOXA9EMdUgCbf4S8Tovk2rKHohozahTKrcS+ePTG+QtP1DcE
         hzavYGBakOSaQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=qKGxaBiyDxZj9c1BscIA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 5/5] allow omitted function attribute in definition
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
 <20191120000224.30441-6-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <273f0297-7966-176a-bce3-1e0d40ace30c@ramsayjones.plus.com>
Date:   Wed, 20 Nov 2019 02:19:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120000224.30441-6-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEjlimCvTU8oet1X8Fvy7qyKFQPUWFOBxkd/PMuuQriEApuf4ADwhneM+/yJTZxtdHBqzSubvMH3fmSghwi7+WncszFat5fBnTjLiDCQmtOD7F6XvU7J
 e7Y/BJbM8rn8ROOmoalhN+D76xbRdGI0wevDdpAQjZ12BNUY/55L4Z8llHAt868jI+h8v3S8g9HQ3Q==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 20/11/2019 00:02, Luc Van Oostenryck wrote:
> It's common to declare a function with the attribute
> 'pure' or 'noreturn' and to omit the attribute in the
> function definition.
> 
> It make some sense since the information convoyed by

s/convoyed/conveyed/

> these attribute are destinated to the function users

s/attribute/attributes/
s/destinated to/destined for/

> not the function itself.
> 
> Silence the warnings emitted when the attributes are
> omited by masking the corresponding modifier bits

s/omited/omitted/

> when checking the type compatibility between a
> function definition and its declarations.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  evaluate.c                              | 4 +++-
>  validation/function-attribute-omitted.c | 1 -
>  validation/function-redecl2.c           | 3 ---
>  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/evaluate.c b/evaluate.c
> index 863750fab..4e1762eff 100644
> --- a/evaluate.c
> +++ b/evaluate.c
> @@ -3371,6 +3371,7 @@ void check_duplicates(struct symbol *sym)
>  	int initialized = sym->initializer != NULL;
>  
>  	while ((next = next->same_symbol) != NULL) {
> +		unsigned long fmods;
>  		const char *typediff;
>  		evaluate_symbol(next);
>  		if (initialized && next->initializer) {
> @@ -3381,7 +3382,8 @@ void check_duplicates(struct symbol *sym)
>  			initialized = 0;
>  		}
>  		declared++;
> -		typediff = type_difference(&sym->ctype, &next->ctype, 0, 0);
> +		fmods = next->ctype.modifiers & MOD_FUN_ATTR;
> +		typediff = type_difference(&sym->ctype, &next->ctype, fmods, 0);
>  		if (typediff) {
>  			sparse_error(sym->pos, "symbol '%s' redeclared with different type (originally declared at %s:%d) - %s",
>  				show_ident(sym->ident),
> diff --git a/validation/function-attribute-omitted.c b/validation/function-attribute-omitted.c
> index 43b301d8f..c5eb50d31 100644
> --- a/validation/function-attribute-omitted.c
> +++ b/validation/function-attribute-omitted.c
> @@ -10,5 +10,4 @@ void		n(void) { while (1) ; }
>  
>  /*
>   * check-name: function-attribute-omitted
> - * check-known-to-fail

yay!  \O/

Thanks! (That's all for tonight!)

ATB,
Ramsay Jones

>   */
> diff --git a/validation/function-redecl2.c b/validation/function-redecl2.c
> index 3435aa00c..ef396137a 100644
> --- a/validation/function-redecl2.c
> +++ b/validation/function-redecl2.c
> @@ -25,7 +25,4 @@ void func2(int a)
>  
>  /*
>   * check-name: function-redecl2
> - *
> - * check-known-to-fail
> - *
>   */
> 

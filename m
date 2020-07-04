Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EC12147C8
	for <lists+linux-sparse@lfdr.de>; Sat,  4 Jul 2020 19:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726739AbgGDRo5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 4 Jul 2020 13:44:57 -0400
Received: from avasout04.plus.net ([212.159.14.19]:45145 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgGDRo4 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 4 Jul 2020 13:44:56 -0400
Received: from [10.0.2.15] ([195.213.6.94])
        by smtp with ESMTPA
        id rmDdjWJZnrXCcrmDeja5DQ; Sat, 04 Jul 2020 18:44:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1593884694; bh=Ilff2eF35QY0jp/h4NE+rWTlmsNNuF1Geakf7JRyBws=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=FROThS9TGgxNSeifG0+Sx/5z0YVz5rrGYrOHWjCrCKm2x0RjzFB1QEJys+u3TIzqR
         30kDcBdhTqFKTFmVDPBxFHRcXGCkGpN2yqnqo2MkiWdHTceFiJX50MA8kuaEZIEfyp
         KBcVd4EVb2732K8CpLpvySHVkpy2fh1dgXhLQhGHF1dnucrXvCuo2ptWXr+kqZLkV3
         BIyinEOX2gw3RSGhmVXyDgFXni1RSXbMA9Jppjd8utmtHBT/oACp/bNQHimofjiCC2
         jvshIl5IMiL0dMe26jFqFUAcVPq5lfcUKWqU3Ti2FENdIwJ9fExSFx1gSqFC9KdV/P
         Aqxkg3VuOIm4w==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Q+xJH7+a c=1 sm=1 tr=0
 a=zLrGoXp437TtaqwGN82bxg==:117 a=zLrGoXp437TtaqwGN82bxg==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=LaZqv50LeR_9UZHcis0A:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 2/3] add memory asm constraint for PPC
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20200704135747.87752-1-luc.vanoostenryck@gmail.com>
 <20200704135747.87752-3-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <693a3fa0-5202-3695-54cf-aa1cc1f514fd@ramsayjones.plus.com>
Date:   Sat, 4 Jul 2020 18:44:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200704135747.87752-3-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP3BdPn/YtIz+e0QmC5/eXS4skCxvt2QY/0XlEYwbuqhlXVGFa86On0dspx9W+1zjSXtWRuE7jnCpdcGzhMFnluY6SnEKcdXcoA+wCNdsQUOjieiqnhN
 6/7DE8LVoDzXRCVAPhe8kJoMKaa/b7NqrH2+/YLI8tBFtUFohfyKi5EzwBV7Lfxbtp8vgw0vHI2BWw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


Hi Luc,

All of the patches in this series look good to me! ;-)

(I have been following all patches on the list, I just
haven't had anything to say about them - which is a good thing!)

On 04/07/2020 14:57, Luc Van Oostenryck wrote:
> The 'Z' asm constraint is used for doing IO accessors on PPC but
> isn't part of the 'common constraints'. It's responsible for
> more than half of all warnings (with defconfig + allyesconfig).

Not a problem, but this made me think 'half of which warnings'. :-D
I assume, but it's just a guess, this means 'half of all asm-constraints
warnings on the kernel PPC build'.

How many warnings is that? What percentage is that of _all_ sparse
warnings on a typical kernel build?

Thanks!

[BTW, I also noticed the (long running) 'luc/options' branch, which
looks like it could prove to be a nice cleanup - I've only read the
commit messages, not the actual commits.]

ATB,
Ramsay Jones

> 
> Fix this by handling this constraint in a specific method for PPC.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  target-ppc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/target-ppc.c b/target-ppc.c
> index b138635b9103..c0d6068f436a 100644
> --- a/target-ppc.c
> +++ b/target-ppc.c
> @@ -1,6 +1,7 @@
>  #include "symbol.h"
>  #include "target.h"
>  #include "machine.h"
> +#include "expression.h"
>  
>  
>  static void predefine_ppc(const struct target *self)
> @@ -15,6 +16,16 @@ static void predefine_ppc(const struct target *self)
>  		predefine("_BIG_ENDIAN", 1, "1");
>  }
>  
> +static const char *asm_constraint_ppc(struct asm_operand *op, int c, const char *str)
> +{
> +	switch (c) {
> +	case 'Z':
> +		op->is_memory = true;
> +		break;
> +	}
> +	return str;
> +}
> +
>  
>  static void predefine_ppc32(const struct target *self)
>  {
> @@ -32,6 +43,7 @@ const struct target target_ppc32 = {
>  	.target_64bit = &target_ppc64,
>  
>  	.predefine = predefine_ppc32,
> +	.asm_constraint = asm_constraint_ppc,
>  };
>  
>  
> @@ -55,4 +67,5 @@ const struct target target_ppc64 = {
>  	.target_32bit = &target_ppc32,
>  
>  	.predefine = predefine_ppc64,
> +	.asm_constraint = asm_constraint_ppc,
>  };
> 

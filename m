Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6900AF6208
	for <lists+linux-sparse@lfdr.de>; Sun, 10 Nov 2019 02:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfKJBae (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 20:30:34 -0500
Received: from avasout03.plus.net ([84.93.230.244]:42544 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfKJBae (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 20:30:34 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id Tc3jixhqmKleZTc3libCxi; Sun, 10 Nov 2019 01:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1573349433; bh=ND61Qf1dBRaHELjjVG7LON8hseiKVR6tyrrOAr0UwYA=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=TcuUjLCtounzaY4FQlkCzDY8auP6yaduvPj1OcB9dMBy6STLShXJI6Lf7/JCTeY/G
         5lPxf0cHCHxke21Myr1zn9yVPOzBEfQxtz2hQV1vgl3DMl57gkYIXpSTtB2qQI1Dqz
         xyy4ruNry2Ty598LpMF5tmEJurnbIrWac9pqX6kF3NL0lS3rQsNYfwHXQY4FiMuob6
         s421Qnf3UDRKCBFdzTltqhGd9pLSk+b72k9CWtiU2FueSx6bl6HcXtLXZA8wLIY5E5
         uON52u5JwqQL/ZlOgDf+wGhzu8hNjByKkqUNfoLxFJVUjP2NVl/44Yy5Z5w6V0afr+
         yq2v8+sO2tcrA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=9oZuuXWrouY-7KKWOrkA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 2/4] typeof: fix up comment in examine_pointer_type()
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
 <20191109133519.63010-3-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <7029af3c-e9f6-043e-b3de-dd6d8f3be078@ramsayjones.plus.com>
Date:   Sun, 10 Nov 2019 01:30:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191109133519.63010-3-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEPAOJiLlMqnnuQHXXOBSdoGGbXKtikllAwMIES5iDM/21rPus3z3wKKgN39eCTz3zmUDdtDsVbUT2tUPnRanGHpb79NeIU33kYuuOjqjs3Xkb+SoNOM
 gxuyQg8Tu7Wp5gS4Hxmn370qQk4nQUZEKnZU2oNgtaOnbta7MOcfzDNSN3HuhRixAK7GCzi+hjTrnQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 09/11/2019 13:35, Luc Van Oostenryck wrote:
> The comment was added in commit c72032ad3 ("Add comment on what ...")
> and explain why the size is set before recursing into the object
> pointed to. But since commit 017034ed4 ("Fix up type examination.")
> the object is nore examined.

s/nore/now/?

ATB,
Ramsay Jones

> 
> Adjust the comment to remove posible confusion.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  symbol.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/symbol.c b/symbol.c
> index 72ea2e4e7..334f9df29 100644
> --- a/symbol.c
> +++ b/symbol.c
> @@ -436,10 +436,11 @@ static struct symbol *examine_enum_type(struct symbol *sym)
>  static struct symbol *examine_pointer_type(struct symbol *sym)
>  {
>  	/*
> -	 * We need to set the pointer size first, and
> -	 * examine the thing we point to only afterwards.
> -	 * That's because this pointer type may end up
> -	 * being needed for the base type size evaluation.
> +	 * Since pointers to incomplete types can be used,
> +	 * for example in a struct-declaration-list,
> +	 * the base type must *not* be examined here.
> +	 * It thus means that it needs to be done later,
> +	 * when the base type of the pointer is looked at.
>  	 */
>  	if (!sym->bit_size)
>  		sym->bit_size = bits_in_pointer;
> 

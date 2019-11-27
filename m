Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA80510B2D5
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 16:58:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfK0P6x (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 10:58:53 -0500
Received: from avasout01.plus.net ([84.93.230.227]:42683 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0P6x (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 10:58:53 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id ZziMigTfvSXPqZziNiGl1L; Wed, 27 Nov 2019 15:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574870331; bh=U+XrpRt3D9cKtp1jn9livq/qUdS1HacdcgCLKMWCMtQ=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=PedpOnAyv3OnUGB67nbsPvCDGHiBd7tzRijzm54+j+lz/3do1oNvpDPu+6RYW87ZH
         0WSslusnCncHPYmt6bljII72xkZbt2wEX8iMiDISTJnnHgI4lLmbpQZ9DVLI3pRcpH
         k9TGAvAJWfJoXI0REDTVqFLSaHVUl7Ikkrp1TH4lK4/G7744WqWUIlkrVzJF03NLdH
         Zcx4nMdzq36a7hM6mFg5AlEZjcGWnO4qcebPweoOhAPZIJZEtMz8P8PfWveKZ9L4Kj
         U+bBNfJ5FrKfUVgHbkvkR9huniX089QzJ3uLKy8statYi+vJOLkRrK8/OgNnTZrU5W
         BNCh/4XkdAMXQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=U/js8tju c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=2kiK2E52bXNfRXITg58A:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v2 02/12] arch: simplify i386/x86-64 specifics
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
 <20191127020643.68629-3-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <760daec9-8e73-d4be-5502-4d7c74f467f6@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 15:58:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127020643.68629-3-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIjJDVe7V982yQFHzIYxrwPXGeRaroeKdKQ0G0ldTFQTRUgpSn9PX0qA4AVstgl4bpYYQC2kcV52P/kvqrh6pfyIsfzKna7Y4WgKqajF+YGnjg+YC1N5
 w8FeP0SfN/rM1AVOdRuTeoqY2yUn5/0Ljrcbu9wca8ulxyyma06cWIC1WutSHxX5J1ZRKZKrS8FM+Q==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 02:06, Luc Van Oostenryck wrote:
> The current test for setting wchar on i386 uses a
> conditional break and a fallthrough on the x86-64 case.
> 
> This is not needed and can be simplified by reversing the
> order of the i386 & x86-64 cases.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  target.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/target.c b/target.c
> index 497ecdc5e..acafbd929 100644
> --- a/target.c
> +++ b/target.c
> @@ -79,11 +79,11 @@ void init_target(void)
>  	}
>  
>  	switch (arch_mach) {
> -	case MACH_X86_64:
> -		if (arch_m64 == ARCH_LP64)
> -			break;
> -		/* fall through */
>  	case MACH_I386:
> +		wchar_ctype = &long_ctype;
> +		/* fall through */
> +	case MACH_X86_64:
> +		break;
>  	case MACH_M68K:
>  	case MACH_SPARC32:
>  	case MACH_PPC32:
> 

Hmm, wouldn't it be easier to simply remove the MACH_X86_64 case
altogether, so that you have:

	switch (arch_mach) {
	case MACH_I386:
	case MACH_M68K:
	...

... since m68k, sparc32 and ppc32 case-s which follow also set
wchar_ctype to 'long'?

If you don't want to remove the MACH_X86_64 case, then have:

	switch (arch_mach) {
	case MACH_X86_64:
		break;
	case MACH_I386:
	case MACH_M68K:
	...

instead?

ATB,
Ramsay Jones

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A46E510B37A
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 17:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbfK0QeO (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 11:34:14 -0500
Received: from avasout01.plus.net ([84.93.230.227]:45742 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfK0QeN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 11:34:13 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id a0GZigWb0SXPqa0GaiGn4G; Wed, 27 Nov 2019 16:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574872452; bh=q6Rew873appLT1ANDj4EHVWqS9INMp+0VQwxFFlsQVg=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=AmrCI8lbGNi4qUIy5PU0Sil6dFR+tLEYp0DjuyTf/uJZAK01qji1PyHbBbhA4Xy+B
         HZ8d+fX+jYyGbpW2iYo7fmgI8lMv4EfrS1VNXy4kycBxD8894lNcMCr6UOyMxhCdQn
         hlCKXzg8lUc49A2z6bWyQYJkRFQqZumk6qTMBTmXJVNAy7YT6BmYr+KRtu9e2LIzov
         2z8j8xet0Yug/gzc6D1ftSrGF/QycBsDwagEoUqGJHBaCvXnhKK3IORqCHl0CMwWbE
         cFRfSIHbvmfywus+RKsGmvZv3SjdB+cs3w56G+lxPOzFFFfIqWH+rUvUlbSuJbBgtq
         6iaUsEKVSkUgg==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=U/js8tju c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=zKM6DHd-OTjsgGm26twA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v2 11/12] arch: sparc32 on SunOS/Solaris uses 128-bit long
 doubles
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
 <20191127020643.68629-12-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <b5002a75-02f9-6650-db7f-9546ac73974d@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 16:34:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127020643.68629-12-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHT6odQe3HzvlBfXeX9NrKBjkh1LFg8amNqUEgShTTcbGdFYYRahdvoUyoiBcZJFe9DJJ+Yjxrdw66k5CgIH1O4mJubKUGvhLxnlUwF0Xt6fk6G4xq0z
 Qa6p5hN22Yu6aH6RLfFlY97TJB+gl4doiLT20OfAzCDkc6SsEokeEFCm7TFZdnsLhNdoufbNNrB9eA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 02:06, Luc Van Oostenryck wrote:
> On 32-bit sparc running SunOS or Solaris, long doubles
> are 128-bit, not 64-bit.
> 
> Add a special case to handle this.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  target.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/target.c b/target.c
> index 64e6533f6..ebc7d493b 100644
> --- a/target.c
> +++ b/target.c
> @@ -116,11 +116,14 @@ void init_target(void)
>  	}
>  
>  	switch (arch_mach) {
> +	case MACH_SPARC32:
> +		if (arch_os == OS_SUNOS)
> +			break;
> +		/* fall through */
>  	case MACH_ARM:
>  	case MACH_MIPS32:
>  	case MACH_S390:
>  	case MACH_S390X:
> -	case MACH_SPARC32:
>  		bits_in_longdouble = 64;
>  		max_fp_alignment = 8;
>  		break;
> 

OK, I had to check that 'bits_in_longdouble' was initialised
to 128 and 'max_fp_alignment' to 16 at the top of the file ...

ATB,
Ramsay Jones



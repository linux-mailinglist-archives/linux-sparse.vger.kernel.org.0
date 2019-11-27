Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0F410B2DE
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 17:01:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfK0QBS (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 11:01:18 -0500
Received: from avasout01.plus.net ([84.93.230.227]:42935 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0QBS (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 11:01:18 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id ZzkiigTvxSXPqZzkjiGlKQ; Wed, 27 Nov 2019 16:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574870477; bh=gEQJqNaIdNpcfokiDuPK7MF3DY8z8jC+PmRutGMU7mo=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=im8bRzVmOAcLNOVeEMMuTfkEhCVtgrZGN9CCasVURnFRhgxbmJf8oDwDuFPF76PAq
         5IYThTTB22/eW28mvd4hfJ9L+zhzQW7HEPly5ZVyB1qeAX++IRFIo32f8oir2UkfLe
         7DK4tJ2yWu1VJrOUVT2dtMFVL5iT37a5T1hEzgEwacEDIGg/HdXWPh+ZQpS3kKcp3g
         vwN4a/C1BVHU+eGI0iUr0zX/mwrlhYtL3D+RocbdlCyMkZCvpt1UNcUGKI4V2L734I
         gXhhbUJjlHXBsNfvsBsJmKkpQAesugcXPSrA2jHhQyOZ/En3RNMjY+2lhd1Ge7K58g
         v632yyxl1KP9Q==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=U/js8tju c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=CmTKI4E7twpjSsFj1rQA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v2 03/12] arch: keep BSD & Darwin specifics with
 i386/x86-64 specifics
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
 <20191127020643.68629-4-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <e86276dc-1458-cd45-7833-cfdb8f530f02@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 16:01:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127020643.68629-4-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMFdWNppWJg0TIPc7Ya8bprhaQ3JUbM2KqKhccfrhYFB+6ftFRDebJCvq+jcqvy99pPKjBjvSfvbHo0wxVxk7974GU4BlwiWeoZgmU8kHLysM5BkX41B
 GJ8n5aP2RwQcMyuzLiZ95yhLyhPH9EWUOBEX4/f8dpu4DxpnQHjPcouUc7vsAhC8tVBqnHAUqvEmtQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 02:06, Luc Van Oostenryck wrote:
> Without more testing, the specific types for wint_t & int64_t
> on FreeBSD & Darwin are only valid for i386/x86-64.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  target.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/target.c b/target.c
> index acafbd929..647817a22 100644
> --- a/target.c
> +++ b/target.c
> @@ -83,6 +83,13 @@ void init_target(void)
>  		wchar_ctype = &long_ctype;
>  		/* fall through */
>  	case MACH_X86_64:
> +#if defined(__APPLE__)
> +		int64_ctype = &llong_ctype;
> +		uint64_ctype = &ullong_ctype;
> +#endif
> +#if defined(__FreeBSD__) || defined(__APPLE__)
> +		wint_ctype = &int_ctype;
> +#endif

Heh, OK, question answered! ;-)

ATB,
Ramsay Jones

>  		break;
>  	case MACH_M68K:
>  	case MACH_SPARC32:
> @@ -193,11 +200,4 @@ void init_target(void)
>  #if defined(__CYGWIN__)
>  	wchar_ctype = &ushort_ctype;
>  #endif
> -#if defined(__FreeBSD__) || defined(__APPLE__)
> -	wint_ctype = &int_ctype;
> -#endif
> -#if defined(__APPLE__)
> -	int64_ctype = &llong_ctype;
> -	uint64_ctype = &ullong_ctype;
> -#endif
>  }
> 

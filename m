Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E14D10B335
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 17:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfK0Q1i (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 11:27:38 -0500
Received: from avasout01.plus.net ([84.93.230.227]:45243 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0Q1h (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 11:27:37 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id a0ABigW3vSXPqa0ACiGmmv; Wed, 27 Nov 2019 16:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574872057; bh=y6MW21EZ4C6Bv943k6PLSd2T5u/n9nI2GKTR7DqCmTw=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Hnxx17/euabtI/Dg7EApfL1OnHssu/Lkh+l92sIsV2bpFyfOLekGDajVMJ0rYjBz+
         DnrbCs9QVJJovS4xR67hUkSFxwA/QTdNdhe+x8SMbTO1v8WkkyyQ8JdPgL+YJyu7Ic
         7StKlYokXB1Zc5asYWKto8PJLX7zYag5D+ugTsF75wieV6ZQk/57sBmjeNOyV4AjXQ
         AphlTq6bBFbgNKx1h6DUESe7sJB+4p4p+z7wcgxQqEh2DHOlMwh3PWAFzIY8KgWfNh
         0bz1vcWaarVlGwB+BSwn7HYep0eCVXXMAMMYtWfoDIVUCysmZ5gwCTkZjvfg3+jb3s
         kB/YNQ9FvHu9g==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=U/js8tju c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=kPjV96IE7-fJrs6VSyUA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v2 09/12] arch: use a variable for the OS
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
 <20191127020643.68629-10-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <4ee48f99-d4c0-1f27-4557-abc014c3d576@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 16:27:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127020643.68629-10-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMsyVq9C4myWgP6D/HzvtxUX2xr06aRhqbKSPMmeVeSj021Bw70sQJzbibUjv2FjEbO8fXbOeY9H2fRVKutOjtHf6cA4HcO3UqLKjvIFOgoxKp0tcJH1
 V0otVH6FcJjgy4MC+ddFY6vad29LdhUzn60fNzxSST6v+9m7gB1HYlj/WGlod8a55T7imQKUJXgXJA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 02:06, Luc Van Oostenryck wrote:
> There are a few OS-specific settings and handling them
> with #ifdef is 1) ugly, 2) can only work with when specifically
> built for this OS (either a native or cross-build).
> 
> So, use a variable to hold the OS and initialize it to the one
> used to compile sparse. This avoid the ugly #ifdef and allow
> simpler transition if if the future sparse would take the OS
> in parameter (maybe as triple).
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  lib.c     |  1 +
>  lib.h     |  1 +
>  machine.h | 26 ++++++++++++++++++++++++++
>  target.c  | 24 +++++++++++++-----------
>  4 files changed, 41 insertions(+), 11 deletions(-)
> 
> diff --git a/lib.c b/lib.c
> index 602960a08..8bfe4e1c9 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -329,6 +329,7 @@ static int arch_msize_long = 0;
>  int arch_m64 = ARCH_M64_DEFAULT;
>  int arch_big_endian = ARCH_BIG_ENDIAN;
>  int arch_mach = MACH_NATIVE;
> +int arch_os = OS_NATIVE;
>  int arch_cmodel = CMODEL_UNKNOWN;
>  
>  
> diff --git a/lib.h b/lib.h
> index 00c608125..24febfbfa 100644
> --- a/lib.h
> +++ b/lib.h
> @@ -207,6 +207,7 @@ extern int funsigned_char;
>  extern int arch_m64;
>  extern int arch_big_endian;
>  extern int arch_mach;
> +extern int arch_os;
>  
>  enum {
>  	CMODEL_UNKNOWN,
> diff --git a/machine.h b/machine.h
> index 22b05d91a..e98a64462 100644
> --- a/machine.h
> +++ b/machine.h
> @@ -70,4 +70,30 @@ enum machine {
>  #define MACH_NATIVE	MACH_UNKNOWN
>  #endif
>  
> +
> +enum {
> +	OS_CYGWIN,
> +	OS_DARWIN,
> +	OS_FREEBSD,
> +	OS_LINUX,
> +	OS_NETBSD,
> +	OS_OPENBSD,
> +	OS_SUNOS,
> +	OS_UNKNOWN,
> +};

cgcc also supports:

gnu (== Hurd kernel, Linux userspace ?)
gnu/kfreebsd (== Hurd kernel, FreeBSD userspace ?)

Yes, I am just guessing at the above definitions! ;-)
[I think Debian have these builds, right?]

ATB,
Ramsay Jones

> +
> +#if defined(__linux__) || defined(__linux)
> +#define OS_NATIVE	OS_LINUX
> +#elif defined(__FreeBSD__)
> +#define OS_NATIVE	OS_FREEBSD
> +#elif defined(__APPLE__)
> +#define OS_NATIVE	OS_DARWIN
> +#elif defined(__CYGWIN__)
> +#define OS_NATIVE	OS_CYGWIN
> +#elif defined(__sun__) && defined(__sun)
> +#define OS_NATIVE	OS_SUNOS
> +#else
> +#define OS_NATIVE	OS_UNKNOWN
> +#endif
> +
>  #endif
> diff --git a/target.c b/target.c
> index d03b179be..c89bb07d2 100644
> --- a/target.c
> +++ b/target.c
> @@ -83,13 +83,19 @@ void init_target(void)
>  		wchar_ctype = &long_ctype;
>  		/* fall through */
>  	case MACH_X86_64:
> -#if defined(__APPLE__)
> -		int64_ctype = &llong_ctype;
> -		uint64_ctype = &ullong_ctype;
> -#endif
> -#if defined(__FreeBSD__) || defined(__APPLE__)
> -		wint_ctype = &int_ctype;
> -#endif
> +		switch (arch_os) {
> +		case OS_CYGWIN:
> +			wchar_ctype = &ushort_ctype;
> +			break;
> +		case OS_DARWIN:
> +			int64_ctype = &llong_ctype;
> +			uint64_ctype = &ullong_ctype;
> +			wint_ctype = &int_ctype;
> +			break;
> +		case OS_FREEBSD:
> +			wint_ctype = &int_ctype;
> +			break;
> +		}
>  		break;
>  	case MACH_M68K:
>  	case MACH_SPARC32:
> @@ -178,8 +184,4 @@ void init_target(void)
>  		pointer_alignment = 8;
>  		break;
>  	}
> -
> -#if defined(__CYGWIN__)
> -	wchar_ctype = &ushort_ctype;
> -#endif
>  }
> 

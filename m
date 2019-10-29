Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 429A2E7E8C
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 03:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbfJ2CcV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 28 Oct 2019 22:32:21 -0400
Received: from avasout03.plus.net ([84.93.230.244]:51503 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727775AbfJ2CcV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 28 Oct 2019 22:32:21 -0400
Received: from [10.0.2.15] ([146.198.133.39])
        by smtp with ESMTPA
        id PHIuig4kItvkXPHIviiAcf; Tue, 29 Oct 2019 02:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1572316339; bh=AHxmEmqA3jKbaq985HO6+X0/WK+Cj7Quf1Ghb2s1VHI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=TIfJ95jkrmG26dU6VcMeZePaSz5G7Vz0EBo5MO4wPJQs9K11GjMtl6hvtgqkm02Yt
         olJ8cVgVJGl3fwzZze4bl/zQXv67AgeqiDsut9yoKszL/VXiku5sdlrnXwTRqHPb9t
         Bzl9bZ55R/v40BBgS9P/5tZVe4+dVBRryNCK7Za2zIg1xAM3p3QPuh4JIpByg/U5lv
         sBYVqhv8QcX4DzUi31IYgicYnFDTAansml0xOdfBFH8S/sXPlOHFd8zbI1km8rwcja
         F88UkOD1gwhhYXxg7PXPmZPMSbzMhKLTt9kGtV3sb+GgBTw68GrLrW5m19ewnSEzcd
         qtAyb63he5qHA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ePBtc0h1 c=1 sm=1 tr=0
 a=1Jh3712dEPwUcX5EWi7t+w==:117 a=1Jh3712dEPwUcX5EWi7t+w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=1EsaE_6oAAAA:8
 a=pGLkceISAAAA:8 a=zVSr1GjoBOdNZ055LQgA:9 a=QEXdDO2ut3YA:10
 a=3ZumFrijQQ-2J9H5h8ct:22 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] options: allow to specify the desired arch with
 --arch=<arch>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
Date:   Tue, 29 Oct 2019 02:32:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFP+ZHaeTDot/bdeAWnAbfJ/CEijxCwmMx+3b8c5JEC+d38zZDzOx0jclwN0+BxLO884t9ESh2epPPtvK7vEecT1sto14xGsr+L+KqoH2MNgRsFzqxSp
 cu5EoeP4e19Je53h47XUa7F5N9wVTIk6Pa+doRIAl1C3+887gQjdKqcIT/ofMBA1se2o/crtX3iuyQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 28/10/2019 21:43, Luc Van Oostenryck wrote:
> Sparse is universal in the sense that the same executable can
> be used for all architectures. For this, most arch-specific
> setting can be set with an option and the default values
> are taken from the host machine.
> 
> This is working nicely for native targets. However, for cross-
> compilation, while seeming to work relatively well (thanks to
> the kernel build system using -m32/-m64 for all archs, for example)
> things can never work 100% correctly. For example, in the case
> an X86-64 host machine is used for an ARM target, the kernel
> build system will call sparse with -m32, Sparse will 'autodetect'
> the target arch as i386 (x86-64 + -m32) and will then predefine
> the macro __i386__. Most of the time this is not a problem (at
> least for the kernel) unless, of course, if the code contains
> something like:
> 	#ifdef __i386__
> 	...
> 	#elif  __arm__
> 	...
> 
> So, add an option --arch=<arch> to specify the target architecture.
> The native arch is still used if no such flag is given.

How does this interact with the cgcc --target=<spec> and the
(otherwise) guessing of the 'native' specs?

> 
> Reported-by: Ben Dooks <ben.dooks@codethink.co.uk>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  lib.c    | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  sparse.1 |  8 +++++++
>  2 files changed, 76 insertions(+)
> 
> diff --git a/lib.c b/lib.c
> index 75a4f9870..353d19100 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -1044,6 +1044,73 @@ static char **handle_switch_x(char *arg, char **next)
>  }
>  
>  
> +static char **handle_arch(char *arg, char **next)
> +{
> +	static const struct arch {
> +		const char *name;
> +		int mach;
> +		int bits;
> +	} archs[] = {
> +		{ "aarch64",	MACH_ARM64,	64 },
> +		{ "arm64",	MACH_ARM64,	64 },
> +		{ "arm",	MACH_ARM,	32 },
> +		{ "i386",	MACH_I386,	32 },
> +		{ "m68k",	MACH_M68K,	32 },
> +		{ "mips",	MACH_MIPS64 },
> +		{ "powerpc",	MACH_PPC64 },
> +		{ "ppc",	MACH_PPC64 },
> +		{ "riscv",	MACH_RISCV64 },

I would rather these were explicitly set to 0.

> +		{ "s390",	MACH_S390X,	64 },
> +		{ "s390x",	MACH_S390X,	64 },
> +		{ "sparc",	MACH_MIPS64 },

Er, I suppose this should be MACH_SPARC64, right? (also 0 init).

> +		{ "x86_64",	MACH_X86_64,	64 },
> +		{ "x86-64",	MACH_X86_64,	64 },
> +		{ "x86",	MACH_X86_64 },

(also 0 init).

> +		{ NULL },
> +	};
> +	const struct arch *p;
> +
> +	if (*arg++ != '=')
> +		die("missing argument for --arch option");
> +
> +	for (p = &archs[0]; p->name; p++) {
> +		size_t len = strlen(p->name);
> +		if (strncmp(p->name, arg, len) == 0) {
> +			const char *suf = arg + len;
> +			int bits = p->bits;
> +
> +			arch_mach = p->mach;
> +			if (bits == 0) {
> +				// guess the size of the architecture
> +				if (!strcmp(suf, "")) {
> +					if (arch_m64 == ARCH_LP32)
> +						bits = 32;
> +					else
> +						bits = 64;

So, this is a 50-50 bet. ;-)

ATB,
Ramsay Jones

> +				} else if (!strcmp(suf, "64")) {
> +					bits = 64;
> +				} else if (!strcmp(suf, "32")) {
> +					bits = 32;
> +				} else {
> +					die("invalid architecture: %s", arg);
> +				}
> +				if (bits == 32)
> +					arch_mach -= 1;
> +			} else {
> +				if (strcmp(suf, ""))
> +					die("invalid architecture: %s", arg);
> +			}
> +			if (p->bits == 32)
> +				arch_m64 = ARCH_LP32;
> +			else if (p->bits == 64)
> +				arch_m64 = ARCH_LP64;
> +			break;
> +		}
> +	}
> +
> +	return next;
> +}
> +
>  static char **handle_version(char *arg, char **next)
>  {
>  	printf("%s\n", SPARSE_VERSION);
> @@ -1076,6 +1143,7 @@ struct switches {
>  static char **handle_long_options(char *arg, char **next)
>  {
>  	static struct switches cmd[] = {
> +		{ "arch", handle_arch, 1 },
>  		{ "param", handle_param, 1 },
>  		{ "version", handle_version },
>  		{ NULL, NULL }
> diff --git a/sparse.1 b/sparse.1
> index beb484423..be38f6883 100644
> --- a/sparse.1
> +++ b/sparse.1
> @@ -423,6 +423,14 @@ Sparse does not issue these warnings by default.
>  .
>  .SH MISC OPTIONS
>  .TP
> +.B \-\-arch=\fIARCH\fR
> +Specify the target architecture.
> +For architectures having both a 32-bit and a 64-bit variant (mips, powerpc,
> +riscv & sparc) the architecture name can be suffixed with \fI32\fR or \fI64\fR.
> +
> +The default architecture & size is the one of the machine used to build Sparse.
> +.
> +.TP
>  .B \-gcc-base-dir \fIdir\fR
>  Look for compiler-provided system headers in \fIdir\fR/include/ and \fIdir\fR/include-fixed/.
>  .
> 

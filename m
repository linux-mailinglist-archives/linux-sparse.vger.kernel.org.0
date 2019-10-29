Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8426CE8FAC
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 20:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfJ2TFP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 29 Oct 2019 15:05:15 -0400
Received: from avasout03.plus.net ([84.93.230.244]:56731 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfJ2TFP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 29 Oct 2019 15:05:15 -0400
Received: from [10.0.2.15] ([146.198.133.39])
        by smtp with ESMTPA
        id PWnpigzwotvkXPWnqiiZN2; Tue, 29 Oct 2019 19:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1572375914; bh=RkjLrCzfgZV7R0GuVteKrmexvH77SAMyptUifgMqIoE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=rGjfhXorfqsZqDDYOeKallSUjyjCJs7xwDuhmGKKkgwdStsjYMv7AxFJsNymQJsti
         7TTA7+Mi3IZzykpiHOzqVjD2ATV2de+eliXAdb9hcU4utQkpDdajUyqnTxLTFh1kqw
         PYLihbb2CFz3kM0RcI+88VIHw5rgFfJZZpxIc/vNY82bTcb/ZBKTfyijzRzVzTk1s7
         CL0tC1qGQbJSusJe+k4BodUorYWzwEFmSxG4Bq6aEA98lFU/wUpS8mEjJRDcriw3Pf
         hGaPEprPbRHLBNX0/N6B5Ln8sSVyRWxtzQw785tXSn2vxLI2Ge/1RmktVrUVSdT6b/
         GJqn/xPl39PbA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ePBtc0h1 c=1 sm=1 tr=0
 a=1Jh3712dEPwUcX5EWi7t+w==:117 a=1Jh3712dEPwUcX5EWi7t+w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=W1xL6O7qRDPrH8b88V0A:9
 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] options: allow to specify the desired arch with
 --arch=<arch>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
 <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
 <20191029092807.cvb7ipfexxfyr5nc@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <6e698a41-040a-bc31-9eb6-c6b4fc09d954@ramsayjones.plus.com>
Date:   Tue, 29 Oct 2019 19:05:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029092807.cvb7ipfexxfyr5nc@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMq6wjY73UR2WB6FSDYoK+vAmijkPkJk1XqlXLuoZyX1aOfEUQTjtcHBRUF5paxU63eJ4fp7psN/lDXoGzXFvtuLzaFnRrvoaPnrw3q8Ax0t6CwgLcDF
 jeTwTaX92rRDuIFXFeJtdkAQtdQuCaf0yQ3tHYgJVrjvqvvB855Xjg75UsDHw5RFwuyJqPWd1aLguA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 29/10/2019 09:28, Luc Van Oostenryck wrote:
> On Tue, Oct 29, 2019 at 02:32:15AM +0000, Ramsay Jones wrote:
>>> +	static const struct arch {
>>> +		const char *name;
>>> +		int mach;
>>> +		int bits;
>>> +	} archs[] = {
>>> +		{ "aarch64",	MACH_ARM64,	64 },
>>> +		{ "arm64",	MACH_ARM64,	64 },
>>> +		{ "arm",	MACH_ARM,	32 },
>>> +		{ "i386",	MACH_I386,	32 },
>>> +		{ "m68k",	MACH_M68K,	32 },
>>> +		{ "mips",	MACH_MIPS64 },
>>> +		{ "powerpc",	MACH_PPC64 },
>>> +		{ "ppc",	MACH_PPC64 },
>>> +		{ "riscv",	MACH_RISCV64 },
>>
>> I would rather these were explicitly set to 0.
> 
> Hmm ... To me, the difference pop out better like so.
> The absence of a value is supposed to mean "there is not
> a known size for this, it needs to be calculated/guessed".
> I find that an explicit 0 conveys this les well.

OK, authors choice! ;-)

>  
>>> +		{ "s390",	MACH_S390X,	64 },
>>> +		{ "s390x",	MACH_S390X,	64 },
>>> +		{ "sparc",	MACH_MIPS64 },
>>
>> Er, I suppose this should be MACH_SPARC64, right? (also 0 init).
> 
> Ooops, yes, thank you. Bad copy-paste, bad.
>  
>>> +			if (bits == 0) {
>>> +				// guess the size of the architecture
>>> +				if (!strcmp(suf, "")) {
>>> +					if (arch_m64 == ARCH_LP32)
>>> +						bits = 32;
>>> +					else
>>> +						bits = 64;
>>
>> So, this is a 50-50 bet. ;-)
> 
> No, not really.
> The -m32/-m64 flags are still taken in account, before the
> --arch and after it too. If no -m32/-m64 is given at all
> then the used size is the one of the native arch (because
> arch_m64 is initialized so).

heh, yes, I just meant that (if -m32/-m64 has _not_ been given)
then you have a 50/50 chance that you are cross-compiling to a
system that has the same 'bit-ness' as your current platform.

(well, actually, I suppose both are likely to be 64-bit these
days - so, maybe not 50/50! ;-) ).

>                               I think it's quite natural to
> use but it lacks some error checking (e.g.: --arch=arm -m64
> will purposely *not* select arm64, aka aarach64, but no
> warnings will be issued).

Thanks!

ATB,
Ramsay Jones


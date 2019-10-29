Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1A2E8F9F
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 19:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732136AbfJ2S5G (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 29 Oct 2019 14:57:06 -0400
Received: from avasout03.plus.net ([84.93.230.244]:56203 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731945AbfJ2S5G (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 29 Oct 2019 14:57:06 -0400
Received: from [10.0.2.15] ([146.198.133.39])
        by smtp with ESMTPA
        id PWfuigzRktvkXPWfviiYzm; Tue, 29 Oct 2019 18:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1572375425; bh=THG3dtRAjyEwQTV5sV3qjbW4lTGCzA0f9i6eoHu0jrE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=n11OBkUd8+ckijoM56YuIN3SRN+NkhmNVIq1gkSgQ9xeBpyE0UMfXqfaTKonagCdy
         u1moh8g7Ogt40d1BwdDxHOmkoMVpvmotJlUTr/YjJnFlZt/1sT6ZG6fqwvgQImzp7E
         x6JNg/WgWWskNX822u1F98rbJMvwt8o86srn4YUdzuWdk79PRD1vPSvTg+wujjhjTU
         ndo8HJ4uHuXEdX5Ug34R8AvJH5y39CEi2z5Y0sGqjNGM2oWb2Cxyru3+nB5HTf6L8h
         YizNSUseOCw5FSqgroF9rdKhyPlxq+PzSQU3+gTtGJuPLSwuSO8IWUyWzDsayUR7Lv
         nFeQBhCPG7qVw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ePBtc0h1 c=1 sm=1 tr=0
 a=1Jh3712dEPwUcX5EWi7t+w==:117 a=1Jh3712dEPwUcX5EWi7t+w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=xLWFFq2Szfy1quqjhzcA:9
 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] options: allow to specify the desired arch with
 --arch=<arch>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
References: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
 <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
 <20191029082334.g3evfqkc73ohn6pn@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <89ebf585-7700-c8e2-7786-a599f31ee5e8@ramsayjones.plus.com>
Date:   Tue, 29 Oct 2019 18:57:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029082334.g3evfqkc73ohn6pn@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfC6NZ+I+bHSKEkK/edx/Dqb7g0TU3p+kYg6NNkvkuCkvXvcSQ7rzTsDu4yPTAxKe64IiqkcpUlJiOdBdUnTG2Mo7J0TTOhs6Zsm5b42Mvj8cp6heAqhu
 Fq1Xhkz+ZG24y+/mjZcUnaEpynzR5zaC8AZo6/wbhbMDvqEEq2RfAGGDvx5bGBxa79SyaaNxH8JD2w==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 29/10/2019 08:23, Luc Van Oostenryck wrote:
> On Tue, Oct 29, 2019 at 02:32:15AM +0000, Ramsay Jones wrote:
>>
>>
>> On 28/10/2019 21:43, Luc Van Oostenryck wrote:
>>> Sparse is universal in the sense that the same executable can
>>> be used for all architectures. For this, most arch-specific
>>> setting can be set with an option and the default values
>>> are taken from the host machine.
>>>
>>> This is working nicely for native targets. However, for cross-
>>> compilation, while seeming to work relatively well (thanks to
>>> the kernel build system using -m32/-m64 for all archs, for example)
>>> things can never work 100% correctly. For example, in the case
>>> an X86-64 host machine is used for an ARM target, the kernel
>>> build system will call sparse with -m32, Sparse will 'autodetect'
>>> the target arch as i386 (x86-64 + -m32) and will then predefine
>>> the macro __i386__. Most of the time this is not a problem (at
>>> least for the kernel) unless, of course, if the code contains
>>> something like:
>>> 	#ifdef __i386__
>>> 	...
>>> 	#elif  __arm__
>>> 	...
>>>
>>> So, add an option --arch=<arch> to specify the target architecture.
>>> The native arch is still used if no such flag is given.
>>
>> How does this interact with the cgcc --target=<spec> and the
>> (otherwise) guessing of the 'native' specs?
> 
> I didn't yet looked at how it interacts with cgcc --target=<spec>.
> I had losely planned to do this after having removed all the defines
> in cgcc that are now unneeded (integer_type() and define_size_t()
> are now done by sparse itself, float_types() should also).
> 
> I think that the OS-specific parts can be kept in cgcc and in
> the 'arch' parts it would be easy enough to call sparse with the
> right '--arch=<...>' (either guessed via uname or specified via
> --target=<spec>, it wouldn't matter).
> 
> Do you see some complications?

No, I was thinking about the opportunity to simplify cgcc! :-D

ATB,
Ramsay Jones

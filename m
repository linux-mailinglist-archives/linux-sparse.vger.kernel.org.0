Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD4AC10F1
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 15:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfI1N2G (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 28 Sep 2019 09:28:06 -0400
Received: from avasout02.plus.net ([212.159.14.17]:34274 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfI1N2G (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 28 Sep 2019 09:28:06 -0400
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Sat, 28 Sep 2019 09:28:05 EDT
Received: from [10.0.2.15] ([146.198.132.191])
        by smtp with ESMTPA
        id ECeEiVAkZCBKpECeFiFDdU; Sat, 28 Sep 2019 14:20:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1569676834; bh=H1Fvd8nY0ExNHZ+A+IcArrRh6nlMQzB9OLqIPKQXKUA=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=SwYg+TD90QNRifSoyj30hykrgRJQdoEeuDQwJs0vQEYKhtwYPM5s32LgZ3QVCdA6O
         ti7Gvi2NOB4TjqGVEMXbJDm1R+dp2WpEf2VbcsDIygIUsMYfDYt4gfE/4LrjdAeAiZ
         qm/quGHVs9Urbyd6dKK5ToVznQmORhmxtMhVO35oIHT16A+NbfeU+lg12hv/tp1ZHX
         +7a7G0Hg7PJBIOta2q+XAzOCeRmnWpTsoYEt+zsurkuNSUAmr7HBmR/jgtpGJ8//PD
         lnL4Rd99PYpmPwXIovOO/e/4jcbW/CYI/zS+OElJsCltTp6qYXoOOksqZfSA6kVtpc
         TgDUiDBf5z88A==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=OPxZIhSB c=1 sm=1 tr=0
 a=Fsx7Iv7+m2wQNRAD/kuoBg==:117 a=Fsx7Iv7+m2wQNRAD/kuoBg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=rE8UOv9j4jRpsk_R-v4A:9
 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: problem building sparse 0.6.0 (sparse-llvm)
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>
References: <c03600e0-057a-fb59-78b4-60f363c1b44d@infradead.org>
 <c037bde7-84ea-a7ed-ab81-f5a054093069@ramsayjones.plus.com>
 <f135aab3-5a94-f073-2fd2-c1890abe37b0@infradead.org>
 <54aaa827-4f31-69de-277b-f9723b829d02@ramsayjones.plus.com>
 <20190925221610.srmkmsqkmqh4uzd3@desk.local>
 <d4203048-34da-0fa0-b670-c400b1bc05b7@ramsayjones.plus.com>
 <20190926203326.t6or7pbvybtnussi@desk.local>
 <03244c02-bf1a-7cf8-aa23-ee0e9ae17cf2@ramsayjones.plus.com>
 <20190927230037.35jv5esltpuhirmd@desk.local>
 <6b0efa4c-038b-b48e-da82-a9aa658c188e@ramsayjones.plus.com>
 <20190928014429.u2meyekebyffcfz4@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <3634ed7b-16c1-c548-cb9a-a5425954eeb2@ramsayjones.plus.com>
Date:   Sat, 28 Sep 2019 14:20:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190928014429.u2meyekebyffcfz4@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMfz9Jk6Yyl2uZF1Dlxgh/cqKXp8ZZPVP4cbvdmoBw7av9za8Afnwt4JgkK7QnGNmtJUFtqxmxMWhxaEoIIGSpwHYKFu3G9ghrsJKMDz1Ege7gMC/olt
 LAglCtoJOxEaQnMgWIat1qbJBCzfwzg+RzjqZd7Ncc7nTuFEzrpXjePd+f330SieAJvb/GSccuW8pw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 28/09/2019 02:44, Luc Van Oostenryck wrote:
> On Sat, Sep 28, 2019 at 02:27:40AM +0100, Ramsay Jones wrote:
>> On 28/09/2019 00:00, Luc Van Oostenryck wrote:
>>> On Fri, Sep 27, 2019 at 09:24:05PM +0100, Ramsay Jones wrote:
>>>> On 26/09/2019 21:33, Luc Van Oostenryck wrote:
>>>>> On Thu, Sep 26, 2019 at 07:50:27PM +0100, Ramsay Jones wrote:

[snip]

>>>> I noticed that you could override the target triple used by llc, so
>>>> decided to give it a try:
>>>>
>>>>
>>>> $ git diff
>>>> diff --git a/sparsec b/sparsec
>>>> index bafe2da..8a056e7 100755
>>>> --- a/sparsec
>>>> +++ b/sparsec
>>>> @@ -39,6 +39,7 @@ case "$(uname -s)" in
>>>>  *CYGWIN*)
>>>>         # cygwin uses the sjlj (setjmp-longjmp) exception model
>>>>         LLC_ARCH_OPTS="-exception-model=sjlj"
>>>> +       LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=x86_64-unknown-windows-cygnus"
>>>>         ;;
>>>>  *)
>>>>         ;;
>>>> $ 
>>>>
>>>> This fixes the testsuite on cygwin! :-D
>>>
>>> Great!
>>>
>>>
>>> The defaut target triple is supposed to be determinated from the host triple
>>> but from what I've seen LLVM's config system seems to know only about
>>> x86_64-unknown-cygwin and nothing about *-*-windows-cygnus (config.guess).
>>> OTOH, the part related to code generation seems to only know about
>>> x86_64-unknown-windows-cygnus ...
>>>
>>> I suppose that `llvm-config --host-target` returns x86_64-unknown-cygwin ?
>>
>> Ah no, I had meant to mention this:
>>
>>   $ llvm-config --host-target
>>   x86_64-unknown-windows-cygnus
>>   $ 
>>
>> ... which agrees with clang, but not llc.
> 
> Then the patch could simply be something like:
> +       LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=$(llvm-config --host-target)"
> 
> but I'm not sure how this would behave with cygwin32 or when using -m32.

Yeah, I don't know either. Unfortunately, my cygwin32 installation
is *very* old and on an Windows XP laptop that I would rather not
connect to the internet at this point ... (Also, I don't think cygwin
supports windows XP anyway, so ...)

Anyway, I think it is somewhat odd that clang and the llvm tools
don't agree on the host 'triple' used during configuration. ;-)

I would rather not, but I guess I may have to download the cygwin
source packages for clang/llvm and take a look at how the binary
packages are configured/built. I suppose this could be a problem
with the cygwin packaging, or with upstream - dunno! :(

Hmm, I will _hopefully_ find time to look at that soon, but I don't
think anyone needs a quick solution to this ... :-D

ATB,
Ramsay Jones


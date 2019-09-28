Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C935BC0F21
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 03:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfI1B1y (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 21:27:54 -0400
Received: from avasout07.plus.net ([84.93.230.235]:57852 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfI1B1x (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 21:27:53 -0400
Received: from [10.0.2.15] ([146.198.132.191])
        by smtp with ESMTPA
        id E1WPiwEocyvjUE1WQiP0eh; Sat, 28 Sep 2019 02:27:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1569634065; bh=JZaNVnKFs1sdGBqwxLVxcdJoWKIaISTuVvOkk2+rHUg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=F/1FEG6D4vWFhEsiUX9EUu2WNTQ1R+r0os7IxDBNJgYi7W5BMqhmEKv+xAURCoUjH
         aig6WjA8ZP8lL61GLt73slmn3u78I7ovi+BCkyN7iPh6kZ5KCFdXVfrIY3ln+uzx+h
         ptgl2g5fmDocFFtsd/XDWXxCb2KGQ8hv8LxYw3tJC0g3RqqSf0VvMYPBPbGg/VSofM
         UuHsVMYInujKQpCc7LrQaPh4cqCODrE3Edb5uPItIxj0dmMlhE2T1/Azo3MTT1t+FE
         4Br0HLS2uG//Qoka3WjAJMfBI0MtrTsjhA6sQYeJ8eFdPE6OWivRQderxc3C+JycPy
         JDncFAe2hp5aA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=UrEdyN4B c=1 sm=1 tr=0
 a=Fsx7Iv7+m2wQNRAD/kuoBg==:117 a=Fsx7Iv7+m2wQNRAD/kuoBg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=Twlkf-z8AAAA:8
 a=CXs6RviAVSb4pzh98xgA:9 a=QEXdDO2ut3YA:10 a=-74SuR6ZdpOK_LpdRCUo:22
X-AUTH: ramsayjones@:2500
Subject: Re: problem building sparse 0.6.0 (sparse-llvm)
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>
References: <5ebc73fc-1c4f-e97a-f626-ec0d35ec4e69@infradead.org>
 <c03600e0-057a-fb59-78b4-60f363c1b44d@infradead.org>
 <c037bde7-84ea-a7ed-ab81-f5a054093069@ramsayjones.plus.com>
 <f135aab3-5a94-f073-2fd2-c1890abe37b0@infradead.org>
 <54aaa827-4f31-69de-277b-f9723b829d02@ramsayjones.plus.com>
 <20190925221610.srmkmsqkmqh4uzd3@desk.local>
 <d4203048-34da-0fa0-b670-c400b1bc05b7@ramsayjones.plus.com>
 <20190926203326.t6or7pbvybtnussi@desk.local>
 <03244c02-bf1a-7cf8-aa23-ee0e9ae17cf2@ramsayjones.plus.com>
 <20190927230037.35jv5esltpuhirmd@desk.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <6b0efa4c-038b-b48e-da82-a9aa658c188e@ramsayjones.plus.com>
Date:   Sat, 28 Sep 2019 02:27:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190927230037.35jv5esltpuhirmd@desk.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJrSqFcl6ZgaiiWEeX0suRiT1Ytv8h80kPIrAKn1Pg1oVFmSwDTYa7ry4lZW6n83eAatNUkYY8d3ekzCRL018dYVo8Cvvsy3t0mGUP3ntISQ4VCY8g2a
 sNHB0ImXRn0wI4+bLtJZ1Kng/tL1fQGpBGLz5hESyV0QsQqJXoqSRC/GBzCuxrY6RxlTFt6lqcJlQQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 28/09/2019 00:00, Luc Van Oostenryck wrote:
> On Fri, Sep 27, 2019 at 09:24:05PM +0100, Ramsay Jones wrote:
>>
>>
>> On 26/09/2019 21:33, Luc Van Oostenryck wrote:
>>> On Thu, Sep 26, 2019 at 07:50:27PM +0100, Ramsay Jones wrote:
>> [snip]
>>> Randy had the problem on llvm-3.8.0.
>>>  
>>>> I haven't looked into the errors/warnings yet, but they seem to
>>>> relate to 'unknown/misused' pseudo-ops used for debug info.
>>>
>>> I really don't think it could be related to the last patch.
>>> I don't use or have access to cygwin but I've tested on Debian
>>> (bullseye/sid) with gcc-7 & gcc-9 and there wasn't any problem with
>>> llvm-8 (on Ubuntu I can only test with llvm-7). So, I'm curious to
>>> know more about this error you're seeing.
>>
>> I forgot to mention, in my previous email, that I was pretty
>> sure this was a platform specific issue, so I am not surprised
>> that you see no problem on Linux.
>>
>> So, tonight, I had a very quick look at the problem. If I use
>> gcc or clang to generate the assembler version of one of the
>> failing tests (backend/pointer-sub.c), then the pseudo-ops used
>> are appropriate for use with a 'coff-type' object file (ie a PE
>> file). However, the assembler produced by sparsec (saved from the
>> output of llc), would typically used in ELF object files ...
>>
>> After studying the output of 'clang -###', I noticed that clang
>> was passing (among other things) a 'triple' parameter to cc1.
>> However, the triple displayed by clang and llc were different:
>>
>> $ llc --version | head -5
>> LLVM (http://llvm.org/):
>>   LLVM version 8.0.1
>>   Optimized build.
>>   Default target: x86_64-unknown-cygwin
>>   Host CPU: haswell
>> $ clang --version
>> clang version 8.0.1 (tags/RELEASE_801/final)
>> Target: x86_64-unknown-windows-cygnus
>> Thread model: posix
>> InstalledDir: /usr/bin
>> $ 
>>
>> I noticed that you could override the target triple used by llc, so
>> decided to give it a try:
>>
>>
>> $ git diff
>> diff --git a/sparsec b/sparsec
>> index bafe2da..8a056e7 100755
>> --- a/sparsec
>> +++ b/sparsec
>> @@ -39,6 +39,7 @@ case "$(uname -s)" in
>>  *CYGWIN*)
>>         # cygwin uses the sjlj (setjmp-longjmp) exception model
>>         LLC_ARCH_OPTS="-exception-model=sjlj"
>> +       LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=x86_64-unknown-windows-cygnus"
>>         ;;
>>  *)
>>         ;;
>> $ 
>>
>> This fixes the testsuite on cygwin! :-D
> 
> Great!
> 
> 
> The defaut target triple is supposed to be determinated from the host triple
> but from what I've seen LLVM's config system seems to know only about
> x86_64-unknown-cygwin and nothing about *-*-windows-cygnus (config.guess).
> OTOH, the part related to code generation seems to only know about
> x86_64-unknown-windows-cygnus ...
> 
> I suppose that `llvm-config --host-target` returns x86_64-unknown-cygwin ?

Ah no, I had meant to mention this:

  $ llvm-config --host-target
  x86_64-unknown-windows-cygnus
  $ 

... which agrees with clang, but not llc.

ATB,
Ramsay Jones


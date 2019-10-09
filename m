Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 632DBD14B1
	for <lists+linux-sparse@lfdr.de>; Wed,  9 Oct 2019 18:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731158AbfJIQ4W (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 9 Oct 2019 12:56:22 -0400
Received: from avasout03.plus.net ([84.93.230.244]:44862 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730490AbfJIQ4W (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 9 Oct 2019 12:56:22 -0400
Received: from [10.0.2.15] ([146.198.133.39])
        by smtp with ESMTPA
        id IFG7iGdAgtvkXIFG8iXR3T; Wed, 09 Oct 2019 17:56:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1570640181; bh=Rj1lTodho9UnOAQbjwvwPUiqSoH7tYJc55q5vODC040=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=rb5ntsdgxD04qsvO6dHDkygl8pZ1QxFkDNXBJPOhOLrGQbFO3rS8o/RRzIim0xTyu
         4AitGYopIe+VYnUoiiWwzmr9iB+4o62j7J5VgpcSuVsMhyvv5fv2R0yZH3CJUko5O8
         ZP/P91TLoUiI/cyW7Em769FAgRr6q1KKWUFy9ZYOnkTdJaLSpZiCslILrrxSQCqB/V
         N1H9BQCLXf6EUPBTdks93A6O4kHp/fTmlHNutRe8GXUi+eYr7oOgr3fWJNQYRGinIr
         Zez096ubsK996B1pGhqd6bQfBQ4VMsGLxrafV8SGGus0bkgGK9ArlyKU3SIdDY5Swu
         B24TSVJVnCKjw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ePBtc0h1 c=1 sm=1 tr=0
 a=1Jh3712dEPwUcX5EWi7t+w==:117 a=1Jh3712dEPwUcX5EWi7t+w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8
 a=c-iLqsyUcdR9tygbuWMA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] Sparse v0.6.1-rc2 is now out.
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20191007090610.10640-1-luc.vanoostenryck@gmail.com>
 <e07a51e8-dc18-5074-3832-8a1f33ec7085@ramsayjones.plus.com>
 <4f29a2d7-de83-5b6b-ce14-1ed880b6fe12@ramsayjones.plus.com>
 <20191009112226.f6vgymntddcz7mgq@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <64c4ca41-79f9-4182-1e07-1efe68063d07@ramsayjones.plus.com>
Date:   Wed, 9 Oct 2019 17:56:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009112226.f6vgymntddcz7mgq@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLa5wUEf0Ar5qQqa56R7UeJQu7dSox1sfUqZZVaQhDPo60YimPDTbLOYIpec3/fb+IUNITIF0iAn7J2z+c1VL8SdgTz7vwQ7krIHNJlQ6smFMRCfP359
 lGyagqfQLdPbk73mD1/2f/KY5MY01Hw5DUBgx4zodu2vqhfGSvgBdimj1IhzlhiGWfcfpg+oAZJELA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 09/10/2019 12:22, Luc Van Oostenryck wrote:
> On Wed, Oct 09, 2019 at 02:03:19AM +0100, Ramsay Jones wrote:
>>
>>
>> On 08/10/2019 22:57, Ramsay Jones wrote:
>>>
>>>
>>> On 07/10/2019 10:06, Luc Van Oostenryck wrote:
>>>> The source code can be found at its usual repository:
>>>>   git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.1-rc2
>>>>
>>>> The tarballs are found at:
>>>>     https://www.kernel.org/pub/software/devel/sparse/dist/
>>>>
>>>
>>> Luc, I tested (last night) in the usual way on 64-&32-bit Linux
>>> and 64-bit cygwin, without issue. I had intended to test (tonight)
>>> also on fedora 30 and Ubuntu 19.04 (19.10 is still in beta), since
>>> my normal test targets are all built on a fairly old base. However,
>>> I didn't find time tonight, sorry ... :(
>>
>> OK, I lied. I managed to do a quick test on fedora 30 tonight
>> after all! No issues found. :-D
> 
> Awww, thanks a lot for this.

No problem.

> For my part, I've tested on the most recent unstable/dev version of
> Debian & Ubuntu and everything was fine.> 
> Before the release, I would like to add the patch for the problem
> you had with Cygwin. Would you be fine with the:
> 	LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=$(llvm-config --host-target)"
> we had discussed before, with a note saying it's needed for recent
> cygwin64 but may be inadequate for cygwin32?

Ha, yes, I should have mentioned that, on cygwin, I actually
tested:

 $ sparse --version
 v0.6.1-rc2-dirty
 $ 

... where the 'dirty' was:

 $ git diff
 diff --git a/sparsec b/sparsec
 index bafe2da..8a056e7 100755
 --- a/sparsec
 +++ b/sparsec
 @@ -39,6 +39,7 @@ case "$(uname -s)" in
  *CYGWIN*)
         # cygwin uses the sjlj (setjmp-longjmp) exception model
         LLC_ARCH_OPTS="-exception-model=sjlj"
 +       LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=x86_64-unknown-windows-cygnus"
         ;;
  *)
         ;;
 $ 

Given that:

 $ llvm-config --host-target
 x86_64-unknown-windows-cygnus
 $ 

... the above should be just fine. (Do you want me to send
a tested patch?).

Note that I have been messing around with 'sparsec' and, in
particular the invocation of llc, which can also output the
object file directly. ie there is no need to generate assembler
output and then assemble with the platform assembler. (which
allows us to sidestep the incorrect assembler directives used
for the wineh exception model!).

However, 'sparsec' seems to have several problems (not just
on cygwin). For example, on Linux, we see:

 $ ./sparsec -o hello hello.c
 /usr/bin/ld: /tmp/tmp.F57wOC: relocation R_X86_64_32 against `.rodata' can not be used when making a PIE object; recompile with -fPIC
 /usr/bin/ld: final link failed: Nonrepresentable section on output
 collect2: error: ld returned 1 exit status
 $ 

whereas, on cygwin:

 $ ./sparsec -o hello hello.c
 $ ./hello.exe 
 hello world
 $ 

... which was somewhat surprising! ;-)

Note that the testsuite is happy if 'sparcec' produces an
object file without error - it never tests the creation of
an executable (let alone that it actually runs and produces
correct output).

So, I don't know if we want to bust a gut to fix this up.

ATB,
Ramsay Jones


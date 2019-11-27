Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D0710C061
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 23:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfK0WwG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 17:52:06 -0500
Received: from avasout03.plus.net ([84.93.230.244]:36489 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfK0WwG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 17:52:06 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id a6AFiKmGYKleZa6AGimIGv; Wed, 27 Nov 2019 22:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574895124; bh=cG6JnMPePNu2nDTAbbRp8hcKxaohDPF5Dczvfoci1EQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=V5f7668qHQBpqj3ohHNEg/Iv9imJfON3EJ3IAzG2P+8R/RkNSUxSuhZLlYUHE2Oh2
         3x3h7z0NYvBa9JRHLGriwJjUJpDWanObT1vEO2hQV95s7Jq7WesH8PlHQTDBlu1oSo
         24Z0dfRAGlL9clbczgF4Xd5nCegTi3rIVLeWKIytWrw5R3KxK/cm8/qw9YZhgcX0JI
         Neb/yGsCkM6b5WlfwILoq4ezq1NKoXKy/G72ljALgZDltyNOmw4CxPM6TfWzhqoo8h
         tArG/F7RiZXn6x2bcJBhFpGoeR88WIInHNsFStFCnVMjWFnZPgYQZn48cux2M6KLC7
         MqAy5VUG+uDXQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=S0M5J17CAAAA:20
 a=rwWLWjjMVuqeBOVP4_gA:9 a=QEXdDO2ut3YA:10 a=rblfI0TChoxLVqhZACYb:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 0/4] More arch specific fixes
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
 <2c56999a-3ee8-999a-be41-962ec8c8d70e@ramsayjones.plus.com>
 <20191127174845.uol5jdfdqpso6o3h@ltop.local>
 <37371468-5ffd-7021-ea50-35d23eef943c@ramsayjones.plus.com>
 <20191127210248.hcp3rvchzwxjpcx6@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <547bd7d9-2844-1276-fce5-c406e9bcd529@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 22:52:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127210248.hcp3rvchzwxjpcx6@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF1IFBIaOwPjze25nPKow8BHBjyaVd/3ovM2sypKj9nayB1oWVqrZ8m6XC2XQpi3GdZcYULYtnedemA+nEdlo7QFvG2SxOc/fFdDwI1nwW0rO5d7qE51
 1UMGn4GHFc3bB2MQM1HXxaQJcVXxhGWEANER7yiA8b0iVFkaqLBo/2YftAjywxamQZ0WMrkOFxOy2w==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 21:02, Luc Van Oostenryck wrote:
> On Wed, Nov 27, 2019 at 06:05:37PM +0000, Ramsay Jones wrote:
>> On 27/11/2019 17:48, Luc Van Oostenryck wrote:
>>> On Wed, Nov 27, 2019 at 05:15:20PM +0000, Ramsay Jones wrote:
>>>>
>>>> I was going to just test 'luc/int128_ctype', but looking at the output
>>>> of 'git log --oneline --graph master..luc/int128_ctype' I can see that
>>>> several other branches are merged into the result. So, I will apply
>>>> the patches from the mailing list directly to test them (hmm, _hopefully_
>>>> tonight).
>>>
>>> Hi Ramsay,
>>>
>>> Sorry, I should have added in the cover letter that the series
>>> with all related patches is available at:
>>> 	git://github.com/lucvoo/sparse-dev.git next
>>
>> Hmm, but that _also_ contains several other branches not contained
>> in 'master', thus:
>>
>> $ git --no-pager log --oneline --graph master..luc/next
>> * 4a8aa8d1 (luc/tip, luc/next) cgcc: add support for riscv64
>> * df14d253 arch: fix wchar_t & wint_t for openbsd
>> * 662ed740 arch: add missing predefines for PPC
>> * 1ff97d3a arch: add missing predfines: __amd64 & __amd64__
>> * d8754f2c cgcc: filter-out -msize-long & -msize-llp64
>> * 7efa090f (luc/int128_ctype) spec: replace lllong_ctype by int128_ctype
> 
> Yes, indeed. It's how these patches have been written and tested, though.
> They're supposed to be the cherries on top of the cake.
> But I think that only 'df14d253 arch: fix wchar_t & wint_t for openbsd'
> may have some dependencies on one of these branches. For the 3 others
> it shouldn't matter.

I decided to just test the 'luc/next' branch (commit 4a8aa8d1 cgcc: add
support for riscv64). :-P

I have only tested on 64-bit Linux and Cygwin (the sparse testsuite and
running it over git), so far with no issues.

I have also compared the output of:
  $ ./cgcc -dM -E - </dev/null | sort >sss
  $ gcc -dM -E - </dev/null | sort >ggg
  $ meld ggg sss
on both Linux and cygwin (with similar results).

I have ignored the 'float stuff', since the output of gcc and sparse
is almost totally different! :(

The main difference, which is new, is the spelling of the 'type names'.
e.g. __CHAR16_TYPE__ is given as 'short unsigned int' by gcc but
'unsigned short' by sparse. The following table shows the 'type name'
differences:

CHAR16_TYPE  short unsigned int => unsigned short
INT16_TYPE   short int          => short
INT64_TYPE   long int           => long
INTMAX_TYPE  long int           => long
INTPTR_TYPE  long int           => long
PTRDIFF_TYPE long int           => long
SIZE_TYPE    long unsigned int  => unsigned long
UINT16_TYPE short unsigned int  => unsigned short
UINT64_TYPE  long unsigned int  => unsigned long
UINTMAX_TYPE long unsigned int  => unsigned long
UINTPTR_TYPE long unsigned int  => unsigned long

sparse seems to '#define linux linux' rather than '#define linux 1'.
sparse defines __LITTLE_ENDIAN__ but gcc does not.

On cygwin, the results are similar to the above, with the addition
of the following:

WCHAR_TYPE short unsigned int => unsigned short
Also, sparse defines __CYGWIN32__ when it shouldn't (this is on
x86_64 cygwin, without -m32 etc).

That's all so far. ;-)

ATB,
Ramsay Jones



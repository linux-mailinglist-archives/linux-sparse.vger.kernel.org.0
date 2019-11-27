Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83C5510B514
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 19:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK0SFk (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 13:05:40 -0500
Received: from avasout03.plus.net ([84.93.230.244]:45542 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfK0SFj (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 13:05:39 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id a1h3iKRidKleZa1h4im9nq; Wed, 27 Nov 2019 18:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574877939; bh=VraKi8h3VVR/lK6aOgpmpfT3y2X9/Z2UMtwy4fvO94w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=nTJ1LpRTMCoLXPmcav9PORCfFDZY+5hj4HKtj7EUZYdtdOzhrqQEM55flHSCdGcSw
         a1+5PCL1QXzynQObekYpIkjE6fSgu6ZKkEfJZ/vDK0LP8XT0rN04MnMHgiJS3vQg59
         WNlKA8e9Ogp8d++OukyqBw/UG08ihpFdaaHS/wPMSgF/U8MJSqgCwu8ZYjitbSvcv4
         i2vqmU3HUkaOLtrdLMcbB5L9KKvaA4e561x2SOxT7tMZs61GKKfyy7rSIDQcgeOA2C
         IHZRlLdzt+Lt1XYIR3177FmVNPKStyEvyFetI8zPvh+pTPem7NlVo4AfLIprTFXDjG
         WWfjqttcbmghQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=S0M5J17CAAAA:20
 a=6QDARwnSZ2gyrS02OiUA:9 a=QEXdDO2ut3YA:10 a=rblfI0TChoxLVqhZACYb:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 0/4] More arch specific fixes
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
 <2c56999a-3ee8-999a-be41-962ec8c8d70e@ramsayjones.plus.com>
 <20191127174845.uol5jdfdqpso6o3h@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <37371468-5ffd-7021-ea50-35d23eef943c@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 18:05:37 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127174845.uol5jdfdqpso6o3h@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKZ++2wkywC2aPIZeMC7WbtbKU4zI8fnEvknla3zCW9iqwLymRoUrN8D5n4obYkN0IOzB599LBXnaWZh72C6jvQ9Eef3uC9xVKjr8twieVzdHeJp6V9J
 +jGdYSHP5nA59UPdGc37cP9fbxKjOI7l0vCLKaw6+iBBWWXq7Mk+/LdwisGrPDZwszBWCy+oNMG9JQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 17:48, Luc Van Oostenryck wrote:
> On Wed, Nov 27, 2019 at 05:15:20PM +0000, Ramsay Jones wrote:
>>
>>
>> On 27/11/2019 02:23, Luc Van Oostenryck wrote:
>>> These are small tweaks going on top of all the previous ones.
>>
>> Hi Luc,
>>
>> I only had minor comments on this (and the previous) series, but I
>> haven't had a chance to apply and test them yet.
>>
>> I was going to just test 'luc/int128_ctype', but looking at the output
>> of 'git log --oneline --graph master..luc/int128_ctype' I can see that
>> several other branches are merged into the result. So, I will apply
>> the patches from the mailing list directly to test them (hmm, _hopefully_
>> tonight).
> 
> Hi Ramsay,
> 
> Sorry, I should have added in the cover letter that the series
> with all related patches is available at:
> 	git://github.com/lucvoo/sparse-dev.git next

Hmm, but that _also_ contains several other branches not contained
in 'master', thus:

$ git --no-pager log --oneline --graph master..luc/next
* 4a8aa8d1 (luc/tip, luc/next) cgcc: add support for riscv64
* df14d253 arch: fix wchar_t & wint_t for openbsd
* 662ed740 arch: add missing predefines for PPC
* 1ff97d3a arch: add missing predfines: __amd64 & __amd64__
* d8754f2c cgcc: filter-out -msize-long & -msize-llp64
* 7efa090f (luc/int128_ctype) spec: replace lllong_ctype by int128_ctype
*   28f31494 Merge branch 'arch-cleanup' into master
|\  
| * b0b47346 arch: add note for 128-bit long double on mips64
| * 66101fc5 arch: sparc32 on SunOS/Solaris uses 128-bit long doubles
| * 9c091c77 arch: fix wchar_t & wint_t on SunOS/Solaris
| * c79584fa arch: use a variable for the OS
| * eb87ce1b arch: add predefines for INT128 only on supported archs
| * a39cfb99 arch: (almost) all platforms simply use int for int32
| * 12abe926 arch: char32_t should be the same as uint32_t, not uint
| * 832d7a76 arch: remove impossible cases with 64-bit arch not being lp64
| * 6096ede6 arch: do not needlessly set bitness on 32-bit archs
* |   dbcc589f Merge branch 'arm-hf' into master
|\ \  
| * | fd59a5e8 cgcc: use -mfloat-abi=hard for armhf
| * | 7729ee4a fp-abi: teach sparse about -m{hard,soft}-float
| * | 532f6621 fp-abi: teach sparse about -mfloat-abi on ARM
| * | 16df5da6 fp-abi: add tests for ARM's -mfloat-abi=... & -msoft-float
| * | ec743e7f option: simpler handling of key-value for suboptions
| * | 95620eed option: use handle_switches() for -m flags
| * | 13391893 option: allow handle_switches() to set non-boolean values
| * | ed7b9191 option: move all option parsing helpers before their potential uses
|  /  
* |   50438f45 Merge branch 'arch-cygwin' into master
|\ \  
| * | 16a575e1 (luc/arch-cygwin) cgcc: let cygwin use -fshort-wchar
| * | 0789c9a3 arch: teach sparse about -fshort-wchar
| * | 47628528 arch: keep cygwin specifics with i386/x86-64 specifics
| |/  
| * c67fc56d arch: keep BSD & Darwin specifics with i386/x86-64 specifics
| * ecf39861 arch: simplify i386/x86-64 specifics
| * ebe08622 arch: fix the signedness of plain chars
* 467d8d02 Merge branch 'parse-spec' into master
* 10b89d60 spec: get rid of all specifier MOD_XXX
* 3d515131 spec: make ctype_declare[] more readable
* 570e295b spec: s/size/rank/
* c2d67bb0 spec: KW_LONG is not needed
* be1c60ca spec: KW_SHORT is not needed
* c04f113b spec: improve parsing of __int128
* 4c3567c2 spec: add '.class = CInt'
* 30ca8e0b spec: types[] is indexed by the specifier class
* 91c4ac10 spec: process chars like other integer types
$ 

Yes, I think most of the 'extra' commits are still in my email
client waiting to be looked at (sorry for being slow). :-D

ATB,
Ramsay Jones



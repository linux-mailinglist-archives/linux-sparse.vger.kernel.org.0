Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7342310D06B
	for <lists+linux-sparse@lfdr.de>; Fri, 29 Nov 2019 02:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbfK2Bu1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 20:50:27 -0500
Received: from avasout06.plus.net ([212.159.14.18]:51493 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfK2Bu1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 20:50:27 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id aVQPiZop7sjQSaVQQiFELW; Fri, 29 Nov 2019 01:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574992226; bh=hxeIGiBHZ+NRsq4kqorBUxorGi0oTArlI18xjM9vQ/I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=MxAx/2X3fNn+uqyS+K0VKAGvNonmOPMxHTFGzrLJitcQCNDjxJNAs1AduOAJaF1og
         6A3BbmLk6Mesz7PpF8S4wgD6nLJ0+v0W1MjMH1CVVt4MhcYSNRmMRwzZAFw4gc5B8I
         Z7jbjdVcwQJOXh3nfPFjAc1wf/57Ok11tIvZJbA1gGrdODTE6QtJ+8kGZ88PwFaTPX
         ZGxK23T4ph6YeTGg0+8yFuGaaU4dqP2QZC2EOnu/Qk1K1IYCKTtANtcGtLbFsqt87R
         pHoHVIeTTki56Q/nSPAkkRwyTduA+m3GLOFwuxRo3obHJm/QBWO2sf1vK+owLOVCp/
         BHpmnaKZZMySQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=cZasUULM c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=Q1Xrn8gz-tVaUaEVTfAA:9
 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 0/4] More arch specific fixes
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
 <2c56999a-3ee8-999a-be41-962ec8c8d70e@ramsayjones.plus.com>
 <20191127174845.uol5jdfdqpso6o3h@ltop.local>
 <37371468-5ffd-7021-ea50-35d23eef943c@ramsayjones.plus.com>
 <20191127210248.hcp3rvchzwxjpcx6@ltop.local>
 <547bd7d9-2844-1276-fce5-c406e9bcd529@ramsayjones.plus.com>
 <20191127233601.oplm2rnu2vewa2f5@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <505fc93c-c1bf-5f78-3822-b993616a2f7d@ramsayjones.plus.com>
Date:   Fri, 29 Nov 2019 01:50:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127233601.oplm2rnu2vewa2f5@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP9fY5r+7rUH414CPpB7v3z4RAKlmErPTo7tU6jTnkzIQ0/K6ML8RCRmqTBbUR4TFBj90XGorfPAcbfXHDa346jSz7UMpCVf4MKglUV/UXMuJ+AYimoO
 g43Vq446y6K32LMNSGexLUUc0wNC6NB5g+zLpwPnNtQ0Vcs4HDHnRvoUFxbtELRv9MsLiPY2E3dpcQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 23:36, Luc Van Oostenryck wrote:
[snip]

>> The main difference, which is new, is the spelling of the 'type names'.
>> e.g. __CHAR16_TYPE__ is given as 'short unsigned int' by gcc but
>> 'unsigned short' by sparse. The following table shows the 'type name'
>> differences:
>>
>> CHAR16_TYPE  short unsigned int => unsigned short
>> INT16_TYPE   short int          => short
>> INT64_TYPE   long int           => long
>> INTMAX_TYPE  long int           => long
>> INTPTR_TYPE  long int           => long
>> PTRDIFF_TYPE long int           => long
>> SIZE_TYPE    long unsigned int  => unsigned long
>> UINT16_TYPE short unsigned int  => unsigned short
>> UINT64_TYPE  long unsigned int  => unsigned long
>> UINTMAX_TYPE long unsigned int  => unsigned long
>> UINTPTR_TYPE long unsigned int  => unsigned long
> 

Just FYI, I happened to be on my 32-bit Linux installation
tonight, so I did a quick test of current sparse (of course)
and found it to be very similar to 64-bit Linux. [passes it's
own tests and run over git source with no issue].

There were some differences, of course, mainly the types
that appear in the above table are slightly different (but
in the same way/pattern as above), thus:

INT64_TYPE   long long int          => long long
INTMAX_TYPE  long long int          => long long
UINT64_TYPE  long long unsigned int => unsigned long long
UINTMAX_TYPE long long unsigned int => unsigned long long
WCHAR_TYPE   long int               => long

The following <TYPE-WIDTH> macros were output by sparse, but
not by gcc:

__INTMAX_WIDTH__
__INTPTR_WIDTH__
__INT_WIDTH__
__LONG_WIDTH__
__PTRDIFF_WIDTH__
__SCHAR_WIDTH__
__SHRT_WIDTH__
__SIZE_WIDTH__
__WCHAR_WIDTH__
__WINT_WIDTH__

... but I think this has more to do with the version of gcc on
that system (Linux Mint 18.3, based on Ubuntu 16.04), which was
version 5.4.0.

Some of the missing macros included:
i386
__i686
__i686__
__pentiumpro
__pentiumpro__

Again Just FYI.

ATB,
Ramsay Jones


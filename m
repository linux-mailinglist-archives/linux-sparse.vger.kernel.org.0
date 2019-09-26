Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D075BF9B1
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 20:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbfIZS6D (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 26 Sep 2019 14:58:03 -0400
Received: from avasout01.plus.net ([84.93.230.227]:46238 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728377AbfIZS6D (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 26 Sep 2019 14:58:03 -0400
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Sep 2019 14:58:02 EDT
Received: from [10.0.2.15] ([146.198.133.101])
        by smtp with ESMTPA
        id DYqSiWisnbMsODYqTiMJ2Y; Thu, 26 Sep 2019 19:50:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1569523831; bh=iAZhzAYMaepEBjycS/djuNUeTsxDypCPnvyFjU9mkP8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=rxMPVHv3wuC9JK2pYIEczRkk2R+FCbdGp4pV4XGyGB/k5k4/mweOz+LeSSLN1dlSP
         g9ndelSSb1bpBb/01rh4KcRoqh0402MsuHs3HzvVLZuczTV8ia1mtjm/Iqexyf0RDc
         AAKb02UiyYWwRN4QI3i1dTUIomDFGsJHaHSnBvg/ce0X/4tPEgKJAg5CQhVmqJrU3m
         OU0CzGCH8s30L0ho3xJyVD7F/oICgOdPQfmN3lgtl6Y7AdmKHDh7fvEEVQJQ0z5M2a
         jM6EJVuZidQRoqKYbmsQjfyXOlLa/N1RP0HIQ5upwtZAcs7Q9Zcgq9Kbw7RdkOGdjY
         wgC88w6VSFOPw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=C5WXNjH+ c=1 sm=1 tr=0
 a=T/I7yOf4TbhWogbgnfTaxw==:117 a=T/I7yOf4TbhWogbgnfTaxw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pBZnl71HcN4KRPHueLcA:9
 a=QEXdDO2ut3YA:10
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
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <d4203048-34da-0fa0-b670-c400b1bc05b7@ramsayjones.plus.com>
Date:   Thu, 26 Sep 2019 19:50:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190925221610.srmkmsqkmqh4uzd3@desk.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCNHMSQidGKk5Ta/W3mTVabS5oRM4lKPJKS9VDt4Jn0jUYSGQKphwrqQrsFsn2LuN62iQHrdZqWx3UG3b+dL+rpKrvHUbw+/R69Y5F7zuSsDue9rWyxF
 CgGdIdf4OBWk8TMe82BTevZMyYJKWHW01q5rwxpL/XOjzcYyFFRg+hcxSVwtAtKAPY8/DexYd0SljA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 25/09/2019 23:16, Luc Van Oostenryck wrote:
> On Fri, Apr 26, 2019 at 05:46:22PM +0100, Ramsay Jones wrote:
>> On 26/04/2019 16:20, Randy Dunlap wrote:
[snip]
>> However, I should have made it clear that I meant to suggest
>> that we should _replace_ the definition of LLVM_CFLAGS with
>> that single call to llvm-config. So, I also tested the
>> following on cygwin:
>>
>>   $ git diff
>>   diff --git a/Makefile b/Makefile
>>   index f816a50..7e8c2ab 100644
>>   --- a/Makefile
>>   +++ b/Makefile
>>   @@ -165,8 +165,7 @@ ifeq ($(shell expr "$(LLVM_VERSION)" : '[3-9]\.'),2)
>>    LLVM_PROGS := sparse-llvm
>>    $(LLVM_PROGS): LD := g++
>>    LLVM_LDFLAGS := $(shell $(LLVM_CONFIG) --ldflags)
>>   -LLVM_CFLAGS := -I$(shell $(LLVM_CONFIG) --includedir) \
>>   -       $(shell $(LLVM_CONFIG) --cppflags)
>>   +LLVM_CFLAGS := $(shell $(LLVM_CONFIG) --cppflags)
>>    LLVM_LIBS := $(shell $(LLVM_CONFIG) --libs)
>>    LLVM_LIBS += $(shell $(LLVM_CONFIG) --system-libs 2>/dev/null)
>>    LLVM_LIBS += $(shell $(LLVM_CONFIG) --cxxflags | grep -F -q -e '-stdlib=libc++' && echo -lc++)
>>   $ 
>>
>> ... which also works! The only difference is that '-I/usr/include'
>> is not passed to gcc twice.
>>
>> Looking at commit 65840c61dc ("build: only need includedir from
>> llvm-config", 2018-12-18), Luc only wanted the 'pre-processor'
>> flags not all of the '--cflags'. The '--cppflags' argument to
>> llvm-config is used for just that. ;-)
>>
>> If you could confirm that the above works for you also, that
>> would be great. Thanks!
> 
> Yes, I agree and applied.
> Thank both and really sorry for the delay.

Welcome back Luc. ;-)

[BTW, we are still in 'RC' period! I have been using sparse
version v0.6.1-rc1-7-g2b96cd8 in 'production' all this time ...]

I just fetched sparse and tested master@3c74809, and it failed
on cygwin!

At first I thought it was this patch (ie it was all sparse-llvm
tests which failed), but I was equally sure I had tested back
when Randy sent the patch (_not_ just compile tested).

However, if I go back to v0.6.1-rc1-7-g2b96cd8, it also fails, so
this is not the smoking gun. Then I remembered that the cygwin
package for clang/llvm was updated recently ...

Back when Randy sent the patch I was on clang/llvm v3.x.y (I _think_
it was 3.0.1, but don't quote me), but now I am on v8.0.1.

I haven't looked into the errors/warnings yet, but they seem to
relate to 'unknown/misused' pseudo-ops used for debug info.

Just a heads up! (If Randy hasn't also updated, he may well still
be fine).

ATB,
Ramsay Jones


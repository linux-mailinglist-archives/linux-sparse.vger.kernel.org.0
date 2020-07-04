Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 419F42148CE
	for <lists+linux-sparse@lfdr.de>; Sat,  4 Jul 2020 23:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727816AbgGDVHU (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 4 Jul 2020 17:07:20 -0400
Received: from avasout07.plus.net ([84.93.230.235]:49432 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgGDVHU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 4 Jul 2020 17:07:20 -0400
Received: from [10.0.2.15] ([195.213.6.94])
        by smtp with ESMTPA
        id rpNTjmcri0wwMrpNUjMWdv; Sat, 04 Jul 2020 22:07:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1593896838; bh=PGaB27eWXsEAKxbQ1Bi9dBnFaCPH1QmGGnXjHAFNS7A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=Q0c43ZwIdBaBhN/cwh+fay7vdac9aF5P/CAbzS6udPwGwidG8gXBpAlhgTnn5SP5r
         ML7/lI1Zx03saHPQ37cLbcmdrlQtClIRK90Y1P4I+rVRUJg+TF87McoiUlRo2N4LwI
         PJURZp6sbW6cfclGkuCJtJWDeiL+cZ7hdVuAVvBjScS1/xbcZ+qcDAbF8ylXUvHuPb
         C0oHsQGl0zcIYMOK+y+sv/tTWGjH79r9rgKIUspTIg+IycUFa4qAbk+Egd/imf5fCQ
         LZm6dyjNMClg43QlgccUzmNJ5JPwpX3VXbwVCxEh5Tb2FTxvpDWdHrDXqaVZSzZtSl
         G6e66+Z4/Zzhw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=b/4pHuOx c=1 sm=1 tr=0
 a=zLrGoXp437TtaqwGN82bxg==:117 a=zLrGoXp437TtaqwGN82bxg==:17
 a=IkcTkHD0fZMA:10 a=VyfTGX6reh7rp47T9EYA:9 a=4vB3xzPzKg2zxUkv:21
 a=IqAIAT5qUqJBH8kr:21 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 2/3] add memory asm constraint for PPC
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20200704135747.87752-1-luc.vanoostenryck@gmail.com>
 <20200704135747.87752-3-luc.vanoostenryck@gmail.com>
 <693a3fa0-5202-3695-54cf-aa1cc1f514fd@ramsayjones.plus.com>
 <20200704193248.simtaedrt7gbiepy@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <900dd2ad-9037-cefb-6a22-27cd0b971716@ramsayjones.plus.com>
Date:   Sat, 4 Jul 2020 22:07:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200704193248.simtaedrt7gbiepy@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLe9eMQOjhCuy/j8kZN4EAVV7yKzKHq57/akyaSE7I8JUn5IXkVj+maPJyHeSAiJcX5yDhYc1uGUeHJs3LRd3GDNENjQnEj9fBzfn+a5jfA4E6dIqlRS
 bnplQhuMvBvh4C3/7NquRF404RwwNwx25ykvuFqLZCU1imwVMQG3D1zx5GTyl0ePgEvwprR0zTvXQw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 04/07/2020 20:32, Luc Van Oostenryck wrote:
> On Sat, Jul 04, 2020 at 06:44:53PM +0100, Ramsay Jones wrote:

>> On 04/07/2020 14:57, Luc Van Oostenryck wrote:
>>> The 'Z' asm constraint is used for doing IO accessors on PPC but
>>> isn't part of the 'common constraints'. It's responsible for
>>> more than half of all warnings (with defconfig + allyesconfig).
>>
>> Not a problem, but this made me think 'half of which warnings'. :-D
>> I assume, but it's just a guess, this means 'half of all asm-constraints
>> warnings on the kernel PPC build'.
>>
>> How many warnings is that? What percentage is that of _all_ sparse
>> warnings on a typical kernel build?
> 
> It's literally more than half of all warnings issued by sparse when doing
> a build of the kernel with 'defconfig' and another one with 'allyesconfig'
> (all my tests on kernel builds are done like so) on a ppc64 machine:
> 	$ grep ': \(error\|warning\):' log-master-master | wc -l
> 	138581
> 	$ grep ': \(error\|warning\):' log-arch-asm-mem | wc -l
> 	50006
> So, this series eliminates about 64% of all warnings, a nice
> improvement of the S/N ratio.

Oh, nice!

It's a _long_ time since I last built the kernel (about when reading
Greg's 'Linux Kernel in a Nutshell' book, so about 2006), and I don't
even recall if I ran sparse over it. (Hmm, did you have to specify
a C parameter to make or something?).

Anyway, that is still a very large number of error/warnings - has it
always been that bad?

>> [BTW, I also noticed the (long running) 'luc/options' branch, which
>> looks like it could prove to be a nice cleanup - I've only read the
>> commit messages, not the actual commits.]
> 
> Yes, I think it's a nice cleanup because this code is quite messy but,
> OTOH, moving around all this code break all its history (via 'git blame'
> or 'git log -L') is is guaranteed to create really nasty conflicts with
> anything touching the code for the options. This is really a downside.

Yep, I know what you mean. However, I don't think you should shy
away from clean-ups for too long - it will be counter-productive
in the end.

ATB,
Ramsay Jones


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307371F8B5A
	for <lists+linux-sparse@lfdr.de>; Mon, 15 Jun 2020 01:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgFNXhc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 19:37:32 -0400
Received: from avasout02.plus.net ([212.159.14.17]:43707 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgFNXhc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 19:37:32 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id kcBtjh3zsU8CkkcBujxaQL; Mon, 15 Jun 2020 00:37:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1592177850; bh=Ai8y+bW6L0yyA2m0cCDaN/3+1EelqATCCjmkdUh+d0k=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=jx3i/X5DGu4jFp5NA9KV8uHe9zmHFAqe7S1BPwrvBGhaGi1R62mfInb0dxqtRvExz
         RFc2L0lTI/NbbEuO6yOIpJGY+Hct7KoVsnsrUrRpeyXO9Jbb/PG3UWSkXajVpQ2lfR
         aqwc++GtWQ6rwRVGPFREGgFYlRZow7tyXv61uWrKxnJTTUeODt+l4bcEA+ftDzqjZ8
         xcUhxd83r9GY/14roSd1peByow2KoZJcXMHjfRxr9Qa28EeJEfS7FC0yTF3ttRCmSL
         yzbURNIfZBTAzcMhoqR1C/uUdS/CkJniCTqCwgDhH9EE1SLhwdNotEXNjqwBgkOccI
         0ECpdWxWDz90w==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=H8om_15A4BeiMBv5teUA:9 a=QEXdDO2ut3YA:10
 a=umGxW14bZhoA:10 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: ramsayjones@:2500
Subject: Re: [ANNOUNCE] Sparse v0.6.2-rc1
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20200613020735.iqb2vd23jpomisbq@ltop.local>
 <c80024d2-6d91-4fe7-a919-3edcf4a9b80a@ramsayjones.plus.com>
 <20200614215445.rtfbx23ve57fhlbr@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <d540f450-c72e-5c51-ffba-32d7eb800137@ramsayjones.plus.com>
Date:   Mon, 15 Jun 2020 00:37:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614215445.rtfbx23ve57fhlbr@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPiK1K8JUDXP3Q0z3TzegvxTW9gyONzZ3Iv8lBE8BtOBwlEOgTN2LKSiAI1U4d1FNIwudMo9UarUSUgWoaqkUanjbCbyPM2a2nLUNvz6cw+FGXHl3TRp
 VGtpzApnaGOfr6lEhFzUtFLSUzsHWHV70q1yc/0ki8jeTvbSb1Oh6Khl0DGMmG4XYDUaSE4coZ6VHg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 14/06/2020 22:54, Luc Van Oostenryck wrote:
> On Sun, Jun 14, 2020 at 08:35:51PM +0100, Ramsay Jones wrote:
>>
>>
>> On 13/06/2020 03:07, Luc Van Oostenryck wrote:
>>> Sparse v0.6.2-rc1 is now out.
>>
>> Tested in the usual places (Linux Mint 19.3, 64-bit and 32-bit and
>> 64-bit cygwin) and in the usual way; no issues found!
> 
> Thanks a lot. Here I tested it on 64-bit Debian (latest + unstable)
> and Ubuntu, and also on ARM64, ARM(32), ppc64, sparc64, mips64.
> I'll give a try later to some BSD.
> 
>> Well, I say no issues - I did notice some spelling errors and
>> the formatting of the release notes does not look correct to
>> me (https://sparse.docs.kernel.org/en/latest/release-notes/v0.6.2.html).
>> Unfortunately, I don't know anything about the documentation tools
>> you are using, so I can't try to fix this. (It seems to be the only
>> attempt at nested 'bulleted lists', ...)
> 
> Yes, I saw that too now. I thought I had fixed it but visibly it
> wasn't. It should be really fixed now.
> 
> [(Just FYI) The format of the doc is either reStructuredText
> (.rst) or MarkDown (.md). Both are much less simple than they
> appear to be but they have the huge advantage to almost look
> as if there is no markup at all/as if written 'naturally' in
> ASCII. Much much more readable than man-pages or html markup.
> 
> The system used to generate the resulting HTML is Sphinx.
> It has the huge advantage to be very easy to install/to have
> near-zero dependencies: it's just a single python package.
> To use it, it's enough to just 'cd Documentation; make html'

I just installed python-sphinx (on LM 19.3 it is the python2
version) to give it a try, and it failed:

  $ make html
  Running Sphinx v1.6.7
  making output directory...

  Extension error:
  Could not import extension cdoc (exception: cannot import name switch_source_input)
  Makefile:21: recipe for target 'html' failed
  make: *** [html] Error 1
  $ 

It's too late to try and fix it tonight ... (also LM 20 is currently
in beta, so I will be trading up soon) :D

ATB,
Ramsay Jones

> and the result can be found in 'build/html'. But I confess,
> most of the time, I'm too lazy to do that, I just push it
> on github which trigger a build on readthedocs.io (which
> then nicely send me an email if there is an error).]
> 
> -- Luc
> 

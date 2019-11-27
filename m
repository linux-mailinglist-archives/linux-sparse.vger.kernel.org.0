Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A476710B3EE
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 17:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726990AbfK0Q4G (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 11:56:06 -0500
Received: from avasout03.plus.net ([84.93.230.244]:39933 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfK0Q4G (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 11:56:06 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id a0bjiKLwPKleZa0bkim7US; Wed, 27 Nov 2019 16:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574873764; bh=lbIqQ8zQsUnnoTVuRbIW2Lz5uYhM79E9rTD8hxM1O9U=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=HoMfQMeiPcGeNORi9aV/gHY0m9Zko+XX4y5Gu8y6SIjQNqEQ/fyp0p0btxLJISAMh
         L2r0DjrteXGRDVaV+KLELvYmbHunKtSOzMdJbPTHI+1b4TfuLHBvZRzFHZ8zSpdTh3
         Pvjg4U2srIRaYqH9InzpFPGSSg01EfUbBOSKAejzpN/b+5xUf7Li8dqhL9MDmnoGV/
         AWckknTsg1d2u4D7SUMLqoTTosNtAIVRoAdP1VLp7qC6t62PrIqiZKFgd650xZpUjg
         x2V5LHzXksw+tpfrKCAjxCOXpjfkPrGWymD8joViJmmKrAoD8S7KbhoOoOYZw3DLjX
         iPZOK288VSihg==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=W03bb99Gkr5rBGteawIA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=n87TN5wuljxrRezIQYnT:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 1/4] arch: add missing predfines: __amd64 & __amd64__
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
 <20191127022351.68902-2-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <ac2b7a29-2d20-451c-0748-097dfc16c2f9@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 16:56:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127022351.68902-2-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJYVVXVkPJhYwqQGEfdtJwCeVyjhRSeN7hHjOKrCcp2m2ovo3Xscveq4SeB161dPJnFTqJ74/hwJ8bowx0SgSc/DQq/1ELVj6oySl0B4qWlnKiRcAm6C
 GzmsO/LWOp8tcEudfWmjUivTCZ3Vh7TPHUN9dvifr0XWlP1JwvBtgTTIjza54cSBLPEch/8Z6hkXDA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 02:23, Luc Van Oostenryck wrote:
> These seems to be defined whenever s__x86_64 & __x86_64__

s/seems/seem/
s/s__x86_64 & __x86_64__/the __x86_64 and __x86_64__ macros/

ATB,
Ramsay Jones

> are defined.
> 
> So, do the same here too.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  lib.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/lib.c b/lib.c
> index 45402e51f..28ca49c7c 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -1609,6 +1609,8 @@ static void predefined_macros(void)
>  		if (arch_m64 != ARCH_LP32) {
>  			predefine("__x86_64__", 1, "1");
>  			predefine("__x86_64", 1, "1");
> +			predefine("__amd64__", 1, "1");
> +			predefine("__amd64", 1, "1");
>  			break;
>  		}
>  		/* fall-through */
> 

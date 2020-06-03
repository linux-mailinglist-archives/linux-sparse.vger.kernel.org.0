Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33CF1ED123
	for <lists+linux-sparse@lfdr.de>; Wed,  3 Jun 2020 15:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgFCNrK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 3 Jun 2020 09:47:10 -0400
Received: from avasout07.plus.net ([84.93.230.235]:36401 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgFCNrK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 3 Jun 2020 09:47:10 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id gTjWj935i0wwMgTjXj8NMI; Wed, 03 Jun 2020 14:47:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1591192028; bh=P20o4FQerPOvazwdeA7xgeps8jXdteZCaN0LZx25fmM=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=GZhCE3cAyF2PRt96IcFACVTR24QPhOE9GeaHUsmVro5ERu5WZFsnexfAJ29t3wD5V
         DTmnoyV1XGNEYExWzgFK2Guy4RURxz0RWZDR2LUkfaXICS5+ejmGSEEuiGAD6047GK
         b2wZkbeEbritpMQTS5xQ+d99KhXC1JhAWQNd6gUv7S8PYeAyq/LpU9cxHf2RZn+xIx
         o+8RVH9iWk+qcppWX1llEokfRgAHrglboMldeB6PEKBi9CuY6ICkgeodN5JlTJ6i0Q
         oHyqvKLy7J27e362L3TYGhufPBwa1x+ktSD221uPbwFF0LMwu8ZURCEHov7m9yd3Ct
         jJVz1gqxLxMAA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=b/4pHuOx c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=zbbe8oHl7hlBIGIYIhIA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] univ-init: scalar initializer needs some additional
 checks
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20200602163336.32667-1-luc.vanoostenryck@gmail.com>
 <34e42c7f-6c9d-b8e5-6ee1-2988b1099176@ramsayjones.plus.com>
Message-ID: <99851c7e-e96a-aa5d-9184-d6e17e31e3d3@ramsayjones.plus.com>
Date:   Wed, 3 Jun 2020 14:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <34e42c7f-6c9d-b8e5-6ee1-2988b1099176@ramsayjones.plus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNaUKaz8fvyDdNKGwjHuB8jMo0MTborxzBPPsQD7QWMrq+jzUYxTUwzQAje03NZWwVSzYob5uLf/VHlRnCurJx1vpvP3xW9SlBXf8rh6X531W3rLKUQ3
 D9I27lQVtcBpWkmHU7EfHiwTKz9Z0pGLNTttnEEEDRG4KvqnAIGI0zFbZEgcLhsfdlYGqyuEPH1w/g==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 03/06/2020 02:01, Ramsay Jones wrote:

> On 02/06/2020 17:33, Luc Van Oostenryck wrote:
[snip]
> I applied this patch just now and everything worked fine. In addition,
> the tests from my patch also passed, once I had remembered to add the
> -Wno-universal-initializer to the 'check-command' - because I do not
> have the patch which changes the default for that warning.
> 
> The only thing which gave me pause ...
> 
>> Fixes: 537e3e2daebd37d69447e65535fc94e82b38fc18
>> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
>> ---
>>  evaluate.c                 |  3 +++
>>  expression.h               |  1 +
>>  parse.c                    | 15 ++++++++-------
>>  validation/Wuniv-init-ko.c | 16 ++++++++++++++++
>>  validation/Wuniv-init-ok.c | 18 ++++++++++++++++++
>>  5 files changed, 46 insertions(+), 7 deletions(-)
>>
>> diff --git a/evaluate.c b/evaluate.c
>> index 8d2e68692a48..16553eb3481b 100644
>> --- a/evaluate.c
>> +++ b/evaluate.c
>> @@ -2608,6 +2608,9 @@ static void handle_list_initializer(struct expression *expr,
>>  	struct expression *e, *last = NULL, *top = NULL, *next;
>>  	int jumped = 0;
>>  
>> +	if (expr->zero_init)
>> +		expr->expr_list = NULL;
> 
> ... was the potential memory leak here. (OK it wouldn't be a
> huge leak, but still!).

Heh, as soon as my head hit the pillow I realised that, due to extensive
use of memory pools/arenas, this is a rather silly comment! ;-)

[Ah, well, it was 2am!]

ATB,
Ramsay Jones



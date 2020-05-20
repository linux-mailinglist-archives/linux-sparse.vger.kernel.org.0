Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70E61DC1BC
	for <lists+linux-sparse@lfdr.de>; Thu, 21 May 2020 00:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgETWDd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 May 2020 18:03:33 -0400
Received: from avasout01.plus.net ([84.93.230.227]:60374 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgETWDd (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 May 2020 18:03:33 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bWoDjGU0LjUVQbWoFjkcDI; Wed, 20 May 2020 23:03:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1590012211; bh=Oa+809KAMDNOEDYlm2perWcGRoYqGl6Vpl6J1gmsvGc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=miyVbU6iIf03SwRaU7IQKE/Wvza+/9WAgTufO0KI4y8plZPOaUI01ljkIcboi4QaP
         89B0pTW4w0LjW/KyWS54TVngUtg1bPmxYGJGFqCeV9V7fWfqwp8/Fot1fPGuZDmUx7
         2T4ik209Mdbz/80RYjXeeKe+nTR8TzriSjbylYJE3N3HOpSBOQga/YfVvjnYP/L8+V
         wR01sYba9QoXchK22WG4YLbt9aDr8qDbe/KIHLKagvmE8TmSbv9EczTq9GWGQ4N+d4
         SHdS2xUH86rpzbNPy1NsGFGU/Wonur/pWKYAkKhZBycVCJeHR27HJ3unScG3EEROOI
         9JziamkmuKyCA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=L5aGv9b8 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=gu6fZOg2AAAA:8 a=RDgEQt9NXa0NUufKwBAA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=NWVoK91CQyQA:10 a=2RSlZUUhi9gRBrsHwhhZ:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [SPARSE PATCH] univ-init: conditionally accept { 0 } without
 warnings
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org, Junio C Hamano <gitster@pobox.com>,
        =?UTF-8?B?xJBvw6BuIFRy4bqnbiBDw7RuZyBEYW5o?= <congdanhqx@gmail.com>
References: <20200518235446.84256-1-luc.vanoostenryck@gmail.com>
 <2fcda487-733b-8ed1-e1f4-6c6204a68569@ramsayjones.plus.com>
 <20200520204001.2nkuowfeftp7uhpl@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <0e81e382-5dde-6029-35d7-0de72e5a0a99@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 23:03:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520204001.2nkuowfeftp7uhpl@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLnFzYq9n/el6x0ZiGOdjRoz1eYMNXjlENehyo5zKZ5sVGMBwonapYv0/8t1eei+9y9yA3MJDgyVuABcW6jqlH6UvVidLyrb4Vthsbi5qu/XF6+WR7lc
 mHBhvm6OtEa1AXbIb17GHJzjHp56MMBaWPQXvZgOod4oo591/Sd8eMePWWRKQDTpSqKMhvvMsSirrw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 20/05/2020 21:40, Luc Van Oostenryck wrote:
> On Wed, May 20, 2020 at 01:22:22AM +0100, Ramsay Jones wrote:
[snip]

>>
>> I remember the discussion (on lkml and sparse ml) in which
>> there was general agreement that '{}' would be preferred
>> solution (if only it was standard C!). However, I thought
>> that (since some compilers don't support it e.g. msvc) the
>> next best solution would be for sparse to suppress the
>> warning if given the '= { 0 }' token sequence. (ie. no mention
>> of it being conditional on a option).
> 
> Yes, I kinda agree but concerning the kernel, my understanding is
> that the warning is desired (cfr. https://marc.info/?t=154704602900003 ) 

Oh, my lord, I had no recollection of that thread - and it was
only just over a year ago! ;-P

Hmm, yes it's a shame, but I guess the kernel usage takes precedence.

> For example, for cases like:
> 	int *array[16] = { 0 };
> 
> So, I want to keep the current behavior as the default.
> 
>>> @@ -2750,6 +2750,13 @@ static struct token *initializer_list(struct expression_list **list, struct toke
>>>  {
>>>  	struct expression *expr;
>>>  
>>> +	// '{ 0 }' is equivalent to '{ }' unless wanting all possible
>>> +	// warnings about using '0' to initialize a null-pointer.
>>> +	if (!Wuniversal_initializer) {
>>> +		if (match_token_zero(token) && match_op(token->next, '}'))
>>> +			token = token->next;
>>> +	}
>>> +
>>
>> Ha! This made me LOL! (see my patch below).
>>
>> So simple. (I did think, at first, that deleting the '0' token was
>> not a good idea - then I realized that it's more like skipping/ignoring
>> the token than deleting it.)
> 
> Well ... I'm lazy, so ... and it gave me the garantee that it will
> behave exactly like '{ }'.
> 
>> The patch below was (I think) my third attempt. If memory serves
>> me, the first patch attempted to determine the '{0}' initializer
>> from the 'struct expession *' passed to bad_null() alone. However,
>> that did not allow me to distinguish '= { 0 }' from '= { 0, }',
>> so I needed to backup from evaluation to the parse.
> 
> I think it's fine to allow the comma, I probably need to change
> this is my version.

No, No, that would definitely be wrong. In fact, I would go further
and say _only_ '= { 0 } ;' should suppress the warning (yes I added
the semi-colon). (I did think that maybe other forms of 'integer
constant with value zero' could be added; e.g. 0x0, but I am not
sure even that is useful).

['designated initializers' would also not work to suppress the
warnings, of course!]

BTW, I was not entirely convinced by the git-list discussion which
lead to this patch. However, limiting the suppression of the warning
to _just_ '= { 0 } ;' would leave the majority of use-cases issuing
the warning anyway. The main benefit would be, as argued by others,
that when you switch the order/type of fields in a struct (say) that
you would not have to change the initializer from/to {0}/{NULL}.
(Again, I don't see that as a huge advantage ...)

>> Also, I didn't test the initialization of embedded struct/array fields
>> (and what should happen anyway? should '{ 0 }' also work for initializing
>> the sub-structure(s), or should it only work at the top-level?).

And so, given the above, I don't think the warnings should be suppressed
on sub-structures.

> In fact, it works for literally anything: simple arrays, multi-dimensional
> arrays (it must be because the braces doesn't need to match:
> 	int a[2][2] = { 1, 2, 3, 4 };

Heh, yes indeed.

> is perfectly legal), structures with a scalar as first member, more complex
> strutures, sub-structures, and more suprisingly even for simple types:
> 	int a = { 0 };
> 	_Bool b = { 0 };
> 	double f = { 0 };
> 	int *ptr = { 0 };

Ah, yes, I wonder if that would be a problem. ;-)
My initial reaction would be that non-aggregate types would still
issue warnings (even with ={0};), but that starts getting harder
to do ... :(

I don't have any simple answers.

ATB,
Ramsay Jones


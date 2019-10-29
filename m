Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3EE4E7E93
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 03:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbfJ2CjG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 28 Oct 2019 22:39:06 -0400
Received: from avasout03.plus.net ([84.93.230.244]:51787 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729320AbfJ2CjF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 28 Oct 2019 22:39:05 -0400
Received: from [10.0.2.15] ([146.198.133.39])
        by smtp with ESMTPA
        id PHPLig50ftvkXPHPMiiAfY; Tue, 29 Oct 2019 02:39:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1572316744; bh=3Vd0JoyK9vjaMDPiEfIcd0bq4Da/dDRQVJRkigVYHx8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=GpkkkMh7LCwSC46u2HgfQp5jLrtQpvnvXOOoPPE85Jgqm00T26JxCjah0K5W5+0rR
         mJmYjyA4sTgCc4oUlB5Y6OQrl/JTjpeJI7G7LKXlSXy8seGlvmq9c1F8pFEpFb4JON
         oK1ko7oP1ONYTI7BT0fMScfL9/t7soQGTKDSVZ3lqqaLnLHBUN5Z4pFAYbOivCyF0s
         6LQ704/BxQuu/PhnMSOStcStwKiX3nwnJLz8ta2txWo/gCOZV1NxBNQvgFCeSJTuOY
         qOV+6sR/TTmNGy8kzsJyRwAqLfpLNSpH8jrnw9yzLbZZkWrPp2MSCnqoU6a/KHrshi
         qWZsebbR10niA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ePBtc0h1 c=1 sm=1 tr=0
 a=1Jh3712dEPwUcX5EWi7t+w==:117 a=1Jh3712dEPwUcX5EWi7t+w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=X9G2ohcBEumEKn13xBoA:9
 a=DKryddvG6lcVqKu1:21 a=rVP9ElcGolyjnz41:21 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] compiler*.h: Add '__' prefix and suffix to all
 __attribute__ #defines
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Joe Perches <joe@perches.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        linux-sparse@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <7a15bc8ad7437dc3a044a4f9cd283500bd0b5f36.camel@perches.com>
 <CANiq72=B6XKwfkC9L4=+OxWtjxCp-94TWRG1a=pC=y636gzckA@mail.gmail.com>
 <19fd23e98bab65a1ee624445193bd2ed86108881.camel@perches.com>
 <20191028221523.vlzdk6dkcglxei6v@desk.local>
 <00c5ef125a4e62f538de7ddddc9d8fe7085794a3.camel@perches.com>
 <20191028230349.xlhm42ripxktx43y@desk.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <61eb73ad-5c30-0005-5031-6584df72ad5f@ramsayjones.plus.com>
Date:   Tue, 29 Oct 2019 02:38:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028230349.xlhm42ripxktx43y@desk.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJdK6ojPg4UiCDVjaWTqnOOrupE3lz3KQWXLl6QihDq77CAG4/APgQzVxjAQpq+wdO3iqLRan8yae0aSYVGClPTFYVrugUDQPyHeMhm+MQkzu5UTCa1x
 PFXN/KmG3YgTK+giDaL9E7beY3/I3X+pTahWiIdsN5A5tlrgkm7ML6d0Jtn2WMn6V9WY3+oCnuWZJg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 28/10/2019 23:03, Luc Van Oostenryck wrote:
> On Mon, Oct 28, 2019 at 03:28:17PM -0700, Joe Perches wrote:
>> On Mon, 2019-10-28 at 23:15 +0100, Luc Van Oostenryck wrote:
>>> On Mon, Oct 28, 2019 at 10:59:47AM -0700, Joe Perches wrote:
>>>> On Mon, 2019-10-28 at 18:37 +0100, Miguel Ojeda wrote:
>>>>> Just in case: for these ones (i.e. __CHECKER__), did you check if
>>>>> sparse handles this syntax? (I don't recall myself if it does).
>>>>>
>>>>> Other than that, thanks for the cleanup too! I can pick it up in the
>>>>> the compiler-attributes tree and put it in -next.
>>>>
>>>> Thanks for asking and no, I did  not until just now.
>>>> Turns out sparse does _not_ handle these changes and
>>>> the checking fails for these __<changes>__.
>>>>
>>>> sparse would have to update parse.c or the __CHECKER__
>>>> changes would need to be reverted.
>>>>
>>>> Perhaps update parse.c like:
>>>
>>> ...
>>>
>>> Yes, this was missing. Thanks.
>>> Can I have your SoB for this?
>>
>> I'm not sure this actually works as there's
>> some possible sparse parsing changes in the
>> use of __context__.
> 
> Yes, indeed. The following shoud be squashed on top of
> your patch (not tested yet on linux side):
> 
> -- Luc
> 
> diff --git a/parse.c b/parse.c
> index 4464e2667..4b0a1566c 100644
> --- a/parse.c
> +++ b/parse.c
> @@ -345,6 +345,7 @@ static struct symbol_op goto_op = {
>  
>  static struct symbol_op __context___op = {
>  	.statement = parse_context_statement,
> +	.attribute = attribute_context,

Hmm, so why is do we have a context_op and a __context___op?

>  };
>  
>  static struct symbol_op range_op = {
> @@ -537,6 +538,7 @@ static struct init_keyword {
>  	{ "while",	NS_KEYWORD, .op = &while_op },
>  	{ "do",		NS_KEYWORD, .op = &do_op },
>  	{ "goto",	NS_KEYWORD, .op = &goto_op },
> +	{ "context",	NS_KEYWORD, .op = &context_op },
>  	{ "__context__",NS_KEYWORD, .op = &__context___op },

So, can '__context__' be used in a statement, as well as an
attribute, while 'context' can only be used in an attribute?

Confused.

ATB,
Ramsay Jones

>  	{ "__range__",	NS_KEYWORD, .op = &range_op },
>  	{ "asm",	NS_KEYWORD, .op = &asm_op },
> @@ -560,8 +562,6 @@ static struct init_keyword {
>  	{ "__bitwise__",NS_KEYWORD,	MOD_BITWISE,	.op = &attr_bitwise_op },
>  	{ "address_space",NS_KEYWORD,	.op = &address_space_op },
>  	{ "__address_space__",NS_KEYWORD,	.op = &address_space_op },
> -	{ "context",	NS_KEYWORD,	.op = &context_op },
> -	{ "__context__",NS_KEYWORD,	.op = &context_op },
>  	{ "designated_init",	NS_KEYWORD,	.op = &designated_init_op },
>  	{ "__designated_init__",	NS_KEYWORD,	.op = &designated_init_op },
>  	{ "transparent_union",	NS_KEYWORD,	.op = &transparent_union_op },
> 

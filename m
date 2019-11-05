Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27B12F053A
	for <lists+linux-sparse@lfdr.de>; Tue,  5 Nov 2019 19:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390520AbfKESj1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 5 Nov 2019 13:39:27 -0500
Received: from imap1.codethink.co.uk ([176.9.8.82]:58033 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390485AbfKESj1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 5 Nov 2019 13:39:27 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iS3jh-0005Ym-QP; Tue, 05 Nov 2019 18:39:25 +0000
Subject: Re: latest printf code
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
 <20191104222703.d75txlb7pq2dp6kd@ltop.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <f2efffd7-c032-9875-1990-67716612ea9b@codethink.co.uk>
Date:   Tue, 5 Nov 2019 18:39:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104222703.d75txlb7pq2dp6kd@ltop.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 04/11/2019 22:27, Luc Van Oostenryck wrote:
> On Mon, Nov 04, 2019 at 10:46:44PM +0100, Luc Van Oostenryck wrote:
>> On Fri, Nov 01, 2019 at 04:36:51PM +0000, Ben Dooks wrote:
>>> I've put the latest code up at:
>>>
>>>   https://github.com/bjdooks-ct/sparse bjdooks/printf20
>>>
>>> I think it has all the issues dealt with.
>>>
>>> I can't currently post or do a final test as away from work laptop.
>>
>> Thank you.
> 
> I think that the only missign thing are:
> 1) eliminate the call to strcmp() on the typediff
> 2) do a custom type checking instead of calling check_assignment_types()
> 
> What is your plan about them?

see below

> There is also one more thing I would like: it's that you move all the
> code in evaluate.c in a separated file (for example verify-format.c)
> and have just verify_format_attribute() exported. For the moment, it's
> not really possible because of the dependence on check_assignment_types()
> but it can nicely be do,e once 1) & 2) are done.

I was wondering if we could do something like export the 
check_assignment_types and maybe also add check_pointer_asn() in
evaluate.c? The code in check_assignment_types is quite long and
I am not sure I really want to try and recreate it.

I'm still not quite sure over the rules over what is and isn't allowed
to printf, it may be that we need to be able to get the sizes of the
types and verify those, which is very architecture specific.

> -- Luc

I would like to see this merged soon, as it looks like I will be doing
an amount of travelling for work, which can be time consuming and tiring.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

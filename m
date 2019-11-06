Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3D4CF1D02
	for <lists+linux-sparse@lfdr.de>; Wed,  6 Nov 2019 18:58:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728740AbfKFR6J (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 6 Nov 2019 12:58:09 -0500
Received: from imap1.codethink.co.uk ([176.9.8.82]:57002 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727397AbfKFR6J (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 6 Nov 2019 12:58:09 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iSPZH-0001sM-Bq; Wed, 06 Nov 2019 17:58:07 +0000
Subject: Re: latest printf code
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
 <20191104222703.d75txlb7pq2dp6kd@ltop.local>
 <f2efffd7-c032-9875-1990-67716612ea9b@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <a91fe185-9b23-f0f4-097c-e9bd57d40243@codethink.co.uk>
Date:   Wed, 6 Nov 2019 17:58:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f2efffd7-c032-9875-1990-67716612ea9b@codethink.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 05/11/2019 18:39, Ben Dooks wrote:
> On 04/11/2019 22:27, Luc Van Oostenryck wrote:
>> On Mon, Nov 04, 2019 at 10:46:44PM +0100, Luc Van Oostenryck wrote:
>>> On Fri, Nov 01, 2019 at 04:36:51PM +0000, Ben Dooks wrote:
>>>> I've put the latest code up at:
>>>>
>>>>   https://github.com/bjdooks-ct/sparse bjdooks/printf20
>>>>
>>>> I think it has all the issues dealt with.
>>>>
>>>> I can't currently post or do a final test as away from work laptop.
>>>
>>> Thank you.
>>
>> I think that the only missign thing are:
>> 1) eliminate the call to strcmp() on the typediff
>> 2) do a custom type checking instead of calling check_assignment_types()
>>
>> What is your plan about them?
> 
> see below
> 
>> There is also one more thing I would like: it's that you move all the
>> code in evaluate.c in a separated file (for example verify-format.c)
>> and have just verify_format_attribute() exported. For the moment, it's
>> not really possible because of the dependence on check_assignment_types()
>> but it can nicely be do,e once 1) & 2) are done.

Ok, I've split this out now, I agree it is probably better suited to
being seperate as it may well grow as we add formats and anything
else that might be required.

I'll try and finish looking at the tests tomorrow, ande about the
use of check_assignment_types(), whether we could extend it with
some sort of flags field, such as (IGNORE_ADDRESS_SPACE).

I've started putting up:
	https://github.com/bjdooks-ct/sparse bjdooks/printf22

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

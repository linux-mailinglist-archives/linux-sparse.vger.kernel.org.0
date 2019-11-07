Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7F8F28AA
	for <lists+linux-sparse@lfdr.de>; Thu,  7 Nov 2019 09:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbfKGIFu (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 7 Nov 2019 03:05:50 -0500
Received: from imap1.codethink.co.uk ([176.9.8.82]:38573 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfKGIFu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 7 Nov 2019 03:05:50 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iScnc-0007xF-8y; Thu, 07 Nov 2019 08:05:48 +0000
Subject: Re: latest printf code
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
 <20191104222703.d75txlb7pq2dp6kd@ltop.local>
 <f2efffd7-c032-9875-1990-67716612ea9b@codethink.co.uk>
 <a91fe185-9b23-f0f4-097c-e9bd57d40243@codethink.co.uk>
 <20191107000843.466fv6uihnzmum6t@ltop.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <80a34306-e836-8f88-231a-59bcba280358@codethink.co.uk>
Date:   Thu, 7 Nov 2019 08:05:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191107000843.466fv6uihnzmum6t@ltop.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 07/11/2019 00:08, Luc Van Oostenryck wrote:
> On Wed, Nov 06, 2019 at 05:58:06PM +0000, Ben Dooks wrote:
>>
>> Ok, I've split this out now, I agree it is probably better suited to
>> being seperate as it may well grow as we add formats and anything
>> else that might be required.
>>
>> I'll try and finish looking at the tests tomorrow, ande about the
>> use of check_assignment_types(), whether we could extend it with
>> some sort of flags field, such as (IGNORE_ADDRESS_SPACE).
>>
>> I've started putting up:
>> 	https://github.com/bjdooks-ct/sparse bjdooks/printf22
> 
> Yes, that's fine. There is just that, as I said, you surely want to
> move the code around a little at the start of verify_format_attribute()
> so that the warning "not a format string?" can be showed again
> (the check I made to the expr just do a silent early return
> if the string is not a literal string).

Ah, ok. I'll have a look at the test cases today and work out
what else needs to be done and try and get as much done by the
end of this week.

Thank you for looking at this.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

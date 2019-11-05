Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5DC7F015B
	for <lists+linux-sparse@lfdr.de>; Tue,  5 Nov 2019 16:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389399AbfKEP1T (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 5 Nov 2019 10:27:19 -0500
Received: from imap1.codethink.co.uk ([176.9.8.82]:53198 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbfKEP1S (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 5 Nov 2019 10:27:18 -0500
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iS0jl-0001Je-3v; Tue, 05 Nov 2019 15:27:17 +0000
Subject: Re: latest printf code
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <3c43b973-d387-35c7-441b-a420767474be@codethink.co.uk>
Date:   Tue, 5 Nov 2019 15:27:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104214643.d6ta3xok4jypkrjo@ltop.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 04/11/2019 21:46, Luc Van Oostenryck wrote:
> On Fri, Nov 01, 2019 at 04:36:51PM +0000, Ben Dooks wrote:
>> I've put the latest code up at:
>>
>>   https://github.com/bjdooks-ct/sparse bjdooks/printf20
>>
>> I think it has all the issues dealt with.
>>
>> I can't currently post or do a final test as away from work laptop.
> 
> Thank you.
> 
> I've a few more remarks about formatting or naming and
> also some simplifications I would like you make.
> 
> I'll add them in separated replies but I've pushed the raw
> changes at:
> 	git://github.com/lucvoo/sparse-dev.git printf20a
>

Ok, will go through those and see what else I can do.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

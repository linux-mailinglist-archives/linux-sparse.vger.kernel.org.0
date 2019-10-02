Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 173D9C9258
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 21:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbfJBT1M (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 15:27:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44988 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728773AbfJBT1M (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 15:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=yhdiGBuL446wVwk2ZbZBezM5OV5+IRWjR7T40JL68gs=; b=R9EuOSho4q1JHIYmRatTkYRVC
        EFG1IDvh8hPyXvq9HUlPAdgEJ5BxobLc2vdfrNihaiLzlYmPKYXOEYA2myamqJTZgFaPsspbrc5gQ
        P8CxvUmAJCVqh19KQNQGS1g2lntRq8xK9QZGX0miTBbo0pW6ewnpm6N/uUDwpqRDl1hgE1lFz+2kB
        pwnBXd59u9OqD5QPO5Q66WG+yjHL9ou7fpVVPwKsMU0Tgunszc1v1UsSrqNnL2Rwwer3/0bBZAdDJ
        N1uiu1+5nkgcl/eCF5yvLcBP3AEqxJtj+As2/a1h9LSVSFN2P5YrLzJiucX2nzsJEXggkNImcrwzP
        4t37NM2XQ==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFkHG-00020v-NZ; Wed, 02 Oct 2019 19:27:10 +0000
Subject: Re: conditional operator ?: usage (Linux kernel)
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
References: <74ad3552-ecd8-502e-f8a0-d5e49d11fedb@infradead.org>
 <20191002162016.vfr5cnbaxrjm42rs@desk.local>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d6ff68e0-8891-cbbe-8216-469fdc1952cf@infradead.org>
Date:   Wed, 2 Oct 2019 12:27:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002162016.vfr5cnbaxrjm42rs@desk.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 10/2/19 9:20 AM, Luc Van Oostenryck wrote:
> On Tue, Oct 01, 2019 at 11:16:44PM -0700, Randy Dunlap wrote:
>> I don't mind the use of ?: for choosing values, but it seems odd to me
>> to use it for calling functions, as in:  [from drivers/clocksource/timer-of.c),
>> line 28 in Linux 5.4-rc1):
>>
>> 	of_irq->percpu ? free_percpu_irq(of_irq->irq, clkevt) :
>> 		free_irq(of_irq->irq, clkevt);
>>
>> where free_percpu_irq() and free_irq() are function calls but not of exactly
>> the same type, so sparse (0.6.1-rc1) doesn't like it:
>>
>> ../drivers/clocksource/timer-of.c:28:24: error: incompatible types in conditional expression (different types):
>> ../drivers/clocksource/timer-of.c:28:24:    void
>> ../drivers/clocksource/timer-of.c:28:24:    void const *
>>   CC      drivers/clocksource/timer-of.o
>>
>>
>> gcc doesn't complain about the ?: usage.  Is sparse correct here or is it being
>> too strict?
> 
> I think sparse is well within its mandate here:
>  ?: is an expression and as such should have a defined type
> which requires that both sides matches (with a few subtleties).
> Here it's not used as an expression but only for the side effect
> of calling the functions (with incompatible types).

Yes, that's the way that I read the spec also.

>> I would have just coded the 2 functions calls as
>> 	if (of_irq->percpu)
>> 		free_percpu_irq(of_irq->irq, clkevt);
>> 	else
>> 		free_irq(of_irq->irq, clkevt);
> 
> I would do the same.
> 
> BTW, the previous warnings is, IMO, much more worrisome:
>     timer-of.c:28:55: warning: incorrect type in argument 2 (different address spaces)
>     timer-of.c:28:55:    expected void [noderef] <asn:3> *
>     timer-of.c:28:55:    got struct clock_event_device *clkevt

I might have missed that one.  I was busy trying to ignore the 580 similar warnings
about rcu variables and asn:4, where each warning takes 3 lines, so it really
clutters up the sparse output for the kernel build.


-- 
~Randy

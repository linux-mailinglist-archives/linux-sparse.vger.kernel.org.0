Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D2327F3E1
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Sep 2020 23:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729980AbgI3VFj (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Sep 2020 17:05:39 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:50990 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725355AbgI3VFj (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Sep 2020 17:05:39 -0400
Received: from cpc98990-stkp12-2-0-cust216.10-2.cable.virginm.net ([86.26.12.217] helo=[192.168.0.10])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1kNjI9-0004lF-Gn; Wed, 30 Sep 2020 22:05:37 +0100
Subject: Re: update to format parsing branch
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <3960bea7-69ef-ed00-66cf-ac73d5cd8876@codethink.co.uk>
 <20200930202934.rjcfxikrzfvesxnc@ltop.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <fb7680ab-eab1-9c32-f515-c2737b78d6a5@codethink.co.uk>
Date:   Wed, 30 Sep 2020 22:05:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930202934.rjcfxikrzfvesxnc@ltop.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 30/09/2020 21:29, Luc Van Oostenryck wrote:
> On Wed, Sep 30, 2020 at 09:35:50AM +0100, Ben Dooks wrote:
>> I've done a rebase to v0.6.2 and put the result up at:
>>
>> https://gitlab.com/CodethinkLabs/sparse bjdooks/printf-new3
> 
> Great.
> 
> I've one last request, the email address given as author is not the same
> as the one used in the Signed-off-by and the copyright notice.
> 
> So, is it possible to respin the series with:
> * the small changes I've made here above
> * removing the changelogs from the commit messages
> * using the same email address for the author and the SoB?

I can't see any diffs between git-authour and the SoB in the series.



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0CD2832B9
	for <lists+linux-sparse@lfdr.de>; Mon,  5 Oct 2020 11:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgJEJEr (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 5 Oct 2020 05:04:47 -0400
Received: from imap2.colo.codethink.co.uk ([78.40.148.184]:46970 "EHLO
        imap2.colo.codethink.co.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725885AbgJEJEr (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 5 Oct 2020 05:04:47 -0400
Received: from cpc98990-stkp12-2-0-cust216.10-2.cable.virginm.net ([86.26.12.217] helo=[192.168.0.10])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1kPMQG-00077z-2y; Mon, 05 Oct 2020 10:04:44 +0100
Subject: Re: [PATCH 0/8] format check tweaks
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20201005020002.1108-1-luc.vanoostenryck@gmail.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <58d771f9-7560-f682-3173-78dea0f83711@codethink.co.uk>
Date:   Mon, 5 Oct 2020 10:04:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201005020002.1108-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 05/10/2020 02:59, Luc Van Oostenryck wrote:
> Ben, these are small changes I think should be applied with
> your series, on top of the patches I send yesterday.
> I've pushed everything at:
> 	git://github.com/lucvoo/sparse-dev.git format-check
> If you're fine with these, I can squeeze them with the series.
> 
> There are also a few tests I don't agree with:
> 	const void *ptr = ...
> 	printf("%s", ptr);
> These tests silently accept this, but they should warn.
> But this can be fixed at a later step.

ok, thanks.

I'm going to try and work out the best way to deal with the kernel
extra funsies. I have a few ideas but yet to make a coherent document
about them.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

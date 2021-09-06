Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2EE4019E3
	for <lists+linux-sparse@lfdr.de>; Mon,  6 Sep 2021 12:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhIFKdK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 6 Sep 2021 06:33:10 -0400
Received: from imap3.hz.codethink.co.uk ([176.9.8.87]:45512 "EHLO
        imap3.hz.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229913AbhIFKdK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 6 Sep 2021 06:33:10 -0400
X-Greylist: delayed 1894 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Sep 2021 06:33:09 EDT
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.18])
        by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1mNBQT-0003Rm-Ka; Mon, 06 Sep 2021 11:00:29 +0100
Subject: Re: [ANNOUNCE] Sparse v0.6.4
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Jeff Layton <jlayton@redhat.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
References: <20210906042111.lhoq7egtpmw3jcv6@mail>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <0c4480ce-6c92-7788-772c-581a76c2df51@codethink.co.uk>
Date:   Mon, 6 Sep 2021 11:04:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210906042111.lhoq7egtpmw3jcv6@mail>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 06/09/2021 05:21, Luc Van Oostenryck wrote:
> Sparse v0.6.4 is now out.
> 
> The source code can be found at its usual repository:
>     git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.4
> 
> The tarballs can be found at:
>     https://www.kernel.org/pub/software/devel/sparse/dist/
> 
> Many thanks to people who have somehow contributed to the 299
> patches of this release:
>     Ramsay Jones, Linus Torvalds, Kyle Russell

This has reminded me I have lost track of the printf formatting
changes. Is it possible to re-sync and work out what still needs
to be done to get this work merged?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

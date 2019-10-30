Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C06CE98D1
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbfJ3JGn (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:06:43 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:38456 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfJ3JGn (ORCPT
        <rfc822;Linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:06:43 -0400
Received: from [78.40.148.177] (helo=localhost)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iPjw9-0007Ec-Fh; Wed, 30 Oct 2019 09:06:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 30 Oct 2019 10:06:41 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linux-sparse@vger.kernel.org
Subject: Re: [PATCH] options: allow to specify the desired arch with
 --arch=<arch>
In-Reply-To: <20191029205718.z7ki5z23j5qqovsx@ltop.local>
References: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
 <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
 <20191029082334.g3evfqkc73ohn6pn@ltop.local>
 <89ebf585-7700-c8e2-7786-a599f31ee5e8@ramsayjones.plus.com>
 <20191029205718.z7ki5z23j5qqovsx@ltop.local>
Message-ID: <9108cbcfc91e0bdc8c331beb5a45329b@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 2019-10-29 21:57, Luc Van Oostenryck wrote:
> On Tue, Oct 29, 2019 at 06:57:02PM +0000, Ramsay Jones wrote:
>> > Do you see some complications?
>> 
>> No, I was thinking about the opportunity to simplify cgcc! :

Should we also have an option to use cc to provide the current 
architecture and other cc defines introduced by the ore processor stage 
to allow synchronization with compiler? Or shod this be done in the 
makefile calling
> 
> Oh yes, I'm working on it.
> 
> -- Luc

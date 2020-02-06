Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F26D154B06
	for <lists+linux-sparse@lfdr.de>; Thu,  6 Feb 2020 19:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727358AbgBFSZl (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 6 Feb 2020 13:25:41 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:57592 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgBFSZl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 6 Feb 2020 13:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=8FtHi8dKiDLAWQ3qbqmqDtMXySa6LlAJzlnG/emSglg=; b=cd+GNivcLxgkv0i4QREI04QJH2
        j4d7PjVBQG7RFPO/bl1uG9JUNkkdGdlQuE6P9P1gIaC7HFkeJe3jDdkujw2eJknv66GHMVYLEbkd/
        dkznoef0YLwyap4y8Si/2tCPDCeP4oObDLdQ6j9iPjhEhshfnXDhmm3BvEmbXYsoaTYvmdGQz0NIZ
        PcaTBrywqCYTapkQ9P+mOk7Z9twYiUAGyfNzJz3NPshtJ3byOIUG/S2VPeR4mkpZJdvbGOEurnilV
        F+XUWGaZYKYDDH3pI/QcrdLOuPjOSnE8nD/cc923fpCyZHexhBdmwPMEm5JoEln+koTZY9e7eDeTE
        gQ2J4RFg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1izlqO-00071p-QL; Thu, 06 Feb 2020 18:25:40 +0000
Subject: Re: sparse problem with Linux kernel v5.5
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
 <20200206114619.bfszxgs6jmdgroo6@ltop.local>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
Date:   Thu, 6 Feb 2020 10:25:39 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206114619.bfszxgs6jmdgroo6@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 2/6/20 3:46 AM, Luc Van Oostenryck wrote:
> On Thu, Feb 06, 2020 at 07:18:45AM +0000, Linus Torvalds wrote:
>> On Thu, Feb 6, 2020 at 4:49 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> Also, what is errno 137? (0x89)
>>
>> I think that's just "killed by signal 9" (the high bit is "killed by
>> signal", the low bits are the signal number).

oh. thanks.
(seems like I asked about something similar around 15 years ago
but now I don't recall it :)

>> SIGKILL - oom? What does 'dmesg' say? Maybe there's some exponential
>> memory use triggered by something in that bpf_sk_storage file..

All of the oom-killer instances list sphinx-build as running, and I often
have OOM problems using it (make htmldocs), so that may be a factor.

This morning sparse is handling bpf_sk_storage.c OK (no sphinx-build running).


But I can post the dmesg output if you want to see it.

> Hi Randy,
> What config are you using?

I'm using allmodconfig.


thanks.
-- 
~Randy


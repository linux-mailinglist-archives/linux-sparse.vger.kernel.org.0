Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7B6C273E
	for <lists+linux-sparse@lfdr.de>; Mon, 30 Sep 2019 22:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfI3Uu5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 30 Sep 2019 16:50:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46684 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfI3Uu5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 30 Sep 2019 16:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=A3l7r+ksCqiP6+ctREyqoBTN5t8weeiT6tQveZFkM+4=; b=R9msdUzR5JKYEkRkuH/gs231z
        V+mCH2++yUXIgDCSsLD1hZEIoLOyN3iCezA+WzxgaLbUUNUL2KDo7Z8YGyU09Ene8+SQRk8LA3CSr
        AnXpysQItebKWiduRD4F0jLAVDYHstvP25T2w06gXw+Zle3nhda0Ypnj+Dmzq6JBoMO3ro84GCwCk
        LVbDqzMbAs/60sahcaxqE/JXYa/nZfvo6Dl3E6OCBI0an0FB34a5qtMkBSjCFGGJH8dj5I8D1DQrQ
        +n1E4+E+tc4nn+TshG6Uynw6a/keyyzDx7JIf5fDWaodkvBFehiN160lDw91AV5cOyqWTBA2u3LHO
        STeMfOgWQ==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iF2EV-0004gv-Jh; Mon, 30 Sep 2019 20:25:23 +0000
Subject: Re: <linux/kernel.h>: container_of()
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
References: <db1c5b13-8864-f7a9-81b7-8cb153760778@infradead.org>
 <20190930163258.7nrseddp5mk6wyz4@ltop.local>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d0a328fa-ac96-8629-df84-fc2ee32619ef@infradead.org>
Date:   Mon, 30 Sep 2019 13:25:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930163258.7nrseddp5mk6wyz4@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 9/30/19 9:32 AM, Luc Van Oostenryck wrote:
> On Mon, May 06, 2019 at 01:30:09PM -0700, Randy Dunlap wrote:
>> Hi,
>>
>> sparse (0.6.0) seems to have problems with container_of().
>> My x86_64 allmodconfig build has 88 warnings like these:
>>
>> ../kernel/bpf/verifier.c:7701:39: warning: unknown expression (4 0)
>>
>> ../include/linux/genhd.h:221:32: warning: unknown expression (4 0)
>>
>> ../fs/proc/array.c:686:32: warning: unknown expression (4 0)
>>
>> ../drivers/infiniband/hw/hns/hns_roce_device.h:1003:16: warning: unknown expression (4 0)
>>
> 
> Hi,
> 
> This is now fixed in sparse's upstream.

Hi Luc,
Thanks. and welcome back.

-- 
~Randy

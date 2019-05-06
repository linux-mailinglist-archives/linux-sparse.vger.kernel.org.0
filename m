Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEC0154E9
	for <lists+linux-sparse@lfdr.de>; Mon,  6 May 2019 22:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfEFUaN (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 6 May 2019 16:30:13 -0400
Received: from merlin.infradead.org ([205.233.59.134]:59246 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbfEFUaN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 6 May 2019 16:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ohlaMaHOogkpdugtzSG6KGYdsylaCm7OMG7OVplpvW0=; b=Pq5kliz5NkZXO5n6jzphubfwPt
        nvh/VE1lrt1hmnQYD2bogIxzXn92I9EU2/14cu4GWbN9qgy2LTmnR0N3b4iaOFl0u6v0zhInAUZvq
        m8UrjMeHS72BSlSjft0lvhgEelaWITwlGmFF4vG3zcBeJaGrvfOzLF8SLRqpKB9YPmzz2cJgwNPA+
        N0Veyh+xsfLTV2+6nEYkDKA6snEe7TzBeX6GoQlZfRSGJG0reKkXVNcst1ORJW4YjrI5XYiPdvK3V
        Jfkgm/Ubpnb+alJlcyfLyizjUEmAQfDYK5aQmcPAMwApTkf17GrOjbNNtFvh8su3Xv3Uap10zXW68
        T/11sGUA==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=dragon.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hNkFW-0000YV-Pd
        for linux-sparse@vger.kernel.org; Mon, 06 May 2019 20:30:12 +0000
To:     Linux-Sparse <linux-sparse@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: <linux/kernel.h>: container_of()
Message-ID: <db1c5b13-8864-f7a9-81b7-8cb153760778@infradead.org>
Date:   Mon, 6 May 2019 13:30:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi,

sparse (0.6.0) seems to have problems with container_of().
My x86_64 allmodconfig build has 88 warnings like these:

../kernel/bpf/verifier.c:7701:39: warning: unknown expression (4 0)

../include/linux/genhd.h:221:32: warning: unknown expression (4 0)

../fs/proc/array.c:686:32: warning: unknown expression (4 0)

../drivers/infiniband/hw/hns/hns_roce_device.h:1003:16: warning: unknown expression (4 0)


cheers.
-- 
~Randy

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5FCC8CFA
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 17:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728793AbfJBPe6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 11:34:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56700 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfJBPe6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 11:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
        Subject:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=KUFo+63X4GmKv0oyMTDgTP2SZWoE0GWM+1tHVyyhbuU=; b=ry+OhiPpTooJB/kbBLeC8k+X3
        8dweEbOyvD8q9tlrdmZqTWwNfpnnv5K2ub5/cVRzkS9tYjcTqTZFCSEcUA6sQN9ncHpJErru0ncBY
        6izh2TJbhVb9ShFWvPPerjcGVGxEW+Bwf5ZJbUJIv1F3jK4O5r9FbSmHBl7cTRgmKI9+Xy3PhkjM8
        Fergmgj/7kM+g+LDUkvi3jLBZiZ627eRSwFiNUtQCguXSotO6iZafah9A5y/FNZzEk9erwyOcnEN/
        1wVdxyZAnfuBhqaOULbh8/9d68laSbs4Fprxn34HxVK0IqFb/e1KeOH5eu9PTx+YAj5HdkC/qs1Qs
        EtEg/klhg==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFgeY-0004BT-Al
        for linux-sparse@vger.kernel.org; Wed, 02 Oct 2019 15:34:58 +0000
Subject: Re: problem with bit field sizes
To:     Linux-Sparse <linux-sparse@vger.kernel.org>
References: <995abb2b-5ece-c256-ef8d-d772c6164ac1@infradead.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8ad4c23b-63fe-d056-08e5-4cbc3a63b3bf@infradead.org>
Date:   Wed, 2 Oct 2019 08:34:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <995abb2b-5ece-c256-ef8d-d772c6164ac1@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 10/2/19 8:18 AM, Randy Dunlap wrote:
> With sparse 0.6.1-rc1 and Linux kernel v5.4-rc1, sparse is complaining about
> bit field sizes in 2 header files: include/linux/sched.h and
> kernel/sched/sched.h.  They both use a calculation + define macro for the
> bit field sizes.
> 
> ../kernel/sched/sched.h:809:31: error: bad integer constant expression
> ../kernel/sched/sched.h:809:61: error: invalid named zero-width bitfield `value'
> ../kernel/sched/sched.h:810:45: error: bad integer constant expression
> ../kernel/sched/sched.h:810:77: error: invalid named zero-width bitfield `tasks'
> 
> ../include/linux/sched.h:596:43: error: bad integer constant expression
> ../include/linux/sched.h:596:73: error: invalid named zero-width bitfield `value'
> ../include/linux/sched.h:597:43: error: bad integer constant expression
> ../include/linux/sched.h:597:67: error: invalid named zero-width bitfield `bucket_id'
> 
> I added #include <linux/log2.h> to both of these header files so that
> bits_per() would be defined, but that did not help solve the problem.
> 
> 

Somewhat similar problem here (using macro for case statement):

../drivers/gpu/drm/i915/display/intel_display.c:1202:22: error: Expected constant expression in case statement
../drivers/gpu/drm/i915/display/intel_display.c:1205:22: error: Expected constant expression in case statement
../drivers/gpu/drm/i915/display/intel_display.c:1208:22: error: Expected constant expression in case statement
../drivers/gpu/drm/i915/display/intel_display.c:1211:22: error: Expected constant expression in case statement


-- 
~Randy

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E539BC9364
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 23:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbfJBVSG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 17:18:06 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42898 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728713AbfJBVSG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 17:18:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ACblhzbGmjWq2066bgP7LTLuwkCgkpM1WFeEDygS5Tg=; b=gdWgu7oHd0mIUYJY9loY7v678
        JepAqt7/hpJZch+a68V7NbCliYAPXWgIzVJ7IJA8Ng5wHFh4vvq1mL8FX8vzxUzjc7wuVuDwgvQy6
        Y2Rj8W+fjpL1Do2exuk47Kb4MYA9yv7OPr+PNuhHbDeZx1a/abpJ/NBB505ixZVIN3IinJGpv7fOm
        SQboJ1+Ul8DlhhTyhg7SAcGgAEPe6zQGKYxboOXlnc7NMXK9hmau/J4tEoPVpLutJtn9AdXQskJ52
        R5meTxaGZ519b/R+9laenHr59QHoYCcFa9NuUZfYWQYXP6VdKOWijn/0P6KC+UOhNEZd2mYz7Y1DN
        //cxgF6gA==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFm0b-0006NQ-Na; Wed, 02 Oct 2019 21:18:05 +0000
Subject: Re: problem with bit field sizes
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
References: <995abb2b-5ece-c256-ef8d-d772c6164ac1@infradead.org>
 <20191002162304.lhmpippekptzcqtl@desk.local>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2d32e9c5-9c1e-f381-dca5-082607c0026b@infradead.org>
Date:   Wed, 2 Oct 2019 14:18:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002162304.lhmpippekptzcqtl@desk.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 10/2/19 9:23 AM, Luc Van Oostenryck wrote:
> On Wed, Oct 02, 2019 at 08:18:02AM -0700, Randy Dunlap wrote:
>> With sparse 0.6.1-rc1 and Linux kernel v5.4-rc1, sparse is complaining about
>> bit field sizes in 2 header files: include/linux/sched.h and
>> kernel/sched/sched.h.  They both use a calculation + define macro for the
>> bit field sizes.
> 
> This is corrected in upstream: v0.6.1-rc1-37-gd466a0281

Thanks.  I got that and confirm your statement.
However, the other one that I reported is still around (case statement
constant, not bit field size):


Somewhat similar problem here (using macro for case statement):

../drivers/gpu/drm/i915/display/intel_display.c:1202:22: error: Expected constant expression in case statement
../drivers/gpu/drm/i915/display/intel_display.c:1205:22: error: Expected constant expression in case statement
../drivers/gpu/drm/i915/display/intel_display.c:1208:22: error: Expected constant expression in case statement
../drivers/gpu/drm/i915/display/intel_display.c:1211:22: error: Expected constant expression in case statement


-- 
~Randy

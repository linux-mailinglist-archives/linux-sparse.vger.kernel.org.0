Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F2CAC479A
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 08:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfJBGQp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 02:16:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47952 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfJBGQp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 02:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=V6re4tBoLccyqAw99zZHB9PGKx8tvkj2vM14Z11+Ujg=; b=Vzh7+HS9CmG6xVF+wqddu0fZR
        L/Jwx4pdjHUPmNKShb+jGZofPytny1viYMagtBFIOulpW0SllqEfChauey+i3RQ3Sjb1tWHox8MDL
        tkONYBjwcLPdbTDr3yZ8/UG2J+LS5nSIh/0Mx3xlNu3pU53aPOErng5CH5tLdySCVl3cZbmesh1E8
        0Ky/Qs7hkMsuchfHuK708sjNxoFPYo/HOFe42JtcFKxoJZQQI03V/xJfUlCwDGXqiDtHrFpiSOL1c
        z4A5KrjwJm2CMrBmc1bTU7VqTF5HSKXvry6SG8eFkdAgJRILi5AX5UAwuqDEJvFHaNaUcINQs11tf
        GDAtuG8eg==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iFXwK-0001xJ-TF
        for linux-sparse@vger.kernel.org; Wed, 02 Oct 2019 06:16:44 +0000
To:     Linux-Sparse <linux-sparse@vger.kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: conditional operator ?: usage (Linux kernel)
Message-ID: <74ad3552-ecd8-502e-f8a0-d5e49d11fedb@infradead.org>
Date:   Tue, 1 Oct 2019 23:16:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

I don't mind the use of ?: for choosing values, but it seems odd to me
to use it for calling functions, as in:  [from drivers/clocksource/timer-of.c),
line 28 in Linux 5.4-rc1):

	of_irq->percpu ? free_percpu_irq(of_irq->irq, clkevt) :
		free_irq(of_irq->irq, clkevt);

where free_percpu_irq() and free_irq() are function calls but not of exactly
the same type, so sparse (0.6.1-rc1) doesn't like it:

../drivers/clocksource/timer-of.c:28:24: error: incompatible types in conditional expression (different types):
../drivers/clocksource/timer-of.c:28:24:    void
../drivers/clocksource/timer-of.c:28:24:    void const *
  CC      drivers/clocksource/timer-of.o


gcc doesn't complain about the ?: usage.  Is sparse correct here or is it being
too strict?

I would have just coded the 2 functions calls as
	if (of_irq->percpu)
		free_percpu_irq(of_irq->irq, clkevt);
	else
		free_irq(of_irq->irq, clkevt);

cheers.
-- 
~Randy

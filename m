Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8B2C8E24
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 18:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725916AbfJBQUU (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 12:20:20 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35110 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfJBQUU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 12:20:20 -0400
Received: by mail-ed1-f68.google.com with SMTP id v8so15830750eds.2
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 09:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T//7WZTls6bI6b8TJw9uzSOFk+B4PYKarwpNP80TX+c=;
        b=W7+wo/N/BbDQxt/gpxgnuEuPCrIkwnmKsOJ1o0ot2yWIw7VtjZdPBA1wKFIUeJt6IO
         8RHJhpoXIdjJOuWI9vi32QhB/GbJWRefzTL3J5fj68VzWidKeLh+gmj2R1uoD8z5KG/P
         IPrJWZYGbXJqPoqY747o0eM+djgkLnvcdCq9dqKJc3B2F/npmFz7UKUOphrfGeMchsxw
         swqxsKqV7/tL34UcCVyd0N2qJYokO2D3w4M2YIH/xoXN2vzU13XD/IBK5p3V6rbvxhNk
         TtyyqVo0Q5Hlfpef4cMo2FrsmwhdzxLt3ilv12PF/1WDztNuUW/h7XfShhnQXqFQQQhi
         vReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T//7WZTls6bI6b8TJw9uzSOFk+B4PYKarwpNP80TX+c=;
        b=RBch6u6jXAgQh5d207T1dDS/bB/ZsBjp9C4Ir42ILT/98voV7Dlob1mcX24TvKVoHm
         CPsoCKbxHfof0iG1IHtaYTaq2XZy6aFhbF+qPZHYscdKShpAR4bPVBiRqhA32VLTH54X
         y6zuGo/IgqiSePSzIGTzWCSO9veiK9zfCHPInj3IiUPjwTBo7FKWiWscFkqm6n7Jd5Tb
         LC1WNlswcxc8MwcoayDr35CftVfyb73NBZ5yGydNF0CP7xCJ/KfA2KGFK2MrJuedYTzB
         hgpOTtXk8TrvZrwPAya3wT+EGxwBFpV0aiisLLZeHtK9PDEmWFci6ILAF5mInr2KD71R
         qgYA==
X-Gm-Message-State: APjAAAUg2RmZq2Jm0ciUWzqQ2Sle77ZqoCk3qsF09nw4e3rcjDqD7o3x
        mBwIOLMF2vMWdbC8Ye7FcrM=
X-Google-Smtp-Source: APXvYqy01EQRB8fHbKFshJfDP6a8D7RdYBmImlBmfOiWY499C8ch8QM8LeEY67mK69y/7VsYeVIvZA==
X-Received: by 2002:a50:d55e:: with SMTP id f30mr4801277edj.35.1570033218901;
        Wed, 02 Oct 2019 09:20:18 -0700 (PDT)
Received: from desk.local ([2a02:a03f:4080:1900:3985:a315:dc4f:6706])
        by smtp.gmail.com with ESMTPSA id ba28sm3939559edb.4.2019.10.02.09.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 09:20:18 -0700 (PDT)
Date:   Wed, 2 Oct 2019 18:20:17 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: conditional operator ?: usage (Linux kernel)
Message-ID: <20191002162016.vfr5cnbaxrjm42rs@desk.local>
References: <74ad3552-ecd8-502e-f8a0-d5e49d11fedb@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74ad3552-ecd8-502e-f8a0-d5e49d11fedb@infradead.org>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 01, 2019 at 11:16:44PM -0700, Randy Dunlap wrote:
> I don't mind the use of ?: for choosing values, but it seems odd to me
> to use it for calling functions, as in:  [from drivers/clocksource/timer-of.c),
> line 28 in Linux 5.4-rc1):
> 
> 	of_irq->percpu ? free_percpu_irq(of_irq->irq, clkevt) :
> 		free_irq(of_irq->irq, clkevt);
> 
> where free_percpu_irq() and free_irq() are function calls but not of exactly
> the same type, so sparse (0.6.1-rc1) doesn't like it:
> 
> ../drivers/clocksource/timer-of.c:28:24: error: incompatible types in conditional expression (different types):
> ../drivers/clocksource/timer-of.c:28:24:    void
> ../drivers/clocksource/timer-of.c:28:24:    void const *
>   CC      drivers/clocksource/timer-of.o
> 
> 
> gcc doesn't complain about the ?: usage.  Is sparse correct here or is it being
> too strict?

I think sparse is well within its mandate here:
 ?: is an expression and as such should have a defined type
which requires that both sides matches (with a few subtleties).
Here it's not used as an expression but only for the side effect
of calling the functions (with incompatible types).

> I would have just coded the 2 functions calls as
> 	if (of_irq->percpu)
> 		free_percpu_irq(of_irq->irq, clkevt);
> 	else
> 		free_irq(of_irq->irq, clkevt);

I would do the same.

BTW, the previous warnings is, IMO, much more worrisome:
    timer-of.c:28:55: warning: incorrect type in argument 2 (different address spaces)
    timer-of.c:28:55:    expected void [noderef] <asn:3> *
    timer-of.c:28:55:    got struct clock_event_device *clkevt

Cheers.
-- Luc

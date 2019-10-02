Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 023FAC90B0
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 20:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfJBSUx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 14:20:53 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45336 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbfJBSUx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 14:20:53 -0400
Received: by mail-ed1-f66.google.com with SMTP id h33so16182973edh.12
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 11:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JRJ4OeEeHQn0b06OsfGI0pXvwfd0htwLNwVQp4zjT7I=;
        b=H5E2RJBkSG3NHY3oUJGEhqwQwAM90AoG/qIeSMMknzs8XW0PV7gfAiZYLFIO8q6Kl8
         sllrkdgMmAQOBi+Pa89kbDCzfuk5i46BKWBKefbJbzElXU8hyNN2QqCEqqnBIwzQltMm
         MV39kFlX6F8PIIJUtt4xb+w4/e87G0EiLe+myZd4Q0EMaDDynax7bih6kXt1tHyp6vC0
         kdoTZEWyAj0QjW1hPxoL+sImGbWBJhNSEIRjAw/aT9neNzQQbgy69ibY1smIYkdn2BXv
         N/XkZyKAQ/WFX03di+KmzKgOm6jBGAg/LMSHAYZhvo3FYlEDNkVdmyyOZhySINKTk/Gr
         xhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JRJ4OeEeHQn0b06OsfGI0pXvwfd0htwLNwVQp4zjT7I=;
        b=f5yIraVvq5zZO74Kq3MQxjq/fWh2rhk1Mx8ILQ2OaB55lyUsYFKQmOg1qwo1hhrFqm
         MTZ0ATc7nK+jmGO432nPSUjVHNlTnG1z2r2ttRuE9h0Ht42+J7U5pJp6xHfrM9IZ8y0P
         2ipD47H2Ykt1rm3j3OiyCY5FARJCpVQerR1lm7Lqxr44HPjzi+LUeIYvBgPpt9ndIcVl
         ULOLv6oCXDduAbvGnbLkIwyAWlVfoowfY77iuHG9pPPHleN3A6WEgvF94Cw9c278jtBF
         ock6V6FIg32ezOwia9pieV5dN8NwmHwNkOahEDAZNDTsN09/J161Y74+vEDK+2GV53d5
         CH+w==
X-Gm-Message-State: APjAAAWeVGxLwRQi5br3QP/jyrjUqOD/GE/qOe2DOtXs/FUtByx2mwIY
        3wkcGTsjg8E2Qt7/g/NuM+Y=
X-Google-Smtp-Source: APXvYqzW+LuywjTDyBeLvijoMlOByUk+agnvKQPigTeU6J898FNUkPeU8p7c5ob6qTj8KTcs0YZnpg==
X-Received: by 2002:a05:6402:383:: with SMTP id o3mr5314047edv.205.1570040451323;
        Wed, 02 Oct 2019 11:20:51 -0700 (PDT)
Received: from desk.local ([2a02:a03f:4080:1900:3985:a315:dc4f:6706])
        by smtp.gmail.com with ESMTPSA id z65sm4015321ede.86.2019.10.02.11.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 11:20:50 -0700 (PDT)
Date:   Wed, 2 Oct 2019 20:20:49 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: conditional operator ?: usage (Linux kernel)
Message-ID: <20191002182048.kme2pomppqklbui7@desk.local>
References: <74ad3552-ecd8-502e-f8a0-d5e49d11fedb@infradead.org>
 <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Oct 02, 2019 at 10:19:42AM -0700, Linus Torvalds wrote:
> On Tue, Oct 1, 2019 at 11:16 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > I don't mind the use of ?: for choosing values, but it seems odd to me
> > to use it for calling functions, as in:  [from drivers/clocksource/timer-of.c),
> > line 28 in Linux 5.4-rc1):
> >
> >         of_irq->percpu ? free_percpu_irq(of_irq->irq, clkevt) :
> >                 free_irq(of_irq->irq, clkevt);
> 
> Ugh. It looks like a gcc extension for when the result of a
> conditional expression isn't used.
> 
> The result of the conditional expression _should_ be the type of
> either side (usual type conversions). And it's fine if *both* sides
> are of type 'void', then the result should be of that type too.
> 
> But it looks like gcc (and clang) allow one side to be void, and the
> result is void.
> 
> Hmm.
> 
> > gcc doesn't complain about the ?: usage.  Is sparse correct here or is it being
> > too strict?
> 
> Sparse is correct, but maybe sparse should accept the gcc extension
> except when in some strict mode?

Yes, it shouldn't be a problem, certainly the 'one side is void and
the result is void'. It makes sense. But I prefer to avoid something
with 'unless the result isn't used', hehe.

-- Luc

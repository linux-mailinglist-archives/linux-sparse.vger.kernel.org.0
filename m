Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07EBC214F84
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 22:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgGEUpE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 16:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgGEUpE (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 16:45:04 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7BC6C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 13:45:03 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id dg28so32984457edb.3
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 13:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qSF1dTNTJXypgrj5HuhGIQ0XJqzTsukHvIjgW1FcQwk=;
        b=Iknygtabj2ISJZzUn+vWFXmzY6Q4B/arzjtQl/zBWkYYOAcSKMUFbR4M5mF61yMk8o
         fX/I396kSK725IEaWaGMZQsKqDZJxrZuV1NYoTFXJQG4MvnlvSoYBali6NLV3WwJRvbA
         b/gnwOJCk0q659FCCOnwMBJ4DgClw45tRK+X5s063bIb0nYDvfpFl4QPSnVAHVJAh5dr
         oPaM9phdHLBpB2QIsQ23AU9LaThbdj0Wp77BG0WNd2KdqOk1hJ6VikOnuBDmkyalB2S8
         c0ekoPBe4Avtk8ubM51ICjqrNb9BYBZ8RtVTTU/qNh2UhGXKmGLS8Ul4ocPHKqE1dz0A
         zX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qSF1dTNTJXypgrj5HuhGIQ0XJqzTsukHvIjgW1FcQwk=;
        b=lOsR0HRhhOe7aWhOOxcQjfBakJ34wqNBPc72Qm43C3PBYvax198b4yb5lg2MIV59Ee
         hb4+WTj1wn2f9bHJKle8g3FzH4DAK6Mbgg5yZtw8Np7R3+8WYeLBIwHQFFreYEXSL4cK
         RoaxFPNEoz52w9CeLZ3Id9xtJNNuZMuQuPOsF/wXBxjRR8iOC6seJAO+QvCLFdSoDq71
         XZNi5TLw3YgOaCERRjetuTLuUpz3YsHjL421/oJ95FPIFaHmDnKEcLfL2eoDkprhYkzj
         K1lEB056I0sMFhIRYaaDt/xoiSvF2IKOffKmiyFi9dgEzF6FdWSGjb6htgBahIObfFOB
         igsw==
X-Gm-Message-State: AOAM533/o27ehCHCjFxqMfh1uNH2EtvarZfBLtMQv4fTIYVzYy+Qqaye
        RkFQXwk+O+8zWxPEAQoXTTafpkkB
X-Google-Smtp-Source: ABdhPJyWJT6xOi1np2EKPOsUiLcaweXGVxi5SKZlpcMAsIoYKKR6FH22M9TKzCMVb2/pPrQyCczmEQ==
X-Received: by 2002:a50:ba8b:: with SMTP id x11mr53686374ede.201.1593981902637;
        Sun, 05 Jul 2020 13:45:02 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:b523:2af1:f337:13a9])
        by smtp.gmail.com with ESMTPSA id b4sm20382763edx.96.2020.07.05.13.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 13:45:02 -0700 (PDT)
Date:   Sun, 5 Jul 2020 22:45:00 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH 14/15] cleanup: move parsing helpers to parse.c
Message-ID: <20200705204500.sl7xgkukhsittq56@ltop.local>
References: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
 <20200705130220.26230-15-luc.vanoostenryck@gmail.com>
 <CAHk-=wh-Eb-LZawa7fH7BOmbq-t8t8GvaY7o9bEW9cGXZgKGsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh-Eb-LZawa7fH7BOmbq-t8t8GvaY7o9bEW9cGXZgKGsQ@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Jul 05, 2020 at 10:27:36AM -0700, Linus Torvalds wrote:
> On Sun, Jul 5, 2020 at 6:02 AM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > lib.c contains 2-3 helpers for parsing. Move them to parse.c.
> 
> This makes sense, because it's not a "library" function if it's only
> used in one place.
> 
> HOWEVER.
> 
> When doing things like this, please also mark the resulting function
> static and remove the declaration from lib.h.
> 
> Otherwise it's entirely pointless, I feel.
> 
> Either it's a library function that gets used from other places (and
> lib.c/lib.h is an appropriate place), or it's a parsing-only helper
> function that _doesn't_ get used from other places (and it should be
> moved to parse.c and be static).
> 
> Not this half-way state that this patch seems to create.

Yes, I agree.
I see them as parsing-only helpers hence the move but (just)
expect() is also used in expression.c. I suppose it should be
fine to move the declaration to parse.h despite not being ideal.
Or maybe, I should just leave them in lib.c

-- Luc

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35BC215568B
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 12:21:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgBGLVM (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 06:21:12 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50970 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGLVM (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 06:21:12 -0500
Received: by mail-wm1-f67.google.com with SMTP id a5so2202440wmb.0
        for <linux-sparse@vger.kernel.org>; Fri, 07 Feb 2020 03:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B0vTeTkudfEyY/EGV9wtEwui0eD6S4ce87Oz+p6snZg=;
        b=iI31GoD+xzgkGqENRxOjxvJ82StQDNR2bGmny50/spgxecFAy3bssg6Zo4HtGKMg0J
         4C0VYLvmCOFgijcQdZLH4Eu6C2HOyF7S5pG9oKfwNG8DDPD3YVOimiMNb3wxWqI7d0TU
         diuFyWYKnnKGLYwclJv1Cs9OhNeoVVm/zq0zKAVwEGPmY4SB3YGNw/01wQccSdS1xRMK
         B6HVQjtTMj/wptRYbnli5ZvgO1pGmwtuwc0YKfDMpFuYk/66FAlHTefpObt1tYddJb1L
         65Fil4Okwt1tvWx2VdevjBNw3TSYhqPNGWjJrjQmXyk98ZZ2wGscnXIFv9R7yaz9kP8x
         XjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=B0vTeTkudfEyY/EGV9wtEwui0eD6S4ce87Oz+p6snZg=;
        b=EGkmkOZ751udxRjiAW/7GqMa06dqSi4GfhPrPlAjwCwyFDe3iStqCkwUwPVnmuqJ3S
         5bKP5p1SiznMvPxb3G1amz355n9uRQGQX7XcvIi9XPf9CAOm9sWgYeb/sKlb9TbW3x6X
         sUATTtO+sV2XyGOrMz+imnWcbDFJaLvqdYmKBkw5gio3bGkk72kwVo/AyC9l5A0BJsaX
         FwKM7IW9hzdI2L9+5VFb12AN11dmGyvTl/0cgeRppcU5vJNuq4WnVLLKFOeFOJrnFOpH
         n1O4Qw/P7wfRIFIJp8v+lyTEhxJ50u2hxpUJBd+bAuja6h1r6fw3m/cyh1eiLIDLJx6F
         oArg==
X-Gm-Message-State: APjAAAVH/JiW8mQ/kYeE2J6z23jYCGExjar4U23a68sXk+rMinnnkCmB
        ARMsRPsp7DZK2AqjeZaklK9gwsBxtSE=
X-Google-Smtp-Source: APXvYqxh+lgNXWtpnUbv8vWkSx2fq4A6QJDEUrbie1wDLAPh9Z9GKpos+05BHHfnP8GA2P00rVnHgg==
X-Received: by 2002:a1c:7915:: with SMTP id l21mr3770258wme.112.1581074470400;
        Fri, 07 Feb 2020 03:21:10 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:7c4c:6743:ca73:a9e5])
        by smtp.gmail.com with ESMTPSA id z133sm3175870wmb.7.2020.02.07.03.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 03:21:09 -0800 (PST)
Date:   Fri, 7 Feb 2020 12:21:08 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] dissect: introduce dissect_ctx
Message-ID: <20200207112108.elchvmg3ikcu67pn@ltop.local>
References: <20200206170132.GA8908@redhat.com>
 <20200206204518.qx5qtyl52al37njy@ltop.local>
 <20200207100150.GB9260@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207100150.GB9260@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Feb 07, 2020 at 11:01:50AM +0100, Oleg Nesterov wrote:
> On 02/06, Luc Van Oostenryck wrote:
> >
> > On Thu, Feb 06, 2020 at 06:01:32PM +0100, Oleg Nesterov wrote:
> > > Points to the current function or to the global variable in case of
> > > compound initializer.
> > >
> > > Kill the ugly test-dissect.c:storage() and change print_usage() to
> > > report dissect_ctx->ident instead.
> >
> > Having the ful ident will be good, I think, but the cost is to have
> > to maintain this context. I suppose it would be too painful to
> > propgate this context via an additional argument to all involved
> > functions?
> 
> Oh, I'd prefer to not do this. This needs to add the additional "ctx"
> arg to every do_.*() function in dissect.c, and for what? IMHO, this
> will just complicate the code for no reason.

Yes, I guessed so. No problem.

-- Luc 

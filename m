Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B350A1DA6B7
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 02:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgETAlz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 20:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETAly (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 20:41:54 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DDAC061A0E
        for <linux-sparse@vger.kernel.org>; Tue, 19 May 2020 17:41:54 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nu7so464190pjb.0
        for <linux-sparse@vger.kernel.org>; Tue, 19 May 2020 17:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uH0QnXvEu7EJo54/lh8u+7dzn0Xtqr4VIWNf0xry5nU=;
        b=Eg/MjFwMPxR/0ttgJWNN9UhJ89dr/nL0/kcpkNvasU5R3rQrADHTZthJfu/ZlO0TuE
         pIyRruPxCHaTCmaAFJfFjkzX4ryoYQRDRe3HoV3SXmAxTQK3V/ToFYYJ9MTIqB0ha7wE
         NW5vRsEUp/sdQg71pbiwqc/gsHrEFXe7c8mQ8fDNvaUP1wBBURVQ3hk7btYBdutgstSL
         VCSrIIbPGft+q+TlULxgkfgrKrZbQ5Jz/EyyuVjrfA6rGVnJ5mmIa4qneU71+CnkY5+L
         OZW9brdB0vO22XtVW2v+UlzQAlPjbpdAkBZfYJHZ/fpv6ckrunT3q2NC7a7rJKXE4y10
         B64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uH0QnXvEu7EJo54/lh8u+7dzn0Xtqr4VIWNf0xry5nU=;
        b=VUw+is2xVbo0MbtiGXSRT8Ftgs61Hl2BmxoMCIxFx9y0hl7nAtY4vOpooiZAT0PDiy
         WtolzzC6cgFTC0DAXR4tqkyg/BWGjCQ8/DyVhcGKqErdyXPjOL4r8FUlZS1+vUoLB3v2
         IGek2P+Ldifgf5a0MVNyaBWb96QerhzW2xOkl2G0M0IVOKrCtvZp9SEQpkuUUA8xV9pr
         1+tovFpWhViBq2h1x7B1FUygC+fLKlvFXLzgnc7lrXttn4SUrgadI9NnQ7ZDMoWml5nc
         Ac51XYhVDbu/AMVRS40WxYmLZfcREjlapwzR0XM8Sj5vaPLIIiIQ2itkbb3NsynzE4K9
         A8+A==
X-Gm-Message-State: AOAM532IXboUKPw0WPFg6KKt+dhg5wyebMU7mXepGn1mKVkTXisc/IgO
        ibrBT8ZsORS24m4xdlh4vrgkAx1K
X-Google-Smtp-Source: ABdhPJzVg0gRxlqlmCKV7S4/8rmXl7wsAbWjruGCUMURdDEEgW5BEFtwfe9JSlc/8TeplymM1holQw==
X-Received: by 2002:a17:90b:1101:: with SMTP id gi1mr2393368pjb.117.1589935314162;
        Tue, 19 May 2020 17:41:54 -0700 (PDT)
Received: from localhost ([2402:800:6374:cedc:d509:3e82:1f34:e3c4])
        by smtp.gmail.com with ESMTPSA id m9sm484346pgd.1.2020.05.19.17.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 17:41:53 -0700 (PDT)
Date:   Wed, 20 May 2020 07:41:51 +0700
From:   =?utf-8?B?xJBvw6BuIFRy4bqnbiBDw7RuZw==?= Danh 
        <congdanhqx@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org, Junio C Hamano <gitster@pobox.com>
Subject: Re: [SPARSE PATCH] univ-init: conditionally accept { 0 } without
 warnings
Message-ID: <20200520004151.GB12509@danh.dev>
References: <20200518235446.84256-1-luc.vanoostenryck@gmail.com>
 <2fcda487-733b-8ed1-e1f4-6c6204a68569@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fcda487-733b-8ed1-e1f4-6c6204a68569@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi Luc,

On 2020-05-20 01:22:22+0100, Ramsay Jones <ramsay@ramsayjones.plus.com> wrote:
> > In standard C '{ 0 }' is valid to initialize any compound object.
> > OTOH, Sparse allows '{ }' for the same purpose but:
> > 1) '{ }' is not standard
> > 2) Sparse warns when using '0' to initialize pointers.
> > 
> > Some projects (git) legitimately like to be able to use the
> > standard '{ 0 }' without the null-pointer warnings
> > 
> > So, add a new warning flag (-Wno-universal-initializer) to
> > handle '{ 0 }' as '{ }', suppressing the warnings.
> 
> Hmm, I didn't think this would use a warning flag at all!
> 
> I remember the discussion (on lkml and sparse ml) in which
> there was general agreement that '{}' would be preferred
> solution (if only it was standard C!). However, I thought
> that (since some compilers don't support it e.g. msvc) the
> next best solution would be for sparse to suppress the
> warning if given the '= { 0 }' token sequence. (ie. no mention
> of it being conditional on a option).

I'm also in the camp of favouring no -W at all.
But, have another -W is fine to me.

> > Suggestions for a better name than this -W[no-]universal-initializer
> > are warmly welcome.
> 
> Heh, you know that I am no good at naming things - but this may well
> give the impression of a C++ like 'int i{}' type initializer!

From this discussion in GCC's BugZilla [1], I think compiler people
tend to call that style as zero-initialization, or universal zero
initialization.

[1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53119#c12



-- 
Danh

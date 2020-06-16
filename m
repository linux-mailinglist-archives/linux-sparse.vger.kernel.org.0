Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02891FC040
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 22:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbgFPUvt (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 16 Jun 2020 16:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgFPUvt (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 16 Jun 2020 16:51:49 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2977C061573
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 13:51:48 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o15so23172734ejm.12
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bWMjw/0wLB367m810HDwMWco1ddR//QAScn43S6cogU=;
        b=KPYUFVK+HruTh3h6q0r3CEos3mzyFr5OVq0oRGjfOaRoUIZOk9REb/iy1Zn9hogx2h
         Fw5AUeCigmzGGDg5C0pqIT0/UvjxsYXtVORFT3Im26LqD3oZrJI58+L18nuhqe+alRaw
         zM+/tw0Dseqf/NuYaZv+ptwI395ZA+H4E5B9W+RqgL+SMXbMvrZ9+Aw6k83hPyVJI642
         Vuilu+qGYlzgqJwaRza1R/zu+h8PuJKwDAvQQ8e7UolcxDb+uvFDYBpoyDuOeqJuNBZi
         sxlbn9GVg0/2McnkED7b2p+MnHUMkGjzQVnOJs9nCuI4Hl/md0ivMMdq+YfzMDSLI2hh
         NW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bWMjw/0wLB367m810HDwMWco1ddR//QAScn43S6cogU=;
        b=h6EzcJtEXuIIWqiEbKArbFHL/5L7NfAJ1ZiwSr4xVJ1OofuuPIRSRDVCeH8FYjTqy4
         Bp5dLC9YvKf6xzUjB7olMhnsiSKWGwzV0iz0XB5cmlBvUEMwCvqV87agAQWjYj0kJPYE
         ajyHbuTQV0sVBxLVJ1jsJlKd0l32JDgvPp36eAs0XdQwgUmn9H71EPRcxQq1gMXEKqNc
         TOnfV994hUkrhWdyU1mB8JcIFEzxGjJG+XLwisYsPVM72EIjTerIQYIj8KhZwM+zkaf5
         wmRrICyAVvwcYEXMaZwzkE5k9oXk9F0b9t1d4/sQMi7UV2Yn/qUU/9UT8A5ezsCYuvio
         vYNw==
X-Gm-Message-State: AOAM530qh4a9lxQIDNHtTeYj6bKMmBMBtTNJCim2B+K0TZCBbCiTkY5y
        9oz4/C+j1nr7aBGTBlANg4k=
X-Google-Smtp-Source: ABdhPJyAmYWNxROiwqcCSboVxhXa8wCsbW2OCmi2T0S490BNj+71aTZ5NUaKvOY+4JEC7TViZ39YaA==
X-Received: by 2002:a17:906:365a:: with SMTP id r26mr4420570ejb.466.1592340707633;
        Tue, 16 Jun 2020 13:51:47 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:5034:6797:70f1:e20a])
        by smtp.gmail.com with ESMTPSA id ck11sm11864680ejb.41.2020.06.16.13.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:51:46 -0700 (PDT)
Date:   Tue, 16 Jun 2020 22:51:45 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] predefine: add a macro telling about named address spaces
Message-ID: <20200616205145.gtg3vybznxfx62tx@ltop.local>
References: <20200616005012.66141-1-luc.vanoostenryck@gmail.com>
 <CAHk-=whHKXbJS62Nrcsn6cy0EcHh3PrGbESBkM0MOAjFx-CVsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whHKXbJS62Nrcsn6cy0EcHh3PrGbESBkM0MOAjFx-CVsQ@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Jun 16, 2020 at 12:13:18PM -0700, Linus Torvalds wrote:
> On Mon, Jun 15, 2020 at 5:50 PM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > Sparse supports named address spaces since v0.6.0-rc1.
> > This gives much nicer warnings ('... __user' instead of '... <asn:1>')
> > but this featres is not yet used in the kernel since it could be
> > a problem for people using an older version of Sparse.
> 
> Actually, I think it's more that nobody has sent a tested patch.

Yes, I should have done this many months ago. I admit that it bothers
me when people complain that something doesn't work with sparse and
it's just that they using an old version (sometimes quite old).
 
> I don't think it's a big burden to say "you need a newer version of
> sparse" for kernel checkers, and in fact a number of the problems
> people report then get answered with "update your sparse version"
> anyway for other reasons.
> 
> In fact, I'd personally like to just make the kernel use _Generic()
> everywhere now that we started getting our toes wet, but the fact that
> we would have to require gcc-4.9 (instead of gcc-4.8 which is
> currently the minimum version) is holding us back.
> 
> So I'd be perfectly happy to take a patch to do the ASN names, and to
> remove the __CHECKER__ thing that holds us back from using _Generic()
> with sparse. And just document that you need to have a recent enough
> release..

OK. The one for the ASNs is already prepared anyway and I'll do the
one for _Generic() tomorrow.

-- Luc

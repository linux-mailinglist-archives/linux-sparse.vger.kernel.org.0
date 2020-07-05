Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82053214F5D
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 22:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgGEUfF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 16:35:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbgGEUfF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 16:35:05 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A910C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 13:35:05 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id z17so32966749edr.9
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 13:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kjJ6PUHNnv++CHvLwI2Zol01j4viDmUSY2G2EfcCM7Y=;
        b=Wa+l/TbK37d7d5/kZwZQDdLzFwSEGKXDhIV52pi0AjozPbpXz4BvTwcRu/3RfztsQ+
         H1dg7jinf5mKcDMKsFB91oKOm3o7n6r40NRMH7KXvqrlxqbZqNbWlx4Io8uSyzMx7qN+
         dKRnqA+rlB2pv9FD4+MbK+A8nrcgDlJecpwl/vv2Kt2m/l+TLoy+XY6wJpiYMHkdmzqE
         EOWq4ovY0G7cNi6u3bM6J1Nu+WG09cJrPXhox+nC6eJ5A9xu8UoA4BeIBt1v9xlXn+xz
         AjzhF4O5J+smvVxdCkevCLSXslZT3nJPkryqMpkvf/IAyuBMxEJ9f2QKWeCzAoHDi3b8
         mSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kjJ6PUHNnv++CHvLwI2Zol01j4viDmUSY2G2EfcCM7Y=;
        b=UZgUT01r9PXICzP/zMBM6gJMMpjZleaBrmxs6zdAHNKJRZsp/x2CWAjbBqf4REvgib
         AzzKroGDwM9y+WhkvuGuFA/0C5gLygersDt/M+wjfN84cBfhwozsTvqn1/OBGlhYZVqt
         yf7WIpbN0ODwNUSxVFSjPFebQpIJV1EZunILxqba2S17kqtDdNsr1VDO2n5w/uJxO1oo
         ktSYbkeH3Iw3MZhrLYCqMcHRPBc9y2f52jMrLYyPKvZh0n1lFyUuJjLyfdWvbstLC4NQ
         1L0f4fKxqx7PLjEQLpJ/byFccUm56GjhZB2FtQ9exnzHUK7oUuuHB+GQVd6WICP6UwG7
         6hWA==
X-Gm-Message-State: AOAM531NyODMeqzz3kTDe5wlkfKKxoPrR8QJmxx37F6q4ApB+I5fSxug
        8r6Jzb4DsL0c4cQXY263Vrs=
X-Google-Smtp-Source: ABdhPJyWqKm8+Eivky5CC0vLEAwCXNlTTFbObv6d89IOPJUTWbZqm/UjKzFClG6zwYODU7XR/98pDQ==
X-Received: by 2002:a50:bb48:: with SMTP id y66mr47767627ede.147.1593981303892;
        Sun, 05 Jul 2020 13:35:03 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:b523:2af1:f337:13a9])
        by smtp.gmail.com with ESMTPSA id t25sm14927840ejc.34.2020.07.05.13.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 13:35:03 -0700 (PDT)
Date:   Sun, 5 Jul 2020 22:35:02 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Davidson Francis <davidsondfgl@gmail.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] test-inspect: reset locale after gtk_init()
Message-ID: <20200705203502.dwctpjxtqfwaz7bd@ltop.local>
References: <20200705185013.8578-1-davidsondfgl@gmail.com>
 <CAHk-=wjqh1KOVWaP=xPZH_9grwDVtCMitWOb4vtKj+cB0jghBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjqh1KOVWaP=xPZH_9grwDVtCMitWOb4vtKj+cB0jghBw@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Jul 05, 2020 at 12:12:55PM -0700, Linus Torvalds wrote:
> On Sun, Jul 5, 2020 at 11:51 AM Davidson Francis <davidsondfgl@gmail.com> wrote:
> >
> > The test-inspect tool uses GTK to visualize symbol nodes. It turns
> > out that gtk_init() implicitly sets the locale to the system locale,
> > and since Sparse uses strtod()/strtold() for parsing floating-point
> > numbers in expressions, parsing becomes locale-dependent.

Oh yes, indeed :(
Thanks for the patch.
 
> We probably shouldn't be using strtod/strtold in the first place
> because of issues like this, but I think your patch is likely the
> simplest fix.

Yes. 
 
> It _might_ be a good idea to limit it to LC_NUMERIC instead of LC_ALL,
> but who knows.. I'm not sure what else might be affected (and I'm not
> sure how good LC_NUMERIC support is on all platforms)

Well, checking the standard, I see that strtold() first strips
whitespaces as defined by isspace() and isspace() itself depends
on LC_CTYPE. So, for the moment, I prefer to take Davidson's
patch as is this (OTOH, we already depend on isspace() anyway).

-- Luc

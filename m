Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF94413B95
	for <lists+linux-sparse@lfdr.de>; Tue, 21 Sep 2021 22:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234993AbhIUUo0 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 21 Sep 2021 16:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234240AbhIUUo0 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 21 Sep 2021 16:44:26 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB4BC061575
        for <linux-sparse@vger.kernel.org>; Tue, 21 Sep 2021 13:42:57 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id x2so270957ilm.2
        for <linux-sparse@vger.kernel.org>; Tue, 21 Sep 2021 13:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=saxUeZkyfD8m3fLKWMGCvCKIEI/yO8iAXU931aRd5WU=;
        b=a72tCTH63AUXKla3GIb4KeGSIsIWtDIubA+z5EzCcwxLDDbfnCgdBjTJyUsDvcdQry
         DZJhI1zU83c96zRsUlhCrIvj0nW/+wM/r9UVJ174IDqNBdk125De1bw8QMcRG+mNMBKk
         lpEZV3vIRucuELPKJ3KLp9lByezvSKMgH5fPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=saxUeZkyfD8m3fLKWMGCvCKIEI/yO8iAXU931aRd5WU=;
        b=Pyzx23mbD+bI0xMUky+yEjLuoLIWXSSAccgIuvq+L1mEiGEi+c32GryF00jE/URcXa
         uQY6So97NMTd/z7bxJRguMqvef4RvFY3mZSTAusnR49nppB7jE4bISLzIRou9OJlpA/4
         0SVqqE/FBFMXv54mDfhLOI7KiwVXah8oQMumv34x0bG+Lq51zgw4tSjsGEd/VLsgyqNr
         FmqJ5CwWtSqNJ8jNoqSAW80SHfRn5h0ln8O1dduqV23RPZb2sXZwpsKAUt22kaBAci0X
         qJTpDhISdzYDmB41XLj3bJ+fi6W+32KsUhKXF5UuHVqilvbcDiJ98SycUpNUQkMOaCD1
         19JQ==
X-Gm-Message-State: AOAM5338ukMQwXYHzQK9VeWDDTVVrH38zwxyNQ6hqGrrXxHh3AO0Y7yN
        0+LhCCIK9sLNVY69k4MsQJJ1mRnEeDUTpyqGe/U=
X-Google-Smtp-Source: ABdhPJw4OZ77p7nsHxyJOFfVcfwftJuoNt4rUlR1QYSXKZTGK3JAYuzzWSnDqbgH9yWJ8+TodIUY/Q==
X-Received: by 2002:a05:6e02:1bc2:: with SMTP id x2mr22842202ilv.98.1632256976650;
        Tue, 21 Sep 2021 13:42:56 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id a10sm6106ilt.69.2021.09.21.13.42.55
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 13:42:55 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id r75so381098iod.7
        for <linux-sparse@vger.kernel.org>; Tue, 21 Sep 2021 13:42:55 -0700 (PDT)
X-Received: by 2002:a05:6638:1b2:: with SMTP id b18mr1732593jaq.95.1632256974780;
 Tue, 21 Sep 2021 13:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wibRWoy4-ZkSVXUoGsUw5wKovPvRhS7r6VM+_GeBYZw1A@mail.gmail.com>
 <202109211913.18LJDnXp031134@valdese.nms.ulrich-teichert.org>
In-Reply-To: <202109211913.18LJDnXp031134@valdese.nms.ulrich-teichert.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 21 Sep 2021 13:42:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgricy21sU_rBue-MVNdj-uvCRr=Fn+9K-bBD0x5tCvYg@mail.gmail.com>
Message-ID: <CAHk-=wgricy21sU_rBue-MVNdj-uvCRr=Fn+9K-bBD0x5tCvYg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce and use absolute_pointer macro
To:     Ulrich Teichert <krypton@ulrich-teichert.org>
Cc:     Michael Cree <mcree@orcon.net.nz>,
        Guenter Roeck <linux@roeck-us.net>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Sep 21, 2021 at 12:14 PM Ulrich Teichert
<krypton@ulrich-teichert.org> wrote:
>
> Right, I had DEBUG_INFO set. Stupid me. Now it looks much better:
>
> valdese:~/soft/linux/kernel-git> ls -lh arch/alpha/boot/vmlinux*
> -rwxr-xr-x 1 ut ut 6.4M Sep 21 18:12 arch/alpha/boot/vmlinux*
> -rw-r--r-- 1 ut ut 3.0M Sep 21 18:12 arch/alpha/boot/vmlinux.gz
>
> But it still dies before the first message from the kernel shows up.

Ok. That's a nasty situation to debug, and it's where things like "git
bisect" are really useful just to narrow things down.

... which isn't an option here. Too bad.

I also assume thete is no virtual environment that looks like a Jensen
that would help debug this. Which all makes it a bit nasty to try to
even guess at what goes wrong.

> I don't think I have to do something special with the
> compressed image and according to https://tldp.org/HOWTO/SRM-HOWTO/aboot.=
html
> I don't have to.

Yeah, it's more than two decades since I used an alpha, so I'm afraid
I can't help outside of the "let's make it compile again" thing.

It could easily be that the Jensen required that SRM bootimage, but
it's so long ago that I really don't remember at all.

> I would try the SRM bootimage (make bootimage), but the build is broken:

Well, that looks like something that should be fixed, and that I might look=
 at.

> arch/alpha/boot/tools/objstrip.c:191:52: warning: format =E2=80=98%lx=E2=
=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but ar=
gument 5 has type =E2=80=98long long unsigned int=E2=80=99 [-Wformat=3D]
>       fprintf(stderr, "%s: extracting %#016lx-%#016lx (at %lx)\n",
>                                                     ^
> arch/alpha/boot/tools/objstrip.c:200:12: error: =E2=80=98struct exec=E2=
=80=99 has no member named =E2=80=98fh=E2=80=99
>   if (!(aout->fh.f_flags & COFF_F_EXEC)) {

This looks like the "make bootimage" thing was never designed to work
in a cross-build environment. I think.

Because it looks like what happens is that when you cross-compile, it
gets the x86-64 'struct exec', and then everything goes sideways.

> Was that the target used to get bootable CDROMs? Could that be broken sin=
ce
> the move from aout to ELF? Ugh, sorry for raising so much trouble,

No, this is lovely. It would be really nice to get that Jensen target
working, if only because of silly historical reasons.

I'll see if I can get around to this.

              Linus

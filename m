Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01C81156841
	for <lists+linux-sparse@lfdr.de>; Sun,  9 Feb 2020 01:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbgBIA7L (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 8 Feb 2020 19:59:11 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46254 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727502AbgBIA7L (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 8 Feb 2020 19:59:11 -0500
Received: by mail-lj1-f196.google.com with SMTP id x14so3161911ljd.13
        for <linux-sparse@vger.kernel.org>; Sat, 08 Feb 2020 16:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YwYyvxlANAzDFXq8VR68vfQCJIE0PjfM1kTIe8WIqkQ=;
        b=CyRoJN5wwvl/XeE9ThnRIBZSq73F7yL+0gnvbPeWqFUj1zgb+Re9QJTUF4J3sNHeje
         +q+iigFxHSmLx7AcP3QZHW+jtYAG2o8jfDlxOtLlVbNurRdtobvlE8im/dhazh7aW53Q
         Q0VGf+2BsFhRrzBDmnw/XCum5YQXvCh6l8X2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YwYyvxlANAzDFXq8VR68vfQCJIE0PjfM1kTIe8WIqkQ=;
        b=d/YW0BfUbv03A3HREW6BobEGBbM5D6C4W8221tDzA3HJScNlivJwmZVjL+0nlNfnEj
         H/Pl5ZXCmlJ5TNRAAQnR0vtkFqX1y7EeBJ7kLWcUy3SUkksfljvM7oObKtZC/vprMVA1
         nBpyLj8TGHJNCE2rS+6csAx9ZtrrPvCaoiyBEkPWoMy+KBQsiomFr8IRLYbYlQ11pXRK
         Y1gprc0S+OpSfZWOFg+eZxXcexYvGSuTIThZm3R1Ad/jEboLT3+wvwuDURVbKkGXLWIi
         S/TafBVsi2V0Dx2XYz4GSl547NbllsbLT5kICSHt0t79UA/mO4plKC+QAeQp1FA3qnqh
         xpTg==
X-Gm-Message-State: APjAAAU9F/Sj3nSFY0EXPchb9liE8qHpme/arlVZW3hVEgQzXTwA5pNa
        6wyL9n4VtuW8w3gn7AKQAnVM/UlrNKg=
X-Google-Smtp-Source: APXvYqx11yKHwOfgz1x77GO/Ir8/QtMM9Ej6HGSJZpAs0wOj/LY2FNWC40CEvwYGpUC3FpZpq//NUA==
X-Received: by 2002:a2e:868c:: with SMTP id l12mr3918051lji.194.1581209948444;
        Sat, 08 Feb 2020 16:59:08 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id g27sm3176775lfh.57.2020.02.08.16.59.07
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2020 16:59:07 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id t23so1752595lfk.6
        for <linux-sparse@vger.kernel.org>; Sat, 08 Feb 2020 16:59:07 -0800 (PST)
X-Received: by 2002:a19:c7d8:: with SMTP id x207mr2953497lff.142.1581209946956;
 Sat, 08 Feb 2020 16:59:06 -0800 (PST)
MIME-Version: 1.0
References: <20200207081810.3918919-1-kafai@fb.com> <CAHk-=wieADOQcYkehVN7meevnd3jZrq06NkmyH9GGR==2rEpuQ@mail.gmail.com>
 <CAHk-=wjbhawNieeiEig4LnPVRTRPgY8xag7NuAKuM9NKXCTLeQ@mail.gmail.com>
 <20200207204144.hh4n4o643oqpcwed@ltop.local> <CAHk-=whvS9x5NKtOqcUgJeTY7dfdAHcEALJT53cy3P7Hzfgr1g@mail.gmail.com>
 <20200208235459.xmliqf2ksbre53jj@ltop.local>
In-Reply-To: <20200208235459.xmliqf2ksbre53jj@ltop.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 8 Feb 2020 16:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=whqDZUo6yARXMgwHSJRerXM4tWgMPV=MC9wR80YCEon1A@mail.gmail.com>
Message-ID: <CAHk-=whqDZUo6yARXMgwHSJRerXM4tWgMPV=MC9wR80YCEon1A@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Improve bucket_log calculation logic
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, Feb 8, 2020 at 3:55 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> > Something like the attached completely broken patch. It builds but
> > doesn't work, because "inline_function()" is currently designed to
> > work during evaluation, not during expansion.
> >
> > So the patch is complete garbage, but maybe could be the starting
> > point for something that works.
>
> It was just missing the part with current_fn (needed for the evaluation)
> and some adjustment to avoid recursive expansions.

Oh, good. I looked at that current_fn thing and decided it shouldn't
possibly matter, so my hacked-up patch just dropped it. Blush. And
yeah, the recursion avoidance got broken because it only triggered
during evaluation and that wasn't where it was recursing any more.

Anyway, your fixed patch looks good, and the numbers look lovely. I
don't see why there would sometimes be extra memory use, but the patch
feels like the right thing to do regardless.

Thanks,
               Linus

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 977D4E8327
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 09:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfJ2IXi (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 29 Oct 2019 04:23:38 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46326 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728757AbfJ2IXi (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 29 Oct 2019 04:23:38 -0400
Received: by mail-wr1-f68.google.com with SMTP id n15so12539024wrw.13
        for <linux-sparse@vger.kernel.org>; Tue, 29 Oct 2019 01:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WWnD3aPQj4y/RdmUzoDtIfZgkiE6VwXUVp1vO008BVk=;
        b=Ndw4qpwZDfESfLajoPHa6ZW89plmZJl7XbWH99C5iqBSBnZ52cAWK7soVrdL4lTDWX
         kIuBQ3Ndwl6CL7pKdfz4omB9qcoHJOaJjEs1mMnAwSQbQVpsEu4wD14Tw0D/GZG52xAm
         FcVbj9gY97MMH87EabZfhN++kPFZL3G8HaGYadI+ffvoSDzaILpYLXvHSKI5a6cOYQvW
         N5y6+Ciz2gKjG9fpVWtJ1933j5krEBBnxBckIBh6m/gUSxZOiSAIL7GGIyvDUJtdwcXZ
         8kmRH2WSu2uEeOzA+0GBeL+2xIJDuk0NCsai9JYxoUUXu76Ni8Flxzm9OxXe2xZwDJYq
         YDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WWnD3aPQj4y/RdmUzoDtIfZgkiE6VwXUVp1vO008BVk=;
        b=cWAYAkHNwL4IMIXbRO9L/MZ61Dvw7La7duZ1I8wEKol5aqe6kS7A6f9hbZkbrx6FQm
         lEe4dvkGoE9lzS/Zy3l2IrTzZoDLPbaJYvLgpJtVKuW6vcnZ6bX1+hnS+eYOSxzo6D+n
         nzDFlyOnb7nI0NtGhkKhgmR9/gaehSYFGMNjSvqbGEKnVlPDG4nq9/cWLv7etf5x7arL
         7SW15vo5ui+h0f98wxY7iNXHPdaohd2ukXO8yEpwSLHbMGqgnDX1mT7uikmd/TLp7p1v
         cBBshmrFib1Ip1dhMUSg6cB8JYvup8CbDglTYtFFTsscJJJz+m4Dh4amIUtaSTLvhIvh
         pjkw==
X-Gm-Message-State: APjAAAUKvceEFrkGkdTbLeE/SZmeY7+hDwOKYi4PoDkYT4Y7/wI//P8h
        WcMuas6pP3YzOgl4kqZ96pE=
X-Google-Smtp-Source: APXvYqyfDmT85x1FIhb7Rk2oEjpJbqKV6X7rHaONxWCK4qguExjY9PwhktQEZBeNgqOtX529F3rFzg==
X-Received: by 2002:adf:b6a6:: with SMTP id j38mr18095478wre.275.1572337416681;
        Tue, 29 Oct 2019 01:23:36 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:c1a7:4ac0:2d11:a4f8])
        by smtp.gmail.com with ESMTPSA id l4sm16055111wrf.46.2019.10.29.01.23.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 01:23:36 -0700 (PDT)
Date:   Tue, 29 Oct 2019 09:23:35 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] options: allow to specify the desired arch with
 --arch=<arch>
Message-ID: <20191029082334.g3evfqkc73ohn6pn@ltop.local>
References: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
 <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 29, 2019 at 02:32:15AM +0000, Ramsay Jones wrote:
> 
> 
> On 28/10/2019 21:43, Luc Van Oostenryck wrote:
> > Sparse is universal in the sense that the same executable can
> > be used for all architectures. For this, most arch-specific
> > setting can be set with an option and the default values
> > are taken from the host machine.
> > 
> > This is working nicely for native targets. However, for cross-
> > compilation, while seeming to work relatively well (thanks to
> > the kernel build system using -m32/-m64 for all archs, for example)
> > things can never work 100% correctly. For example, in the case
> > an X86-64 host machine is used for an ARM target, the kernel
> > build system will call sparse with -m32, Sparse will 'autodetect'
> > the target arch as i386 (x86-64 + -m32) and will then predefine
> > the macro __i386__. Most of the time this is not a problem (at
> > least for the kernel) unless, of course, if the code contains
> > something like:
> > 	#ifdef __i386__
> > 	...
> > 	#elif  __arm__
> > 	...
> > 
> > So, add an option --arch=<arch> to specify the target architecture.
> > The native arch is still used if no such flag is given.
> 
> How does this interact with the cgcc --target=<spec> and the
> (otherwise) guessing of the 'native' specs?

I didn't yet looked at how it interacts with cgcc --target=<spec>.
I had losely planned to do this after having removed all the defines
in cgcc that are now unneeded (integer_type() and define_size_t()
are now done by sparse itself, float_types() should also).

I think that the OS-specific parts can be kept in cgcc and in
the 'arch' parts it would be easy enough to call sparse with the
right '--arch=<...>' (either guessed via uname or specified via
--target=<spec>, it wouldn't matter).

Do you see some complications?

--Luc

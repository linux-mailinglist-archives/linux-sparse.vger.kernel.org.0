Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2F8280407
	for <lists+linux-sparse@lfdr.de>; Thu,  1 Oct 2020 18:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732415AbgJAQfC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 1 Oct 2020 12:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732046AbgJAQe5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 1 Oct 2020 12:34:57 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 311C4C0613D0
        for <linux-sparse@vger.kernel.org>; Thu,  1 Oct 2020 09:34:57 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k25so5194028ljg.9
        for <linux-sparse@vger.kernel.org>; Thu, 01 Oct 2020 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O2xnqR3tu4qgyrfJd4p0eVC6NG2Y5EAFQUWg2An+XuY=;
        b=AtE/ujJMp5XiaTdXBN105vHCljzQw1OKWIl8lg2Z6JQPweT33A8qazzY+qb6VM0TXn
         r3MzSR3TD+uaH0Q1l8Q+IP3LTSm6EtJnmYlhyiXxH8mPjBZe8vrpIY8dlA+yUwvUuTpN
         a8QNMhZZUyRm2JRjM4X23KpSzbM+PYABzSPfw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O2xnqR3tu4qgyrfJd4p0eVC6NG2Y5EAFQUWg2An+XuY=;
        b=UmXTt4y5c4aeLU8V2O1HjcPgz+4PSSzpt8Nijqt8QkKHBc626V3Tt3+sCLh8rQcC5d
         TV0CRNDKPw7WQg5Ic9r467zN+ToyeS12PDhSPkLdbcLUr0wnRS36A0iXL1Yp3Q120r5w
         fQ+Z1FAxCatOEN0flR/PhmDotBFTlzMPhzJY1Ba7XqjuLcbQBmKzPlJ8ETqUg1ARen04
         5+BTQ9zSJ4eOlGoRZ//9K4cxnHi+gESeW8dQDlvLervuqjqFVF8Jje5hSgQf6kzLMZd4
         y/DUWbi1grzIXs5wJvgek5d4G2WWxJ+LxPcYlz0dhX/6PsV3WEa7hWVKG/ZudpD+lmtt
         iX+w==
X-Gm-Message-State: AOAM530o2Z3mTQLAW2h/tQYRXiNLfSu+s/QrhIJCegvemRPAmxhTcfg/
        mUye/mm7LvPEClJDKymh52h8MWi/F4NPMw==
X-Google-Smtp-Source: ABdhPJx5WWEijFeCXOEhGAJmV6EpZApNTa7DXZfNQfVuCXw26Md+836Jqv4DCuwFu67smUG+zdoiWQ==
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr2608068ljj.146.1601570095298;
        Thu, 01 Oct 2020 09:34:55 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id n2sm484970lji.97.2020.10.01.09.34.53
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2020 09:34:54 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id y4so5199091ljk.8
        for <linux-sparse@vger.kernel.org>; Thu, 01 Oct 2020 09:34:53 -0700 (PDT)
X-Received: by 2002:a05:651c:514:: with SMTP id o20mr2853086ljp.312.1601570093332;
 Thu, 01 Oct 2020 09:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200930231828.66751-1-luc.vanoostenryck@gmail.com> <20200930231828.66751-14-luc.vanoostenryck@gmail.com>
In-Reply-To: <20200930231828.66751-14-luc.vanoostenryck@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 1 Oct 2020 09:34:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiyAWuHQuDPBC290V-Bx5Eyu1izPj9iSSN0hdkSM2a4iQ@mail.gmail.com>
Message-ID: <CAHk-=wiyAWuHQuDPBC290V-Bx5Eyu1izPj9iSSN0hdkSM2a4iQ@mail.gmail.com>
Subject: Re: [PATCH 13/13] flex-array: warn when a flexible array member has
 some padding
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Sep 30, 2020 at 4:18 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> If some padding is added because of the presence of a flexible
> array member, the size of the structure will be greater than
> the offset of this flexible array which can cause some
> problems if the assumption is made that these 2 size must be
> identical (which is easy to do since such flexible arrays are
> conceptually 'after' the structure itself).

The warning seems pointless, and the explanation above is wrong.

Flexible array padding is normal and good. IOW, if you have

    struct odd_struct {
        char c;
        unsigned int flex[];
    };

then the flexible array - and the structure - very much should be
aligned on 'unsigned int', and both the offset of the flex-array and
the (bogus) size of the structure is 4.

So this is a normal case and nothing wrong with it, and the above is
the "flexible array caused padding" one (but sizeof and offsetof
match).

And the case that causes sizeof() and offsetof() to not match is
normal too: but is not that the flexible array member caused padding,
but that *other* members did.

IOW, maybe you have a structure like this:

    struct other {
        uint64_t a;
        uint32_t b;
        char flex[];
    };

and now "offsetof(flex)" is 12, but "sizeof(struct other)" is 16,
because the flex-array itself has no real alignment requirement and
will just be laid out after the 12 bytes of a/b, but the structure has
8-byte alignment due to 'a'.

So I don't think the warning is interesting, because this is a
perfectly normal condition too.

And I don't think your explanation for the warning makes sense,
because you say "padding is added because of the presence of a
flexible array member", but that's not at all what is going on. The
padding is added because of *other* members.

Anyway, the above is just an example of why "sizeof()" itself makes no
sense on these things. A "sizeof()" of a structure with a flexible
array member is inherently pointless. You can't use it for anything
really valid, and it doesn't have any sensible meaning.

But I don't think that has anything to do with warning about padding.
The padding is right - it's the sizeof() itself that is nonsensical.

So in the kernel, we would

 - start warning about 'sizeof(flex_struct)'

 - make our "struct_size(s, m, N)" construct use
"offsetof(m)+N*sizeof(*m)" instead of using sizeof().

Of course, it may well be that we end up with trouble just because we
end up _needing_ sizeof() for some reason. I can't think of any sane
situation off the top of my head, but who knows what odd macros etc we
might have that end up doing sizeof() as part of things..

                  Linus

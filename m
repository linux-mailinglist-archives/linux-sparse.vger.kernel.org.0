Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2B47BBE63
	for <lists+linux-sparse@lfdr.de>; Tue, 24 Sep 2019 00:17:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391278AbfIWWRR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 23 Sep 2019 18:17:17 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37673 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388785AbfIWWRR (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 23 Sep 2019 18:17:17 -0400
Received: by mail-lj1-f195.google.com with SMTP id l21so15305419lje.4
        for <linux-sparse@vger.kernel.org>; Mon, 23 Sep 2019 15:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HYNoYLLGGs59jfBB0+YGCqebvK+gLX/xtb2Yh7mk1wY=;
        b=R0bmtUWTRq2haoPfGdkt6Tp7KkAU5qSiJJcJh2wFeI6D4zU+QMIPRflJSA3ChN/3eq
         MRqGwgLkTyIgHIitZuLRRjXIWPs8TZap8T1Adz7thWN4tS/sSB0p+CkcHk/QbKCkWlIm
         Ckh4PF1QxPKvskNLlIFM+YrJorWaxsp+JnwRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HYNoYLLGGs59jfBB0+YGCqebvK+gLX/xtb2Yh7mk1wY=;
        b=DJRNrWebkzf+UIB1CMDcICZHM/vB+nxz/YmoIm02U3xspemRwX0j2xInVkeiA2+VoB
         r6VI9Moi/8SRvwXJvHOyqZVvR1ZTBkfrlz5CFH8CR/mO6eJqcRJNRM/YsYKE5J90p3qY
         FBWNrSPeeUPQNsfp2D5L+SADdkUpC8yqgTJmmcKqqIpqkBfWt3qfmbJXO15GQqS+6/KI
         tRUjn6UMm4pGcPtUAcas7hUoG9M1Vd20p0QpnHWLwLAPoebwmpW8Rr/ySLk0lSQP9cie
         StRYta3I2tBRNJZLz2PXqIX24hAF9VuKHqsdk/YQWApSkz3FdC7f0e5aqOFJ3JkWtzL6
         3X/g==
X-Gm-Message-State: APjAAAVqzyK6p7Lox8aLNtOYmoPHWeEOW8txxbs+trZjvnhIyYdtvy7v
        AQ0QsfVmdMO/LM1JU7Tp+63nI5qO7+M=
X-Google-Smtp-Source: APXvYqyWMZ2qX58+hPA88phMKdY6jhorEmKZHZOK1WADEx1Ww55VCitPTLeGUxSW4M12v8TfvCp5/g==
X-Received: by 2002:a2e:7211:: with SMTP id n17mr895935ljc.9.1569277034467;
        Mon, 23 Sep 2019 15:17:14 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id q19sm2759382lfj.9.2019.09.23.15.17.13
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2019 15:17:13 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id f5so15284633ljg.8
        for <linux-sparse@vger.kernel.org>; Mon, 23 Sep 2019 15:17:13 -0700 (PDT)
X-Received: by 2002:a2e:9854:: with SMTP id e20mr938658ljj.72.1569277032970;
 Mon, 23 Sep 2019 15:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190923193856.GJ20699@kadam>
In-Reply-To: <20190923193856.GJ20699@kadam>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 23 Sep 2019 15:16:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiby96wPxF87Fdq=yPVpjBMv+okrAoQUgO+2eCYjWbqPA@mail.gmail.com>
Message-ID: <CAHk-=wiby96wPxF87Fdq=yPVpjBMv+okrAoQUgO+2eCYjWbqPA@mail.gmail.com>
Subject: Re: enums and EXPR_VALUE and sign expansion
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Sep 23, 2019 at 12:39 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> In GCC the enum would be a signed int,

That would be broken. You can't fit 0x80000000 in a signed int.

But that's not actually what gcc does.

For gcc, the type of the 'enum' is actually 'long'.

But the type of 'a' is 'unsigned int', and the type of 'b' is 'long'.

Yes, crazy and arguably completely broken, but there you are.

> but in Sparse it is a signed
> long (on my 64 bit system).  That would be fine except the second issue
> is the signed bit isn't expanded correctly because a long -1 should be
> 0xffffffffffffffff and the expr->value is 0xffffffff.

Well, that's even more broken, of course.

sparse makes everything have the same type, but yes, it has corrupted
the value of 'b'.

We used to get this right (well, I'm sure we got other things wrong),
and bisecting shows that it was brokenb by commit 604a148a ("enum: fix
cast_enum_list()").

Luc - I _suspect_ that what happens is that it now does that

                expr->ctype = base_type;

in parse.c, which is correct in the long run, but AT THE TIME it is
parsed, the type hasn't been finalized yet. That's fine - we'll fix it
in-place eventually.

HOWEVER. We also do this:

                if (ctype->bit_size == base_type->bit_size)
                        continue;
                cast_value(expr, base_type, expr, ctype);

and I think it's that 'cast_value()' that gets things wrong somehow.
It probably uses a 'unsigned int' either as the source or the
destination, or something.

Luc?

            Linus

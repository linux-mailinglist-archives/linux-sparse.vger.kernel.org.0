Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B98B4154F7F
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 00:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgBFXrp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 6 Feb 2020 18:47:45 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42596 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgBFXrp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 6 Feb 2020 18:47:45 -0500
Received: by mail-lf1-f67.google.com with SMTP id y19so276899lfl.9
        for <linux-sparse@vger.kernel.org>; Thu, 06 Feb 2020 15:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DLMQCb/rC63e8ysBPsJiM4ioJ2j3gs4A+SZ4tO6Mk4s=;
        b=YJOfMzXyWfkSaOqavSPr0N8smuSk0AH/Eqrzvza0MygqOY6zTZeEyayCr7mTrwgCP2
         0CWP4OcUEpLxx6z/gkz6l9svw4qJz78JqyBbOLzYOol3kwp9GKW0m8CW/BATb18z2nOK
         lPJ2HGZIPm6s8qeZcT8TAACQkgdRP93Z6zcLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DLMQCb/rC63e8ysBPsJiM4ioJ2j3gs4A+SZ4tO6Mk4s=;
        b=mJjWW5wSlX/45y9azV02e7Mn1TlCuqagG/7qtkl7CJRkI+BdwIRZIO96SmSm2y7052
         9IHpJOR9APj3VVheH2gzejBPA1nxaZdlLevKgw5pyvPKv0G1RIaXQoP7tXlMC5607ndn
         0OVXg8KnncT1GZ9gRoZi3TBrD/PYFKX3QIBG6Qyq5BeyhNaR+HvMPeIkMUeyVfTH1tNy
         hnqH9DtQYjBfVEtrV4nOP4+yB8HLJIEgKHheF2iQr9JKxmtm4pWM3P/WRwAQFxc+Vz5W
         jAojisBMblGGg7LN+VJgwFqSNlET95ndHFihbqXiN85PpGujZE9hmXt9fbNv7SNyd+I0
         ziQw==
X-Gm-Message-State: APjAAAWyNqZ0oOY5dW0vzL+r4D7Hm7vKM2uNG2qDPU0ow48XYvucExWo
        P6a7xvabp9+A8odB0ixe5nXeyA7FrduU8Q==
X-Google-Smtp-Source: APXvYqwXLGV/D3QSVg3+RmhWK0ar0+K/C5iNkuPSSU9t3XBcCelTZeNt5Y0OQSfeJfOZH2aW6qMUUQ==
X-Received: by 2002:ac2:4476:: with SMTP id y22mr3021373lfl.169.1581032859967;
        Thu, 06 Feb 2020 15:47:39 -0800 (PST)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id i4sm320549ljg.102.2020.02.06.15.47.38
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 15:47:38 -0800 (PST)
Received: by mail-lj1-f169.google.com with SMTP id x14so129361ljd.13
        for <linux-sparse@vger.kernel.org>; Thu, 06 Feb 2020 15:47:38 -0800 (PST)
X-Received: by 2002:a2e:88c5:: with SMTP id a5mr3618009ljk.201.1581032858268;
 Thu, 06 Feb 2020 15:47:38 -0800 (PST)
MIME-Version: 1.0
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
 <20200206114619.bfszxgs6jmdgroo6@ltop.local> <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
 <20200206200610.7ktqp2yzriw7zurx@ltop.local>
In-Reply-To: <20200206200610.7ktqp2yzriw7zurx@ltop.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 6 Feb 2020 15:47:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=whEFcgPW8oD=rGGyDiML_7AaCP0DGdW=WXjvF9zAv6Vrg@mail.gmail.com>
Message-ID: <CAHk-=whEFcgPW8oD=rGGyDiML_7AaCP0DGdW=WXjvF9zAv6Vrg@mail.gmail.com>
Subject: Re: sparse problem with Linux kernel v5.5
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Arthur Fabre <afabre@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Feb 6, 2020 at 12:06 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> However, I thought that the 5+seconds of runtime with 2.9Gb of memory
> consumption I reported earlier was somehow excessive. So, I looked
> at the preprocessed file and my editor (and several other tools) chocked
> near the end ... It appears that one line is 2.8Mb on a total of 6.2MB
> and contains 28968 times the expression for num_possible_cpus().

Whee..

> The origin of this is situted at line 647:
>         smap->bucket_log = max_t(u32, 1, ilog2(roundup_pow_of_two(...));
> because ilog2() is an 'interesting' macro which is already expanded
> inside roundup_pow_of_two().

Yeah, so we have "const_ilog2()" expanding its argument 63 times (to
handle the "just turn it into a constant" case), and so

   ilog2(roundup_pow_of_two(x))

where both ilog2() and roundup_pow_of_two() contains a const_ilog()
ends up internally essentially expanding x 63*63 times. Plus a couple
for the non-constant case.

And in this case 'x' wasn't all that simple to begin with on SMP.

And then the "max_t" thing adds another factor of 7 due to the whole
"let's keep a constant expression constant" with all the careful "can
I use a variable or not" code.

So you get 7*63*63 expansions of num_possible_cpus(), plus that "some
slop" for the other cases.

I wonder if we could just make sparse _warn_ about this kind of
situation with expressions that are very big - even if they turn into
nothing)?

Because I bet it's not good for a real compiler either. Compile time
does matter to people, and this clearly wasn't intentional.

And even if we apply a patch to avoid it here, that's fine, but others
might be lurking.

Of course, sometimes you do want to have that kind of nested expansion
on purpose - creating huge expression lists for some initializer or
whatever. And sometimes the constant value is what you care about, and
are willing to have complex expressions.

I don't think anybody intended for the expression to be quite _that_
complex, though..

> This exists since the introduction of this file in commit
>     6ac99e8f23d4 bpf: Introduce bpf sk local storage
> but back then it made sparse consume only about 500Mb of memory on it.

Well, the fact that sparse memory use has exploded by a factor of 6 is
not exactly good either. What happened?

> but a better patch should, I think, directly use ilog2() and avoid the roundup.

No, I think it would be better to just split that expression up.

Right now the code does:

        /* Use at least 2 buckets, select_bucket() is undefined
behavior with 1 bucket */
        smap->bucket_log = max_t(u32, 1,
ilog2(roundup_pow_of_two(num_possible_cpus())));
        nbuckets = 1U << smap->bucket_log;

so it calculates the log2, and then does "1U << log2".

Instead, it could just calculate the nbuckets first, and then do the
"log2()" on that:

        /* Use at least 2 buckets, select_bucket() is undefined
behavior with 1 bucket */
        nbuckets = max_t(u32, 2, roundup_pow_of_two(num_possible_cpus()));
        smap->bucket_log = ilog2(buckets);

because honestly, that is just a whole lot more legible anyway. Maybe
even split _that_ up, and have the max_t as a separate thing.

Right now the constant in the comment (2) doesn't match the constant
in the code (1) because the code is too dense for its own good.

Of course, currently that "too dense for its own good" code ends up
evaluating to a constant on UP. Which the easier-to-read code does
not.

I'm not convinced that it makes sense to optimize for UP that much.

                Linus

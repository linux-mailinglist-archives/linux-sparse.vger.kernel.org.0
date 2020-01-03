Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACED12F2BB
	for <lists+linux-sparse@lfdr.de>; Fri,  3 Jan 2020 02:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgACBf4 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 2 Jan 2020 20:35:56 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43797 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgACBfz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 2 Jan 2020 20:35:55 -0500
Received: by mail-lj1-f196.google.com with SMTP id a13so42453746ljm.10
        for <linux-sparse@vger.kernel.org>; Thu, 02 Jan 2020 17:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=35QK6jthzemu1MKfbbKBkPZnLXfewVEr2JR1TDwvfRg=;
        b=P4HVy1dnZY1g/SmNj+L1cp8Gqmk85eFl7JXdAo0PnsDl+1mkfClQLuxReD1j1KU3Su
         tTOHteMcRCGrSCzWj/ftYmWShmuYjj8Fm2x2iL+fAGpwG3zWZKGl5S7HX/K8wvqrU4/t
         R+IXcRs9U5rNlL7gJVM3Xhddt9ZD1Eb9dG6N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=35QK6jthzemu1MKfbbKBkPZnLXfewVEr2JR1TDwvfRg=;
        b=GnSiCCf3WpLtPs/6wmEyRVVrq5mptMVTOA699CnZDmLiK+ZCSHRePc1RP2BCyXoehS
         kcHoASYLMAbOJ3IznxqNCgo42wDZDK+fTyNJVSObexOVdjYlqGOGvmhN332c/TXSNUAj
         7GCA6oSq5c3zRd6TqUYu7oHOVH+eXjZDucV40ZpEgdVIYBvQIDtc2rVgwKe82Fw58KgO
         RPd6ipOI806m1loEYW0tubqWkKbzddSY7kxmSSpafLLxjuj84+PPW0I8UhkCmkmsImFq
         F0hoEwS3ZY47CxiDAln3fq9HiGwhXzXm6qu+SaJOta3uJd3+rcN+hLUA9oyg2mmDf3bq
         8NYw==
X-Gm-Message-State: APjAAAUWotOH3s19YuAJFnKqcwhHKHLqHqWAQbEW1ywKqAgtUdfRVs4h
        HuLeNKcalAIKP/VC96VWWZ0JZZPsxvY=
X-Google-Smtp-Source: APXvYqzU3XOGNSItpSj3gDES3HG/w+MGsqCA5M3ZeYOEJcaWqKIyNxgxcKC36oVqEHLOlGnhNwOb8A==
X-Received: by 2002:a2e:5304:: with SMTP id h4mr52138920ljb.75.1578015352274;
        Thu, 02 Jan 2020 17:35:52 -0800 (PST)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id i19sm24098702lfj.17.2020.01.02.17.35.50
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2020 17:35:51 -0800 (PST)
Received: by mail-lf1-f50.google.com with SMTP id y1so30968028lfb.6
        for <linux-sparse@vger.kernel.org>; Thu, 02 Jan 2020 17:35:50 -0800 (PST)
X-Received: by 2002:ac2:465e:: with SMTP id s30mr49465252lfo.134.1578015350526;
 Thu, 02 Jan 2020 17:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20191226152922.2034-1-ebiggers@kernel.org> <20191228114918.GU2827@hirez.programming.kicks-ass.net>
 <201912301042.FB806E1133@keescook> <20191230191547.GA1501@zzz.localdomain>
 <201912301131.2C7C51E8C6@keescook> <20191230233814.2fgmsgtnhruhklnu@ltop.local>
In-Reply-To: <20191230233814.2fgmsgtnhruhklnu@ltop.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 2 Jan 2020 17:35:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgkoUeLGEdUF2nsibsK8YFrOOXMd9j5Y1ND4R+1a-6n8w@mail.gmail.com>
Message-ID: <CAHk-=wgkoUeLGEdUF2nsibsK8YFrOOXMd9j5Y1ND4R+1a-6n8w@mail.gmail.com>
Subject: Re: [PATCH] locking/refcount: add sparse annotations to dec-and-lock functions
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Eric Biggers <ebiggers@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Elena Reshetova <elena.reshetova@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Anna-Maria Gleixner <anna-maria@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Dec 30, 2019 at 3:38 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> One of the simplest situation with these conditional locks is:
>
>         if (test)
>                 lock();
>
>         do_stuff();
>
>         if (test)
>                 unlock();
>
> No program can check that the second test gives the same result than
> the first one, it's undecidable. I mean, it's undecidable even on
> if single threaded and without interrupts. The best you can do is
> to simulate the whole thing (and be sure your simulation will halt).

No, no.

It's undecidable in the general case, but it's usually actually
trivially decidable in most real-world kernel cases.

Because "test" tends to be an argument to the function (or one bit of
an argument), and after it has been turned into SSA form, it's
literally using the same exact register for the conditional thanks to
CSE and simplification.

Perhaps not every time, but I bet it would be most times.

So I guess sparse could in theory notice that certain basic blocks are
conditional on the same thing, so if one is done, then the other is
always done (assuming there is conditional branch out in between, of
course).

IOW, the context tracking *could* do check son a bigger state than
just one basic block. It doesn't, and it would probably be painful to
do, but it's certainly not impossible.

So to make a trivial example for sparse:

    extern int testfn(int);
    extern int do_something(void);

    int testfn(int flag)
    {
        if (flag & 1)
                __context__(1);
        do_something();
        if (flag & 1)
                __context__(-1);
    }

this causes a warning:

    c.c:4:5: warning: context imbalance in 'testfn' - different lock
contexts for basic block

because "do_something()" is called with different lock contexts. And
that's definitely a real issue. But if we were to want to extend the
"make sure we enter/exit with the same lock context", we _could_ do
it, because look at the linearization:

    testfn:
    .L0:
        <entry-point>
        and.32      %r2 <- %arg1, $1
        cbr         %r2, .L1, .L2
    .L1:
        context     1
        br          .L2
    .L2:
        call.32     %r4 <- do_something
        cbr         %r2, .L3, .L5
    .L3:
        context     -1
        br          .L5
    .L5:
        ret.32      UNDEF

becasue the conditional branch always uses "%r2" as the conditional.
Notice? Not at all undecideable, and it would not be *impossible* to
say that "we can see that all context changes are conditional on %r2
not being true".

So sparse has already done all the real work to know that the two "if
(test)" conditionals test the exact same thing. We _know_ that the
second test has the same result as the first test, we're using the
same SSA register for both of them!

              Linus

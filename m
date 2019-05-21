Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70FF325780
	for <lists+linux-sparse@lfdr.de>; Tue, 21 May 2019 20:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728581AbfEUSXb (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 21 May 2019 14:23:31 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:36783 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfEUSXb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 21 May 2019 14:23:31 -0400
Received: by mail-pl1-f194.google.com with SMTP id d21so8834458plr.3
        for <linux-sparse@vger.kernel.org>; Tue, 21 May 2019 11:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KfCh0884v4bVSRmnlQWvFHPVad54nh6+zV1JwGfTT18=;
        b=ezXHTWxKgXYe5C2JJlTooG4x8QRdPU2kupBFx4GtzVhA5nQtBUyh6BM/1RueM8AS/k
         6OoXYA8UWfHmaGLGH63oTnKdc/hgM6U5snfh4/NUrIh9cszPD9ffCGNUGuUXxQ0WlN98
         XBJPW//CBwzRf/CO/KH0yQHIdUJzhxo2o7n7EanN968FiuK+2qsiqac6xaFLorWkp8gN
         eumRz+urIYZw2exl7SoT9zAYVJm2Hues/i2cizOyMC5A7Lg9UdEnQ7KrO4DuKSl8DOPj
         eh5RwrIamiSfiUGiZRsO/VYfyYSCHZx2H0qsR8ju8pCa31p/pmW6eGqknMWvRQiTB8Zs
         Qe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KfCh0884v4bVSRmnlQWvFHPVad54nh6+zV1JwGfTT18=;
        b=Xr9scXBgbgLgbtIEZCZJ6/hV6jUD9SDWiTtMhAxSFCf0MFddXJa4g9Sq6wRVmdVjfi
         lrxBq5chq9zzTuUA4ubRNxP5JZKDC1KqH9ytJwl1slUAmVRFAsKsTYm5M+iIKO9bCw+z
         M6H7LNmTc1wlFQctEUfWn9nEo/rB/1cp9+r4ufyIsYzheH5t0I3PDFpBDQE7PRxJf9og
         26Rp/4YFMUzqx2S9C4mXlQMeRzEbclKjKkqe/TwWbfy7+TLGkY/HMFrW/2rhts0Hi7xY
         nFgAenxiPu6m1uoRGUWuvm05EK6BC7oH1Xok9GCbNIIMvhZV036wAHhxe0cdTkJXtB0r
         v8og==
X-Gm-Message-State: APjAAAWQw0s1G8+1utS7n8CR5JGnEZsWIZxguZzhkVPCdKbaRsWppAJU
        R6OYffWCu0k+eBmzDkk8aSw=
X-Google-Smtp-Source: APXvYqyq9fkKQCI2jYxjXU5Wezw/aNAfjUEpEGcLTTLQsDr4RHgDTz3kOJ/NQ/QW6Fic3FdQjJ3mwA==
X-Received: by 2002:a17:902:1029:: with SMTP id b38mr44439686pla.72.1558463010726;
        Tue, 21 May 2019 11:23:30 -0700 (PDT)
Received: from himanshu-Vostro-3559 ([103.83.145.175])
        by smtp.gmail.com with ESMTPSA id f28sm46139334pfk.104.2019.05.21.11.23.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 11:23:29 -0700 (PDT)
Date:   Tue, 21 May 2019 23:53:23 +0530
From:   Himanshu Jha <himanshujha199640@gmail.com>
To:     Jann Horn <jannh@google.com>
Cc:     linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Philipp Reisner <philipp.reisner@linbit.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>
Subject: Re: Sparse context checking Vs Clang Thread Safety analysis
Message-ID: <20190521182322.GB15859@himanshu-Vostro-3559>
References: <20190520164214.GA14656@himanshu-Vostro-3559>
 <CAG48ez2+NoQ4mtm=PCyz005O4Efmszxo3Z7wgaF_5xx1nYO8dQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez2+NoQ4mtm=PCyz005O4Efmszxo3Z7wgaF_5xx1nYO8dQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi Jann,

On Mon, May 20, 2019 at 09:01:26PM +0200, 'Jann Horn' via Clang Built Linux wrote:
> +kernel-hardening
> 
> On Mon, May 20, 2019 at 6:42 PM Himanshu Jha
> <himanshujha199640@gmail.com> wrote:
> > I'm an undergrad student working on Google Summer of Code'19 Project[1]
> > to apply clang thread safety analysis feature on linux kernel to find bugs
> > related to concurrency/race condtions with Lukas & clangbuiltlinux
> > community.
> >
> > Since sparse has similar context checking feature, I started
> > investigating by looking the source and some other resources such as
> > LWN[2] about the internals.
> >
> > `-Wcontext` is my prime focus for now and currently we have:
> >
> > himanshu@himanshu-Vostro-3559:~/linux-next$ make C=2 CF="-Wcontext" 2>&1 >/dev/null | grep -w 'context' | wc -l
> > 772
> >
> > o Why do we have so many open warnings for context imbalance ? Or
> >   Why did we stop at some point annotating the codebase ?
> 
> Many developers don't use sparse, and sparse doesn't support some
> locking patterns that the kernel uses.

I understand little interest in sparse warnings among developers.

I see frequently patches related to fixing codebase such as:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?h=char-misc-testing&id=324fa64cf4189094bc4df744a9e7214a1b81d845

and by 0-day bot:
https://lore.kernel.org/lkml/201905210520.GS4ztecg%25lkp@intel.com/

> > o Does sparse stores some sort of context counter since we didn't get
> > any warnings for `bad_difflocks` which locks 'lock1' and unlocks 'lock2'
> > ?
> 
> Yes. Sparse currently ignores the context and only has a simple
> counter shared by all locks.
> 
> > o What exactly the usage of `__acquire/__release` ?
> > I have used it to shut up the warning for lockfn & unlockfn above.
> 
> You use those to inform sparse where you're taking a lock or releasing
> a lock; and some parts of the kernel also use it to inform sparse of
> places where a lock is effectively taken, even though there is no
> actual locking call (e.g. when two pointers point to the same object,
> and therefore you only need to actually call the locking function once
> instead of twice).
> 
> [...]
> > So, clang thread safety analysis[3] follows a different mechanism
> > to overcome what we have observed above.
> >
> > I did small analysis on a C program[4] and a device driver[5].
> >
> > Clang analysis has many annotations available to suitable annotate the
> > codebase which can be found in the documentation[3].
> >
> > Quite surprisingly, Philipp proposed[6] `__protected_by` feature which is
> > very similar to `guarded_by`[7] feature implemented in Clang.
> >
> > Similarly, Johannes proposed[8] the same with a different implementation.
> >
> > Questions from both you:
> >
> > o Why was it not deployed in sparse ?
> >
> > o Does the lock protecting the data should be a global variable ?
> >
> > ie.,
> >
> > struct foo {
> >         struct mutex lock;
> >         int balance __protected_by(lock);
> > }
> >
> > Can this be done ? Or lock should be global ?
> >
> > Because clang analysis wants it to be global!
> >
> > There are other attribute restrictions as well for clang analysis:
> > https://github.com/llvm-mirror/clang/blob/master/test/Sema/attr-capabilities.c
> >
> >
> > *Most Important*
> > Could you please point me some critical data examples that you know in
> > the kernel source which should be protected. This would help us a lot!
> 
> The complicated thing in the kernel is that almost any structure
> member can be accessed without locking under some circumstances - for
> example, when a structure is initialized, or when the structure is
> being freed and all other references to the object have gone away. On
> top of that, many fields can be accessed under multiple locking
> mechanisms - e.g. many fields can be read under either a
> spinlock/mutex or in an RCU read-critical section. And there are
> functions that conditionally acquire a lock and signal the state of
> the lock through their return value - for example,
> mutex_lock_killable() and mutex_lock_interruptible().

Yes, I understand.

Maybe TRY_ACQUIRE() would fit such a situation:
https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#try-acquire-bool-try-acquire-shared-bool


> I think that static analysis of locking is a great thing, but the
> kernel doesn't exactly make it easy. In particular, I think it is
> going to require annotations that you can use to tell the compiler
> which state of its lifecycle an object is in (since that can influence
> locking rules), and annotations that tell the compiler what the
> semantics of functions like mutex_lock_killable() are.

I will try with the easy ones in the beginning and share the analysis.


Thanks for your time!
-- 
Himanshu Jha
Undergraduate Student
Department of Electronics & Communication
Guru Tegh Bahadur Institute of Technology

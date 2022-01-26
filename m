Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67A3249C062
	for <lists+linux-sparse@lfdr.de>; Wed, 26 Jan 2022 01:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235474AbiAZA72 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 25 Jan 2022 19:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235473AbiAZA71 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 25 Jan 2022 19:59:27 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C5FC061744
        for <linux-sparse@vger.kernel.org>; Tue, 25 Jan 2022 16:59:27 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id a28so29915228lfl.7
        for <linux-sparse@vger.kernel.org>; Tue, 25 Jan 2022 16:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z71P7Xp5dv6WjZqQ3zBgUE6e/dyCl8Gv6LZSgzhmEF0=;
        b=YxkcuAon8bS+2bQjPPNAgxM2rDMFd6aoPVQ/fcKh0AkzpcJfXxuJ4rLkJlfnjnRB8f
         jeHfmu0k5gmyMY/n9jdN0eW2fAudKR/84WqEBH2x69Bzcicm6s3a6JsQMK6w8lHb1Lps
         ZxHzEpYXnARrogT72+tdrulFexJ0VbmbUZZJrSH10PQQ+t0/rka4hI0pksA5MwDYyDgj
         /hzjVQmpPB+HbOh4PC+WQdi+1bMfs8etFyRfSdt6hag3sGL8Ls1pIETUseevlo0mMyNb
         7MM7CcMS9skmdB687IiPvJNhetJiCiKab2IxnqwgGL9/qONMIm8qYYbGKF5r3ZO1fZgq
         QiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z71P7Xp5dv6WjZqQ3zBgUE6e/dyCl8Gv6LZSgzhmEF0=;
        b=riEhLpvXi8DZTGCyDt+Jlq2PYuK4VqFmuZEzXtT0b+95o/vAu4KSWSvaSbYSnLNTvZ
         r5trln+J3SIFse1Y6HJRdemjwywbBmSt+4Wetl+C8qUArdCVEE3ogxL0W/NcUeh80Dst
         65A0rblTuantpsqwTxEzPCdzsP5Rfbo+epL7n5CoHBaWxoJll0uAqyarXWrEERBwVUzw
         RnQhTz/mfesH4k/moco5V8eVwvxHHcYIHtR2WfnrWw1CdXUfFuMO9NfCK7S5M/NvkKRC
         IgBAoioXnIjBMJ/caSP2HCl/zDGxM3drdRCd8rjf7jelO8RcG+7yucOthsiC8aogDpzY
         7DVQ==
X-Gm-Message-State: AOAM530DsT8TgjT+nPmY0TT9xfOLA6Ku4M5a0Ori0qxDt7t2OZqfkuGu
        yXCnqPQOnFhgPg758Al4Rtdjbd4OQKCXnMro9704Pg==
X-Google-Smtp-Source: ABdhPJwy4V88GdNrO9tRchz5OfI8p/bCHIpaK5dAlNpQA1JPyiTKreaA0cOPcwZEMFUN2L3ofZuzU/IpAj8pZtAGgN0=
X-Received: by 2002:a05:6512:b0d:: with SMTP id w13mr18623372lfu.240.1643158765067;
 Tue, 25 Jan 2022 16:59:25 -0800 (PST)
MIME-Version: 1.0
References: <20220114010526.1776605-1-ndesaulniers@google.com>
 <YeQei0xNzMq7bFdg@zn.tnic> <20220118192256.jzk5dnceeusq7x7u@treble>
 <20220118230120.pivvson7qekfiqic@treble> <CAKwvOdmLzwz=02ypt0_1324_5-7i3Az7HizFaDMqZv__-D99uA@mail.gmail.com>
 <20220125233128.GT614@gate.crashing.org>
In-Reply-To: <20220125233128.GT614@gate.crashing.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 25 Jan 2022 16:59:12 -0800
Message-ID: <CAKwvOd=P0VAFrrUXV0z5dES9hYP2b8-KwTzyG5=ezeUve=K3QA@mail.gmail.com>
Subject: Re: [PATCH] objtool: prefer memory clobber & %= to volatile & __COUNTER__
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        x86@kernel.org, llvm@lists.linux.dev, linux-sparse@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Jan 25, 2022 at 3:34 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> Hi!
>
> On Mon, Jan 24, 2022 at 03:26:36PM -0800, Nick Desaulniers wrote:
>
> > If this is fixed in gcc-10, then we can probably add a comment with a
> > FIXME link to the issue or commit to replace __COUNTER__ with %= one
> > day.  If not, then we can probably come up with a reduced test case
> > for the GCC devs to take a look at, then add the FIXME comment to
> > kernel sources.
>
> Please open a PR?

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104236

> > I'm more confident that we can remove the `volatile` keyword (I was
> > thinking about adding a new diagnostic to clang to warn that volatile
> > is redundate+implied for asm goto or inline asm that doesn't have
> > outputs) though that's not the problem here and will probably generate
> > some kernel wide cleanup before we could enable such a flag.
>
> Its main value is that it would discourage users from thinking volatile
> is magic.  Seriously worth some pain!

Yeah, SGTM.

>
> > Perhaps
> > there are known compiler versions that still require the keyword for
> > those cases for some reason.
>
> It was removed from compiler-gcc.h in 3347acc6fcd4 (which changed the
> minimum required GCC version to GCC 5).

```
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index e512f5505dad..b8fe0c23cfff 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -80,11 +80,25 @@ void ftrace_likely_update(struct
ftrace_likely_data *f, int val,

 /* Optimization barrier */
 #ifndef barrier
-# define barrier() __memory_barrier()
+/* The "volatile" is due to gcc bugs */
+# define barrier() __asm__ __volatile__("": : :"memory")
```

I definitely wish there was a comment with a link to what "gcc bugs"
they were referring to; otherwise who knows if it's been fixed...if
they have been...
-- 
Thanks,
~Nick Desaulniers

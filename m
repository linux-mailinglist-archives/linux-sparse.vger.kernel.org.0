Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951C51E6623
	for <lists+linux-sparse@lfdr.de>; Thu, 28 May 2020 17:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404379AbgE1Pa6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 May 2020 11:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404280AbgE1Pa5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 May 2020 11:30:57 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F7BC08C5C6
        for <linux-sparse@vger.kernel.org>; Thu, 28 May 2020 08:30:57 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id u23so2642862otq.10
        for <linux-sparse@vger.kernel.org>; Thu, 28 May 2020 08:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7zLzuBtkzzrfMI0aeJbgJ3mTynJAFHTEFBcwCOtpGB4=;
        b=ayFVSc4tknZaBb6kjVfuGoESqr8Xq6dcYEdaJ9EYB/CHDo1cRre8XtlVTe5Ac6PRjC
         bhiDLe1e23kYgPJgdCrpwN0W+110RYPe8+i7gPm242HiX69t4jlbF3hmMSPNWcToc6xT
         u3IgBxt/ZqJ9Xwe9XRpNtuaCzKx2bio+h5xssFgjiEeY5EfGfon589ZzpEmNMeQOeJYH
         5FY+lpQ22iRZUGCHey4q5F2Z+e0mvk1HL+HN4t4XQgj53TRZFqCv9WBowMLI3Yk2ETU1
         cY+JCeibtRIKFhk7HxBJz2BeJG4+w9/Ydhbqzp7eYwcSdj07sskhs7sSrkP4leBEEQhC
         IxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7zLzuBtkzzrfMI0aeJbgJ3mTynJAFHTEFBcwCOtpGB4=;
        b=HLM++Y6SSQcHfn68Rj+rn0MhCPqUR63MBH5VXnogcNdJLc6+YPf5PfrFNSRtjCaCk0
         z8A5Exi+bBJpFp3GTVgpvuZIDTcpM31yLf0VMaFj4CNxwHRg+vcOknLLEOI5TgcVo0tS
         /PwvzcHpZmFvJyXuqSdmq+RwIIdNJF4uvqqOee7L01mZvFuRYVOzwWm2s1Da8k55wObA
         YertBK0dH+bExfita3vRYxzSLT7YuzfcvdmD6tnXyXg1EcJV4hfcIZXI0sPIiOzgZ3ft
         VkJnpahXQ97xexVJ+ErSR4NpZy0mejWy7zh0acR8zZgS0tPTdxrRSaoE3wX6/lJQVfp6
         mlig==
X-Gm-Message-State: AOAM531UPkKhBx/DO9qrAZT7btn7DYlLhDqT48vfKXoFWlPwUutlxFaE
        lGodHDiYRYtvLyg7xpn+RV5BsGkckgf1dJ1IxAHoGw==
X-Google-Smtp-Source: ABdhPJwjkzjon9XN9rYyLq693qHtAT1Y3xZql7tY5iWA/hIbOjBzUeAegR1TfYFKYdPnKTi/sCLSK//GO3XFncPdzgM=
X-Received: by 2002:a9d:27a3:: with SMTP id c32mr2828481otb.233.1590679855941;
 Thu, 28 May 2020 08:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <202005280727.lXn1VnTw%lkp@intel.com> <20200527235442.GC1805@zn.tnic>
 <20200528075900.GA236442@google.com> <20200528152218.npq53zode7hh7qh4@ltop.local>
In-Reply-To: <20200528152218.npq53zode7hh7qh4@ltop.local>
From:   Marco Elver <elver@google.com>
Date:   Thu, 28 May 2020 17:30:44 +0200
Message-ID: <CANpmjNPOu2rduGN-jbpMi77vsfz2J5q-EPfkvHqr48K9DEcmSQ@mail.gmail.com>
Subject: Re: [tip:locking/kcsan 12/12] /bin/bash: line 1: 61526 Segmentation
 fault sparse ...
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Borislav Petkov <bp@suse.de>, kbuild test robot <lkp@intel.com>,
        kbuild-all@lists.01.org, LKML <linux-kernel@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        linux-sparse@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, 28 May 2020 at 17:22, Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> On Thu, May 28, 2020 at 09:59:00AM +0200, Marco Elver wrote:
> >
> > Ouch. The below should be all we need, assuming it's the best we can do
> > for sparse right now.
>
> Upstream sparse should be OK with it now.

Very good, thank you! For 5.8 we probably still want the ifdef
__CHECKER__, otherwise we might break too many existing workflows. But
hopefully we can remove it again at some point. At the latest when the
kernel deprecates GCC 4.8 support, because then we can just remove the
whole unoptimized __unqual_scalar_typeof() definition.

Thanks,
-- Marco

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE71268AB
	for <lists+linux-sparse@lfdr.de>; Wed, 22 May 2019 18:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729712AbfEVQ56 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 22 May 2019 12:57:58 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44660 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729641AbfEVQ55 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 22 May 2019 12:57:57 -0400
Received: by mail-io1-f68.google.com with SMTP id f22so2417128iol.11
        for <linux-sparse@vger.kernel.org>; Wed, 22 May 2019 09:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3IVTSI+EmZr/tBzjLVeb7Y2OOlUZ5l3PnYfOgMHFQ1I=;
        b=MW1L1AuUyTrHe0W7EZnc4CQevRhP9EMrdZEfs6jAgXkcfreCQ+939UJ05P1ARpnkK0
         SReVLVNvn9ZR/ck/C8WT/bHaJDc95Z+Gy6nXXsyfZs01PVQk8sZmDs9VLi/GSSwvtHl0
         cqWYKHKiKRk57XacweiUVqy7HjjNZXDyMyhv8sGWLohFyypnV29H1xU2CyYqyYvViAqc
         KSzfSL6I9cz4xnKiveB6uJuZ7Z+Lpy5y7R6+pi4om06bRopPaLa+/Rjl0KICg4SGq6r7
         G3oV14ZBcJb9OfP2TFBq+cia5NTu6leVzxqSAU4AmvWs6LD46v9qA6PL52GptcvfiJcZ
         iEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3IVTSI+EmZr/tBzjLVeb7Y2OOlUZ5l3PnYfOgMHFQ1I=;
        b=N/JtQKkfFuqdk6vh9oIAXJS7OfydttHFVkG7PJv0Vm66xO/9cMnB7rT6guTEdV2nYa
         CQTz2b5NjsCMW0FERZbpMA0p5C/jcMZIxmp8GlwQ416m3DIvqG1Mzm1h3Zrvs7ZCXOE5
         2rUGiaCpqUTfWEwnqffo72MkfJNMpxEt3SE0GsyxNa71SD+mGu2QAoG5d9YogUjgw5dm
         1jNsHqCQ+cMmeTUAnerHjNJfe/dLkI4jIQ0C99NoSpVg+Uh1iyHYWHn2D1r5br3376Dl
         U2he8eQplMWICo6aThjrYpzz7m5Hy5jZKvkDKyv8wRMGr1I4K8hvewJ7SLXt1HSCQ8sF
         HP/g==
X-Gm-Message-State: APjAAAV9ipFF4EaeyD5EIZuBVGVzvGvEI7Qz9dDIhe7mmWevTx6rY+Y3
        xXRzyW4Umt36/nJe7AeALPCnezk9k0iaZ8DQK6I=
X-Google-Smtp-Source: APXvYqz8zJpVzQqVeQAs+JRtTfq1uedJ4Uyub8dC+DQ+gpcJDDRzwIvMdjhnpId1ernJd05EZstevTFftsaA2qPsz6M=
X-Received: by 2002:a5d:93cc:: with SMTP id j12mr19151177ioo.147.1558544276627;
 Wed, 22 May 2019 09:57:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190520164214.GA14656@himanshu-Vostro-3559> <20190522091642.GQ31203@kadam>
In-Reply-To: <20190522091642.GQ31203@kadam>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Wed, 22 May 2019 18:57:45 +0200
Message-ID: <CAKXUXMwgEqqQyyBdPwh994w30-qO+qpKWZ4Z2fCUiU88=+1HWQ@mail.gmail.com>
Subject: Re: Sparse context checking Vs Clang Thread Safety analysis
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Himanshu Jha <himanshujha199640@gmail.com>,
        linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Philipp Reisner <philipp.reisner@linbit.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Julia Lawall <Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi Dan, Hi Julia, Hi Phil,

On Wed, May 22, 2019 at 11:16 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
>
> On Mon, May 20, 2019 at 10:12:14PM +0530, Himanshu Jha wrote:
> > o Why do we have so many open warnings for context imbalance ? Or
> >   Why did we stop at some point annotating the codebase ?
> >
>
> What we're looking for here is mostly bugs where we forget to drop the
> lock on an error path.  Sparse isn't a great tool for this because it
> doesn't have very sophisticated flow analysis.
>
> Smatch has decent flow analysis but it too sucks for finding locking
> bugs because I wrote the check_locks.c code 10 years ago.  I said I
> would re-write it seven years ago but I never got around to it.  The
> smatch check doesn't do cross function analysis, for example...
>

So, when we would propose a set of annotations to the kernel that
would allow a combination of multiple tools (coccinelle, smatch, clang
thread safety analysis etc.) to do static analysis of these locking
bugs, there is some support here to get this accepted in the code
base.

Further, I understand now that the locking in sparse has some analysis
imprecision, leading to various false positives, and hence, annotating
the kernel was eventually stopped due to missing success stories (in
addition to the common problem that nobody continued to pick it up at
some point in time).
So, if we can show that we have static analysis tools clearly superior
in its analysis capabilities, coverage and completeness compared to
sparse, we could actually drop the current sparse rules, replace or
remove the sparse annotations and in the further documentation refer
to this new static analysis tools instead, right?

That does sound like a good motivation for us to continue our
investigation to determine if and possibly finally show that we have a
combination of tools that can handle locking bugs statically better
than what sparse is currently offering.

This then makes a good GSoC project to start this activity and
suggests that with further community support this may be continued.

Best regards,

Lukas

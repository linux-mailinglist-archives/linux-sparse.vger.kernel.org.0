Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADAE9183889
	for <lists+linux-sparse@lfdr.de>; Thu, 12 Mar 2020 19:24:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgCLSY0 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 12 Mar 2020 14:24:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40602 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgCLSYZ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 12 Mar 2020 14:24:25 -0400
Received: by mail-lj1-f194.google.com with SMTP id 19so7586139ljj.7
        for <linux-sparse@vger.kernel.org>; Thu, 12 Mar 2020 11:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Xa1t0B7gozrraWAOerWu+HQfdF8r3Sd5I+6kPcu5CM=;
        b=chs6Klac+UK4ZgLoFvEJQ+1HIJwetjRUlkjyYa1BeMsGaXQRQhU8Ldz1zMJ8yDn4wF
         d1mQR6ZTvgOWrIP/KKeAsyvhwrQqzIYorsf1OWAGXELFNqD+YWcfWSAa/EdGNig0hOBC
         AvJA6v24ZijKZpg+HwCRQZk0zLKmgveVUBXOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Xa1t0B7gozrraWAOerWu+HQfdF8r3Sd5I+6kPcu5CM=;
        b=AjYZPv+TSvLiBNB+iHtNNReq+l+CUqUb0vU8gw/ycOaNg8u+Rpdo6ZPYJYv50kDX7g
         nOGGXp7TzwxLl3vnn04E3UTQmeQClEhpNp175lPnKYUx6FnDr+l3XtLpKtxvv60m94fZ
         3sTtm3ZliVLrg4bn0QmBOhoyEwx2Q4xceqDRY/CM+VqhdMLthpbDFcrQkxQzCO2uqgpQ
         TmQSZn1TqmpRgJVWdhpzKoZiUFG3Af/+cLQ9t2j8UTB47+0bUhXuwxtLnFdzqJ09ZOTj
         cb1tGjDkVgiTRt9NN2kZewwYXUtBatbjlxLQX8jKuPE2xJxrX2b5H7PC7u8d3Z15O2zQ
         pTxQ==
X-Gm-Message-State: ANhLgQ1zpMzUGXWCwKN88RBJyRbbBaC4py3eHm7nDzf9rDaG19+0uiwa
        awx2mu5f1Brsm91xYYUDbIAbRdMxZ5k=
X-Google-Smtp-Source: ADFU+vsKiG8KVZOEx+AoAi56ZvReMlVdXc+cG4FJUkaXwkjr4F4ItwTGyxiJfiGdDdjIhdpx4Er2vA==
X-Received: by 2002:a2e:a173:: with SMTP id u19mr6257201ljl.20.1584037463508;
        Thu, 12 Mar 2020 11:24:23 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id j17sm12725680ljc.0.2020.03.12.11.24.22
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 11:24:22 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id d23so7550787ljg.13
        for <linux-sparse@vger.kernel.org>; Thu, 12 Mar 2020 11:24:22 -0700 (PDT)
X-Received: by 2002:a2e:5850:: with SMTP id x16mr5567765ljd.209.1584037462064;
 Thu, 12 Mar 2020 11:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200312150909.GA3403@redhat.com>
In-Reply-To: <20200312150909.GA3403@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 12 Mar 2020 11:24:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiNPBt4wNkfgSd_utshPkjqQv-z7cg5iCji2jbFAUrLkg@mail.gmail.com>
Message-ID: <CAHk-=wiNPBt4wNkfgSd_utshPkjqQv-z7cg5iCji2jbFAUrLkg@mail.gmail.com>
Subject: Re: [PATCH] introduce Wdirective_within_macro
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Mar 12, 2020 at 8:09 AM Oleg Nesterov <oleg@redhat.com> wrote:
>
> When used on linux kernel, sparse issues a lot of "directive in macro's
> argument list" errors, "#if" within a macro invocation is widely used in
> the kernel code.

Ack. Downgrading to a warning is a good thing anyway.

I'd even be ok with making the default be "don't warn", and enable
warnings only if explicitly asked for, or perhaps with "pedantic" (not
that I think sparse cares about pedantic right now).

Yes, it's undefined behavior. But sparse does the right thing, and
it's the better thing to do. And it's not like we're necessarily
always particularly pedantic about some other cases.

Now, the example where somebody _redefined_ a macro inside the macro
expansion, that's a different thing. That's just crazy. Maybe we could
make that "directive in macro argument list" thing be a more nuanced
flag?

             Linus

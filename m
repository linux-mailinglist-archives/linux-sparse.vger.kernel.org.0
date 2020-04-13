Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A01C1A6C82
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 21:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387877AbgDMTdC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 15:33:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387876AbgDMTdB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 15:33:01 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59569C0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 12:33:01 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id t11so7477475lfe.4
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 12:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IG3VWs02WWigWgBqgZZcxVFtQlaMVUg17Cr58dkQGYA=;
        b=N5MMDXbqHPkpfvCg+Rs0GBmLZB20gvViS7pT6VOOklq4xY+McdRnTGgTURWlAMpKAE
         xQrw9bFF/z5mV8BbF0rIMWnBobKyqLuGwvOWJ07alb5TPAFbV0aQvU84Zv3/BB1nGpWx
         U3oPlHQ85ZYDHSShcCAdPvKoRMTInS8oYoB+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IG3VWs02WWigWgBqgZZcxVFtQlaMVUg17Cr58dkQGYA=;
        b=OMqCfaWEk7u4KxqQM9XXrmkPThe9qqtLA1EdWoiyMl9HFXj1UsYWSVC25KRgCaFrtq
         EsbH+ZZz5KHGMDr40JQ+fkb19HgGg1bcHgmNX69aFCqQNLpfUKgbEc60O0ACiI9r0+RG
         8REsRLC6R7z0ZegTd6tKzVpcnMqtYGdLZnopwry2P0YZf/LbuWx2fwkbrtjwNzJOcCzD
         BjPYg9bkqOCrMl2pdO3VB3YvecG+7d8w6o0/45YkVr817302u27pm2JRciGGQauZBVKD
         HVr5XDlmXxIi0PKNBKluDF9XjQnposJ7aTuQLEKlLgRCxXTyebFttrSRIBDDAAaeSRoE
         kEoA==
X-Gm-Message-State: AGi0PuYI+PKlQBEUsNevvoW2zfA1U6ACxtQPUc04r65dAAtaX/Yu8HVo
        M1yc2M7J47BqUm6iUxjdA3aalVupsSg=
X-Google-Smtp-Source: APiQypIh+OOOaWjzUXnmsjEqEYKi7UXB92IuMn+cKPixoE/z/sG802LzH7NZ4xvn/0fOzsNk9mZ9kA==
X-Received: by 2002:a19:f206:: with SMTP id q6mr11574566lfh.85.1586806379306;
        Mon, 13 Apr 2020 12:32:59 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id q9sm9461130ljm.9.2020.04.13.12.32.57
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 12:32:58 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id j14so2114174lfg.9
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 12:32:57 -0700 (PDT)
X-Received: by 2002:a19:7706:: with SMTP id s6mr11173320lfc.31.1586806377447;
 Mon, 13 Apr 2020 12:32:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
 <20200413161605.95900-16-luc.vanoostenryck@gmail.com> <CAHk-=wiy-BFXMpmm9-GNT_WtDKVLeR0ki4OTj83xPk=npuNSHA@mail.gmail.com>
 <20200413185452.pgj75pj5g7a42kik@ltop.local>
In-Reply-To: <20200413185452.pgj75pj5g7a42kik@ltop.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 13 Apr 2020 12:32:41 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjMSeVVQHZ23=HJ3V-yYPooeuHNHmZtexUVRKg_e5VMXA@mail.gmail.com>
Message-ID: <CAHk-=wjMSeVVQHZ23=HJ3V-yYPooeuHNHmZtexUVRKg_e5VMXA@mail.gmail.com>
Subject: Re: [PATCH 15/17] scope: give a scope for labels & gotos
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Apr 13, 2020 at 11:54 AM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> Yes, I agree and in fact (if I understand you correctly) it was what
> I tried first, mainly because it was "conceptualy neat" and simpler.
> But then it wasn't working correctly in all situations and I
> convinced myself it couldn't. The problem was with code like:
>         void foo(void)
>         {
>                 ... = ({ ...  goto out; ... });
>
>         out:
>                 ...;
>         }
>
> In this case, when 'goto out' is parsed, the corresponding label
> symbol would be created in the inner scope and later when the label
> is defined the symbol lookup will only look in the outer scope, see
> nothing and declare another symbol for it

Oh, yeah, I see.

And that's just because of how we basically do the same thing at
"goto" time as we do at "label definition" time.

Both basically create the symbol label.

Which was simple, and worked, and meant that you never had to look
anything up, because they automatically just did the right thing - and
the use and scope is symmetric.

And the reason it does that, is that labels - unlike every other
symbol - aren't declared before use. So it's a hacky solution, and it
works.

And by "it works", I mean "doesn't really work all that well", because
clearly all the _other_ patches in your series were about the fact
that it also meant that we were horrible at the whole "label was never
defined in the first place" case.

But with the scoping change, the use and scope isn't symmetric any
more, and the "create symbol both at use and at definition" doesn't
work.

I _feel_ like the fix to that should be that the only thing that
creates the actual symbol is the label definition, and that the goto
should only ever use the 'ident' and we'd tie the two together later.

But yeah, that "tie the two together later" may not work, simply
because scoping is so tightly tied to parsing in sparse.

So maybe your approach is the best one.

It feels hacky and wrong, but maybe that just fundamentally comes from
labels having that very special "use = implicit declaration" thing.

              Linus

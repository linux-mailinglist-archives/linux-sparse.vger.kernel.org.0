Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 539C22A88D2
	for <lists+linux-sparse@lfdr.de>; Thu,  5 Nov 2020 22:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732264AbgKEVSW (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 5 Nov 2020 16:18:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgKEVSW (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 5 Nov 2020 16:18:22 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06280C0613CF
        for <linux-sparse@vger.kernel.org>; Thu,  5 Nov 2020 13:18:22 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id b1so4362164lfp.11
        for <linux-sparse@vger.kernel.org>; Thu, 05 Nov 2020 13:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZiFHJI1zkfwg9D3GE/EmzSUbWOcAuBecR9eDVV3Fu5w=;
        b=DmgGLzqs1F2wHZHtr36q8aRY1jBTei1mmbIeh2yw6ojd8dqFPrhe/J70z9H3C9B0yi
         PTSz+xuz99+4w9k4wZfd/elLCwRMOo2ri6nNPRRuqnCVW+e2T5myR8oJZj61E3UqbdM9
         A7kLJ/E1bSK5EMAiKhkWhtk7OfrFqlM3AZHOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZiFHJI1zkfwg9D3GE/EmzSUbWOcAuBecR9eDVV3Fu5w=;
        b=LMu5udDpNLCA9Wuzh8qCBVToGDUY3+l+ckjpIJxgeX0V9MWxz3L9rvyGRmf/3Au87k
         WAcZtKeLwbb/eXZCxqkIrESJ5ZX+7vRBkxnwrUsBL3mAEvWlH+vYlksnijkT/oGkpdaX
         2b3gfhqCF7XMMXS5MRaediWDJhRWtdbK/mPnot/w8zi3FFoQjd42AfRZ/oaIwshYIxMc
         L16UwnaoKEULnL5UVBn/PGizMH7DCFOaMqT38YyvmFt3nE5+RPwq8m3/9xzkMuS5lmc4
         n9VR6hJZHJgGz+oqnKfezLw5Q7S8BxTMHo9xujjiNKYCm0fQy5IaKLXsYZM0iO8HTTO7
         VXLQ==
X-Gm-Message-State: AOAM531nqgDk4tGauXY/i/aQVCUmbRA96v3FWw+EDmFettfwZcWeHZgd
        8DaQsXeNtjsKaQWvnsicJUs0SA84qe7o+w==
X-Google-Smtp-Source: ABdhPJyqPL2iAt5sdnqrwGh9wAEmOoIn6rdNCcJrZHiMaPqosx9aXgwify7V9YaimKWheu/d7q4IHw==
X-Received: by 2002:a05:6512:3193:: with SMTP id i19mr1864861lfe.80.1604611100277;
        Thu, 05 Nov 2020 13:18:20 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id t26sm292946lfp.296.2020.11.05.13.18.18
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 13:18:19 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id u18so4348066lfd.9
        for <linux-sparse@vger.kernel.org>; Thu, 05 Nov 2020 13:18:18 -0800 (PST)
X-Received: by 2002:a19:c703:: with SMTP id x3mr1628818lff.105.1604611098053;
 Thu, 05 Nov 2020 13:18:18 -0800 (PST)
MIME-Version: 1.0
References: <4126C08B-532F-4B6A-A3C2-9F7928EA2806@fb.com> <20201105211342.6mglug2a74bi5hvd@ltop.local>
In-Reply-To: <20201105211342.6mglug2a74bi5hvd@ltop.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 5 Nov 2020 13:18:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjgKzHvGYbHpJ6DJj6W73b54QqNK0LSjY-jYdU3kxhWMQ@mail.gmail.com>
Message-ID: <CAHk-=wjgKzHvGYbHpJ6DJj6W73b54QqNK0LSjY-jYdU3kxhWMQ@mail.gmail.com>
Subject: Re: "warning: context imbalance" in kernel/bpf/hashtab.c
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Song Liu <songliubraving@fb.com>,
        "linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Nov 5, 2020 at 1:13 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> Annotations can't fix anything here. The patch [1] changes htab_lock_bucket(),
> into conditionally taking a lock while before it took it unconditionally.
> So, each point where its value is tested now becomes the confluence of 2
> distinct paths: one with the lock taken and one with the lock not taken.
> This is what is meant by 'context imbalance'.

I think the point Song makes is that if sparse did a few more
optimizations, it would see the context imbalance go away, because the
value it tests would become constant.

                 Linus

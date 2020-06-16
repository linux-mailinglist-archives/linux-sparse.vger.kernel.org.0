Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB9D1FBECA
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 21:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgFPTNi (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 16 Jun 2020 15:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729841AbgFPTNi (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 16 Jun 2020 15:13:38 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC019C061573
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 12:13:37 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z9so24928184ljh.13
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 12:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=plFMpgUspsGxwRTZWEu/ZGVsgUmF8Xv0psoGX6HdxLc=;
        b=Zt/Z4TWSqeBhyluOYN6q2eEnWB3q/b5qGvL1RdXC3wAvVrPty9mVx5G7xnpwzwKS9e
         NIhx3SERjSFGI+utP9eqaPM4LVz38WdViXPfvrY6A1+ALCVuLmwXTXzO5709CMg1n07f
         ie3hl5t+3Wx5lrkJQES17NIP1nvfLXz6s38lY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=plFMpgUspsGxwRTZWEu/ZGVsgUmF8Xv0psoGX6HdxLc=;
        b=NnVauIrbJCvPl6pCgalHsxmPlSPmvcKNY8Wsxwep97dAMWPrq7MGyx0xUkmUdOphBD
         tKvl//LpqNkwkYv+c+Dki0jLK4/h4s+R2CsZS8wjtvfxNlaFqo5bXuvM2uiJJl/VqANO
         BlfbpGSkBdA76LP5d8u47epve8dYEDKoHxcj9rzPa/M4oyEFBIbSqlmBeSi3uLs5VpMT
         xY7Cg5OmeImAnSGlFd2whHTkP6lC/JooGJAMMau4OXtF+IJpTrKhE9PCUT6ow11aqkME
         tzaUkERzrYQq7qxU7g8BGBMU/XQeGh5QQZEr2D61OR7iSioUUo8UsvvVWQZt3htRUBqN
         5N2Q==
X-Gm-Message-State: AOAM531Ung0+H4nnA2gQftqIH/I7VXAmRhtZoqvJ8LKGjBkOwNmLGIOB
        CWRU9/y2e1tL5ut/QcUaAooRL2w0XUo=
X-Google-Smtp-Source: ABdhPJxYKQzVhCvaiqcNoXSc2qXnEh3XyhiqsOg8F90JXL5ra5uu6AKzAOFHZnXyDyoB9ZT2+fV1fw==
X-Received: by 2002:a05:651c:1064:: with SMTP id y4mr2324744ljm.180.1592334815533;
        Tue, 16 Jun 2020 12:13:35 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 11sm4551714lju.118.2020.06.16.12.13.34
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2020 12:13:34 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id g2so4827701lfb.0
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 12:13:34 -0700 (PDT)
X-Received: by 2002:ac2:5a4c:: with SMTP id r12mr2519504lfn.10.1592334814269;
 Tue, 16 Jun 2020 12:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200616005012.66141-1-luc.vanoostenryck@gmail.com>
In-Reply-To: <20200616005012.66141-1-luc.vanoostenryck@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 16 Jun 2020 12:13:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=whHKXbJS62Nrcsn6cy0EcHh3PrGbESBkM0MOAjFx-CVsQ@mail.gmail.com>
Message-ID: <CAHk-=whHKXbJS62Nrcsn6cy0EcHh3PrGbESBkM0MOAjFx-CVsQ@mail.gmail.com>
Subject: Re: [PATCH] predefine: add a macro telling about named address spaces
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Jun 15, 2020 at 5:50 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> Sparse supports named address spaces since v0.6.0-rc1.
> This gives much nicer warnings ('... __user' instead of '... <asn:1>')
> but this featres is not yet used in the kernel since it could be
> a problem for people using an older version of Sparse.

Actually, I think it's more that nobody has sent a tested patch.

I don't think it's a big burden to say "you need a newer version of
sparse" for kernel checkers, and in fact a number of the problems
people report then get answered with "update your sparse version"
anyway for other reasons.

In fact, I'd personally like to just make the kernel use _Generic()
everywhere now that we started getting our toes wet, but the fact that
we would have to require gcc-4.9 (instead of gcc-4.8 which is
currently the minimum version) is holding us back.

So I'd be perfectly happy to take a patch to do the ASN names, and to
remove the __CHECKER__ thing that holds us back from using _Generic()
with sparse. And just document that you need to have a recent enough
release..

             Linus

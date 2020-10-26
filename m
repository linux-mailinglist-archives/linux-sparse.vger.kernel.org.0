Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F25129941B
	for <lists+linux-sparse@lfdr.de>; Mon, 26 Oct 2020 18:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1788122AbgJZRl6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 26 Oct 2020 13:41:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40941 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1788121AbgJZRl5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 26 Oct 2020 13:41:57 -0400
Received: by mail-lj1-f193.google.com with SMTP id 23so11136749ljv.7
        for <linux-sparse@vger.kernel.org>; Mon, 26 Oct 2020 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N6eZ8asGSWaNJRTlVJKaDhLMjE8/bJAq2MZ0ekD4X6g=;
        b=AeAFuRraeqZz5d8YOAA8DA1QfybZuP9XAHWSEO5ynfw42p7hacF+tiFh4GFxSb4IeT
         3duNsU6RTOLUrLpBz2jL1dYm8U7yML6Fp1oORukvh1ifny8InAI5YqyWNZ+dzgWnsSgo
         8e99Qh2Ap4qCRxKxbpcPBArRqXRItufUUZJaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N6eZ8asGSWaNJRTlVJKaDhLMjE8/bJAq2MZ0ekD4X6g=;
        b=qoFKdrx5PRBEVGpYBVt739KgDbssyVucP/Ln222ueHa5sxadIMCGsj1J1nMUUYVUob
         uAMQhDd8yqKRQI4dO7GjsNSA3+GCprk+nzqUmiD3+xVZ+uvIe8bJ3mwPVThlvzWIkcwc
         SoHTpM7LG/+tlRFLrbcEM6MVb3dADz0BxECihPP5G3v61uxxjeVQX7PupNpXdvMNp7jy
         vjaapMbyZ3diBtcRVsUgwuYJdoYRddpE2k9FPwyfT6AQEpUibfsVZzHAij1b8bRLO+q6
         OYPPpwQYG2SyrB7f10BeGWMbYSV4+8mBGZXmgP6UOGXt46K04IK9QDrhGeF9KEuecXBt
         GPeg==
X-Gm-Message-State: AOAM530V13jk4w5Wb+zn+wV9gpp35TpvPGnkLAdobsVQu1JoH1XEOyzw
        B9EBv7gaJ6+qCTkDjUfo+HKl09TOzFtDZQ==
X-Google-Smtp-Source: ABdhPJz+K3JB7D99rVDcHLc7Mw0dkaQoDs49TSvk0WRTv7ncMj+4TgKNQkLILoOlyXzwizQvorzCDg==
X-Received: by 2002:a2e:87c6:: with SMTP id v6mr6785206ljj.233.1603734115012;
        Mon, 26 Oct 2020 10:41:55 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id i139sm1100747lfi.276.2020.10.26.10.41.53
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 10:41:53 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id z2so13195430lfr.1
        for <linux-sparse@vger.kernel.org>; Mon, 26 Oct 2020 10:41:53 -0700 (PDT)
X-Received: by 2002:a19:c703:: with SMTP id x3mr5104857lff.105.1603734113269;
 Mon, 26 Oct 2020 10:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201026045338.55218-1-luc.vanoostenryck@gmail.com>
In-Reply-To: <20201026045338.55218-1-luc.vanoostenryck@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 26 Oct 2020 10:41:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wigYApoRH_LS2wu-i7fNp0wF1eJz27od02oo124qXvBjw@mail.gmail.com>
Message-ID: <CAHk-=wigYApoRH_LS2wu-i7fNp0wF1eJz27od02oo124qXvBjw@mail.gmail.com>
Subject: Re: [PATCH] handle more graciously labels with no statement
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Oct 25, 2020 at 9:53 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> This occurs currently on v5.10-rc1 because of some ifdefery.

Well, sparse being more robust is good, so the patch looks sane to me..

But can you point to the actual 5.10-rc1 problem? I haven't seen the
report, and afaik gcc will complain about this too ("label at end of
compound statement") so I'm surprised sparse hits it..

                Linus

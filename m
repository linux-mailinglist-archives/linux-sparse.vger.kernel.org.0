Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79423214ED8
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 21:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727875AbgGETNO (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 15:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgGETNO (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 15:13:14 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1178C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 12:13:13 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id t9so21357195lfl.5
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BtcgvKFopMhYCprPsgwR2dxQcTRIha7drNR8ehitTbk=;
        b=h9XegT/hy2fIVGwTEZnYg3318f+ePPzLL+5bIRMBDGHDrMFLrm4iDAsje76Pf3va/p
         yVdsnFFoLjvdO3ObvkeCVautCy+b4D+SBam2wqM9WTsrPk3uiylYng9VOUfB5EXbbVqW
         A9Ms9NZCN82LXKeBaU3diFw5aAvExkrNXpd8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BtcgvKFopMhYCprPsgwR2dxQcTRIha7drNR8ehitTbk=;
        b=fsvbTfAi6YSoIVr0ZRdrTtWvDlunFe4s+s1b5jYKBNNYrMq/l4qiGQ4LbPnV8DfUan
         b8ZtG1IjgOaEkCLV+rR/MpnqOTAkbVCClJQEYt/22KTDR0vri34aMjB/YZhnp3i5CH6z
         jVKTPKgnC0XkutElEgJzVk6dMosjBqjOJHKcEQMdcwYh7tNnxT4WSOGB8E4978aCn8w4
         uCNfBgL8N5pyfn955jDI4n/MmHNV1ntMF4X8Ja/3LMhBRXM0kEl+H7S2CNdLW1izp59r
         kE8glR9/9d/0yJin7o218zHLk/R0KDenwE/HuwDQC3Y7qtf2ER0LF/v7x0YvRExsX1Zz
         LNbw==
X-Gm-Message-State: AOAM532XlaZGBkLo2qw83omOJF29ZFXJUMj4MEou6kmdhF38AphvjXW3
        Xkz9lu9RwKZO2BnfV9s8BlL8vU+zWRc=
X-Google-Smtp-Source: ABdhPJxQcUedK/FAT1cuHiMlI5glvVofvV5PbQO57zBFCDMnOyHhsSXabweS7+xDXFHa3pj9WfU8/g==
X-Received: by 2002:ac2:4557:: with SMTP id j23mr28689959lfm.124.1593976392069;
        Sun, 05 Jul 2020 12:13:12 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 23sm7386859ljv.129.2020.07.05.12.13.11
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2020 12:13:11 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id g2so21383143lfb.0
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 12:13:11 -0700 (PDT)
X-Received: by 2002:a05:6512:3f1:: with SMTP id n17mr28183758lfq.125.1593976390791;
 Sun, 05 Jul 2020 12:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200705185013.8578-1-davidsondfgl@gmail.com>
In-Reply-To: <20200705185013.8578-1-davidsondfgl@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Jul 2020 12:12:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjqh1KOVWaP=xPZH_9grwDVtCMitWOb4vtKj+cB0jghBw@mail.gmail.com>
Message-ID: <CAHk-=wjqh1KOVWaP=xPZH_9grwDVtCMitWOb4vtKj+cB0jghBw@mail.gmail.com>
Subject: Re: [PATCH] test-inspect: reset locale after gtk_init()
To:     Davidson Francis <davidsondfgl@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Jul 5, 2020 at 11:51 AM Davidson Francis <davidsondfgl@gmail.com> wrote:
>
> The test-inspect tool uses GTK to visualize symbol nodes. It turns
> out that gtk_init() implicitly sets the locale to the system locale,
> and since Sparse uses strtod()/strtold() for parsing floating-point
> numbers in expressions, parsing becomes locale-dependent.

We probably shouldn't be using strtod/strtold in the first place
because of issues like this, but I think your patch is likely the
simplest fix.

It _might_ be a good idea to limit it to LC_NUMERIC instead of LC_ALL,
but who knows.. I'm not sure what else might be affected (and I'm not
sure how good LC_NUMERIC support is on all platforms)

               Linus

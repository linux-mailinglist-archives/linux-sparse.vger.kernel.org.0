Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04B92214E29
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 19:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgGER15 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 13:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgGER15 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 13:27:57 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A027CC061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 10:27:56 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y13so21263639lfe.9
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 10:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jrGT6G0G5sT5xOUIdCU9qWxMdzQthpWsYTCf6aUdbIc=;
        b=h4/XXWip2qRAny3whxdjD52ZMEnRIiAsEvaBVXhhxG4K1IXP14KoN3KGUB8MohsErF
         Ylwvp7YUZjY09VP6cGlUKHKoSzttHaQUJw+aztPNbzojTvKvYnlCxHSNKgUjcV3hwg9t
         Z4+0ZaDv+ZzciG05Ox72C19TCZdqrSi3j4/ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jrGT6G0G5sT5xOUIdCU9qWxMdzQthpWsYTCf6aUdbIc=;
        b=S3KrXfE7FgTEF3SzNln9S6xwUAENcOVZgRuFDzIQbF9wXllg59iuX2gsx6oaCW71QE
         QQvJBmjN3DpbnSmMeBBdlBL77E/JEgmlpFzCPnfrmOF322tyhUsGfukgDivryHOQcdUU
         Zpi8LwAcJLYPQ+oUM+3pKpyrUI8c6CmPV/w30w3Mv5XxcdnFQwPkV2tt3bgMWLE7q0od
         vsnB4gGfCGymJbunU1Xt5Kde1yQstf4a1pRkXk+UlyJ40L1Wv+oE4ufqVN46bP/e0Gel
         pYLQeLKk5aATMupumlN+juzwBTxDjUa/LqoS0b3Q2scQcpkEqVH7npu6eM8yUBZK22mB
         rhrg==
X-Gm-Message-State: AOAM533GkzgT/KuZjg+S/vVLhGkFoNISEFKUPX945SKzOqlIjr/gqLIw
        PybZGcjDYiySWfZCB/0xsqZmFJBfFpQ=
X-Google-Smtp-Source: ABdhPJz8Gzkyq5ESA04vljobhyS/oPMccZDI48VJdWA3mjPHd6GT3klG/mA8W9uQBFwVZTZUWJE2dg==
X-Received: by 2002:a19:ccc5:: with SMTP id c188mr27736105lfg.163.1593970073462;
        Sun, 05 Jul 2020 10:27:53 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id w4sm7338809ljw.16.2020.07.05.10.27.52
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2020 10:27:52 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id h22so35427466lji.9
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 10:27:52 -0700 (PDT)
X-Received: by 2002:a2e:9c92:: with SMTP id x18mr19424862lji.70.1593970072314;
 Sun, 05 Jul 2020 10:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200705130220.26230-1-luc.vanoostenryck@gmail.com> <20200705130220.26230-15-luc.vanoostenryck@gmail.com>
In-Reply-To: <20200705130220.26230-15-luc.vanoostenryck@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Jul 2020 10:27:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh-Eb-LZawa7fH7BOmbq-t8t8GvaY7o9bEW9cGXZgKGsQ@mail.gmail.com>
Message-ID: <CAHk-=wh-Eb-LZawa7fH7BOmbq-t8t8GvaY7o9bEW9cGXZgKGsQ@mail.gmail.com>
Subject: Re: [PATCH 14/15] cleanup: move parsing helpers to parse.c
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Jul 5, 2020 at 6:02 AM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> lib.c contains 2-3 helpers for parsing. Move them to parse.c.

This makes sense, because it's not a "library" function if it's only
used in one place.

HOWEVER.

When doing things like this, please also mark the resulting function
static and remove the declaration from lib.h.

Otherwise it's entirely pointless, I feel.

Either it's a library function that gets used from other places (and
lib.c/lib.h is an appropriate place), or it's a parsing-only helper
function that _doesn't_ get used from other places (and it should be
moved to parse.c and be static).

Not this half-way state that this patch seems to create.

               Linus

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C3BC1A3848
	for <lists+linux-sparse@lfdr.de>; Thu,  9 Apr 2020 18:51:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727185AbgDIQvr (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 9 Apr 2020 12:51:47 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:41785 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbgDIQvr (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 9 Apr 2020 12:51:47 -0400
Received: by mail-lj1-f169.google.com with SMTP id n17so377361lji.8
        for <linux-sparse@vger.kernel.org>; Thu, 09 Apr 2020 09:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fl0ad01KnDLrsWd0PGeInY9sgiIwmKJVXtsz9UPKQpo=;
        b=C0NmQOzLpA7z2ca9+m9hRhVD61N6L9y8sbMu4/tWSa065sSxua0QDaP3r6h8jiprrK
         rknLjSDrnyH956cmJP2zdsstwmTrnpuR8uhDNXGIFInwIPJKlnBGkn/4djq17tqxnJzs
         FbZrNzFg7nmRL5jq5vC0mknsRu47CGx32WjAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fl0ad01KnDLrsWd0PGeInY9sgiIwmKJVXtsz9UPKQpo=;
        b=bg04yFJlC8HyTRilB1GgK30hzChX8zIByTHyKiv/uNTraimY05Oj5O+l09DgGWsij4
         tACmj/WmdMg5gyzf52IDdt7t5v8NOT+3PwqxsDjwL2LVI4cRJlkIXP7DhOowqQhnbz0p
         q2o3q3R5IIn95+4YMz8jG1PaJxHg4J1ZGIcTQaywHDWo6OhaO5avmxYqhPgkHVSANZtp
         LjkFEQZlxzlFKeberWXK6BblrDQW0LN2pYIUmBZiSwsHsQs/SmV0jixr7SSo1FGelTDl
         dwMbWdw78LqaHFLJ5cE7iDF9Nl0+yljnS56libpz4diJO5BvKFgegKh5GukNQ/cKecdN
         tUWA==
X-Gm-Message-State: AGi0PuZm1gjc+1mNdT8LV0oAF+lLLB7cvahEemhvAMhBdP2Ln4pqNm4d
        MvjGE8ymylKmUex9s0H0Wo1zCFuxnR0=
X-Google-Smtp-Source: APiQypIo1E/39QE5S5gKJy07fWVl6q/7y0bvwzceGO2iGpvpPrOw3OLWyoCm2h/aTjUpBHlTnoLV+g==
X-Received: by 2002:a05:651c:452:: with SMTP id g18mr446093ljg.224.1586451105899;
        Thu, 09 Apr 2020 09:51:45 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id e17sm15463524ljo.75.2020.04.09.09.51.45
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 09:51:45 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id i20so394320ljn.6
        for <linux-sparse@vger.kernel.org>; Thu, 09 Apr 2020 09:51:45 -0700 (PDT)
X-Received: by 2002:a2e:7c1a:: with SMTP id x26mr387181ljc.209.1586451104671;
 Thu, 09 Apr 2020 09:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wg=Fs=EecQCNNzofn8+QXuB-sYy9m+YVPAmzDesmqFsbg@mail.gmail.com>
 <20200409062319.ykuewl7z3dc3a55n@ltop.local>
In-Reply-To: <20200409062319.ykuewl7z3dc3a55n@ltop.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 9 Apr 2020 09:51:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgLxBez6hB1t5UQbhpFpwXpASe-+Nqz5_=_Qp1w-9hz9g@mail.gmail.com>
Message-ID: <CAHk-=wgLxBez6hB1t5UQbhpFpwXpASe-+Nqz5_=_Qp1w-9hz9g@mail.gmail.com>
Subject: Re: Interesting (?) failure case
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Apr 8, 2020 at 11:23 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> Yes, the problem is caused at expand_conditional() where one of
> the sides is throwed away if the condition is known. So the label
> doesn't exist anymore and at linearization Sparse ends with a
> jump to an unexisting BB.

Yes.

And I don't think that's really a problem per se. I think the gcc
model of saying "you jumped to an invalid place, go away" is fine -
particularly since this can only happen if you use a gcc extension to
begin with.

So I don't think sparse is wrong, except for the total lack of any
error messages.

> I tried to simply discard the early optimization in expand but
> then when testing the kernel I got a whole bunch of warnings

I don't think we want to get rid of the early tree-level
simplifications. They are sensible and help avoid unnecessary work
later.

So I'd much rather just figure out some way to say "hmm, this goto is
to something that was removed earlier, let's just say so".

> I tried also to warn on gotos jumping into an expression statement.
> The idea was to give a new 'label_scope' for each such statement.
> Things are a bit complicated because the labels are implicitly
> declared by the gotos.

Yes. I think the gcc warning is nice, but I also think that it would
be entirely sufficient to not notice at an early stage, but only when
linearizing and hitting the "I'm branching to something that I can't
generate code for", and report it at that point, instead of being
clever and analyzing scopes up front.

                  Linus

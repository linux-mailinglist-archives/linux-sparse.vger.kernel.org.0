Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1E7153F35
	for <lists+linux-sparse@lfdr.de>; Thu,  6 Feb 2020 08:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727698AbgBFHTG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 6 Feb 2020 02:19:06 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36180 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgBFHTG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 6 Feb 2020 02:19:06 -0500
Received: by mail-lj1-f193.google.com with SMTP id r19so4973646ljg.3
        for <linux-sparse@vger.kernel.org>; Wed, 05 Feb 2020 23:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IOitb46KGiHRBjzMdZ3XQPqKb9puENtrVmffYG8XsR4=;
        b=UL87ZMYlcAYms+gOpVR/NvXME97yvFC4WnCE/AHp2FAmYM2i1rCsvpx7NCOqkghByR
         JZllZRWkjPXl6mrzLBsZLY6nVAvS7lNJabwOvF9xsbAUmGH6qRI7SA67ngpsZmJr3TBD
         Z2bBF2f7Aj56u7f0atQhr7D2ndMxmzNCXjuE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IOitb46KGiHRBjzMdZ3XQPqKb9puENtrVmffYG8XsR4=;
        b=pZJmMOUgNXYzjR4hRaRqAuejfetoY6h0ffvmd8ate0RRdXTsxMbHacysoJqWDbrsR1
         cgm68EYXFzwur2ZqYCXbb3SH2KkqC1TKimQqITfCwLKFwQGBmT6P1MpZjqv9kUbP57Z0
         rgspt3fUY99ZbjyBZSQZr83Tv+e/wddZtaKG7RzH0a6sFq9GO5eZcTHJGI86l7p+lJIp
         tRQN6x3ih6DotuZXgaDfQg9N6HKtobaflaf3/hf3cX6zyraF9jq1RvbEh2pbnglLOMHO
         P11j+SNKJJnybQM9tV67gIDr6Dq0/JhP0LQVoCTkQ6tUJWXDs+GhgbtNtvagAbMvrg74
         ccXg==
X-Gm-Message-State: APjAAAV4Rra6VLmL7VQwrxxfRpeFKDVGRUQjflwXq5v3Hn6JpfXN3XlR
        VnmMhUDM7koVCjpKFtaxZsNrenHBCK8=
X-Google-Smtp-Source: APXvYqyv9TFkZ3NZ7MYNhDv7BKsJmXPjr4ijlPXTULT0J7pTK/BUlCP1S5KsswUK86l/I60aGjVSSA==
X-Received: by 2002:a2e:870b:: with SMTP id m11mr1131717lji.93.1580973543659;
        Wed, 05 Feb 2020 23:19:03 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id w6sm769445lfq.95.2020.02.05.23.19.02
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2020 23:19:02 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id y6so4990098lji.0
        for <linux-sparse@vger.kernel.org>; Wed, 05 Feb 2020 23:19:02 -0800 (PST)
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr1154468lja.16.1580973541849;
 Wed, 05 Feb 2020 23:19:01 -0800 (PST)
MIME-Version: 1.0
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
In-Reply-To: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 6 Feb 2020 07:18:45 +0000
X-Gmail-Original-Message-ID: <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
Message-ID: <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
Subject: Re: sparse problem with Linux kernel v5.5
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Feb 6, 2020 at 4:49 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Also, what is errno 137? (0x89)

I think that's just "killed by signal 9" (the high bit is "killed by
signal", the low bits are the signal number).

SIGKILL - oom? What does 'dmesg' say? Maybe there's some exponential
memory use triggered by something in that bpf_sk_storage file..

                Linus

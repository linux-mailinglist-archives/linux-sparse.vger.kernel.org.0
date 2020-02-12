Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB3A159E10
	for <lists+linux-sparse@lfdr.de>; Wed, 12 Feb 2020 01:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbgBLAg3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 11 Feb 2020 19:36:29 -0500
Received: from mail-lj1-f181.google.com ([209.85.208.181]:46853 "EHLO
        mail-lj1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728041AbgBLAg3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 11 Feb 2020 19:36:29 -0500
Received: by mail-lj1-f181.google.com with SMTP id x14so222738ljd.13
        for <linux-sparse@vger.kernel.org>; Tue, 11 Feb 2020 16:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jhh2XyRihKAXfRBfCbGQ7CRI6abzMIaueaE+j+AoHY8=;
        b=KBJhq0xOZpc6/13xoSyzJ5wkx7rykhb36C1yAnb70MW2MxdP1YZVfbuFxvZchrG37r
         l5kRTLEjZjZfhmUhU8MZIklmhYfq+oWsTRK3haTDUZFIF2Zn1RxLel4Dl6sfSja0Yo8I
         VxwwftJb5LqJGDi+EFrXENvhn7ES2Laj/7u/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jhh2XyRihKAXfRBfCbGQ7CRI6abzMIaueaE+j+AoHY8=;
        b=IzCW1iMNTRRaPldfzhjo6UT5JA66rXksUbhzxXK7ohfJXR2meRKdvB3onuLVg9C7dO
         sn0HVabQh0rqMuF/9mra9q532jhytDEVEUaqrfnXPmNoIfxQaRJq9ZuXsOlxCb//F9vg
         Qm9g+tgX/B5eKsLFPkwuoxI86tVunnJMtvvlJQNHd4MHYymCFQwGoMosYThpmVXSg/OQ
         7GBvtiHAfRYkmV0XV7dwQOdMaNM1cD32Lf96NcjjVMdBItyQWr5rUTei4gFK2uaA5gxz
         Lyc24FqvWSFHD60vfD+jukoHkLrNnx/3OaLqu635RLtsesl6EqKxkxVunMn/8lrQPDsp
         xbLw==
X-Gm-Message-State: APjAAAWx21tWLjVt0iUU/YxjvqKH9HqrHVo2as2LaczNYLROeSjhB75L
        yEKzodRpt5yPmSaI0buF7H3KOoqiF8U=
X-Google-Smtp-Source: APXvYqyzGff6GEQ44hMWMWktB4GRvgmpFVFr0PSihbeyKzL9S34LX8BzArB4Y19UKVmgFGeMvyBE+A==
X-Received: by 2002:a2e:a551:: with SMTP id e17mr6071643ljn.86.1581467787382;
        Tue, 11 Feb 2020 16:36:27 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id b1sm3501589ljp.72.2020.02.11.16.36.26
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 16:36:26 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id z18so284703lfe.2
        for <linux-sparse@vger.kernel.org>; Tue, 11 Feb 2020 16:36:26 -0800 (PST)
X-Received: by 2002:ac2:4839:: with SMTP id 25mr4988491lft.192.1581467786054;
 Tue, 11 Feb 2020 16:36:26 -0800 (PST)
MIME-Version: 1.0
References: <e588417e-1bf4-35e3-d8d9-9911fe29e0f5@pensando.io> <ecdd10cb-0022-8f8a-ec36-9d51b3ae85ee@pensando.io>
In-Reply-To: <ecdd10cb-0022-8f8a-ec36-9d51b3ae85ee@pensando.io>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 11 Feb 2020 16:36:10 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi7jGZ+bVbt-UfXOkpEQdHzF3Z2HBjkGdjh8q4dvPPGWQ@mail.gmail.com>
Message-ID: <CAHk-=wi7jGZ+bVbt-UfXOkpEQdHzF3Z2HBjkGdjh8q4dvPPGWQ@mail.gmail.com>
Subject: Re: smatch/sparse complaints on static assertion
To:     Shannon Nelson <snelson@pensando.io>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Feb 11, 2020 at 9:41 AM Shannon Nelson <snelson@pensando.io> wrote:
>
> drivers/net/ethernet/pensando/ionic/ionic_dev.h:56:1: error: static
> assertion failed: "sizeof(struct ionic_dev_getattr_comp) == 16"

As Luc says, this is because those structures are mis-declared.

See this, for example:

  struct ionic_dev_getattr_comp {
        u8     status;
        u8     rsvd[3];
        union {
                __le64  features;
                u8      rsvd2[11];
        };
        u8     color;
  };

and notice how "__le64  features" is a 64-bit entity but it's in a
union with a "u8 rsvd2[11];".

That makes the whole union align to the same as the __le64 (on x86-32,
that's 32-bit, for bad legacy reasons, on everything else it's
64-bit).

Mark the associated types properly packed individually, rather than
use the disgusting "pragma pack()" that should never be used.

This is not a recent sparse change, it must never have worked.

            Linus

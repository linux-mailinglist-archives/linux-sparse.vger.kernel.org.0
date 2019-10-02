Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E38A5C94D0
	for <lists+linux-sparse@lfdr.de>; Thu,  3 Oct 2019 01:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfJBX1L (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 19:27:11 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44766 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbfJBX1L (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 19:27:11 -0400
Received: by mail-lj1-f195.google.com with SMTP id m13so587559ljj.11
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 16:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K2bEgAKhQcpe92d9ZWUdYuXi8fgnLrYkrbX/62N99B8=;
        b=beNN4uQ+epcK90LaO72kwtH0be3IdL+9IEFs/rBFa8YsB/kK3DwTTrcIua+CKzI2oD
         +KqHjI82WLDwTQEOgl10kmjQXj9oOBMLj9dGv1LcXqfUkms3tugILGa3E2wYX3Fk25JL
         iBUheObRCZxsWe1rOSAPIIO9h9SWXjnbhGpCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K2bEgAKhQcpe92d9ZWUdYuXi8fgnLrYkrbX/62N99B8=;
        b=UIqfylNjFabm2b00+oNNud26OPuuPxthZwH7NAxJD0vd259ZzXgZnouVdIe5u053gY
         G83Nd1LOvD5aT7r/T3TgWlw+Mbl0ENroc+R/qLwq43XZD/UlUGITeSMPjI0/fFRkHI+Z
         wQ2mEFFTqa91ZGvm+JJLgUXUcN5HvWJP/dTh84vYI1+Y7hoa3NH6hUENOSvI/nJhe63e
         ecpXZdO1badSfer8ckD/KcmhsZqNaRdEgEXtaB98oUXNNkqOl7B5pjTaOKl3V0gddXVS
         lNtkzBPzKZ0xoWcTTx7/eU0AucQqqD0iUGlliHLoUqF5aOsEg1vYukhI88uh1SWj4zfy
         0vOQ==
X-Gm-Message-State: APjAAAWUvf0dw7uX9B+52wtXJMZJtEtFE0nNYCwpkQiyANPE40+8JMut
        xNCwMfXmdYuWzF5UyhJ7XKD5w4T8YNw=
X-Google-Smtp-Source: APXvYqzTkzApQn4CLKzBllN8Sy+v/aFOwn+Y7u0hUsOCVAWU/YfKPWbruP5APw1bHJRbjMmCkkACgg==
X-Received: by 2002:a2e:9702:: with SMTP id r2mr4098186lji.190.1570058828277;
        Wed, 02 Oct 2019 16:27:08 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id e21sm89653lfj.10.2019.10.02.16.27.07
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2019 16:27:07 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id a22so655574ljd.0
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 16:27:07 -0700 (PDT)
X-Received: by 2002:a2e:551:: with SMTP id 78mr4156822ljf.48.1570058826978;
 Wed, 02 Oct 2019 16:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
 <20191002212333.51017-1-luc.vanoostenryck@gmail.com> <99173481-dbb9-ee7d-2b03-31aac80980e5@ramsayjones.plus.com>
In-Reply-To: <99173481-dbb9-ee7d-2b03-31aac80980e5@ramsayjones.plus.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 2 Oct 2019 16:26:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=whpCQ8m7TZYE-LBUcZjzTADgBbtuhOWa46xKOWYv70Cnw@mail.gmail.com>
Message-ID: <CAHk-=whpCQ8m7TZYE-LBUcZjzTADgBbtuhOWa46xKOWYv70Cnw@mail.gmail.com>
Subject: Re: [PATCH] void-cond: allow void in conditional expression
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Oct 2, 2019 at 4:11 PM Ramsay Jones <ramsay@ramsayjones.plus.com> wrote:
>
> ... and the fact that such code exists in the kernel is, er,
> somewhat disappointing ... :(

No, I do agree. There's no reason for it in this case anyway, and it
just looks odd.

So I just committed a patch to remove the case that Randy reported.

             Linus

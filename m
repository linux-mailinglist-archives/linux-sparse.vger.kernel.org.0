Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6E88DC89C
	for <lists+linux-sparse@lfdr.de>; Fri, 18 Oct 2019 17:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633200AbfJRPcK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 18 Oct 2019 11:32:10 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37442 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501940AbfJRPcJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 18 Oct 2019 11:32:09 -0400
Received: by mail-lf1-f68.google.com with SMTP id g21so3936349lfh.4
        for <linux-sparse@vger.kernel.org>; Fri, 18 Oct 2019 08:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=htc6+DktT7Y3uD3auBmpX964Gqpp3eQIkOXe0EMRrEM=;
        b=XjWIVFjSz6ga1WAc15MNwGtRsqjuAizeRbLBR+qDU/JmNQalIxeb15P2p6wblxHGiJ
         okv1b5kgGfawN2eTdxq8f/H3KlmOYczAKpLMUGd/da232vCAUcVkSyubf9sHK9JzewVk
         lfeh8fR+XTd8y8oNj8qkk5nI6khRxbHTVmkGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=htc6+DktT7Y3uD3auBmpX964Gqpp3eQIkOXe0EMRrEM=;
        b=sZ1NxVuh53iR9yMfr7p/J95yLTVVcVlnoEzJY5sboMHfv/TX2NolFWGpUQPrigXbQs
         Vju2RgezGySJ4VpLRQw3uhEKX0NnCijIVrc2e3sn8590hIbz+TwXRi40rl0pd4jDH5pv
         YgcYuz/cwanYFazu8R6xJPoTbV0UaET0RW9Wsnb5BDoR9bBA8wBrTd5Iv+U8cEMwEWNq
         j+lbkz4TvsDzfrtvwt7yJOXlxBNro/ZRhS9ez+xmzxzjrY4Gbin4/spDbfnx0LfI0T0+
         hivOrqLl7edKCiHZiRvPLVaeKl7YeKFlv0B0SaX47hx9Av91FRDeuA/LdiU56UOMpsX8
         Oklw==
X-Gm-Message-State: APjAAAWkRULlciNA0MU2/qgkw32zhXfWDdo/EknfGeCW4BGOzMJKWzdG
        4LoZFRTUFgXNf/1MkrycMl86KHRbCxw=
X-Google-Smtp-Source: APXvYqy+TDHlcz3Rc3b5rZW4BJuxm2crtYT6sG4wR0cQdOrCkdqL/pmQogOTNxdwrfdKiFpRShlfqA==
X-Received: by 2002:a19:4849:: with SMTP id v70mr6595922lfa.40.1571412725892;
        Fri, 18 Oct 2019 08:32:05 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id y3sm2451041lfh.97.2019.10.18.08.32.04
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2019 08:32:05 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id y127so5071428lfc.0
        for <linux-sparse@vger.kernel.org>; Fri, 18 Oct 2019 08:32:04 -0700 (PDT)
X-Received: by 2002:a19:f709:: with SMTP id z9mr6504716lfe.170.1571412724682;
 Fri, 18 Oct 2019 08:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <09d824ac-5371-830e-466d-7f78ccdae065@codethink.co.uk>
In-Reply-To: <09d824ac-5371-830e-466d-7f78ccdae065@codethink.co.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 18 Oct 2019 08:31:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiYQ=F5H-uwQvj4eMS3xREmqE6tPuDVVLVML02xaThqVQ@mail.gmail.com>
Message-ID: <CAHk-=wiYQ=F5H-uwQvj4eMS3xREmqE6tPuDVVLVML02xaThqVQ@mail.gmail.com>
Subject: Re: sparse: __pure declaration only
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Oct 18, 2019 at 4:15 AM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> is this a valid warning? if not, should sparse be ignoring these.

It's technically valid, but maybe it's not useful.

If we make sure that any pure bits from a declaration always make it
into the definition, then I suspect that the "was not declared"
warning (if the definition is non-static and seen without a
declaration) is sufficient.

Of course, sparse doesn't actually _care_ about "pure" in the
definition, only in the use, so right now it doesn't even make any
difference to sparse whether the definition has the "pure" or not.
It's only when the function is used that the "pure" matters (it makes
the call instruction be CSE'd like any other random instruction).

               Linus

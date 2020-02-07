Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED78F155D58
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 19:07:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgBGSHx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 13:07:53 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41213 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726951AbgBGSHw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 13:07:52 -0500
Received: by mail-lj1-f194.google.com with SMTP id h23so242665ljc.8
        for <linux-sparse@vger.kernel.org>; Fri, 07 Feb 2020 10:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ii4YAfaJ6LUAXS+i9+EEBAEXwOhLwhmJIesgnXLnmAc=;
        b=A8seTsjAN2EA8ZSrrz51PSagLWek/hwmR0O7d+YjGOF+PvcR+fBXd3sScmJqYpxswW
         JwGl0gcNajX7CahzEl279rJ3HyLZ1EIQmQwVK8gLcrnilFUz/e/rQ8atjgrUgIUdB1mC
         efkR7Ne33pYjbDHvwwqRlu8vrqSOlqu2tnYeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ii4YAfaJ6LUAXS+i9+EEBAEXwOhLwhmJIesgnXLnmAc=;
        b=KXbr0v/Vvh++D1ftUc3nPy3rgXC3LDi9xmSpHiByQzGaM9LDcQoiWWyPQ7JJTtFy1E
         utVyB1+m3yOwWnvc5f7WhjpBvmlqOr4GtIT/RIcZtpZU1NTAv0F/gxcOhiG0Klyb8run
         qYFc8oSdv7TJItBZ9w+RTuNy2Agx2PU5Ynokgu2DmvhfA/KyKl93DY1uR+Wy2wfVtWBD
         WBhx/C8k1wCT0BJ4XyCCmi/zYM4jOM/4MmsugDzYyNEEsyRxi/OdpfZyeNggwEGu1opo
         E2YE0/G+mOtJQxc312zweTxsxPy9bknScfjBgOcUA78kpOr5ZusCAdM4lbR4uLItDjOl
         3lrA==
X-Gm-Message-State: APjAAAWr8mkh3CwCr36F4aO18pGPvyLYbz1ykz9JviyOLX2XvHIXYAMo
        gv2LX3//ieO7ZnStTH6OZEsWtfQJ9s9iPg==
X-Google-Smtp-Source: APXvYqzVhFXUgzg1J0yvOl+LzXdjOBasKRMGFPZrnL/5GSnMkms/fbJ/YfTGHnFBZW7I3LelG2T6Xg==
X-Received: by 2002:a2e:3a12:: with SMTP id h18mr256929lja.81.1581098870041;
        Fri, 07 Feb 2020 10:07:50 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id s22sm1691645ljm.41.2020.02.07.10.07.48
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 10:07:49 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id o15so255256ljg.6
        for <linux-sparse@vger.kernel.org>; Fri, 07 Feb 2020 10:07:48 -0800 (PST)
X-Received: by 2002:a2e:3a13:: with SMTP id h19mr303001lja.16.1581098868657;
 Fri, 07 Feb 2020 10:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20200207081810.3918919-1-kafai@fb.com>
In-Reply-To: <20200207081810.3918919-1-kafai@fb.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 7 Feb 2020 10:07:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wieADOQcYkehVN7meevnd3jZrq06NkmyH9GGR==2rEpuQ@mail.gmail.com>
Message-ID: <CAHk-=wieADOQcYkehVN7meevnd3jZrq06NkmyH9GGR==2rEpuQ@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Improve bucket_log calculation logic
To:     Martin KaFai Lau <kafai@fb.com>
Cc:     bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        David Miller <davem@davemloft.net>, kernel-team@fb.com,
        Linux-Sparse <linux-sparse@vger.kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Netdev <netdev@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Feb 7, 2020 at 12:18 AM Martin KaFai Lau <kafai@fb.com> wrote:
>
> It was reported that the max_t, ilog2, and roundup_pow_of_two macros have
> exponential effects on the number of states in the sparse checker.

Patch looks good, but I'd like to point out that it's not just sparse.

You can see it with a simple

    make net/core/bpf_sk_storage.i
    grep 'smap->bucket_log = ' net/core/bpf_sk_storage.i | wc

and see the end result:

      1  365071 2686974

That's one line (the assignment line) that is 2,686,974 characters in length.

Now, sparse does happen to react particularly badly to that (I didn't
look to why, but I suspect it's just that evaluating all the types
that don't actually ever end up getting used ends up being much more
expensive than it should be), but I bet it's not good for gcc either.

I do think this is a good test-case for sparse. Luc, have you looked
at what it is that then makes sparse use *so* much memory for this one
line?

             Linus

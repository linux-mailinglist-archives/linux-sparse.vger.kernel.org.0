Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6A6156080
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 22:09:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgBGVJx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 16:09:53 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41124 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbgBGVJx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 16:09:53 -0500
Received: by mail-lf1-f68.google.com with SMTP id m30so267885lfp.8
        for <linux-sparse@vger.kernel.org>; Fri, 07 Feb 2020 13:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G6lJ3eVihQzhnpgygVKaGhku6xBoNivJFfNePtZ2oQs=;
        b=TrrZ3kVS5imwLo759RwTKG3OqsyLhZUlxnAA+DnvviLqnGblA3PndVuRaan5cEIn2B
         fDO/Eh0Y9ertNh2QXFLyHH7JFlC/NZfw8IQCgDzbnZWNJJMIDk4r6RxKlVQfHhc4yu/e
         AJBrqOK/YW7HtJ2q3NS8MvmmaiG223SOALKgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G6lJ3eVihQzhnpgygVKaGhku6xBoNivJFfNePtZ2oQs=;
        b=oMgNwUlrWVR2Ql1xRtXx0sv3tu3Is7Yecsou657/4wzTwGS5YK00Swg2f1LVaV9Wib
         oT4+bbzS1750sX+zzOjdgT62kRQrsIEt1iYVN1i3gBNVqlb8Xsc7uM6O2XRlTGptmtEh
         +tDyJaeyFsfyV8ChgYlA68HwXK+CXLvC4TlGY1n1sMa2uSaSAg/Skv9bKLC/UnjjcXzG
         C3Wz+h/+kSW0GEj9Yi/Rj8xIgAPAcv0I4Kc4tpabr7fuGKH0m00ykJBpWmaS+63OjBBW
         +f5XsMgwKpRB3lyvuSkhecp9b8/fQAurB6zoFzB4XULYjx2l30KcwFdIrWqvoLjU2eoX
         JkUw==
X-Gm-Message-State: APjAAAXJorSUJh8Y8WIuqaQxszOxg9aHIDGrMBwxmDLeJIRUguOx7FN5
        yvSwX5ZMTDRjqmFr14NtlGyuC7gt2ZmbKQ==
X-Google-Smtp-Source: APXvYqzS31a5iE/F3SvppjBWkHfaRIv7d7cIlhne7BVhhqihx/BVnXlML6eKWon/4rJKdJs/HCKYXQ==
X-Received: by 2002:ac2:53b9:: with SMTP id j25mr380966lfh.140.1581109790033;
        Fri, 07 Feb 2020 13:09:50 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id z13sm1858216ljh.21.2020.02.07.13.09.48
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2020 13:09:49 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id a13so750814ljm.10
        for <linux-sparse@vger.kernel.org>; Fri, 07 Feb 2020 13:09:48 -0800 (PST)
X-Received: by 2002:a2e:9d92:: with SMTP id c18mr682642ljj.265.1581109788445;
 Fri, 07 Feb 2020 13:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20200207081810.3918919-1-kafai@fb.com> <CAHk-=wieADOQcYkehVN7meevnd3jZrq06NkmyH9GGR==2rEpuQ@mail.gmail.com>
 <20200207201301.wpq4abick4j3rucl@ast-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200207201301.wpq4abick4j3rucl@ast-mbp.dhcp.thefacebook.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 7 Feb 2020 13:09:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgdCXgQyBSSx-ovfiZ7WFR6fStOZ_2R9mxkX3a+R5MkxQ@mail.gmail.com>
Message-ID: <CAHk-=wgdCXgQyBSSx-ovfiZ7WFR6fStOZ_2R9mxkX3a+R5MkxQ@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: Improve bucket_log calculation logic
To:     Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc:     Martin KaFai Lau <kafai@fb.com>, bpf@vger.kernel.org,
        Alexei Starovoitov <ast@kernel.org>,
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

On Fri, Feb 7, 2020 at 12:13 PM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> In addition to this patch I've tried:
> +#define __const_ilog2(n, unique_n) ({                  \
> +       typeof(n) unique_n = (n);                       \

Yeah, as you found out, this doesn't work for the case of having
global initializers or things like array sizes.

Which people do do - often nor directly, but through various size macros.

It's annoying, but one of the failures of C is having a nice form of
compile-time constant handling where you can do slightly smarter
arithmetic. The definition of a "const expression" is very very
limited, and hurts us exactly for the array declaration and constant
initializer case.

Oh well.

          Linus

Return-Path: <linux-sparse+bounces-5-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FE57FA928
	for <lists+linux-sparse@lfdr.de>; Mon, 27 Nov 2023 19:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD4AF1C20299
	for <lists+linux-sparse@lfdr.de>; Mon, 27 Nov 2023 18:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226E43DB82
	for <lists+linux-sparse@lfdr.de>; Mon, 27 Nov 2023 18:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ekc7rlBw"
X-Original-To: linux-sparse@vger.kernel.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219C3B8
	for <linux-sparse@vger.kernel.org>; Mon, 27 Nov 2023 09:26:24 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a0f49b31868so166753066b.3
        for <linux-sparse@vger.kernel.org>; Mon, 27 Nov 2023 09:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1701105982; x=1701710782; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TEU3+aCfiSmQFyVqBrrLYcYFe/sY4vb17c0SHE7wKwE=;
        b=ekc7rlBwFJAJRDepiogJXDsoOH7hkwTYqduMwpRQsRHKfWSY1DjDWwIm8iGu3VxY/O
         LTPg9nSBlM3g2Arh7fJKexaOjQAWHNkNkKNXHJhe22rys0iED93kSy5QvEZ2kI6dxm+P
         IWdK/jxkrpqyf7TmVIffpcM4z29yBUbh+IvY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701105982; x=1701710782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEU3+aCfiSmQFyVqBrrLYcYFe/sY4vb17c0SHE7wKwE=;
        b=bEpQyphAyGbjMq74+v4ZpRV6elnjv/xuO1nYB5hu1YiePKDRo6KTgtIdxZldHM/dVt
         8KiFJ4QYOV0zBQ6S+XExRAINF6FD0Z96Itj5siIMBUdSwGn9WtHvZcVi/Cl/C2MBgTCe
         GjA2L3ydB93ENHjq/dc07FBa5TEQ1Lc5Ii7YWT+6bjgSbMWoWCe5Jxmt4hCMlGh2YZ6O
         yFm62FlDn7Kdg8DORaxvC13m5K1KgUzMJcgV/Ql1nNZ6U8CkCNT7lMQTCSKZC1+zLWma
         ym5jgIX0xPtw5hF1EqCAD0huAwOO6Zjb1IIdN8uw+1diyl23ePZphox/Fp6IToTthkYq
         0cew==
X-Gm-Message-State: AOJu0YwQBJDrn8KGTXySA2SAoLpT2cuunSlKCXVrWAJcThBcbf4UcJn+
	iqNn7IeRi0vOB8QdZBsKPKs14qkRbeiep50Uy5WgFw==
X-Google-Smtp-Source: AGHT+IFKCF52aDZIuu88df64ft6jcQ/pFYeHgvwpWjfXpte1K+ErIXAiAwqHfL0Uk81JQJL5RDyBlQ==
X-Received: by 2002:a17:906:3fc3:b0:9f7:b852:f807 with SMTP id k3-20020a1709063fc300b009f7b852f807mr7149337ejj.9.1701105982314;
        Mon, 27 Nov 2023 09:26:22 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id h4-20020a170906398400b009fd541851f4sm5882970eje.198.2023.11.27.09.26.21
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 09:26:21 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-549070a04baso6148071a12.3
        for <linux-sparse@vger.kernel.org>; Mon, 27 Nov 2023 09:26:21 -0800 (PST)
X-Received: by 2002:a05:6402:2b85:b0:54b:8958:3a3c with SMTP id
 fj5-20020a0564022b8500b0054b89583a3cmr1821041edb.29.1701105981089; Mon, 27
 Nov 2023 09:26:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZUxoJh7NlWw+uBlt@infradead.org> <3423b42d-fc11-4695-89cc-f1e2d625fa90@suswa.mountain>
 <ZWS+LLCggp70Eav3@infradead.org>
In-Reply-To: <ZWS+LLCggp70Eav3@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Nov 2023 09:26:03 -0800
X-Gmail-Original-Message-ID: <CAHk-=whC6fX5U3kfG9zKxw+_G=n=Y0VJYZ-BBF7EQ1KZM2Zb2g@mail.gmail.com>
Message-ID: <CAHk-=whC6fX5U3kfG9zKxw+_G=n=Y0VJYZ-BBF7EQ1KZM2Zb2g@mail.gmail.com>
Subject: Re: sparse feature request: nocast integer types
To: Christoph Hellwig <hch@infradead.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-sparse@vger.kernel.org, 
	linux-xfs@vger.kernel.org, smatch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Nov 2023 at 08:50, Christoph Hellwig <hch@infradead.org> wrote:
>
> Yes, doing it without specific annotations seems like a pain.  I did a
> little prototype with the existing sparse __nocast for one xfs type that
> is not very heavily used, and it actually worked pretty good.
>
> The major painpoint is that 0 isn't treated special, but with that
> fixed the amount of churn is mangable.

I would suggest trying to just treat "__bitwise" as the "nocast" type.
And note that doing a

   typedef uXX __bitwise new_integer_type;

will make a *specific* new integer type that is only compatible with
itself (so not other bitwise types).

Of course, that only works if you are then willing to just use
accessor functions when you actually want to do arithmetic on the
values. If you use a *lot* of arithmetic - as opposed to just passing
values around - it is too painful.

> The next big thing is our stupid 64-bit divison helpers (do_div & co),
> which require helpers to do that case. I'm actually kinda tempted to
> propose that we drop 32-bit support for xfs to get rid of that and a
> lot of other ugly things because of do_div.  That is unless we can
> finally agree that the libgcc division helpes might not be great but
> good enough that we don't want to inflict do_div on folks unless they
> want to optize that case, which would be even better.
>
> Linus, any commens on that?

Some architectures do that, but honestly, we've had *horrendous*
numbers of cases where people did 64x64 divisions without ever
realizing what they did. Having it cause compile failures on x86 -
even if it silently works elsewhere - means that they do get caught
fairly quickly.

Just go to lore, and search for "__divdi3". You will find *tons* of
kernel test robot reports for completely idiotic cases that then never
get to me because of this.

IOW, you may not see it in the resulting kernel, but the reason you
don't see it is *exactly* because we require that do_div() dance for
64-bit divides.

The least one I see is literally from less than a week ago, when media
code tried to do this:

        i = v / (1LL << fraction_bits);

without realizing that a signed 64-bit division is truly *horrendous* here.

So you may never see this, but it's a *constant* churn, and we really
are better for it.  It's not some historical artifact, it's a "the
kernel test robot finds stuff weekly".

                 Linus


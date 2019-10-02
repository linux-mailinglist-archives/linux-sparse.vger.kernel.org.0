Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E557FC8FB3
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 19:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728478AbfJBRUD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 13:20:03 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32846 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbfJBRUC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 13:20:02 -0400
Received: by mail-lj1-f195.google.com with SMTP id a22so17977535ljd.0
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OhwHZM4/MAfbhlAuojboZxbzmv7R5UrLIob+iQHcNHM=;
        b=a68QQxcuZ4UoWwf0/bGCxevV0BpunvutZKBnrePBfJXllNukYHmn+FLZ2GxKl0yUfO
         VeSI5AaeUjK7YNpnlclvT5CcRuMPgrAJ5gITEtdwcqyNxrazyUYQnB8UXpXgsOJG24RY
         sfQdCG4RVoJTQYnVEfYZwi/2LQHF9Ac6SHx94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OhwHZM4/MAfbhlAuojboZxbzmv7R5UrLIob+iQHcNHM=;
        b=qRFKkkeehk02mYN1kQ36jY+5jqnLmgT6mifYucWu+c1rRYpyrfDyBjAgqjis3q2Rh4
         ZyFjOVBWVQ90XGMVgi2mQD0lcSXYVsjCaq/yf+UpRNUT6wgbHfx8LQ5izDPRauviT67g
         9LUMrXspaC4PA2vjVhVnckANkYVlGbpavsW6hLWNuNYYHAiIKxqr8a+t+XdIQgEmpWHy
         obpWpEROzgifJ80B6P6Ksx7eVz5jZy2TCTCqL40XrjhyC5SBKe5WHDncuJyk5pCi3DLy
         bmA6+gS4opppvcvXUjhqqNQ/c3ur+Slfb5fu4sMsU+5I8XIG/hW+p7mMy574PWg2eTmL
         4TrA==
X-Gm-Message-State: APjAAAUFv0ZX4NUMoimNV1UGx9R9wnTWMcGFOVc0HANGSLn1WuBi5i8M
        rJ34L3XGjg3CQfc8IptH7XnndV6TxAI=
X-Google-Smtp-Source: APXvYqxmgNCZ2K8SCb0SoNO2ZAF4ZN4BWP2tb/UnLQE3dtWUcrNanoOHPwrbpF9PiydVJfPHexXDiQ==
X-Received: by 2002:a2e:8052:: with SMTP id p18mr3091958ljg.198.1570036800511;
        Wed, 02 Oct 2019 10:20:00 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id v1sm4714709lfa.87.2019.10.02.10.19.59
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2019 10:19:59 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id q64so17943563ljb.12
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 10:19:59 -0700 (PDT)
X-Received: by 2002:a2e:9241:: with SMTP id v1mr3266940ljg.148.1570036798981;
 Wed, 02 Oct 2019 10:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <74ad3552-ecd8-502e-f8a0-d5e49d11fedb@infradead.org>
In-Reply-To: <74ad3552-ecd8-502e-f8a0-d5e49d11fedb@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 2 Oct 2019 10:19:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
Message-ID: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
Subject: Re: conditional operator ?: usage (Linux kernel)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 1, 2019 at 11:16 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> I don't mind the use of ?: for choosing values, but it seems odd to me
> to use it for calling functions, as in:  [from drivers/clocksource/timer-of.c),
> line 28 in Linux 5.4-rc1):
>
>         of_irq->percpu ? free_percpu_irq(of_irq->irq, clkevt) :
>                 free_irq(of_irq->irq, clkevt);

Ugh. It looks like a gcc extension for when the result of a
conditional expression isn't used.

The result of the conditional expression _should_ be the type of
either side (usual type conversions). And it's fine if *both* sides
are of type 'void', then the result should be of that type too.

But it looks like gcc (and clang) allow one side to be void, and the
result is void.

Hmm.

> gcc doesn't complain about the ?: usage.  Is sparse correct here or is it being
> too strict?

Sparse is correct, but maybe sparse should accept the gcc extension
except when in some strict mode?

We have a (somewhat similar) issue with Wreturn_void - we accept the
syntax "return voidexpr;" in a function returning void, even if the
standard explicitly says that a void function shall have no
expression.

          Linus

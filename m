Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF471A8FF7
	for <lists+linux-sparse@lfdr.de>; Wed, 15 Apr 2020 02:59:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733284AbgDOA7n (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 14 Apr 2020 20:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733273AbgDOA7l (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 14 Apr 2020 20:59:41 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB47C061A0C
        for <linux-sparse@vger.kernel.org>; Tue, 14 Apr 2020 17:59:38 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id w145so1293169lff.3
        for <linux-sparse@vger.kernel.org>; Tue, 14 Apr 2020 17:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2YW/7N/iiE8RbvWXbUqgAlB9JLVU8FirMQeYRgzXPg=;
        b=NJ+kJ4VHWIhYvpmSjfTMVA/D75lkEBLhbGzC3PoO27ERlosMr9PleDps0LuezQCNk1
         OKiHx4E/bGKGgdkdBlSbbJD8GhWTRWH8+d5HrxK7JGSmpPNfAEyfH0aocRjo+j3vvP0R
         ZiguRmy2+EKinNgJRmF7hnEwTRUJ6ihW3G/A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2YW/7N/iiE8RbvWXbUqgAlB9JLVU8FirMQeYRgzXPg=;
        b=U0OpCARXDkAZ/T/PiRjXLs54H3NF2VjaPqUqtWtcLJKgojz/rypNCGNhInjQyPxY1q
         sI5DFmOfSpLmpFC3a6iEXnU+uDSSxm3k8Q1IVRfXnISkKjdT1bK3pHt2seXfrPF3ZKCI
         2Qv9AvFDXm3cBwSDF02xlt2HxJziZ4IfJOscC0BZ1BwkZz4D6SUNWhe+8Ryq3azKDMEm
         /kbHEpurq+OKxHLwc6NKpNfBmpRTgY9VYbEvb5Nx/0pV/hwqKIduSehtJdOR9Lu562m1
         G3dndrEWGMa9bPWIEMsfdMUkVLSToss8q0knJuODFOn0iZrRbqlzdHlqbw0JnOBJoA8k
         cLLA==
X-Gm-Message-State: AGi0Pua+gamo+Att5n4JNaHbtpg/0/dVeYiqC9sIz299oAJSpS4VGfE3
        BVgxXibWRcWeW1PNCJQ+IUbAQIk3OsY=
X-Google-Smtp-Source: APiQypIVaYwNctUZ0G5mQYyJ/Xi9g3LuwYL5dCHq8AC5kL040ZY8nIp5YfCDonKDyAtzsKIEaAIpKw==
X-Received: by 2002:ac2:5559:: with SMTP id l25mr1435392lfk.55.1586912376237;
        Tue, 14 Apr 2020 17:59:36 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id x67sm11344837lfa.76.2020.04.14.17.59.35
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 17:59:35 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id u15so1854819ljd.3
        for <linux-sparse@vger.kernel.org>; Tue, 14 Apr 2020 17:59:35 -0700 (PDT)
X-Received: by 2002:a2e:870f:: with SMTP id m15mr1668146lji.16.1586912374713;
 Tue, 14 Apr 2020 17:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
 <20200413161605.95900-16-luc.vanoostenryck@gmail.com> <CAHk-=wiy-BFXMpmm9-GNT_WtDKVLeR0ki4OTj83xPk=npuNSHA@mail.gmail.com>
 <20200413185452.pgj75pj5g7a42kik@ltop.local> <CAHk-=wjMSeVVQHZ23=HJ3V-yYPooeuHNHmZtexUVRKg_e5VMXA@mail.gmail.com>
 <CAHk-=whNLSTtSsmMD5a6D3s_LtjEYwZPWOSvUdz4mCd5kFO26Q@mail.gmail.com>
 <20200413233900.t7fczyyqrees5gwr@ltop.local> <20200414074934.urvzzgpi2a36jdf2@ltop.local>
 <CAHk-=wiahqumRaQkkcQ_kFhknA9z==DCWNKK-j0GRJH7GUtPEw@mail.gmail.com> <20200414230908.kb44bx5fgu3hzq7r@ltop.local>
In-Reply-To: <20200414230908.kb44bx5fgu3hzq7r@ltop.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 14 Apr 2020 17:59:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=whoCQ9hiNsNS_PKJGt+dxhXng8+YLJ-CzGG0eESfv0f0g@mail.gmail.com>
Message-ID: <CAHk-=whoCQ9hiNsNS_PKJGt+dxhXng8+YLJ-CzGG0eESfv0f0g@mail.gmail.com>
Subject: Re: [PATCH 15/17] scope: give a scope for labels & gotos
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Apr 14, 2020 at 4:09 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> +                       if (s->scope != s->declared_scope) {
>
> This comparison can never succeed for labels declared with __label__
> because s->scope is a block scope and s->declared_scope a label one.

Hold on.. I'm sure I tested it.

Oh.

What I tested wasn't what I sent you, and I'd fixed things due to the
testing but not updated the patch file.

Oops.

The test is supposed to be

                        if (s->declared_scope != label_scope) {

which is the whole point of that 'declared_scope'.

So the concept of the patch is that the 'declared_scope' (and
'label_scope') are the same kind of scope (and comparable): it is the
applicability of the label itself (either the whole function or some
sub-expression statement).

And the the visibility of the -symbol- ends up being different, and is
the s->scope thing.

But while my testing wasn't quite as limited as my wrong-version patch
implied, it _was_ limited. So it might miss some other case.

              Linus

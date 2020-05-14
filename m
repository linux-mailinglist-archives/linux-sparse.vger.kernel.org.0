Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9313D1D4119
	for <lists+linux-sparse@lfdr.de>; Fri, 15 May 2020 00:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbgENWc6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 May 2020 18:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728662AbgENWc6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 May 2020 18:32:58 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C8ACC061A0C
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 15:32:58 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 8so162098lfp.4
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 15:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aRTZNpfDgqCtoWCob+jYBxYztV32cVSeGYQXMKCr+K8=;
        b=bEeNraX837hLt+ZspGiSmjuLQwyEpwjzLSweoon6YDdDAhGL8FA+XgYGS+Zd2B6Ot9
         kqd8HwXLLxV3a1sWb9pF2T9xOz+fGdJbST2AKT3JeN0llO22xBnLhIXkAuRPHErInS7d
         3Te2rbWkvn3RJO8ev8X5U0TXCUomRevrDnHx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aRTZNpfDgqCtoWCob+jYBxYztV32cVSeGYQXMKCr+K8=;
        b=AmV395R0Pe1N776g7A4rb6FfvqTUw2I633MV3O7x+zjexUNZe+iIAtwz3uGHZSEV2g
         MPxt4hRbc6zld57Hx+kYEG9J0oY0OpDeIk25Tx8bGN4qWxZWyNtUcNk6agbofCtlmHWO
         odLIL+2y+bAOqTxs76M8gRr//EuQ8fsNVYKygMAAKe0208zXA9qGeSr6w0xggFATDuia
         Kg+fp0Od4UrWQqNUpIc50Nx5b68LdZrRzwKYtzpg5Ue5JVJek+5I6ObYTZjxU4iPRlGn
         RFdI6Tk/4wd8pb1yu3YnIWRxsHT5S+KVhM9mGNswbhdFXAHeqEm5HF4qUYAP2QXnOxVg
         UFTg==
X-Gm-Message-State: AOAM530yYCQWCG5oLh+rC5+auPVcgvTAMtKg0/owCTvDGmzlpUXiFRkV
        7taYD1aDZUbOCwGCsyIPUTPgRo4dUuU=
X-Google-Smtp-Source: ABdhPJxTnkdUyvkuBVFV1a53xojJ1vJ2DTaiKGOYzWBpYokNUA1D1rCO3WZ5laauYuaxSJk76VaCtQ==
X-Received: by 2002:ac2:5182:: with SMTP id u2mr271112lfi.64.1589495576291;
        Thu, 14 May 2020 15:32:56 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id k22sm115941ljj.85.2020.05.14.15.32.55
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 15:32:55 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id z22so176821lfd.0
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 15:32:55 -0700 (PDT)
X-Received: by 2002:ac2:58c8:: with SMTP id u8mr267022lfo.142.1589495574785;
 Thu, 14 May 2020 15:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200514140451.GD2078@kadam> <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
 <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
In-Reply-To: <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 14 May 2020 15:32:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_1ycEjZGN+qFBP8==XPF-+wsiyJ0=-J5JSMDMxmo32g@mail.gmail.com>
Message-ID: <CAHk-=wh_1ycEjZGN+qFBP8==XPF-+wsiyJ0=-J5JSMDMxmo32g@mail.gmail.com>
Subject: Re: complain about re-declared functions with different modifiers
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, May 14, 2020 at 1:56 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> the static definition of foo() and the extern declaration are
> distinct symbols (in the sense that neither has its sym->same_symbol
> pointing to the other). As far as I understand, this is correct
> because they have a different 'scope'.

So it looks like gcc disagrees.

Gcc thinks they are the same symbol. It allows you to re-define it as
static vs external, but it needs to be defined to the same thing.

So yes, "extern" and "static" have different external visibility, but
the scope of the symbol is the same (file scope), and it's the same
symbol.

I didn't check the standard for how it's supposed to work, but I wrote
this silly test program:


    static int __attribute__((noinline)) external(void) { return 0; }
    static int __attribute__((noinline)) internal(void) { return 1; }

    extern int __attribute__((alias("external"))) a(void);
    static int __attribute__((alias("internal"))) a(void);

    int main(int argc, char **argv)
    {
        return a();
    }

to see which one gcc would pick - if it considered them separate symbols.

And gcc refuses to compile it with

   error: redefinition of =E2=80=98a=E2=80=99

which is admittedly very sane.

So I think sparse is in the wrong here, and we should consider both
external and static symbols to be in the same scope and conflict with
each other unless their declarations match.

                 Linus

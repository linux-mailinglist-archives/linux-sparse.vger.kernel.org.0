Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E931D8D32
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 03:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgESBih (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 21:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbgESBig (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 21:38:36 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713A2C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 18:38:36 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id c12so6331046lfc.10
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 18:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJ1/fns+iZP2eviGKFt6wJBNHGZ+0w2U8G8sxccroGM=;
        b=UTks8pD/tCdr3icX6NdUg7Sy/WZi85b/pkEa0kGG4eW+OT6bCE/MqaKiXKRPkSITAO
         bgsCjYIEd2Do9EQKMrilPVY5Wr0Y27iUt5xY0JTBZX0qvHRut+kylM97kOz5Svl5Mnva
         5lF+fsf2di+dNSjRUk76YksLmRtRijz64NTQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJ1/fns+iZP2eviGKFt6wJBNHGZ+0w2U8G8sxccroGM=;
        b=iJrPlVgF3kq76IaNaVe8C234ErjxPduylyS6y0tmtTPpioyJ0P/6hjT0EB0mjbzspJ
         MfPoVR+4kHvpjpRIabBz6pLf9t+As+M2xKtuZZaLvfjUB0B55VntIAq59q8DUKHa17qh
         +vflB1pwcfJr+Ph1a4Mladi5ZI5FaeBLWkGboN6XO6AJayeTHFzBrtthVeRNqZABKT/L
         cxymnmOstaRXaDMzwA7AgdBChNOvEvcj13Y84GEC5uMnE40C8PtmwyGbp/P0dhYgEoYy
         zB2ZSwrEIoQKbrU1awOGgVkgK9tkpVeRRm5SHV0TXTRABGXEOip7B2IY1NRshUtBBcWF
         kjCQ==
X-Gm-Message-State: AOAM530uoVDW9M4rpeNp648zgzeZu7sj7aKW1Qqd/OszzA8tyqbx9+Dj
        LCeV2tQkftMGzOKNcQI0cb7IJeAvYRA=
X-Google-Smtp-Source: ABdhPJwt5TQcrFx6WIRDnsaFnWGDZoerrMhDMq04ky4dfNCZM9agGNoopukaGdXXnAuY/R94lxR/aw==
X-Received: by 2002:a05:6512:3208:: with SMTP id d8mr6083447lfe.38.1589852314577;
        Mon, 18 May 2020 18:38:34 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id s8sm7899810lfd.61.2020.05.18.18.38.33
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 18:38:33 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id h188so9804141lfd.7
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 18:38:33 -0700 (PDT)
X-Received: by 2002:a19:6e4e:: with SMTP id q14mr13289529lfk.192.1589852313184;
 Mon, 18 May 2020 18:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com> <20200519005728.84594-19-luc.vanoostenryck@gmail.com>
In-Reply-To: <20200519005728.84594-19-luc.vanoostenryck@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 18 May 2020 18:38:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgSBgpXKfMD=yC1B6vH-YxP+6y_KUBuDODXB_i=K7sdNg@mail.gmail.com>
Message-ID: <CAHk-=wgSBgpXKfMD=yC1B6vH-YxP+6y_KUBuDODXB_i=K7sdNg@mail.gmail.com>
Subject: Re: [PATCH v1 18/28] scope: make function_scope invalid outside functions
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, May 18, 2020 at 5:57 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> So, mainly in preparation for some incoming changes, let
> function_scope's parent be NULL instead of the builtin scope.

Hmm. Gcc nested functions?

Sparse doesn't _support_ them, but the symbol nesting part actually
does work, afaik. This looks like it might break it.

Yes, gcc function nesting is disgusting. But it's a thing.

Stupid test-case that almost works with sparse:

    int test(int a, int b)
    {
        inline int nested(int i)
        {
                return a*2 + i;
        }
        return nested(b);
    }

and by "almost works with sparse" I mean that it actually linearizes
correctly, even if it's mostly by mistake, and you get a warning about

    t.c:5:24: warning: unreplaced symbol 'a'

because sparse really doesn't support nested functions and it really
only works because of inlining.

            Linus

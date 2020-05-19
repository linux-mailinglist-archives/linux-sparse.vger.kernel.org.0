Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84C8A1DA323
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 22:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgESU5E (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 16:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgESU5E (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 16:57:04 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C5FC08C5C0
        for <linux-sparse@vger.kernel.org>; Tue, 19 May 2020 13:57:04 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id l5so679429edn.7
        for <linux-sparse@vger.kernel.org>; Tue, 19 May 2020 13:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6mgPWo44IOa7Gf+qSx1FJObt8aZ0lBXlHI0FASeei00=;
        b=Phsr9RPShDowPH4Zdxt2WN8lxFX6nQQXqn0xB/xTbCpKaYYzKIgOkCZYz8LPicD5Zn
         JsHaJ2JW05Il9r1fwgdM4KMHtse0OYWgBsDiI1F5Ea6MraYajDSna2cPWzJ/REh6ZpKF
         jDNyk+EO3ZZ+nOvFoibIPvSpue+TXvg+NYkXN7lER3Xd6Xn8pRQQCQmz0W+DYT/ZW4Cy
         GfwbYJAyDmMJMLrhpw72MfY2h9lQ/JTfL0/d5dl2zREHhTpCaEuNIMuYNoX9MpC4xpvu
         U3ixiR8uvcxbh1c5AgAmJ1fi28EVjfE+2ZypSqtZjeZ8AjAM4E7UrkTewHg8WK7PAUdo
         pNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6mgPWo44IOa7Gf+qSx1FJObt8aZ0lBXlHI0FASeei00=;
        b=XwKMrqrbncuDK2KhfHMfpoU3G3I44IdwxUbEKyKBVmd3PkxOLjgUfdndq45rm8B05C
         4mBMEZB61I3KOi/qp5IJCRptzSfws0tAJTF8EJ3b1SBGHpDwTL58vCgPVVGforQa4B+e
         a7qsvLaTZL2PK/r7dqdsBr8nVmUx6Q3k8gvQKYQt8LzSBjQ8Jky0/thTibV6UxNRe9Mi
         zYGLV96rhusj36dzYcZUISppfVE4oBBEXANFk3mejaSZ44378HBLwAJUzPVP7MSm0v98
         4rTv+84CQ3IXt4G+NHphJG7eQt/AzK6Ge5abVAj+olIWrkRlvBWqy51571AR4kBTpNZW
         OwTQ==
X-Gm-Message-State: AOAM532xibrfNI718srLVJi2qo2pZoGb+NMTPp4WpZzAFBQyqBBJS1WQ
        Igr2r2JTGAvN3P3k+PASxHnIgw7v
X-Google-Smtp-Source: ABdhPJyM5zdMJOZxrXpcp7BBxuVgtt95BRGHuCkXh2prhAYZ27nMdkep9CCcXsgw0uPtK4O9M9DvcA==
X-Received: by 2002:a50:8b06:: with SMTP id l6mr633982edl.190.1589921822770;
        Tue, 19 May 2020 13:57:02 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:d8cf:13ec:5b9:8f3c])
        by smtp.gmail.com with ESMTPSA id be12sm244320edb.11.2020.05.19.13.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 13:57:01 -0700 (PDT)
Date:   Tue, 19 May 2020 22:57:00 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH v1 18/28] scope: make function_scope invalid outside
 functions
Message-ID: <20200519205700.n52dgvp4npgldrey@ltop.local>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-19-luc.vanoostenryck@gmail.com>
 <CAHk-=wgSBgpXKfMD=yC1B6vH-YxP+6y_KUBuDODXB_i=K7sdNg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgSBgpXKfMD=yC1B6vH-YxP+6y_KUBuDODXB_i=K7sdNg@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, May 18, 2020 at 06:38:17PM -0700, Linus Torvalds wrote:
> On Mon, May 18, 2020 at 5:57 PM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > So, mainly in preparation for some incoming changes, let
> > function_scope's parent be NULL instead of the builtin scope.
> 
> Hmm. Gcc nested functions?
> 
> Sparse doesn't _support_ them, but the symbol nesting part actually
> does work, afaik. This looks like it might break it.

Hmm yes. I was barely aware that nested functions were at least parsed
but I had absolutely not internalized that and indeed this patch
assumes that leaving the function will return to the file scope.

But well this patch maybe made some sense at some stage but was
probably a bad idea, even more so with the nested functions.
So I'm dropping it and making the corresponding adjustments
in the next 2 patches.

Thank you for noticing this.

> Yes, gcc function nesting is disgusting. But it's a thing.
> 
> Stupid test-case that almost works with sparse:
> 
>     int test(int a, int b)
>     {
>         inline int nested(int i)
>         {
>                 return a*2 + i;
>         }
>         return nested(b);
>     }
> 
> and by "almost works with sparse" I mean that it actually linearizes
> correctly, even if it's mostly by mistake, and you get a warning about
> 
>     t.c:5:24: warning: unreplaced symbol 'a'
> 
> because sparse really doesn't support nested functions and it really
> only works because of inlining.

I see, interesting. I only saw this "unreplaced symbol" message a very
few tmes and never understood its cause (I don't think it was related
to a nested function but it makes more sense now).

-- Luc

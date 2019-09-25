Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2EAEBD5BE
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2019 02:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389375AbfIYAah (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 24 Sep 2019 20:30:37 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36525 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388529AbfIYAah (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 24 Sep 2019 20:30:37 -0400
Received: by mail-wr1-f67.google.com with SMTP id y19so4119267wrd.3
        for <linux-sparse@vger.kernel.org>; Tue, 24 Sep 2019 17:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QITw1GDj8g6RZsmsxVVVeUjUn2JqC/cPxjZt20P3YsU=;
        b=gDRevbmjJHrq1yUr5p9jSRdDnDjU6X+pybgB7UPNBHX6MUNJqrvXkyCUFt9oBbpShd
         Tj4A8D1fT7hCKbcK9YYZnc8rTIrWE81dTPqsA8B4eq67dsH1jvWGmcXhjCHeuZZuXYLi
         0SF6mV/o9MxHxg2X42DjskpX1mtCPFXOxlt92S3xD3P4iXpmgu8tukGMo0KnSdnp4LrC
         QIcDq5virs9bgK8J2vU1VlEEvkoE3+mZ4DPQDLvGsau7R5g7rWxTHd4+dyaG57x0U62u
         +4/YWh/u57k9QEshMcGC+poh9oE450raZtVejVQXtsUWn1yhS2XnZznU1XXIif7LRE0Q
         R8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QITw1GDj8g6RZsmsxVVVeUjUn2JqC/cPxjZt20P3YsU=;
        b=jE+tL1Mh7/pSeFMVkzAhbq+PZ8T4nmQG4SXgnlolZxRYpiBXYDn4xaBLPB7vhaE0qf
         mQNpKn4ht6WtuNVOh1JsxSNc70+AJWa898CP5xOVtk0wth8w97ixCUQeAVg7i+LM4quQ
         cS0SJz4B4/2nYt0vaVYPfENMZZOd6sY+yEmd1r+jYzxwSXn8RXAIS5jHGv9hO4fG+pQt
         DYg2ckOeWnG+q18e5Y8l7kuTp8wwTGYb7W1AnLKQ/DMp8yUayb3jRx7NNMr0Jx0kcdTR
         NDxf2PzjbyYDs4ABmVrx0olMepS9dLK49x/mEG00ZbKe80n5Zjnja9cPAUefGvW7QbmR
         Or9Q==
X-Gm-Message-State: APjAAAX5T7NE5K9rpB2fRvhZGZA4mfFDMq950Nr1h3WXkZr6jrozK3J1
        McQxb5t2LHq6QuYANDfgpSZzENxE
X-Google-Smtp-Source: APXvYqzZ+0BXr9Zu3Ti09l3xugxh9WlhzW+8nhimn6g2Imk9kHc/aVGx6RG9jnkoi8MpDhtJezVLfQ==
X-Received: by 2002:a5d:558c:: with SMTP id i12mr2865116wrv.8.1569371434926;
        Tue, 24 Sep 2019 17:30:34 -0700 (PDT)
Received: from desk.local ([2a02:a03f:4080:1900:153:592e:a07d:13ca])
        by smtp.gmail.com with ESMTPSA id t30sm658780edt.91.2019.09.24.17.30.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 17:30:34 -0700 (PDT)
Date:   Wed, 25 Sep 2019 02:30:33 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] parse: Fix sign extension in casting enums
Message-ID: <20190925003032.4xhujkifdruryvlk@desk.local>
References: <CAHk-=wiby96wPxF87Fdq=yPVpjBMv+okrAoQUgO+2eCYjWbqPA@mail.gmail.com>
 <20190924070852.GA24834@mwanda>
 <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Sep 24, 2019 at 04:23:34PM -0700, Linus Torvalds wrote:
> On Tue, Sep 24, 2019 at 12:09 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The problem is the sign isn't extended properly when this casts an int
> > to a long.  The expr->ctype has to be the original int ctype for the
> > cast_value() call so that the "value = get_longlong(old);" expansion
> > works correctly.
> 
> What happens if you just remove the
> 
>         if (ctype->bit_size == base_type->bit_size) {
>                 expr->ctype = base_type;
>                 continue;
>         }
> 
> part entirely? IOW, leave just
> 
>         cast_value(expr, base_type, expr, ctype);
>         expr->ctype = base_type;
> 
> in place unconditionally? I _think- that should be the simpler correct
> fix, but I'll leave it to Luc to think about it more.

Yes, I agree. Dan's patch is the obvious one solving the problem
(expr->ctype adjusted too early) but yours should be equivalent since
bit_size check is also done in cast_value(). I still need to run the
tests tough.

That being said, I think that using cast_value() is error-prone:
expr's ctype should probably be changed there. but this will be in
a separate patch anyway.

> That simpler alternate patch attached,

Thanks.
-- Luc

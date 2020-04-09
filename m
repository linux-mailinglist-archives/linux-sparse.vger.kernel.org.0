Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14FDC1A3A92
	for <lists+linux-sparse@lfdr.de>; Thu,  9 Apr 2020 21:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbgDITe1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 9 Apr 2020 15:34:27 -0400
Received: from mail-wm1-f54.google.com ([209.85.128.54]:51844 "EHLO
        mail-wm1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726734AbgDITe0 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 9 Apr 2020 15:34:26 -0400
Received: by mail-wm1-f54.google.com with SMTP id x4so1034476wmj.1
        for <linux-sparse@vger.kernel.org>; Thu, 09 Apr 2020 12:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5L4j0HzgY2wJiwbxruUCKgGb/utPLZOXR1HTyusUXZY=;
        b=f3vUiOxqYkNsbDlkhUxDCn1sey2cgHKe8Tyi/u9vTEb19AZkR6lo+bn5MKIJ5rnOju
         d3N17xm6wuKbvz0YKBiCQp4uQ/NPWFZ22mriAa28BMviczR3PgQDmanP8mYxvb4/Acs8
         OpHYWjc5IdXBjfwL0DyYuHsw7PFgnpzyRDhYqcFcUifuI1hXHx+Ysu1y6slS+I9xmNMC
         PJj8RRK+f+xb33fKo82xButWGVkwjvFqF5GFe0pcr6snfBJ+yinfnMtJY/g/mat+b3Lh
         /YL0jS0+la3k7XtALyUVUoPP7qQYYEke0baNkv2wDWA/YkFgB207giY32RSqi18po7bY
         vayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5L4j0HzgY2wJiwbxruUCKgGb/utPLZOXR1HTyusUXZY=;
        b=gygkXF3mFq0Y1Hl4mAuPBL4TxrXhyx4CZgOiSBjvOcoxqhVrzQpzgiPr6iGT8SEgra
         sWgd5VOCvLr2yjMKDoDLv/pP8co2wWMhPOzcoM6JkcMsAxsrAWKc2GlJqN+w82vEacie
         WgSG2LW01Xy+jizPPtzsHirnADBXaLJ4igdT7VPVPUAclCoBAu4KgrKXxlECSCBS/D/m
         Ew2RW++c0kpMNYxXaoz+36FHwvpxw6SKacp2sqY7CB4xiNLPNZMYGckWRD3gVxROlISt
         iinLbyve5eLp3OWPRR50plsfB5VuaOpzzSH8EhKmU/joJvWf3RBz7ESy2jkMwyl4ztT/
         my8A==
X-Gm-Message-State: AGi0PuZ1qrCKS5vYMKLVBAW7Bt9pY2ru7LAGeh3qhyTV9SxItDIv+heC
        G8T1idisU3+U/HtLSGmwL0RZwdTm
X-Google-Smtp-Source: APiQypKd1cGlL5GUU/QC9uSe1x+bAPSCfLJ0YcMGKtKbpA7FiiQrdTL+i4NTz7of717a63L+70JgsA==
X-Received: by 2002:a1c:2b05:: with SMTP id r5mr1438879wmr.16.1586460865232;
        Thu, 09 Apr 2020 12:34:25 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:7025:ad8:359b:a81])
        by smtp.gmail.com with ESMTPSA id g186sm5283994wmg.36.2020.04.09.12.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 12:34:24 -0700 (PDT)
Date:   Thu, 9 Apr 2020 21:34:21 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: Interesting (?) failure case
Message-ID: <20200409193421.ibvzpbgdl2amk4dx@ltop.local>
References: <CAHk-=wg=Fs=EecQCNNzofn8+QXuB-sYy9m+YVPAmzDesmqFsbg@mail.gmail.com>
 <20200409062319.ykuewl7z3dc3a55n@ltop.local>
 <CAHk-=wgLxBez6hB1t5UQbhpFpwXpASe-+Nqz5_=_Qp1w-9hz9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgLxBez6hB1t5UQbhpFpwXpASe-+Nqz5_=_Qp1w-9hz9g@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Apr 09, 2020 at 09:51:28AM -0700, Linus Torvalds wrote:
> On Wed, Apr 8, 2020 at 11:23 PM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > Yes, the problem is caused at expand_conditional() where one of
> > the sides is throwed away if the condition is known. So the label
> > doesn't exist anymore and at linearization Sparse ends with a
> > jump to an unexisting BB.
> 
> Yes.
> 
> And I don't think that's really a problem per se. I think the gcc
> model of saying "you jumped to an invalid place, go away" is fine -
> particularly since this can only happen if you use a gcc extension to
> begin with.
> 
> So I don't think sparse is wrong, except for the total lack of any
> error messages.
> 
> > I tried to simply discard the early optimization in expand but
> > then when testing the kernel I got a whole bunch of warnings
> 
> I don't think we want to get rid of the early tree-level
> simplifications. They are sensible and help avoid unnecessary work
> later.

Yes, sure. I had hopped to be able to keep the advantages of the
value-expansion while keeping the original information but it
would need quite a bit changes and is certainly not worth this
"jump inside a (discarded) expression statement".
It's interesting, though, that a simple
	if (0) ...stuff... 
can't be discarded at expand time because of the gotos/labels.

> So I'd much rather just figure out some way to say "hmm, this goto is
> to something that was removed earlier, let's just say so".
> 
> > I tried also to warn on gotos jumping into an expression statement.
> > The idea was to give a new 'label_scope' for each such statement.
> > Things are a bit complicated because the labels are implicitly
> > declared by the gotos.
> 
> Yes. I think the gcc warning is nice, but I also think that it would
> be entirely sufficient to not notice at an early stage, but only when
> linearizing and hitting the "I'm branching to something that I can't
> generate code for", and report it at that point, instead of being
> clever and analyzing scopes up front.

Yes, that's certainly much easier and avoids the current garbage with
the IR and the diagnostic will, I think, still be informative enough.

-- Luc

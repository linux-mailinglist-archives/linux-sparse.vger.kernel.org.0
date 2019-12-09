Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8606F11781C
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Dec 2019 22:12:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfLIVM5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 9 Dec 2019 16:12:57 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33536 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbfLIVM5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 9 Dec 2019 16:12:57 -0500
Received: by mail-wm1-f65.google.com with SMTP id y23so794579wma.0
        for <linux-sparse@vger.kernel.org>; Mon, 09 Dec 2019 13:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t/H/M+0/tJkEKzRLwxItc9wp/ejTIQZxU+fnmnrDqOs=;
        b=o3fWTyyJfcV5L0nhaJYNDKus21XzKB3g9Gp0r+IH4UG8/TgLCviuJLLx6IsuF4g7Iw
         4mr0EqNpmOwjdIfpADsxgtrMIMRNIvm8pCi8/oBsn2RWKZyBvL7v4iY6+r4D0QvPJ39i
         a61nr45DDYm42SAha3EI3JZvhhHnm6aUwi5m1A8rDADTiSBuRd1WZqhAGdfzuwY1qClP
         rm14LL6YslAbjoW1dtJRScE1KFn4mVmQ0K1xeEQPL7nWAZWnv2Vmb8NrE2U3FJcfS0c+
         20ctyIEcGh4JHe/ZzHVRZSg9eoyoMV3yUg/OxSfgPYn8HBH7A93b81y5T/tucG5TeD2i
         olnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t/H/M+0/tJkEKzRLwxItc9wp/ejTIQZxU+fnmnrDqOs=;
        b=VjvIKRId3IOn8B5Vs0baNbdFJX6fdXUvBZ9Ax4k5AuVS7GijE0ErlShX8N2HmyrQa/
         zU7OWb9F1Ap1htqHV6PwxjpvP8drx2WNVrywUaTKhfymCoihi8RNGnIzj8wHsE/VCBRk
         uIXpsk3L1xcvVZ57uVzfW2mShJ12EYDwOkCH45Tt1ja3hNcQ9JdNrQiAq5Glx6GP3GpF
         /TSCAy9kENkvBxBoYyp8yqB8ArhWIsNckqs569wK0QMExPXWCj7kobKKVVjbqn6UaRMA
         LJG/n6ZrZaE+QyeZRhMWr4yxMU/Z4gkEnWopIKUIzEbB9czJL6VvE4jmb64+ARSIii4/
         yG3Q==
X-Gm-Message-State: APjAAAXfwCr5brMStfp8IpWq3oqG829GYVbN9SWH/ZvRzniBFsVmj/KQ
        ODQAhuW0WcFwDgK6xZUkNHBhtrX2
X-Google-Smtp-Source: APXvYqzhMHmFyrlbH8TgGSWoc9sVCHnXVRDEZVVHU2Pshk4pRONZGu0b7y6VAAZa63PzUM5cT6gzEQ==
X-Received: by 2002:a05:600c:2117:: with SMTP id u23mr1094551wml.18.1575925975330;
        Mon, 09 Dec 2019 13:12:55 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40f6:4600:a51f:44c:fbfb:c44])
        by smtp.gmail.com with ESMTPSA id l17sm732264wro.77.2019.12.09.13.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 13:12:54 -0800 (PST)
Date:   Mon, 9 Dec 2019 22:12:53 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 0/5] improve diagnostic messages concerning bitfields
Message-ID: <20191209211253.6nm7jaf32tzgia3j@ltop.local>
References: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
 <e6aac4ce-a264-ac7b-dfa2-026eb6a8a532@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6aac4ce-a264-ac7b-dfa2-026eb6a8a532@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Dec 09, 2019 at 05:39:12PM +0000, Ramsay Jones wrote:
> 
> 
> On 08/12/2019 23:19, Luc Van Oostenryck wrote:
> > These few patches contains some fixes or improvements
> > of diagnostic concerning the size of bitfields.
> > 
> > 
> > This series is also available at:
> >   git://github.com/lucvoo/sparse-dev.git bitfield-size
> 
> I tested these patches by applying them on top of current 'master'
> branch (@817270f9). I tested in the usual way (Linux 32-&64-bit and
> cygwin) including a quick run over git source, without issue.
> 
> Today, I noticed that the above branch was based on commit 9b2efc15
> rather than 'master'. I just did a trial merge of 'luc/bitfield-size'
> with 'master' and 'git-diff'ed the result against my tested branch
> head - no difference shown. So, I think we are good! (famous last
> words) ;-)

Yes, I very often have 2 or three topics active at the same time
and I tend to let them 'soak' for a few days. I also tend to not
rebase them without a very good reason. So, it often happens
that a series I post is based on a later version that the
current master. Most of the time the active series are
independents and so their merges are absolutely trivial,
but not always ...

I'll try to use the option '--base' of git format-patch more
systematically (U've begin to use it a bit lately) and return
to my previous good habit of publishing the tree of every series
(I suppose it's always faster than to take them from the emails
of even from patchwork).
 
Anyway, thank you vry much for the testing.
It's pushed now to the main tree.
-- Luc

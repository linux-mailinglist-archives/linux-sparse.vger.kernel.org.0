Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8AF38A42B
	for <lists+linux-sparse@lfdr.de>; Mon, 12 Aug 2019 19:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbfHLRTa (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 12 Aug 2019 13:19:30 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:36658 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfHLRT3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 12 Aug 2019 13:19:29 -0400
Received: by mail-pl1-f195.google.com with SMTP id g4so1646956plo.3
        for <linux-sparse@vger.kernel.org>; Mon, 12 Aug 2019 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jQdWi79UOET3NcbXkAwjygJB1Ir2fsPCLcASHFDPOY4=;
        b=c9m2bRW2HxuvJEovBcFUuEjhkoaeh3/hBEi96hf8jC4GhpACXRSOH0yNlpDL3OIUbE
         vwQd9eJVNG/ktDg4zdgWQ3zTq12opNssQy/H8Pae3V5y22ELcxrwUYkuTDnzLK4GnXc/
         PDJioUs8RXnlaFZFm6PkEx6IwDnD8BzaoJ0CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jQdWi79UOET3NcbXkAwjygJB1Ir2fsPCLcASHFDPOY4=;
        b=o8T9Qu6ZECktvO47CGhj0HxYDItsXMNSgLbfRNkcLBV8XTPSwloxtwN7mjraaQhA4E
         QagLBYAalTuU/Gzb8o/4G8/vmD9H8Azf7P2wHsm4scThqgLKVDLQT3GUoYjFJOdJVWyE
         nus3xz2MrzLM2+QVb5HIDxCH+ljCVspaxxnTF6K8m3Mb424EY5raCbU05lcx6oRVZv2c
         oEmrribBTBUykHIAFGC8dsyNp8pbNw4Xj6wVXxg6chPuPY3m6qknEC2Sqo9KyKH5XUib
         Rga9Qym//M3+xmM998ODHrTb4Vfwn4YHO/J8WCZh4CmjtBQ46/YqHqWP0A2rja1HUG1l
         CkJg==
X-Gm-Message-State: APjAAAXpU0//+WAQk/kHkdNAm3syRC7zOaaj6e9J9Mw2QOsP7+FIZNm5
        pVFk2G7LVbesvaJECltFqAjKvw==
X-Google-Smtp-Source: APXvYqy10JjsFB3axHFNMgROpGcmwPwO4mBb8G1S0iRV3C7gVjicasx85fhT3Py/5umslxym0I5lrg==
X-Received: by 2002:a17:902:b698:: with SMTP id c24mr34036132pls.28.1565630369208;
        Mon, 12 Aug 2019 10:19:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e9sm161724pja.17.2019.08.12.10.19.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 10:19:28 -0700 (PDT)
Date:   Mon, 12 Aug 2019 10:19:27 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Oliver Hartkopp <socketcan@hartkopp.net>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        linux-sparse@vger.kernel.org, Mao Wenan <maowenan@huawei.com>,
        davem@davemloft.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH net-next] net: can: Fix compiling warning
Message-ID: <201908121001.0AC0A90@keescook>
References: <20190802033643.84243-1-maowenan@huawei.com>
 <0050efdb-af9f-49b9-8d83-f574b3d46a2e@hartkopp.net>
 <20190806135231.GJ1974@kadam>
 <6e1c5aa0-8ed3-eec3-a34d-867ea8f54e9d@hartkopp.net>
 <20190807105042.GK1974@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807105042.GK1974@kadam>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Aug 07, 2019 at 01:50:42PM +0300, Dan Carpenter wrote:
> On Tue, Aug 06, 2019 at 06:41:44PM +0200, Oliver Hartkopp wrote:
> > I compiled the code (the original version), but I do not get that "Should it
> > be static?" warning:
> > 
> > user@box:~/net-next$ make C=1
> >   CALL    scripts/checksyscalls.sh
> >   CALL    scripts/atomic/check-atomics.sh
> >   DESCEND  objtool
> >   CHK     include/generated/compile.h
> >   CHECK   net/can/af_can.c
> > ./include/linux/sched.h:609:43: error: bad integer constant expression
> > ./include/linux/sched.h:609:73: error: invalid named zero-width bitfield
> > `value'
> > ./include/linux/sched.h:610:43: error: bad integer constant expression
> > ./include/linux/sched.h:610:67: error: invalid named zero-width bitfield
> > `bucket_id'
> >   CC [M]  net/can/af_can.o
> 
> The sched.h errors suppress Sparse warnings so it's broken/useless now.
> The code looks like this:
> 
> include/linux/sched.h
>    613  struct uclamp_se {
>    614          unsigned int value              : bits_per(SCHED_CAPACITY_SCALE);
>    615          unsigned int bucket_id          : bits_per(UCLAMP_BUCKETS);
>    616          unsigned int active             : 1;
>    617          unsigned int user_defined       : 1;
>    618  };
> 
> bits_per() is zero and Sparse doesn't like zero sized bitfields.

I just noticed these sparse warnings too -- what's happening here? Are
they _supposed_ to be 0-width fields? It doesn't look like it to me:

CONFIG_UCLAMP_BUCKETS_COUNT=5
...
#define UCLAMP_BUCKETS CONFIG_UCLAMP_BUCKETS_COUNT
...
        unsigned int bucket_id          : bits_per(UCLAMP_BUCKETS);

I would expect this to be 3 bits wide. ... Looks like gcc agrees:

struct uclamp_se {
    unsigned int               value:11;             /*     0: 0  4 */
    unsigned int               bucket_id:3;          /*     0:11  4 */
...

So this is a sparse issue?

-- 
Kees Cook

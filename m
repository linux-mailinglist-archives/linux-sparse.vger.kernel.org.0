Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1BE26057
	for <lists+linux-sparse@lfdr.de>; Wed, 22 May 2019 11:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbfEVJVA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 22 May 2019 05:21:00 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:35100 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728584AbfEVJVA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 22 May 2019 05:21:00 -0400
X-IronPort-AV: E=Sophos;i="5.60,498,1549926000"; 
   d="scan'208";a="384228314"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 11:20:42 +0200
Date:   Wed, 22 May 2019 11:20:42 +0200 (CEST)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To:     Dan Carpenter <dan.carpenter@oracle.com>
cc:     Himanshu Jha <himanshujha199640@gmail.com>,
        linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Philipp Reisner <philipp.reisner@linbit.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: Sparse context checking Vs Clang Thread Safety analysis
In-Reply-To: <20190522091642.GQ31203@kadam>
Message-ID: <alpine.DEB.2.20.1905221120050.4390@hadrien>
References: <20190520164214.GA14656@himanshu-Vostro-3559> <20190522091642.GQ31203@kadam>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On Wed, 22 May 2019, Dan Carpenter wrote:

>
> On Mon, May 20, 2019 at 10:12:14PM +0530, Himanshu Jha wrote:
> > o Why do we have so many open warnings for context imbalance ? Or
> >   Why did we stop at some point annotating the codebase ?
> >
>
> What we're looking for here is mostly bugs where we forget to drop the
> lock on an error path.  Sparse isn't a great tool for this because it
> doesn't have very sophisticated flow analysis.
>
> Smatch has decent flow analysis but it too sucks for finding locking
> bugs because I wrote the check_locks.c code 10 years ago.  I said I
> would re-write it seven years ago but I never got around to it.  The
> smatch check doesn't do cross function analysis, for example...
>
> > struct foo {
> > 	struct mutex lock;
> > 	int balance __protected_by(lock);
> > }
> >
> > Can this be done ? Or lock should be global ?
> >
> > Because clang analysis wants it to be global!
>
> A __protected_by() annotation sounds like a good idea.  I don't really
> care about the format too much.  If the information were in a comment
> and we could parse with a perl script that would be fine.  Or we could
> do:
>
> 	struct foo {
> 		struct mutex lock;
> 		__start_protected(lock);
> 		int a, b, c;
> 		__end_protected(lock);
> 	};

That looks really nice :)

julia

>
> In Smatch, I would add an "if (is_probe_function()) return;" and similar
> hacks to silence the majority of false positives.
>
> regards,
> dan carpenter
>

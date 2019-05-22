Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F012615B
	for <lists+linux-sparse@lfdr.de>; Wed, 22 May 2019 12:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbfEVKF3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 22 May 2019 06:05:29 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:12856
        "EHLO mail3-relais-sop.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728638AbfEVKF3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 22 May 2019 06:05:29 -0400
X-IronPort-AV: E=Sophos;i="5.60,498,1549926000"; 
   d="scan'208";a="306842584"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 12:05:26 +0200
Date:   Wed, 22 May 2019 12:05:26 +0200 (CEST)
From:   Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To:     Philipp Reisner <philipp.reisner@linbit.com>
cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Himanshu Jha <himanshujha199640@gmail.com>,
        linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: Sparse context checking Vs Clang Thread Safety analysis
In-Reply-To: <2596650.nKRcJ9SPHD@phil-xps>
Message-ID: <alpine.DEB.2.20.1905221204200.4390@hadrien>
References: <20190520164214.GA14656@himanshu-Vostro-3559> <2109871.T3yqqpU3n3@phil-xps> <alpine.DEB.2.20.1905221136420.4390@hadrien> <2596650.nKRcJ9SPHD@phil-xps>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On Wed, 22 May 2019, Philipp Reisner wrote:

> Am Mittwoch, 22. Mai 2019, 11:37:40 CEST schrieb Julia Lawall:
> > On Wed, 22 May 2019, Philipp Reisner wrote:
> > > Hi,
> > >
> > > [...]
> > >
> > > I love the whole idea, but gave up working on such a things myself.
> > >
> > > > > Because clang analysis wants it to be global!
> > > >
> > > > A __protected_by() annotation sounds like a good idea.  I don't really
> > > > care about the format too much.  If the information were in a comment
> > > > and we could parse with a perl script that would be fine.  Or we could
> > > >
> > > > do:
> > > > 	struct foo {
> > > >
> > > > 		struct mutex lock;
> > > > 		__start_protected(lock);
> > > > 		int a, b, c;
> > > > 		__end_protected(lock);
> > > >
> > > > 	};
> > >
> > > Regarding the syntax I vote for a __protected_by(lock) instead of
> > > __start_protected(lock) / __end_protected(lock).
> >
> > What do you mean exactly, eg in the above example?
> >
>  	struct foo {
>  		struct mutex lock;
>  		int a __protected_by_(lock);
>               int b __protected_by_(lock);
>          };

OK, thanks.  Might the lock be in another structure (eg struct upperfoo)?
So

int a __protected_by_(upperfoo.lock);

julia

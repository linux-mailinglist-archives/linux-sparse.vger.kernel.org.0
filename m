Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C69652614A
	for <lists+linux-sparse@lfdr.de>; Wed, 22 May 2019 12:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729298AbfEVKCj (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 22 May 2019 06:02:39 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:51198 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728602AbfEVKCj (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 22 May 2019 06:02:39 -0400
Received: by mail-wm1-f42.google.com with SMTP id f204so1570698wme.0
        for <linux-sparse@vger.kernel.org>; Wed, 22 May 2019 03:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mauY7O724DmFUU4FHve0pZtKEz+IoJDHIvAtJqKk7N8=;
        b=16iXcZSho56i4HRZ5ElNoTsjij00TIo6ClDQbbjP7N0F9YC1Rrcn9zt+VZbbu1ySJB
         aopGxnE7X7dLpyNqiyLphVVXv1ofjsN9FSC/RAWmkc4k2q8rRgcrUtlbLQ3tbK2k/Pb5
         tMna930vtWMJM3s3ijUyi7zLzLMa6G92p3PyHFx/gD2U600BD0oJTDeI8aHFpJlPpWXN
         rdg7QBVXDEsyrGrBdAwXRbFxmurA5eFSEDtVT7XNpGmZZvjYo2V2ZkN26caGgGINImC5
         hnD2bdZsw2xM3apLr9f9DG3x4EHhu68mMCyBVq2BZVXDZHdkAbby8yZV0E71n/rJCkJT
         ZeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mauY7O724DmFUU4FHve0pZtKEz+IoJDHIvAtJqKk7N8=;
        b=e+ERnWUoVIUwIW/eJ2IBqwcTFPK2hKofYEfee1GPnOXupJqacSLsf1z5eI9k3X0Gnt
         kR0OZgC8MHeuZ7CVHNuNAmLtUnlrqc10AHYBI+HT4IirLAeSmpygpszjDA+VJI3jYeY4
         wZiIiuQOqe0k/U+IhBSAlG52v9xnq1KYeX9SkPlPFZ/SbY0D9DUZieUS2+gmU+muOO00
         eqgf8WTXw3bx5sDpoKY+7VYkRxrgIr6amBiDf5PzEMAfJLFnTnEVKDxG6KjLMhU0BVeT
         raysr1Tf6gizlZ8EXGbGa5nf52EK/6ATNoktFrpFn8x0u1aACn1rzND0K/zCtxLHs3+Z
         1erA==
X-Gm-Message-State: APjAAAVMrvfiA7Ihfqh6eiRkXbDRgkbu4QKWZIxFOb6g+qzNMkbgr9kj
        D+7oP8KpylskTHFUPmop5L2Cd4bFxNdbfg==
X-Google-Smtp-Source: APXvYqyS7j+jjFZT6jswc9gpYP3xeL52o1jjtMpH22lHLKCPAu2MNoX9bmS0PA/SFSjlxDqyr0HMSQ==
X-Received: by 2002:a1c:ed07:: with SMTP id l7mr6552823wmh.148.1558519357160;
        Wed, 22 May 2019 03:02:37 -0700 (PDT)
Received: from phil-xps.localnet ([95.215.121.73])
        by smtp.gmail.com with ESMTPSA id j46sm55311941wre.54.2019.05.22.03.02.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 03:02:36 -0700 (PDT)
From:   Philipp Reisner <philipp.reisner@linbit.com>
To:     Julia Lawall <julia.lawall@lip6.fr>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Himanshu Jha <himanshujha199640@gmail.com>,
        linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: Sparse context checking Vs Clang Thread Safety analysis
Date:   Wed, 22 May 2019 12:02:33 +0200
Message-ID: <2596650.nKRcJ9SPHD@phil-xps>
In-Reply-To: <alpine.DEB.2.20.1905221136420.4390@hadrien>
References: <20190520164214.GA14656@himanshu-Vostro-3559> <2109871.T3yqqpU3n3@phil-xps> <alpine.DEB.2.20.1905221136420.4390@hadrien>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Am Mittwoch, 22. Mai 2019, 11:37:40 CEST schrieb Julia Lawall:
> On Wed, 22 May 2019, Philipp Reisner wrote:
> > Hi,
> > 
> > [...]
> > 
> > I love the whole idea, but gave up working on such a things myself.
> > 
> > > > Because clang analysis wants it to be global!
> > > 
> > > A __protected_by() annotation sounds like a good idea.  I don't really
> > > care about the format too much.  If the information were in a comment
> > > and we could parse with a perl script that would be fine.  Or we could
> > > 
> > > do:
> > > 	struct foo {
> > > 	
> > > 		struct mutex lock;
> > > 		__start_protected(lock);
> > > 		int a, b, c;
> > > 		__end_protected(lock);
> > > 	
> > > 	};
> > 
> > Regarding the syntax I vote for a __protected_by(lock) instead of
> > __start_protected(lock) / __end_protected(lock).
> 
> What do you mean exactly, eg in the above example?
> 
 	struct foo { 	
 		struct mutex lock;
 		int a __protected_by_(lock);
                int b __protected_by_(lock);
         };

cheers,
 Phil



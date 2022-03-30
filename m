Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CED64EBC5B
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Mar 2022 10:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243820AbiC3IJi (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Mar 2022 04:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbiC3IJg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Mar 2022 04:09:36 -0400
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459E02E6A4;
        Wed, 30 Mar 2022 01:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hctkecbqU+WKYrq086q/v84vX7GlKwqVFrfoZacEi7k=;
  b=p3vRG38ENeN0ax0c5BbF3dCt5Z5k4qZO4HMbN4xtmKqVzPDJpbVO8zgg
   j/Tb1c4zGZeB3+gALlkY/eL0GJXkgbiaukPatp6oLaGrsvpFE7+kjRnDj
   5Y7xif8MBMgw8dTIpuL4JMRMwcG5X1zX1ApiwzS7+mZduPH9M5+H358Aw
   s=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,222,1643670000"; 
   d="scan'208";a="29030630"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 10:07:50 +0200
Date:   Wed, 30 Mar 2022 10:07:49 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To:     David Gow <davidgow@google.com>
cc:     Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Latypov <dlatypov@google.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-sparse@vger.kernel.org, cocci@inria.fr,
        smatch@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Dan Carpenter <dan.carpenter@oracle.com>, julia.lawall@inria.fr
Subject: Re: [PATCH v2 2/2] Documentation: dev-tools: Enhance static analysis
 section with discussion
In-Reply-To: <CABVgOSkb5CpnXDF_m7iy=A7RmN+KmY0T38TeZ4hKbmkdQgt6Yw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2203301007190.2592@hadrien>
References: <cover.1648593132.git.marcelo.schmitt1@gmail.com> <11f4750c6d4c175994dfd36d1ff385f68f61bd02.1648593132.git.marcelo.schmitt1@gmail.com> <CABVgOSkb5CpnXDF_m7iy=A7RmN+KmY0T38TeZ4hKbmkdQgt6Yw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

> > +Strong points of Smatch and Coccinelle
> > +--------------------------------------
> > +
> > +Coccinelle is probably the easiest for writing checks. It works before the
> > +pre-compiler so it's easier to check for bugs in macros using Coccinelle.
> > +Coccinelle also writes patches fixes for you which no other tool does.
> > +
> > +With Coccinelle you can do a mass conversion from
>
> (Maybe start this with "For example," just to make it clear that this
> paragraph is mostly following on from how useful it is that Coccinelle
> produces fixes, not just warnings.)

I also suggested "for example", in a different place, but either is fine.

julia

>
> > +``kmalloc(x * size, GFP_KERNEL)`` to ``kmalloc_array(x, size, GFP_KERNEL)``, and
> > +that's really useful. If you just created a Smatch warning and try to push the
> > +work of converting on to the maintainers they would be annoyed. You'd have to
> > +argue about each warning if can really overflow or not.
> > +
> > +Coccinelle does no analysis of variable values, which is the strong point of
> > +Smatch. On the other hand, Coccinelle allows you to do simple things in a simple
> > +way.
> > --
> > 2.35.1
> >
>

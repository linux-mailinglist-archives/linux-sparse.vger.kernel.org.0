Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC3C1D6624
	for <lists+linux-sparse@lfdr.de>; Sun, 17 May 2020 06:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgEQE4n (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 00:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgEQE4n (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 00:56:43 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BAE1C061A0C
        for <linux-sparse@vger.kernel.org>; Sat, 16 May 2020 21:56:41 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id f134so6001425wmf.1
        for <linux-sparse@vger.kernel.org>; Sat, 16 May 2020 21:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dBHE1NmchOK3DTFFTTpxpS/GhBImgfRk7Me03dZYjxs=;
        b=e2QnbOJnEVrN1jj5sz+2vCF/0amYIanpZl6URqgAHT8HG7k2zQKuiRJP/Mg+PicSUE
         FCfGN2g/eiEiZPUl73zSQQBVpoSd591bvBwubqliKtcwWKB+X7QHyMeAAQd29/JeANj2
         rT/ar58crqqgv74yxu/Fu+u8QOQOuFtKGKSGBVDEhkfqKRvx3nUsvEsB+Nh1TbE0lrul
         aDy2km/g2RAPEFF8/T6ZzLlbc/TYwbe7rPSvUF69Bvwl2NnGjyaA5Fxohi2Y+5GRRB+o
         Yarz/QXAso2ssoMY5kFn9fzyCKFfmkM81ge2SuhZO/1q3oCvTpTfK5MA9ZCD0KLwt+js
         ozUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dBHE1NmchOK3DTFFTTpxpS/GhBImgfRk7Me03dZYjxs=;
        b=EvX/KgwchHo0EO1e83AJYJ72ca6owXhlO7EuL9ptnRAJpFFTSkDQ/LCrfVrUfxi+IV
         c0hBby8s5/XkZIvCUKkQfALCULyyxMhDgO26gxUMy5YrilMoZs5yWuVsYP4h1wk6fzjq
         +QC0Yu0jXUGcDjI+NiVxrV4tGAce7Os6lzLE68hhM5f+MH/xJ5GcKwVpHQcDHPd0u3Y0
         3JkVa5FOjMUhOD4aMGJa3IaritSXHsxVSjcFEeTMNzoIbSymhxU8ZIqZNNrrBQUmJip5
         WrJ2AQYYWvk9tV66XEQC4F6dL17yaDQq2/gLo09ztRsmYa5L67jDIwZjAILinTNkOduJ
         wp3Q==
X-Gm-Message-State: AOAM533q3SULm63kSYwnaotGVIyYwkeI9B5G2kZkmcCeu1+PMN0jVXiW
        POj1Osbzvt95Yz0JIqH8Dh8=
X-Google-Smtp-Source: ABdhPJzz+oKC2RgHpokWsL+TDNxJ1VWdNpaBnr2RPGOwQ5HwKCytfGzSXOCmNxU9u+5lW/lF9Is2Fg==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr12871014wmh.31.1589691400030;
        Sat, 16 May 2020 21:56:40 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:d4db:e0a8:fa17:b01f])
        by smtp.gmail.com with ESMTPSA id x17sm10137297wrp.71.2020.05.16.21.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2020 21:56:39 -0700 (PDT)
Date:   Sun, 17 May 2020 06:56:37 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: complain about re-declared functions with different modifiers
Message-ID: <20200517045637.5e4l6pxiuwsimjxf@ltop.local>
References: <20200514140451.GD2078@kadam>
 <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
 <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
 <20200515133617.GF2078@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515133617.GF2078@kadam>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, May 15, 2020 at 04:36:17PM +0300, Dan Carpenter wrote:
> On Thu, May 14, 2020 at 10:56:04PM +0200, Luc Van Oostenryck wrote:
> > Not sure if it's related to Dan's problem or not but with the
> > following code:
> > 
> > 	static inline int foo(void)
> > 	{
> > 		return 1;
> > 	}
> > 	
> > 	extern int foo(void);
> > 	
> > 	int dummy(void)
> > 	{
> > 		return foo();
> > 	}
> > 
> > the static definition of foo() and the extern declaration are
> > distinct symbols (in the sense that neither has its sym->same_symbol
> > pointing to the other). As far as I understand, this is correct
> > because they have a different 'scope'. The problem occurs later,
> > when doing the lookup in dummy(): which symbol should be returned?
> 
> Yeah.  That's it.  When I see the call, I want to parse the statements
> so I need the symbol with the implementation.

There must something else too.
In the example here above I added 'extern' to the second declaration.
But in your first example no storage was given:
	void nvme_put_ctrl(struct nvme_ctrl *ctrl);'
and in this case, Sparse give it the storage/linkage from the previous
declaration which was 'static'.
So in the case, the second occurent has its ->same_symbol set to the
previous static inline version and it's ->definition points to it too.

So, I think everything is correct here regarding Sparse (the question
of a warning is something else: IMO none should be give for a static
declaration/definition followed by a plain declaration (thus implicitly
static) but well if followed by an extern one. One is also when
a static follow an extern or a plain (implicitly extern).

Doesn't smatch uses ->same_symbol and more importantly ->definition?


Regards,
-- Luc

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A08510A72E
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 00:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfKZXmL (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 18:42:11 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55676 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfKZXmK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 18:42:10 -0500
Received: by mail-wm1-f65.google.com with SMTP id a131so812008wme.5
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 15:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=y8jF/UaX++8cdASeMKzBr4sd2oUVptddLyivZ3m0v6E=;
        b=Zbljqn6jbD5Eb9SUKSqiTjubKrt+Yt6WYcuizl8PS2fWMurg+XvYb2aOU7Sh5RdxFt
         DTYIsl2A/TVz59y3bcVVc0OG4unWBJF/9NFa8td+rPqMhxRJiIEav2IHkuCyQfHZUIKx
         s9/e7ZwiiNIMoO/1ounEhWcw2qWWiqtqTGCpAUwLI+IGyD2nzCzJorZbse30WUOnQbPs
         Jc3vw+OU2BvfQeIyV9wG3o/3epX1zPeP8KWKU5E4jV8JCLyY3vUSGiM4/C7nKQgeURXr
         /VBKXa02gJHKA3PuqfOFGybP1lneTZWyrs4rSMbVyf+tPxjlUvYZiut37hPHvmmApqKR
         JXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=y8jF/UaX++8cdASeMKzBr4sd2oUVptddLyivZ3m0v6E=;
        b=Veb4EYR+3xyD3AWVIrtGYKzL7u3D9xOFBq6vCggJCVaJxvA2jSUEbcujSM+9nTLOfW
         xBaQRULPL+jNWWUU7xai+XUv2a8norFJqc3fZTIrbD3iu5/eOIJi6aU5FNm4DfNTzt+R
         1pAzZZCbLfkNusdfIe1Jm/weRsstiZRzsK2sw9La2k/X4ER+ZjP24/vMwSI9myX6eE5G
         MirKVp/hqG4rrue/c5cgRHCm4MqhW4lmpyyiw1TMhpodL4vO7SdeuJon+8/3eTd5o0mu
         wsE6eiVT1+qLTX+sUnDP7SW+OUGaSdXTYXz1zyU7IiuQuW4hbKt8INYMvEHgRXPbTwq5
         QLRA==
X-Gm-Message-State: APjAAAX2qeHHuK9cweQSq7D/3qOmlXSjQ5Kn2wkU3UQlbHzK+w3jqLcu
        zRcAPmBUPdi7/OR2Xa0hYwfYTbBA
X-Google-Smtp-Source: APXvYqzH92Y05zSvGJgKe6+YdN/DMvK5Qonmj8pUMMQ8nLYyll+Ej05LNmlVSfs+902mxGSZwG9lBA==
X-Received: by 2002:a7b:c408:: with SMTP id k8mr1415425wmi.67.1574811728283;
        Tue, 26 Nov 2019 15:42:08 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id r2sm16655841wrp.64.2019.11.26.15.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 15:42:07 -0800 (PST)
Date:   Wed, 27 Nov 2019 00:42:06 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2] let function definition inherit prototype attributes
Message-ID: <20191126234206.mjxgpntlzleqbex5@ltop.local>
References: <20191121131128.7563-1-luc.vanoostenryck@gmail.com>
 <8f474daa-4c17-3012-6cee-d68807d48a6b@ramsayjones.plus.com>
 <20191122221658.3cmkxw35fguvfbvo@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191122221658.3cmkxw35fguvfbvo@ltop.local>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Nov 22, 2019 at 11:16:58PM +0100, Luc Van Oostenryck wrote:
> On Fri, Nov 22, 2019 at 04:23:27PM +0000, Ramsay Jones wrote:
>  
> > So, sparse (with this patch applied) gets it:
> > 
> >   $ ./sparse junk.c
> >   junk.c:7:6: error: symbol 'func0' redeclared with different type (originally declared at junk.c:4) - different modifiers
> >   $
> > 
> > But gcc, not so much:
> > 
> >   $ gcc -c junk.c
> >   $ gcc -Wall -c junk.c
> >   $ gcc -Wall -Wextra -c junk.c
> >   junk.c: In function ‘func0’:
> >   junk.c:7:16: warning: unused parameter ‘a’ [-Wunused-parameter]
> >    void func0(int a)
> >                   ^
> >   $ 
> > 
> > So, I don't know ...

[...]
 
> A priori, though, it seems to me that simply ignoring these function
> attributes when checking the declaration/definition compatibility,
> like it was done in the previous patch, is inferior.
> I'll need to think a bit more about all this.

I'll push this version. I think it's quite sane, better than the
current situation and it's normal for sparse to be more picky
than GCC about these things.

Best regards,
-- Luc

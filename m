Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3591D104261
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 18:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727645AbfKTRqh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 Nov 2019 12:46:37 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37803 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727639AbfKTRqg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 Nov 2019 12:46:36 -0500
Received: by mail-wm1-f65.google.com with SMTP id b17so583312wmj.2
        for <linux-sparse@vger.kernel.org>; Wed, 20 Nov 2019 09:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+Q7l6GIonSlGqXNZTrmhBnjU1va7Vrbr5om4Fpu0fV0=;
        b=G4QC7M4Md4D7H8x/G2Qr+Py2S76hm5G5TXXy5W1AY8l0QbaqGHr1XJtH/XOHq/kG0m
         nID/JRPAwOQmDRVkMDLD0jm3ruwa0DgOo6F86d5TWamxk5J4PHu5s3eonoiSzV44bFMt
         tpsDTAHnCCe8TqIC9SOdsD9+G/phFCn8uYKcQb22P6ZqLFLPTeqr/U2X5wLf60vZKCOu
         j+llgJZmSNcMKjTeV8JIJ7uatNRCtRG/UfC6c3Htn5daiQ95TrbdxG+ZAYv0mAyg1gZY
         vbgNdoiIj1ssEKuYTxu2qsfzdN8+S5lCdR+51vG67ayEqcDxwdM1XvRMvUqaerHvUKEt
         bIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+Q7l6GIonSlGqXNZTrmhBnjU1va7Vrbr5om4Fpu0fV0=;
        b=r6YXzXtGmfW8yWxqsHQHLPbH8U4eOOuFflv7E+VKsdV3kZS46XQ1y6I6gJzC7KEBkH
         okEvZivo6F0UK0xeZ4j+q8LWqz9KOU8wNE7GdCVxPl3MGBIR/sZAhb3XgWNwwvZDWRN3
         waryR/iDfjDi1ZAGpA1BSaafUJydITcfFBOoeEgoXtXGmv0nK5GOC/e1+6azesKwc/7k
         nTl48VCiILa2hMlLfsG7HO1WCW0b+44EIkchcEK8BmuCfxIK7IlGZJ2hNp+erVfSvD7i
         zgwQ91MgomQ0Rt+RA6z6jmNGpHEnOgEucyfbLvDK+WMJMyfLU70bzRfsPeBycWjj/zXN
         P18A==
X-Gm-Message-State: APjAAAWLcFyle7PaHh25eYSUtpqwWxD7duAFX0wbhi6vztOiR7VSdKis
        B0Yg99i8DVFxd3CHGlIm5ys=
X-Google-Smtp-Source: APXvYqxlFlpy+fBZTLVYHvryFKK6H2+ce/f2jPiLp28LRJvwMkfSq+KOYUlP0BkXXjU3aTBWcOknkw==
X-Received: by 2002:a1c:c28a:: with SMTP id s132mr4700510wmf.162.1574271992917;
        Wed, 20 Nov 2019 09:46:32 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40e1:9900:950c:3e8e:b6df:1425])
        by smtp.gmail.com with ESMTPSA id z6sm17887wro.18.2019.11.20.09.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 09:46:32 -0800 (PST)
Date:   Wed, 20 Nov 2019 18:46:31 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 4/5] propagate function modifiers only to functions
Message-ID: <20191120174631.gjdxisf6g3crqiv3@ltop.local>
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
 <20191120000224.30441-5-luc.vanoostenryck@gmail.com>
 <b9aa0b5c-7e65-25ac-898a-a87c5fcaee98@ramsayjones.plus.com>
 <f3185314-1232-1046-ed9d-6ccc4b497d14@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3185314-1232-1046-ed9d-6ccc4b497d14@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 20, 2019 at 01:36:57PM +0000, Ramsay Jones wrote:
> 
> 
> On 20/11/2019 02:13, Ramsay Jones wrote:
> [snip]
> 
> > 
> > Hmm, shouldn't these:
> > 
> >> +	{"const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
> >> +	{"__const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
> >> +	{"__const__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
> > 
> > ... be attr_mod_op? (I'm just reading this in my email client, so I
> > haven't given it much thought, but it just seems wrong ...)
> 
> Of course, as soon as my head hit the pillow, I remembered that
> gcc has a 'const function attribute', somewhat similar to 'pure'.
> (I just looked it up, because I couldn't remember what the
> difference was between 'const' and 'pure'!).
> 
> So, just ignore me! :-D

Hehe, I already had the case at several times when I saw these,
thinking "eh! that cannot possible be correct" and then "ah yes,
these are not for the 'real' const, it's for the other one" ;)

-- Luc

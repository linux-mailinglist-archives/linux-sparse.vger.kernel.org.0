Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1D31DB9BA
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 18:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgETQhp (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 May 2020 12:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgETQhp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 May 2020 12:37:45 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB47C061A0E
        for <linux-sparse@vger.kernel.org>; Wed, 20 May 2020 09:37:45 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id f13so3162161edr.13
        for <linux-sparse@vger.kernel.org>; Wed, 20 May 2020 09:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MUyUbYJYl24wpnPMdLvVCrrx4GCOb6+T34JpvW4Q2Kw=;
        b=e20wosXckHUMhA0TrrlPARDi2r/KfPHx2nxLqLm8d48pfQZRjAKPIZj7GDcU/t4Md8
         t+OCEbHL9G4VLbua3EnhWjS5BpDKQ71qTqrJB7O08upVaE3t4updBl+BJWq1ajjgoJbD
         3Y41dBCPEBrOmh7Sxut7k7uaqc+UdRcp7A8rXhD0hI0Pdkxv5HZwxHRcks+3dltoVmJ9
         3mpy3WVBw4LuItviyrwP3wmhCzlSd0Dt1xomJWfTnXxyfUgI5BFPkUDePFnCpsDRgyl/
         oQOlR87GIIHq8yeBFUpM4xshsIjquaN6OJ7MIkATx/XGlS2mSl1bmsuO88J5FRnfFfJF
         urSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MUyUbYJYl24wpnPMdLvVCrrx4GCOb6+T34JpvW4Q2Kw=;
        b=WjUAgeMCB7zQz30lp4VmqKcebxSBw7nM+HNB6z0W+VXA0ea+eeFb7GmuhxeQEWzvtW
         OqGFKtoCOmWi/2HcuD1p9acyA1hblGval8pxobSnTxriB0TMByEgnsnovDvbx12B54qD
         ZXnV+VnhW3X4uFwu+mhaUEhuvCGqJToUai1TdlsGfLJbjra0aXideKFncO8xmNh6NCZU
         bx6koQZPYDhcmTZ+2Vjc1KaKIH4Pg0O6FQ+Yn9ckUOLR2lRKewxWH/NrehldqeP3p4pF
         0TOaROb9CsNogFdtz3v6slwcH4eJm6WxHbXqbEDBLseQ426xd9eWBrvcJ2FrS0e8bdP6
         6lRg==
X-Gm-Message-State: AOAM5333AvHFRv497o/NHvxq+e9P2ZRauh89almykZERQz0RQm4feDDS
        IYagiqp1YrVfdzM7FkrnaGESNNW7
X-Google-Smtp-Source: ABdhPJyZHto+qBQQIQX7v0m9LmsX8uZ378XcpE6U65ESabHc68z8u08+FDfimq1iGO4meLYwiuWU1g==
X-Received: by 2002:a50:bf04:: with SMTP id f4mr4066192edk.91.1589992663754;
        Wed, 20 May 2020 09:37:43 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:5522:715b:4ca2:a444])
        by smtp.gmail.com with ESMTPSA id m2sm2337156ejb.33.2020.05.20.09.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 09:37:43 -0700 (PDT)
Date:   Wed, 20 May 2020 18:37:42 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 22/28] bad-goto: jumping inside a statemet expression
 is an error
Message-ID: <20200520163742.qvqp6nqwge5ezmoi@ltop.local>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-23-luc.vanoostenryck@gmail.com>
 <0d16af30-3797-3ba8-24b9-5a5697345537@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d16af30-3797-3ba8-24b9-5a5697345537@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, May 20, 2020 at 01:53:51AM +0100, Ramsay Jones wrote:
> On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> > It's invalid to jump inside a statement expression.
> > 
> > So, detect such jumps, issue an error message and mark the
> > function as useless for linearization since the resulting IR
> > would be invalid.

...

> > +static void warn_label_usage(struct position def, struct position use, struct ident *ident)
> 
> you are issuing an error report from this function, so should it be
> called, something like, 'label_usage_error'?

Yes, it's a bit confusing. I hesitated on the name when writting it.
The logic is that most functions in this file (and other files too)
are named following the verb+object pattern and I don't have a good
(short) verb for 'issue an diagnostic message'. 'label_usage_error'
sounds to me more like the name for a variable. In standardese
maybe 'diagnose' could be used but ... no, thanks. The way I see it
is that the verb/action 'warn' can be realized in 2 ways:
issue a warning message or issue an error message.

In fact, I really would prefer to fold this function with its check.
It was how it was written at some stage but the function needed 5
arguments and was quite hard to read.
 
Best regards,
-- Luc

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B90818C3FA
	for <lists+linux-sparse@lfdr.de>; Fri, 20 Mar 2020 00:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgCSXzV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 19 Mar 2020 19:55:21 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44350 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbgCSXzV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 19 Mar 2020 19:55:21 -0400
Received: by mail-wr1-f66.google.com with SMTP id o12so4923273wrh.11
        for <linux-sparse@vger.kernel.org>; Thu, 19 Mar 2020 16:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xWB1FLRqKC3XoX4qSBrU6Lpzkgp1JMvfznMJTsJZFB8=;
        b=EMp6SdsG8vK9BBr5aZV8KU+PJy5z3kKJkgYuN7FEzJJE12Kpm8zoDVuSpvRV2IW/eY
         mmPfmr8Ye6UEE53XsCxWWomjN+BVNyeR/dxoiSvD4YxzItUUOfiJrW4TDAr0oxBSqPxV
         u9d26eLnJI2f/wuOTzPhU7lR4DcwKMVBZsQ3P6KuDtGE8zFbwW0HcUcSxID2qfRAGFDJ
         1zyA+vsZf5BiUtSbabT51vY4QLs8n9djStZATt6dKf3cQ/frAn9Ff1lSsC+u+HBl2OG1
         P5NH4ZNVuj/Wyf18OH89ERoWzmlK7LTAE47mADQOtL8aeXpmr8kl/6epc1opiTqzCY1r
         DXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xWB1FLRqKC3XoX4qSBrU6Lpzkgp1JMvfznMJTsJZFB8=;
        b=tBAeSpAvIlof+7uPQvozZzFovpqP0+ey8dV9cHTeGFVrXcHWeU/NkdmrXON5xXQN65
         Smn2M7WWpmzz4uwNZUib8QLtHsa82GEyjvcc1DCWaajto15XS+o2SoDISOCSv/VJThZm
         rvsBj4awlFxi/Mk53kwbUMvAuW9xqOylaSQ6EqrC3vi3Gy92j1Oaylcvnikc5upCqIP+
         boctriJg5/Vid6zrsmBcgmgil46PZslvwP/7Y8DznrHHkk9GKuLL+9M/0JFEEsXId3d0
         KmcsE3hBIcu4BtTBt3nBNU+ewnsNOdwF1yMVYoRMut6ng/FfXA6EksJjiMinlXtHS4Vs
         nVOg==
X-Gm-Message-State: ANhLgQ1t9TEWelZwwUoGkJlMaXwT+YZfe2MeyKinM2jzqv4q63DUw0OX
        Ez+IHKqalPZ6qFQHmMl9QEpBH7yx
X-Google-Smtp-Source: ADFU+vuZQ2vfdvqld9sSOQHXzS63omY4T3zHjYSE2ArtErKQYvuGdL9eHHflKpMucyBSveQjtM1tnA==
X-Received: by 2002:adf:a54a:: with SMTP id j10mr7485988wrb.188.1584662089567;
        Thu, 19 Mar 2020 16:54:49 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:5d24:5e71:7acd:6955])
        by smtp.gmail.com with ESMTPSA id f187sm5734971wme.31.2020.03.19.16.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 16:54:48 -0700 (PDT)
Date:   Fri, 20 Mar 2020 00:54:48 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 1/5] add testcases for OP_UNREACH
Message-ID: <20200319235448.j4l72vgoo6sl64tn@ltop.local>
References: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
 <20200318173120.63939-2-luc.vanoostenryck@gmail.com>
 <48b264ee-c07f-9545-ba92-04934aca9752@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48b264ee-c07f-9545-ba92-04934aca9752@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Mar 19, 2020 at 10:24:28PM +0000, Ramsay Jones wrote:
> On 18/03/2020 17:31, Luc Van Oostenryck wrote:
> > diff --git a/validation/linear/builtin_unreachable0.c b/validation/linear/builtin_unreachable0.c
> > new file mode 100644
> > index 000000000000..5da9d074ae5f
> > --- /dev/null
> > +++ b/validation/linear/builtin_unreachable0.c
> > @@ -0,0 +1,30 @@
> > +extern void die(void) __attribute__((noreturn));
> 
> Hmm, is this declaration intended?

Only before it was cut-and-pasted ;)
Thanks for noticing.

-- Luc 

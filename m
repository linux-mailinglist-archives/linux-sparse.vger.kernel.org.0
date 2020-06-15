Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A711FA423
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 01:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgFOXdQ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 15 Jun 2020 19:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbgFOXdP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 15 Jun 2020 19:33:15 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4058C061A0E
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 16:33:14 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id o26so12848664edq.0
        for <linux-sparse@vger.kernel.org>; Mon, 15 Jun 2020 16:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DElTTSCCch9/i9AdZx5NpElJXXJRMZ1gnqIYmg1PMKI=;
        b=VCw2+FWmhLDF1E+PNVjlbTF5GiOMIiRbcCxZt8fvdmUuEGtwpIQmP8TQJiKK6yxLfM
         8ZQfRljAHgN9BQUo+Tw9/LXx5QOziDViLHbJJyHOcb6i0HfIJoKS8rTs+vexgfn/00sN
         B+Iiw1/fs0MAZBkXVmCpVjdPZi3wLTHUNCMqJrNHxomsmOSgarC6tCLSd2Xelgaev2AE
         y8MX3MOBW93ICRG4HemQPtq7Oq7fvb5gcz4b4x/TQ5HcJSrnYoJZ/uaO3bEKLUkKicPi
         WAYHhBRNYfNCQNXNUA3wNQPcPis8xs8W4qyWnzyABfXr0r5Pfkw7ZcL2R/HrO0k/T8hj
         AvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DElTTSCCch9/i9AdZx5NpElJXXJRMZ1gnqIYmg1PMKI=;
        b=RhVwPhWdm5IGdVggVJ6ZtEmOB4FkhIL3mbdR3b6LYyg9yde2qG5xU4nrl/hxWoh/xO
         KfoFlTZ8385afUH+sjW8jyzYdBZNhl1DGvkk5K8udtTbb5hBgKQWjrfYb8Q1IRxcZxxr
         PduNPLrDquQhIEu9kZZUOlXLKqQeSWa8OoCB+p6UReTbY6cZUjPoOk8/GC5mTnwax0/C
         +8D7WsOsYMwql5v4+zjexxo4V4FYcuJFaDj6SFjbK40r8Xo++5jQ6SW95CDJtujvLgPr
         V2V97lvkTT3WOveGj4y6JKJ3VWpASS/WiuRi0WpLfjRJFg1kVt/hMIp2xZ88kebgFW0q
         HfmA==
X-Gm-Message-State: AOAM533wOYctVfEo2Nhm2iObJlWM7oaR9oC4bBYPUXeAvOTAOUSAQT1O
        IO+jWN1WznZ7iH3tfaXxuoCbCRvd
X-Google-Smtp-Source: ABdhPJw+cTCt2JEaJUvWeA/Ee8ZktlSFY9P2o6DlQgIWtVfTHeXPTDPuFogl4BvtTuYX6jU7AOPwvw==
X-Received: by 2002:a05:6402:1752:: with SMTP id v18mr156118edx.107.1592263993459;
        Mon, 15 Jun 2020 16:33:13 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:4a3:2242:1764:b7bb])
        by smtp.gmail.com with ESMTPSA id b24sm9127756edw.70.2020.06.15.16.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 16:33:12 -0700 (PDT)
Date:   Tue, 16 Jun 2020 01:33:11 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: [ANNOUNCE] Sparse v0.6.2-rc1
Message-ID: <20200615233311.nep5ssmxbkhnrg27@ltop.local>
References: <20200613020735.iqb2vd23jpomisbq@ltop.local>
 <c80024d2-6d91-4fe7-a919-3edcf4a9b80a@ramsayjones.plus.com>
 <20200614215445.rtfbx23ve57fhlbr@ltop.local>
 <d540f450-c72e-5c51-ffba-32d7eb800137@ramsayjones.plus.com>
 <CAExDi1RbuRvkQb0DAYZUdwj+XQvVn91D8rU_-_bkybfCqi10eg@mail.gmail.com>
 <9fecbef9-12c8-6374-d5cd-914c3b009afa@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9fecbef9-12c8-6374-d5cd-914c3b009afa@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Jun 15, 2020 at 11:54:46PM +0100, Ramsay Jones wrote:
> 
> 
> On 15/06/2020 17:38, Luc Van Oostenryck wrote:
> > On Mon, Jun 15, 2020 at 12:37:28AM +0100, Ramsay Jones wrote:
> >> I just installed python-sphinx (on LM 19.3 it is the python2
> >> version) to give it a try, and it failed:
> >>
> >>   $ make html
> >>   Running Sphinx v1.6.7
> > 
> > This is probably too old (running 3.0 here but IIRC 2.7 or
> > 2.8 should be OK).
> 
> I'm not that surprised! I will wait until LM20 which, being based
> on Ubuntu 20.04, should hopefully have a sufficiently new version.
> 
> BTW, the on-line version of the v0.6.2 release notes look good to
> me now ... except one thing! ;-)
> 
> This part of the release notes:
> 
>   * fully propagate declarations downward.
>       For example, it means that code like:
> 
>           static int foo(void);
>           int foo(void) { return 0; }
> 
>       now behaves as expected: foo() is effectively static.
> 
> ... has the two lines of code formatted as a 'filled paragraph'.
> 
> I assume that some 'code-block' marker(s) of some description are
> required to format this correctly.

Yes, absolutely! I wonder how I didn't saw it.

Thanks a lot,
-- Luc

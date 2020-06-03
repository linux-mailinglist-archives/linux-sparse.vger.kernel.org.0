Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6601ED7FB
	for <lists+linux-sparse@lfdr.de>; Wed,  3 Jun 2020 23:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgFCVQl (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 3 Jun 2020 17:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgFCVQl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 3 Jun 2020 17:16:41 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF66C08C5C0
        for <linux-sparse@vger.kernel.org>; Wed,  3 Jun 2020 14:16:40 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id t21so266800edr.12
        for <linux-sparse@vger.kernel.org>; Wed, 03 Jun 2020 14:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JtZuS4VhQfRNVSEZegRyFMXYRB9Y55HzonWx5sQdXjI=;
        b=ZJiXhXYrLMWh7XnVa3zb1+rWuRs4CLLpygGRCwPx0CZ0cqC9tXb8D0WoHIYM9pBY8U
         EoA4lXdjcnf10X3A+manFJjaJrwWesvu3WDZPBd4X314ZdTdoRbZcOY/wYLV3jjDSryV
         dDnUHfHVq8ziMVImglsWokG/oIItzDmXMWw/PCa6LWUdTwdVdFBCFWmUd867rg2zJfT9
         oZHF56CzOxk9F5vdGCH+i+HsHQHu5Ri6uF5z2rCstx6W42Arb0Kg+U5U3EmNpI30Lv42
         wF9sQj8fq7cBBjGhmEpZTvkE6ti7HmRM3aIKt9AJcW6vLeCh1uWtjEMGHHDLjPYHmzp/
         rEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JtZuS4VhQfRNVSEZegRyFMXYRB9Y55HzonWx5sQdXjI=;
        b=Y39Fth4GU2a4r6UwxjfFHDQd2hNpR9Bm2lFztzh64Lj2tC36gONUx2GTQ5i1Ml8Lew
         QzO3jWaU5OG7pp8gAjs2Rr+yt70zNXlNEb4rcTfQkPKSQLNCqxmMxJM7uuhIe7ZQ1viW
         iMXrzZgHX46f57kLtssYn2XEK+SXVxbF9qw2YLtrgtIEI4e71M/Ii8BuFh4TI5av36aw
         mp9mGMHEfu0Zo6Ja8zsPbwEB+6ugQcEQU2xKFTtxqvaQqfwkzHQ3Eptl8s5xpIdeHigu
         qnP5fLyijs3P25qBwq4mvfma3S4mpUYAQyBm9F6ICymObzsVKJeUWInhdCZNiNnk5HhI
         ZUbg==
X-Gm-Message-State: AOAM5337slFl4HIwJh4wXgEX6rbmoACrSSz2kQkk2ywILIzT/Xx5BPDN
        qtjR73xYk1lgjLvffG1UiXOI0O+I
X-Google-Smtp-Source: ABdhPJzYSx0uZ8kFGNictSkgNbMF0rcy2Z5fADRzHQbjkb/3u49dyTe6vCOvFahZHzWB93jYpgoMGA==
X-Received: by 2002:a05:6402:1441:: with SMTP id d1mr1294572edx.93.1591218999530;
        Wed, 03 Jun 2020 14:16:39 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:2893:79f5:e096:e13d])
        by smtp.gmail.com with ESMTPSA id b21sm389606edv.31.2020.06.03.14.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 14:16:38 -0700 (PDT)
Date:   Wed, 3 Jun 2020 23:16:35 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] univ-init: scalar initializer needs some additional
 checks
Message-ID: <20200603211635.ufhlujbchvlhbhib@ltop.local>
References: <20200602163336.32667-1-luc.vanoostenryck@gmail.com>
 <34e42c7f-6c9d-b8e5-6ee1-2988b1099176@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34e42c7f-6c9d-b8e5-6ee1-2988b1099176@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Jun 03, 2020 at 02:01:07AM +0100, Ramsay Jones wrote:
> 
> I applied this patch just now and everything worked fine. In addition,
> the tests from my patch also passed, once I had remembered to add the
> -Wno-universal-initializer to the 'check-command' - because I do not
> have the patch which changes the default for that warning.

I should have added that this patch was meant to be applied before
the one for the default :(
 
> The only thing which gave me pause ...
> 
> > diff --git a/evaluate.c b/evaluate.c
> > index 8d2e68692a48..16553eb3481b 100644
> > --- a/evaluate.c
> > +++ b/evaluate.c
> > @@ -2608,6 +2608,9 @@ static void handle_list_initializer(struct expression *expr,
> >  	struct expression *e, *last = NULL, *top = NULL, *next;
> >  	int jumped = 0;
> >  
> > +	if (expr->zero_init)
> > +		expr->expr_list = NULL;
> 
> ... was the potential memory leak here. (OK it wouldn't be a
> huge leak, but still!).

Well yes [replying to your other mail too). It doesn't matter much here
but it's also easy to free the list, which is what I've done.

Thanks for giving a look at all of this.
Both patches are now applied.
-- Luc

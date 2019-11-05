Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1AE3F063E
	for <lists+linux-sparse@lfdr.de>; Tue,  5 Nov 2019 20:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfKETt6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 5 Nov 2019 14:49:58 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:43233 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfKETt6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 5 Nov 2019 14:49:58 -0500
Received: by mail-wr1-f43.google.com with SMTP id n1so22924354wra.10
        for <linux-sparse@vger.kernel.org>; Tue, 05 Nov 2019 11:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/8xmRnorDLh/rJkp9IaihTqM1ReYpDlT5tmqtiMTjo8=;
        b=vGPTXYVs1o/VoVnNKfDAekao/GTGV66VAZt9ZtVobSjrDZq53vmMMwMKqDlO33SMQu
         JVIQa+7aKQPFd8l6bVZJ5DmkgT4REjHt8jy9kkGQKTTRm6EYRifvb8eBMVaDPZq1D598
         dw6x9q/V69iC0FpsZPd1IY41UzlMYA4517tJBPKzczxpij08UlVtFIjmwjAz+Qh4IfDz
         0+0Hv9juPoYwF34C3kC97akziRoGn1KeHWznEVQj7euxXVDrAu6773DTe7Mozpqg6WaH
         dNL9KZPuH2j0u7gCBc9u6sW0j2NXJO6n7UG+RwXV1obcg9MZmay5+lqGHoZKKCyxB74I
         Y8nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/8xmRnorDLh/rJkp9IaihTqM1ReYpDlT5tmqtiMTjo8=;
        b=JDarZ81oHV3txyojPGdVA6nE2cSy4Z6lDlN7k8zFYvW6Fl1aI8zCoXwCz+ZXMTtKjG
         YZXkdBFITZpWl1OViF4fDz5LzUzBT8jLY7p8JgV37gcOTu/w7LIg7/5Ta7F62R7s8TDV
         J7kXfCS1stQDOdy4rT8dOVSLdo7J1oYQA4vz8435xm1HheG1KodPtDm9IBheqhfEiEdV
         gc8qFW92nmqpE75eCvEbC6Z7P07A2bHd6Eg4Xkgfr8i/ODRfnzzpc+bF4uSeVxxwZLSN
         jQLVf2LyW5SXGqJgtCaeTXQDVO9CPPLB08BcXHwKYCk9LzjLyviGdJBWWbxPRJnni2Xt
         LXoA==
X-Gm-Message-State: APjAAAV4HN42vVRGffHmh0KxgTp90bD1gcoWAtidHt4m6JwnaDDNrpdS
        kUUFcHtqghyFSKm+T9u4mw/ZvKoa
X-Google-Smtp-Source: APXvYqwLCy6qzs6Ydz8wQiUcGExKoT2E9eg67BvRIzv8RcRYLHOm/NLBcJ9/M8gSP0qEVQPbto92pQ==
X-Received: by 2002:adf:9e92:: with SMTP id a18mr28973215wrf.34.1572983395833;
        Tue, 05 Nov 2019 11:49:55 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:5140:c105:9cf3:64a5])
        by smtp.gmail.com with ESMTPSA id y15sm8530241wrh.94.2019.11.05.11.49.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 11:49:54 -0800 (PST)
Date:   Tue, 5 Nov 2019 20:49:53 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191105194952.b6acjrbvdnc4ibwi@ltop.local>
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
 <20191104222703.d75txlb7pq2dp6kd@ltop.local>
 <f2efffd7-c032-9875-1990-67716612ea9b@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2efffd7-c032-9875-1990-67716612ea9b@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Nov 05, 2019 at 06:39:25PM +0000, Ben Dooks wrote:
> 
> I was wondering if we could do something like export the
> check_assignment_types and maybe also add check_pointer_asn() in
> evaluate.c? The code in check_assignment_types is quite long and
> I am not sure I really want to try and recreate it.

Sure, it's out of the question to recreate it. But better to create
a wrapper for it (and later to adapt it to more specific needs)
than export it.
I'm not sure what you mean exactly by check_pointer_asn() but I've
no principles against doing this.

> I'm still not quite sure over the rules over what is and isn't allowed
> to printf, it may be that we need to be able to get the sizes of the
> types and verify those, which is very architecture specific.

Well, I would say that the main rules are:
* be useful
* be essentially compatible with gcc and current kernel practice.
Or said differently, what's is important it's not what is allowed
or not but what devs needs to be warned about.

The sizes are not what need to be checked, only the types matter.
And yes, I think that checking these types is much desired but this
can be done in a later step. For the architcture specific aspect,
there is no need to worry much about it because sparse, by necessity,
have already the correct types/sizes (for most archs and certainly
the most important ones).

> I would like to see this merged soon, as it looks like I will be doing
> an amount of travelling for work, which can be time consuming and tiring.

I understand and I'll be glad to merge it once the last batch of changes
here are done. The reason I prefer that you move the code in a separate
is not technical but so that you can be properly credited for it (when
using git blame and such).

Best regards,
-- Luc

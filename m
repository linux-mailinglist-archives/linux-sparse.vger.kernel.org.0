Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 731EAF22CC
	for <lists+linux-sparse@lfdr.de>; Thu,  7 Nov 2019 00:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbfKFXp7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 6 Nov 2019 18:45:59 -0500
Received: from mail-wm1-f44.google.com ([209.85.128.44]:52922 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfKFXp6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 6 Nov 2019 18:45:58 -0500
Received: by mail-wm1-f44.google.com with SMTP id c17so210562wmk.2
        for <linux-sparse@vger.kernel.org>; Wed, 06 Nov 2019 15:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=t+qCykt8B/lC0Ca8jQOLdPy7j/87yfuHHuBfA/bpYXQ=;
        b=mNYL1yTJWJaXFg+7R/fYvda0ZtrzIkEe7h1w2v/hgH36dheJe+vAqpc/67ZDwc78g9
         mTXhB3xyn6kuQA8BQg93okOK60YNs+yC6J31nbDSb+b9E2lnYrzmxclAmbOqDK/gpBmZ
         WK1R1b3OOMRgtpKkw34hyT0HtVyfsya1LIJOZB223sI2OxQQGICJq7pKe8C478Bnh07Q
         PrrHYQ1cEqxiFwpe6H7eeHtMM6fdEiKrV9Sn4bDyny5Kh35JUrtN4X3dMv6WdPwHNYUu
         hCWfHNBe7eZ3RgC2m2DJYEWt8m2G8yX2eLb/ifSkKBcbs/6aSJ2NHaMXZUKEYbuy/wAc
         4LAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=t+qCykt8B/lC0Ca8jQOLdPy7j/87yfuHHuBfA/bpYXQ=;
        b=OqgN7TOe45H853mDMBP2y4cA3ZEgOUf1xS1pgiQIh2qMe+jWviayoV2BI5K0fgH2P+
         EyvpGi9HwM8n+WI23EH4jkT0Xcdv+2QGMOFSyiKjR4OvGBvOC22S2+jnAlQB7bsFuZ0d
         iY9AUCUgJcfGjJ3td098OtB7BPhPygcC4R+aQ8+vD0YXnViKy7HiFKBloioJZBoGpgQa
         mb81wWhf4RFZ5t97gBGG+c6+BQCdePgk0S34n3HD3/WivUFphrFkiiNsg4DzONUf1WvY
         5qzyTd2VYj1ATEvNG8aoOf+ZgM4YinMin3U22hCkZLQ8cS2KHJBEOxnAZ7fDVloYQ35j
         7EsQ==
X-Gm-Message-State: APjAAAU4NRCaqb9W7Xk3BkSzoid+JGO5O4krTFlf4qaOb8lhJNpc1brL
        Lh9W/HdmoUsrtVcsrERFjGg=
X-Google-Smtp-Source: APXvYqxrllzFE0ixFuJKekaDOC/q57eEbMZyS62FThUOBPa7qp9Ff+43ygFQess307e0aBnceBWxbw==
X-Received: by 2002:a1c:3c42:: with SMTP id j63mr162105wma.90.1573083956886;
        Wed, 06 Nov 2019 15:45:56 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:f977:7428:775c:3ad2])
        by smtp.gmail.com with ESMTPSA id z9sm581757wrv.1.2019.11.06.15.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 15:45:56 -0800 (PST)
Date:   Thu, 7 Nov 2019 00:45:54 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     linux-sparse@vger.kernel.org, Jeff Layton <jlayton@redhat.com>
Subject: Re: Sparse v0.6.1
Message-ID: <20191106234554.crh5eyybfuhqiy7l@ltop.local>
References: <20191013234630.7uuszc5auri46h4y@desk.local>
 <42602ad0-05c2-b6a1-33ac-75191b80af88@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <42602ad0-05c2-b6a1-33ac-75191b80af88@kleine-koenig.org>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 06, 2019 at 09:59:27PM +0100, Uwe Kleine-König wrote:
> Hello Luc,
> 
> On 10/14/19 1:46 AM, Luc Van Oostenryck wrote:
> > Sparse v0.6.1 is now out.
> 
> I uploaded sparse 0.6.1 to Debian and got two failed builds. Both mipsel
> and powerpc
> fail in the same way:
> 	+enum-sign-extend.c:6:28: error: static assertion failed: "type"

Hi Uwe,

This problem is already fixed on the head since a few days ago.

I've also pushed a branch 'main-0.6.1' containing only the
minimal fix. If needed I can tag it as 'v0.6.1.1' and update
VERSION accordingly but I would like to be sure that such
4-part version isn't a problem.

Thanks for reporting,
-- Luc

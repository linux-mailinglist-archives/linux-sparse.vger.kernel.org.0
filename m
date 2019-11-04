Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA3FEF04A
	for <lists+linux-sparse@lfdr.de>; Mon,  4 Nov 2019 23:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387852AbfKDW1H (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 4 Nov 2019 17:27:07 -0500
Received: from mail-wr1-f41.google.com ([209.85.221.41]:44167 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387831AbfKDW1H (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 4 Nov 2019 17:27:07 -0500
Received: by mail-wr1-f41.google.com with SMTP id f2so10047288wrs.11
        for <linux-sparse@vger.kernel.org>; Mon, 04 Nov 2019 14:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Dx9mNWKJUJM3CPwT21mQI3r8e38l2FrxEuNqWwQMfbs=;
        b=Bo1niZaoU2zG8fPUPxlpWaZu5xdfMIf9uMatUOBx6FYbIC4ahiJ11iI7/fcBaDRmNI
         +XXIXE43Ehdkn8Ov++yRnphrUWqxPNQCiXS8ZHthy0XHfvAL25AvBg2oZahnwMBfjOAt
         jj48OOzQ+P9+bKMjD8vx6JPrqJ0KF2zUvaR+KWOGN337m6c0yxBr9ccDAZfmFnFdFZX2
         70OeUHE55rgSVop30hlvwmKICzgqMIwRmJ1eDw6jXeMsjzasV56KG8jdi3WOvnFAF8bb
         kgIKEwusS9Rm+g1qRZxzLweKEEth7+Dpl/4Ys605yTRkP3zU0HK4N8UWZvE/9+2tpTRA
         VSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Dx9mNWKJUJM3CPwT21mQI3r8e38l2FrxEuNqWwQMfbs=;
        b=blIu35BoSQt0M6nN/xMoba8riA5xaduvtp+xvL/lueJ1bRzn0Nmd/sLW16Bck/B5w1
         qabfzEVKlr8NIe4aLEqMA6du7qNMa2yVYjqOrb7/ZyHkadJsGPxSC+Lr9H4G4DhYRd3M
         040jLqWRIHkGCgefiHpcjy0E5ep9uU5HTKHXpD5d0Jx+wJ8GIMycHHWg2y1Lc29j2htP
         OB587UC5Wb+6pwE9f8t5N4sPGPnFGRNWg4SqYiVvY6CECvfNNMWpSgynlJxxyMUWrX5b
         CjTXpXK4SM05w5NYplifEt22tAOKPzI+OMqhWDzLw9bBEdkyBBx8GPG0DVTyMaLex8Pg
         QB4w==
X-Gm-Message-State: APjAAAVzS3TQ1kYRcC57/m0Q8fkHmZbyBkihmedv5SPumnTxMH45Q1+L
        1yN9jjh3JdmcK9Vk4GkHwhCE8HAu
X-Google-Smtp-Source: APXvYqy7Gi2ohs9TPnecIPBrLg5nCazZoB/rXb87yn+dTvyb3MG2JHDq8lpPr+mL5ShOVhHwPIXu7Q==
X-Received: by 2002:adf:f40c:: with SMTP id g12mr12142382wro.244.1572906425099;
        Mon, 04 Nov 2019 14:27:05 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:cd02:6aa1:b334:cea8])
        by smtp.gmail.com with ESMTPSA id q9sm11595548wru.83.2019.11.04.14.27.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 14:27:04 -0800 (PST)
Date:   Mon, 4 Nov 2019 23:27:04 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191104222703.d75txlb7pq2dp6kd@ltop.local>
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
 <20191104214643.d6ta3xok4jypkrjo@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191104214643.d6ta3xok4jypkrjo@ltop.local>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Nov 04, 2019 at 10:46:44PM +0100, Luc Van Oostenryck wrote:
> On Fri, Nov 01, 2019 at 04:36:51PM +0000, Ben Dooks wrote:
> > I've put the latest code up at:
> > 
> >  https://github.com/bjdooks-ct/sparse bjdooks/printf20
> > 
> > I think it has all the issues dealt with.
> > 
> > I can't currently post or do a final test as away from work laptop.
> 
> Thank you.

I think that the only missign thing are:
1) eliminate the call to strcmp() on the typediff
2) do a custom type checking instead of calling check_assignment_types()

What is your plan about them?

There is also one more thing I would like: it's that you move all the
code in evaluate.c in a separated file (for example verify-format.c)
and have just verify_format_attribute() exported. For the moment, it's
not really possible because of the dependence on check_assignment_types()
but it can nicely be do,e once 1) & 2) are done.

-- Luc

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC31C93D2
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 23:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfJBVwh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 17:52:37 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45916 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfJBVwh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 17:52:37 -0400
Received: by mail-ed1-f66.google.com with SMTP id h33so524152edh.12
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rfYJofnnhnbYucr0UmtttLPVgyiBfzu0gaSn3hP2LPo=;
        b=s/3oSqohpE9t354gPA3FEP2a9gE72GkLC5XokveQ4u2OGXx72J64OZnh72ygBeTTEk
         xEZpnpyre2/SFOtZqZ9bqEiRIjZsVciibwgpVZr0ZQ/M/dxZqYX2fL/sADW+caj8mWYf
         MGbygm9VhWIQ+FSS3WIb0lLBTyLerlSh12nBZVXblUw+CTtPOAYoc/XGwo/iIdL+IwKF
         dkWMtNZVTLtj3Q1G2Sqdv0IXTlxnmKJm1hyQNEx2TSf/vqpQq9fNjYvnZ2b+SMEyLxmd
         KpD/kDaECFE+Q8YR+adLsdCte9siyLF79fuIkKKiOifGJDwZ2saMl/MxcBP3G3wFgGSw
         i6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rfYJofnnhnbYucr0UmtttLPVgyiBfzu0gaSn3hP2LPo=;
        b=Atook0mxKbHB8EL6hjSuqnCFQXQKm11tvALUoGQnyIs/j8WHzs/Pu+qnrBnZGO+G3h
         e3CRD/eUyMjG2whRodRr3F6BuQ7V0FBUkUpPACqmRMlZKa258XTsCRhbjT0BDMIF1IXJ
         H40yA4mDbb7k7xT8XV9eSDZvcOgnOfOuk8AqNB080si5rPD0BIEFXD+B7vK5K7nauOTi
         2ZwMvm9VR3EooyubKv8i79h0vNms2T5F7AOIci+xcIV7XBrapVZSDWGXggikwFXWTEZE
         4yvjwAhIjRC1AyyeTfWRYZ4yhorTAAS4PNUmloOjmoYLsmWnYnkAiWrncHF/CoZgMHEx
         c+Cw==
X-Gm-Message-State: APjAAAUFF6Sx/eF4Nn8GwhFGnNubmWAwQGaGA6eAW6LoU9+llWSyyUxb
        fmgGtJawL6adsyyeNDJnSiLkElDB
X-Google-Smtp-Source: APXvYqxFPNTgljQTVnSalhMSYLuhaWimx8DJ9oOCzBqIZUXKZtIEsqeVOhDV8tOuFIrSUV4cz9KSEw==
X-Received: by 2002:aa7:c749:: with SMTP id c9mr6303747eds.232.1570053153851;
        Wed, 02 Oct 2019 14:52:33 -0700 (PDT)
Received: from desk.local ([2a02:a03f:4080:1900:3985:a315:dc4f:6706])
        by smtp.gmail.com with ESMTPSA id b36sm74480edc.53.2019.10.02.14.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 14:52:33 -0700 (PDT)
Date:   Wed, 2 Oct 2019 23:52:32 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-sparse@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] void-cond: allow void in conditional expression
Message-ID: <20191002215232.slsslbzj3moj5g7h@desk.local>
References: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
 <20191002212333.51017-1-luc.vanoostenryck@gmail.com>
 <c8d2bf4c-c1b5-73f9-e044-0be5b2dfafc4@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8d2bf4c-c1b5-73f9-e044-0be5b2dfafc4@infradead.org>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Oct 02, 2019 at 02:45:01PM -0700, Randy Dunlap wrote:
> On 10/2/19 2:23 PM, Luc Van Oostenryck wrote:
> > As an extension, allow conditional expressions (?:) with one
> > side of type 'void' and consider the result to also be void.
> > 
> > The warning can be reinstated with the flag '-Wcond-void'.
> > 
> > Note: I only see a single occurrence of this in the kernel.
> 
> Yes, I would prefer to eliminate that one.  :)
> 
> > Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> I prefer
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> 
> I didn't try to Suggest this.

Yes, true indeed.
 
> One man page edit below...
> 
> > +.B \-Wconditional\-void
> > +Warn if one side of a conditional expression (\fB? :\fR) is of type
> > +void and the other one not.
> > +As an extension, Sparse consider the result of such expressions as also
> 
>                            considers

Fixed.

Thanks,
-- Luc 

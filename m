Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 031DAE9951
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 10:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbfJ3JkH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 05:40:07 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39301 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfJ3JkH (ORCPT
        <rfc822;Linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 05:40:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id a11so1478640wra.6
        for <Linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 02:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vv8yXcyKNu7N7ZUossfMpB5kIFUFW/m+036/6iHqcrU=;
        b=TK3ofGnstl8hTaijsl7yJ9GBjTgBa4tUGhgzhLCds+o9EWkq4PsO6xmoZZOxDIKSr5
         3qlzm6LEvT86xSi1+rLE6k9valsLu6NAKJ75MFTswnXXJrno5rVjZyMpHmBz/XO+VcVB
         S0H7EVUEv7s2MH5wjC0wE1S+u477vd/Pp/GMrHZxs1cI1hUcyFtMlCYvJAWRjS9knzOh
         5opEHlKLVqbHfKuz9KZZ4vqzDsrXJgKWcQ6BRUL1CoAH1traLkDyvxiR3+XJRU/x3YDY
         ks0vSnK+oYlu65rQSv00z0jDHu6ssNtEU1bBB5mjBvUvxV6sVG9RQPkpSIoq98OCUFpL
         Fisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vv8yXcyKNu7N7ZUossfMpB5kIFUFW/m+036/6iHqcrU=;
        b=fvoPgb7hglw4gPF/4HtjMQLFxamklCZnAs5D7ejoLU7/ikSzmV0olONy8d8ELvjY5I
         +usrWRWWi1E8ZzHfqJ2BSr7bxIgWRjb7UENMfr9sO1piyxJBbxA4D8knL6GSzyKkB4yE
         HVrLm4TWmsiYuUQkSus0saC9YNzgcOMlyo7nBTx11Rh3Q1s952zdeY2+wNrrLtmcd9ll
         RaeSHCvQx3B+Vas1kC8SwRsmgUb7etmPmY01/B/VuyHxqVTGsboSDNAKQQZCk0vTQLbS
         17ptT7dYN2iqpgT45/uOQDRmdtPxNyB+07EbgXtUSeXbSk7oUgt51dG1BV4D8NRYDSUT
         +M6w==
X-Gm-Message-State: APjAAAUMeAmvd/0maydVHB82GSWODdpLjqFvswRcRcdD0vaEamTFYrqh
        bxHawIyY6lSejDoGXgclh2Y=
X-Google-Smtp-Source: APXvYqx3vfUiHbqBPaPaED/kQHWb8ypqSpEbupYdeNBBeVxRrYay/71OX/U6b30T/WNKUPqrD/tr3w==
X-Received: by 2002:a5d:518c:: with SMTP id k12mr1482490wrv.104.1572428404845;
        Wed, 30 Oct 2019 02:40:04 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:5898:aeb7:8c5e:3aa1])
        by smtp.gmail.com with ESMTPSA id f6sm2082754wrm.61.2019.10.30.02.40.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Oct 2019 02:40:04 -0700 (PDT)
Date:   Wed, 30 Oct 2019 10:40:03 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     Linux-sparse@vger.kernel.org
Subject: Re: [PATCH] options: allow to specify the desired arch with
 --arch=<arch>
Message-ID: <20191030094002.6j3hlzzlee26tia6@ltop.local>
References: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
 <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
 <20191029082334.g3evfqkc73ohn6pn@ltop.local>
 <89ebf585-7700-c8e2-7786-a599f31ee5e8@ramsayjones.plus.com>
 <20191029205718.z7ki5z23j5qqovsx@ltop.local>
 <9108cbcfc91e0bdc8c331beb5a45329b@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9108cbcfc91e0bdc8c331beb5a45329b@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Oct 30, 2019 at 10:06:41AM +0100, Ben Dooks wrote:
> 
> 
> On 2019-10-29 21:57, Luc Van Oostenryck wrote:
> > On Tue, Oct 29, 2019 at 06:57:02PM +0000, Ramsay Jones wrote:
> > > > Do you see some complications?
> > > 
> > > No, I was thinking about the opportunity to simplify cgcc! :
> 
> Should we also have an option to use cc to provide the current
> architecture and other cc defines introduced by the ore processor
> stage to allow synchronization with compiler? Or shod this be done
> in the makefile calling

It depends. I think that for the kernel it is not needed
because all CFLAGS are also given as CHECKFLAGS (and,
of course, I planning to send in the following days a patch
for the kernel to add 'CHECKFLAGS += --arch=$(ARCH)').
I think that for the kernel it would be enough.

For user-space, part of this is more or less done in the
cgcc script (and you can specifiy the compiler via the
unusual environment variable 'REAL_CC', the idea being
to be able to define cgcc tself as 'CC').

In both cases, arch-specific details surely need to be added,
like the recent -mcmodel for RISC-V. I'm thinking mainly
about '-march' & '-mabi'.
These can be added as needed but are often quite arch-specific
which is currently a problem for Sparse. My longer term plan
is to move everything arch-specific to separated files.

To answer your question, I would say that if you can easily
do it via the makefile or the makefile's configuration,
then do it so.

-- Luc

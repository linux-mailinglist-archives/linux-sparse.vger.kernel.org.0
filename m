Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD28BC11C9
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 20:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbfI1ShT (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 28 Sep 2019 14:37:19 -0400
Received: from mail-ed1-f54.google.com ([209.85.208.54]:36258 "EHLO
        mail-ed1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728569AbfI1ShS (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 28 Sep 2019 14:37:18 -0400
Received: by mail-ed1-f54.google.com with SMTP id h2so5104629edn.3
        for <linux-sparse@vger.kernel.org>; Sat, 28 Sep 2019 11:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sUg+X8Sj/qmvDh31AeiOPvDc9Y6gIEQI55PgUCLHO70=;
        b=urDA2u7wK5wQfSityblqeTX3PXWp2BLvtq474NSdcO+icenQ2vAcN8HdClDwc0fJnX
         c8xt8rz+itLKThbvbcQcVSIZC6qRTGLH4ZA1pltes5FT/7fHBmZrcMM+ahZeFyFPSB4g
         2cTonYm8cgbzemL9wo7wypuCgDgnFpNT35reIKW0xZ/hOLHp5MQ06znea02XSRGLzyV6
         uKQWUAF8A7+NXYhiN6GgCNdcn+3Ypw7Kr9ocBTe+AdTJDFFL8yraXtAO4k32H9qvHnle
         n7v2w/CpMtRcKwMRLYZhVFjpZ3rDU9h+hSWbS74hqle02dLeUKdlSBOBKxgYu0pcH6kF
         dfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sUg+X8Sj/qmvDh31AeiOPvDc9Y6gIEQI55PgUCLHO70=;
        b=N2R2ecP4W7Li+buybo33NUIEH1GKpvISaPGR2pKl0Hzbu5OR9Hl68KqIv+JWOn/au+
         kzgCdbQlO1eH70PpRgggXyKvV65q5TmepfZDj/iU5SJgtpa/qgEZdS4KJT+Xh+WJdm0G
         +f2ORcl7JlA7ATaLciTTtseyewkVF5f0lRLtEgTip2EcmRXneDikhYc85vbOdSW711r8
         roI1z2kI2GED3WYWap11tJEC4ezNafGMpjspzbMcxPgi/O5kLhdm6yuJN46EBg7T12bA
         y/mz/XMbDCdBunNYxJK7eei+ZCwDR0QyjCAZjAtQKbTmmIgMkRHSf2sf0kRogeLXYkk8
         vj3A==
X-Gm-Message-State: APjAAAXWF8RYX4xRFR7G71BwAJtAA+UzbRuMTAXTIm8uo07shtE63TtD
        ztCtIJ/RLbIRoVC7EE6ZPjdSimjx
X-Google-Smtp-Source: APXvYqylTDdiD7nSlOap/aoZe7FdAS1A1V6e0ynYK/Xctw6Uo/UuGpE3T/upEIk24ch1XtmA5BZngQ==
X-Received: by 2002:a50:a57d:: with SMTP id z58mr11304097edb.115.1569695835665;
        Sat, 28 Sep 2019 11:37:15 -0700 (PDT)
Received: from desk.local ([2a02:a03f:4080:1900:20cf:ab03:5b0c:7197])
        by smtp.gmail.com with ESMTPSA id c1sm1346322edd.21.2019.09.28.11.37.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 28 Sep 2019 11:37:14 -0700 (PDT)
Date:   Sat, 28 Sep 2019 20:37:13 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: problem building sparse 0.6.0 (sparse-llvm)
Message-ID: <20190928183712.vs4ujsd4x4afp5pf@desk.local>
References: <f135aab3-5a94-f073-2fd2-c1890abe37b0@infradead.org>
 <54aaa827-4f31-69de-277b-f9723b829d02@ramsayjones.plus.com>
 <20190925221610.srmkmsqkmqh4uzd3@desk.local>
 <d4203048-34da-0fa0-b670-c400b1bc05b7@ramsayjones.plus.com>
 <20190926203326.t6or7pbvybtnussi@desk.local>
 <03244c02-bf1a-7cf8-aa23-ee0e9ae17cf2@ramsayjones.plus.com>
 <20190927230037.35jv5esltpuhirmd@desk.local>
 <6b0efa4c-038b-b48e-da82-a9aa658c188e@ramsayjones.plus.com>
 <20190928014429.u2meyekebyffcfz4@ltop.local>
 <3634ed7b-16c1-c548-cb9a-a5425954eeb2@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3634ed7b-16c1-c548-cb9a-a5425954eeb2@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, Sep 28, 2019 at 02:20:29PM +0100, Ramsay Jones wrote:
> On 28/09/2019 02:44, Luc Van Oostenryck wrote:
> > On Sat, Sep 28, 2019 at 02:27:40AM +0100, Ramsay Jones wrote:
> >> On 28/09/2019 00:00, Luc Van Oostenryck wrote:
...
> >>> I suppose that `llvm-config --host-target` returns x86_64-unknown-cygwin ?
> >>
> >> Ah no, I had meant to mention this:
> >>
> >>   $ llvm-config --host-target
> >>   x86_64-unknown-windows-cygnus
> >>   $ 
> >>
> >> ... which agrees with clang, but not llc.
> > 
> > Then the patch could simply be something like:
> > +       LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=$(llvm-config --host-target)"
> > 
> > but I'm not sure how this would behave with cygwin32 or when using -m32.
> 
> Yeah, I don't know either. Unfortunately, my cygwin32 installation
> is *very* old and on an Windows XP laptop that I would rather not
> connect to the internet at this point ... (Also, I don't think cygwin
> supports windows XP anyway, so ...)
> 
> Anyway, I think it is somewhat odd that clang and the llvm tools
> don't agree on the host 'triple' used during configuration. ;-)

From what I understand one is the triple for the build/config *host*
and the other is for llvm/clang *target*. The first one is produced
and used by the config/build system at build time, the second one is
produced and used by LLVM/clang itself at run-time. They share syntax
and the first is used as default for the second but that's all (but
yes, this doesn't explain why it was working in the previous version).

> I would rather not, but I guess I may have to download the cygwin
> source packages for clang/llvm and take a look at how the binary
> packages are configured/built. I suppose this could be a problem
> with the cygwin packaging, or with upstream - dunno! :(
> 
> Hmm, I will _hopefully_ find time to look at that soon, but I don't
> think anyone needs a quick solution to this ... :-D

Yes, indeed. This cygwin/sparse-llvm combo is quite 'exotic'
(and, as far as I know, nobody is using sparse-llvm). I would be
perfectly fine with a patch like the one here above.

Best regards.
-- Luc

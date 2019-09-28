Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 982F5C0F41
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 03:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfI1Boe (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 21:44:34 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40263 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfI1Boe (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 21:44:34 -0400
Received: by mail-ed1-f65.google.com with SMTP id v38so3838842edm.7
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 18:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m5Y7yf2qaWT7WDaSZkvL8ZWeGojVBlH40t6y4jley1s=;
        b=eEo8N+HB3PeVrk1pqgfItRkYV6pY6efPrYDT/Pn7YjK7jLGgjXHg+240+kWoSp+sWK
         5T5dvTIzGXNr1Wf5u19acRzgCWnwzN4xy9vGTBsY+zuAlE3x+v7qcjtnNUIwXJhxB++n
         NG2p0PoECFFIbi+aUtEV7xmJ85AKAFn7YkPXw8Qbej8a/KKsLZWfTSWIzjOtTvsHuB+x
         R3nIFw55ozLwvBullJ94jBlnAi95piThgh902FTRpeAze05uYZK+Stsd0mOOqw1gRDvu
         ZtRypvgWAIqwYC0qOGvnku4qVzbj3fBu1GuxlHYdeKj4L+IrSl+itnE6ZaOegr9GckkK
         6L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m5Y7yf2qaWT7WDaSZkvL8ZWeGojVBlH40t6y4jley1s=;
        b=rvIwEsjDLfCpCVBD3Z+Bc4tqCO6zPmQ21lkHmuZIXq+lpppGPVTDJwlUC5p2V3HSxj
         UXY70wXLeBDBe7BK8pVL8lJf4pSh4WxP1mJpN9q8BbUvtvxFM8V32vRbPL633sDdV8wx
         KhgyeNm7C98iA/KUb2wblLtL4UZ+I049cPiLLUDHwvOemNSORAXH5WiiR6qkEzoeHcMU
         j/lsrNj7+ritKXKk+a1CZOwsqrUycTFuKmp19Ap+9UtRr317b5qmppP8P+eaLvicRo7r
         uw2V1eO1conlNDSchXnj8m1RduHafPA5tZY0+QdD17R1/5y26lJgyX/UksfsNxQyig1b
         3HrA==
X-Gm-Message-State: APjAAAVbg1oAul9ARt7Y6E2ACz3I2Smo9uY6SqO91gnE6e+5coaQ3ew7
        dxppJBeKOYWY71NMgAyJpyo=
X-Google-Smtp-Source: APXvYqw3pWkpGshdRUUF/7C7Abvotzf/z8rfMelEq3Bdp0fZ2CASIjZjLSW+fllhciwIIQ2UR8eXOA==
X-Received: by 2002:a17:906:c7c6:: with SMTP id dc6mr10543717ejb.123.1569635072239;
        Fri, 27 Sep 2019 18:44:32 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4080:1900:7125:3a9a:960d:9750])
        by smtp.gmail.com with ESMTPSA id k20sm870549eds.66.2019.09.27.18.44.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 18:44:31 -0700 (PDT)
Date:   Sat, 28 Sep 2019 03:44:30 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: problem building sparse 0.6.0 (sparse-llvm)
Message-ID: <20190928014429.u2meyekebyffcfz4@ltop.local>
References: <c03600e0-057a-fb59-78b4-60f363c1b44d@infradead.org>
 <c037bde7-84ea-a7ed-ab81-f5a054093069@ramsayjones.plus.com>
 <f135aab3-5a94-f073-2fd2-c1890abe37b0@infradead.org>
 <54aaa827-4f31-69de-277b-f9723b829d02@ramsayjones.plus.com>
 <20190925221610.srmkmsqkmqh4uzd3@desk.local>
 <d4203048-34da-0fa0-b670-c400b1bc05b7@ramsayjones.plus.com>
 <20190926203326.t6or7pbvybtnussi@desk.local>
 <03244c02-bf1a-7cf8-aa23-ee0e9ae17cf2@ramsayjones.plus.com>
 <20190927230037.35jv5esltpuhirmd@desk.local>
 <6b0efa4c-038b-b48e-da82-a9aa658c188e@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b0efa4c-038b-b48e-da82-a9aa658c188e@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, Sep 28, 2019 at 02:27:40AM +0100, Ramsay Jones wrote:
> 
> 
> On 28/09/2019 00:00, Luc Van Oostenryck wrote:
> > On Fri, Sep 27, 2019 at 09:24:05PM +0100, Ramsay Jones wrote:
> >>
> >>
> >> On 26/09/2019 21:33, Luc Van Oostenryck wrote:
> >>> On Thu, Sep 26, 2019 at 07:50:27PM +0100, Ramsay Jones wrote:
> >> [snip]
> >>> Randy had the problem on llvm-3.8.0.
> >>>  
> >>>> I haven't looked into the errors/warnings yet, but they seem to
> >>>> relate to 'unknown/misused' pseudo-ops used for debug info.
> >>>
> >>> I really don't think it could be related to the last patch.
> >>> I don't use or have access to cygwin but I've tested on Debian
> >>> (bullseye/sid) with gcc-7 & gcc-9 and there wasn't any problem with
> >>> llvm-8 (on Ubuntu I can only test with llvm-7). So, I'm curious to
> >>> know more about this error you're seeing.
> >>
> >> I forgot to mention, in my previous email, that I was pretty
> >> sure this was a platform specific issue, so I am not surprised
> >> that you see no problem on Linux.
> >>
> >> So, tonight, I had a very quick look at the problem. If I use
> >> gcc or clang to generate the assembler version of one of the
> >> failing tests (backend/pointer-sub.c), then the pseudo-ops used
> >> are appropriate for use with a 'coff-type' object file (ie a PE
> >> file). However, the assembler produced by sparsec (saved from the
> >> output of llc), would typically used in ELF object files ...
> >>
> >> After studying the output of 'clang -###', I noticed that clang
> >> was passing (among other things) a 'triple' parameter to cc1.
> >> However, the triple displayed by clang and llc were different:
> >>
> >> $ llc --version | head -5
> >> LLVM (http://llvm.org/):
> >>   LLVM version 8.0.1
> >>   Optimized build.
> >>   Default target: x86_64-unknown-cygwin
> >>   Host CPU: haswell
> >> $ clang --version
> >> clang version 8.0.1 (tags/RELEASE_801/final)
> >> Target: x86_64-unknown-windows-cygnus
> >> Thread model: posix
> >> InstalledDir: /usr/bin
> >> $ 
> >>
> >> I noticed that you could override the target triple used by llc, so
> >> decided to give it a try:
> >>
> >>
> >> $ git diff
> >> diff --git a/sparsec b/sparsec
> >> index bafe2da..8a056e7 100755
> >> --- a/sparsec
> >> +++ b/sparsec
> >> @@ -39,6 +39,7 @@ case "$(uname -s)" in
> >>  *CYGWIN*)
> >>         # cygwin uses the sjlj (setjmp-longjmp) exception model
> >>         LLC_ARCH_OPTS="-exception-model=sjlj"
> >> +       LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=x86_64-unknown-windows-cygnus"
> >>         ;;
> >>  *)
> >>         ;;
> >> $ 
> >>
> >> This fixes the testsuite on cygwin! :-D
> > 
> > Great!
> > 
> > 
> > The defaut target triple is supposed to be determinated from the host triple
> > but from what I've seen LLVM's config system seems to know only about
> > x86_64-unknown-cygwin and nothing about *-*-windows-cygnus (config.guess).
> > OTOH, the part related to code generation seems to only know about
> > x86_64-unknown-windows-cygnus ...
> > 
> > I suppose that `llvm-config --host-target` returns x86_64-unknown-cygwin ?
> 
> Ah no, I had meant to mention this:
> 
>   $ llvm-config --host-target
>   x86_64-unknown-windows-cygnus
>   $ 
> 
> ... which agrees with clang, but not llc.

Then the patch could simply be something like:
+       LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=$(llvm-config --host-target)"

but I'm not sure how this would behave with cygwin32 or when using -m32.


Best regards,
-- Luc"

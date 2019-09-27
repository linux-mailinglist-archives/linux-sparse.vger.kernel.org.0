Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 846ACC0E3A
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728275AbfI0XAo (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:00:44 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:35522 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfI0XAo (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:00:44 -0400
Received: by mail-ed1-f65.google.com with SMTP id v8so3700922eds.2
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=e+BvMoOBy2y0SdoVJpt8EkEWCp8vxcmoinITWrZ99jo=;
        b=gvikLt3ueCQr2tKhAHImKNf9eXq7rLvw/falDYqvisLCZ8s7jYmpSvG1kQBP2szVZ+
         3SZh5j5XqPj3AB7mGwi9Ze2dsprKu9ZDf0/SHaWPcA8OWTedwzrNY6lWNKdsrHhm6Qhq
         C0Tqx1Gqw7QYQQkc6tlSIaKcr+e3PjftUOU/i15DqwVpqnCVc/TYakqz++wg0CQu6WQB
         L7f95egeNKF3+gHUtjkiobB7c+y8iChMO8/t8Gk5wvFviZyprpWypTQRDkpHvPRjVM7I
         l58gmsJVZjPynEyOAdadbl3O5nhLZ4pEJEIYpEIYSQGMe7tZN5iX8j5dVztOge9Ai2wK
         IG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e+BvMoOBy2y0SdoVJpt8EkEWCp8vxcmoinITWrZ99jo=;
        b=jKEltx09gy2STGEOmP9W/BlH7taU6bx75zVjCUZy52gMTbq5i5POqCkcRjGGpHw67q
         Wf0c+rZsg9IQoMSKU3R+gSy1WFiOzEAo2Q0nIYCTD79BqXqdqfI7wFA1DGOUxVpWnNBd
         qZst0FKiD8mQtQfQRm2vRoTRiUfQh0DcxpRcMqe5oSak5xekGukYGEJ02+Ab3Tkpik4L
         j5v/lwz8mlbtWawoIrffipkqA//qDUNssVTApOy/Nu9hCN9W3GUmVqT2o6ypZLgTG4fJ
         /fldNwsyo3sEvQu+DSl4wLHUPCA6srzv6jfMSWo5S0QgWAAgamBeRKhez3qC8tYAsmqF
         Ijfw==
X-Gm-Message-State: APjAAAXLIOce0S4X7jhw9pvfCbJ0uwXr25qp+pXmLghAY4xSZcsdV2PI
        LYdD6BgTJJygctFtx9jiXc0F5m9G
X-Google-Smtp-Source: APXvYqzvqg7vGdqiVw8fBVQaQVr4mp7Dy/yRNefnBpuMVgskrK3CiAf5pPnnVHUV/7mhz9V0C25QQg==
X-Received: by 2002:a17:906:e290:: with SMTP id gg16mr9733403ejb.176.1569625241251;
        Fri, 27 Sep 2019 16:00:41 -0700 (PDT)
Received: from desk.local ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id m14sm806822edc.61.2019.09.27.16.00.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:00:40 -0700 (PDT)
Date:   Sat, 28 Sep 2019 01:00:38 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: problem building sparse 0.6.0 (sparse-llvm)
Message-ID: <20190927230037.35jv5esltpuhirmd@desk.local>
References: <5ebc73fc-1c4f-e97a-f626-ec0d35ec4e69@infradead.org>
 <c03600e0-057a-fb59-78b4-60f363c1b44d@infradead.org>
 <c037bde7-84ea-a7ed-ab81-f5a054093069@ramsayjones.plus.com>
 <f135aab3-5a94-f073-2fd2-c1890abe37b0@infradead.org>
 <54aaa827-4f31-69de-277b-f9723b829d02@ramsayjones.plus.com>
 <20190925221610.srmkmsqkmqh4uzd3@desk.local>
 <d4203048-34da-0fa0-b670-c400b1bc05b7@ramsayjones.plus.com>
 <20190926203326.t6or7pbvybtnussi@desk.local>
 <03244c02-bf1a-7cf8-aa23-ee0e9ae17cf2@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03244c02-bf1a-7cf8-aa23-ee0e9ae17cf2@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Sep 27, 2019 at 09:24:05PM +0100, Ramsay Jones wrote:
> 
> 
> On 26/09/2019 21:33, Luc Van Oostenryck wrote:
> > On Thu, Sep 26, 2019 at 07:50:27PM +0100, Ramsay Jones wrote:
> [snip]
> > Randy had the problem on llvm-3.8.0.
> >  
> >> I haven't looked into the errors/warnings yet, but they seem to
> >> relate to 'unknown/misused' pseudo-ops used for debug info.
> > 
> > I really don't think it could be related to the last patch.
> > I don't use or have access to cygwin but I've tested on Debian
> > (bullseye/sid) with gcc-7 & gcc-9 and there wasn't any problem with
> > llvm-8 (on Ubuntu I can only test with llvm-7). So, I'm curious to
> > know more about this error you're seeing.
> 
> I forgot to mention, in my previous email, that I was pretty
> sure this was a platform specific issue, so I am not surprised
> that you see no problem on Linux.
> 
> So, tonight, I had a very quick look at the problem. If I use
> gcc or clang to generate the assembler version of one of the
> failing tests (backend/pointer-sub.c), then the pseudo-ops used
> are appropriate for use with a 'coff-type' object file (ie a PE
> file). However, the assembler produced by sparsec (saved from the
> output of llc), would typically used in ELF object files ...
> 
> After studying the output of 'clang -###', I noticed that clang
> was passing (among other things) a 'triple' parameter to cc1.
> However, the triple displayed by clang and llc were different:
> 
> $ llc --version | head -5
> LLVM (http://llvm.org/):
>   LLVM version 8.0.1
>   Optimized build.
>   Default target: x86_64-unknown-cygwin
>   Host CPU: haswell
> $ clang --version
> clang version 8.0.1 (tags/RELEASE_801/final)
> Target: x86_64-unknown-windows-cygnus
> Thread model: posix
> InstalledDir: /usr/bin
> $ 
>
> I noticed that you could override the target triple used by llc, so
> decided to give it a try:
> 
> 
> $ git diff
> diff --git a/sparsec b/sparsec
> index bafe2da..8a056e7 100755
> --- a/sparsec
> +++ b/sparsec
> @@ -39,6 +39,7 @@ case "$(uname -s)" in
>  *CYGWIN*)
>         # cygwin uses the sjlj (setjmp-longjmp) exception model
>         LLC_ARCH_OPTS="-exception-model=sjlj"
> +       LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=x86_64-unknown-windows-cygnus"
>         ;;
>  *)
>         ;;
> $ 
> 
> This fixes the testsuite on cygwin! :-D

Great!


The defaut target triple is supposed to be determinated from the host triple
but from what I've seen LLVM's config system seems to know only about
x86_64-unknown-cygwin and nothing about *-*-windows-cygnus (config.guess).
OTOH, the part related to code generation seems to only know about
x86_64-unknown-windows-cygnus ...

I suppose that `llvm-config --host-target` returns x86_64-unknown-cygwin ?

Thanks toinvestigate this.
-- Luc

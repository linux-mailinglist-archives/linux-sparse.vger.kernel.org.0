Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB75110DBF6
	for <lists+linux-sparse@lfdr.de>; Sat, 30 Nov 2019 01:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727175AbfK3Aso (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 29 Nov 2019 19:48:44 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34876 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfK3Asn (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 29 Nov 2019 19:48:43 -0500
Received: by mail-wr1-f67.google.com with SMTP id g17so5070800wro.2
        for <linux-sparse@vger.kernel.org>; Fri, 29 Nov 2019 16:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g5C6UFrtpnKFGWUTayVDw1LbZpTj4p13kP+eJ9c3yfs=;
        b=rfkXLGbK0r17hLnT+tglcF467iEzJfjhrFHI4MoE5BhFVAZHFDYawPna33nI3AyHCd
         slBJZbqCOoYgk1CmvxJUHAcz2uEp7+MK0EWWHY0xdbDauSkdhhjowvDyhty9ZZd3zaW5
         ZI6Ao40FsmEuWPasDAaO7H1iWRekAT4cFIsa03sNLODwDsuWi0S7C65ZC3rI27wd+rVH
         sH3FuMXZmPDODiEoUa6TEpBowUSLXPkA8TxMUzkGFbsEmqaffg0fE5laUbytmw0H5tsa
         q2wHOGTchvANqacRKaYv59JIqyhqoxcFU6tV5F9+yV+1ODZI2e/NrNPXmrOheaWUSAa0
         WCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g5C6UFrtpnKFGWUTayVDw1LbZpTj4p13kP+eJ9c3yfs=;
        b=qYxtZlZWN5nMpymKgNrtMcgtcGf9ywhEWhMV3UYASqWNDXLl6DM0Tb92y9CTfK/kiM
         lMhYwXp43KPcVQlVZ3vbOPpm6QzOPyWEAx9c2yvzlrVpzWMOjxSPpLpKKBtbk//N0rID
         hBrsy3CcK0awU7XS7XidU53SbcyC1YqtltTkzgBYW9FbwNPCTCPdpHx8EVjyaT0TI/Q1
         7Xcm8KU6k+NIflXprhQbIktg3wTOtbiYu5TGvc/MXgPgaxLARpPjVFCXlzcBz74vwWLH
         aDlQsH12izNtulC2UiH1N2uakZV5jMPzdzsJEE9zXL7mWYtwjWev4KAXf+Bd3MCVmgZG
         LaVg==
X-Gm-Message-State: APjAAAUASb5lVtYR6WboRbvBi8228ct/vGaaCBbqRDKcwuG/nJILNrj8
        hzL4KHusDm3pYTZC1VKtrBdtMp9M
X-Google-Smtp-Source: APXvYqw57DLwhoK9I9xovex/joeIawpRqae/2X4NxCJvJTEDa5OuUuUu4WpyOdIn3XEd175mbgws5Q==
X-Received: by 2002:adf:82f3:: with SMTP id 106mr12148215wrc.69.1575074921432;
        Fri, 29 Nov 2019 16:48:41 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:cdc6:e155:f3db:f2f3])
        by smtp.gmail.com with ESMTPSA id g207sm16647175wmg.40.2019.11.29.16.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 16:48:40 -0800 (PST)
Date:   Sat, 30 Nov 2019 01:48:39 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [RFC PATCH] cgcc: only define __CYGWIN32__ for -m32 builds
Message-ID: <20191130004839.fqtkytdp3vtpqlux@ltop.local>
References: <b342ed82-2949-7a44-3cf7-23ae3d266cbf@ramsayjones.plus.com>
 <20191128200642.wbrb2rukozyac5go@ltop.local>
 <b4b8bd95-ef23-d296-9d16-16fa2683926f@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4b8bd95-ef23-d296-9d16-16fa2683926f@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Nov 29, 2019 at 01:15:12AM +0000, Ramsay Jones wrote:
> 
> 
> On 28/11/2019 20:06, Luc Van Oostenryck wrote:
> > On Thu, Nov 28, 2019 at 05:45:06PM +0000, Ramsay Jones wrote:
> >>
> >> Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
> >> ---
> >>
> >> Hi Luc,
> > 
> > Hi,
> > 
> >> This is marked RFC because it only improves the situation on 64-bit cygwin.
> >> Without access to a (up-to-date) 32-bit cygwin, I can't experiment to find
> >> a means to determine what platform I am on. I don't recall what the output
> >> of 'uname' is on 32-bit cygwin, but I have a hunch that you can't tell which
> >> is which from it's output. On 64-bit cygwin:
> >>
> >>   $ uname -a
> >>   CYGWIN_NT-10.0 satellite 3.0.7(0.338/5/3) 2019-04-30 18:08 x86_64 Cygwin
> >>   $ uname -s
> >>   CYGWIN_NT-10.0
> >>   $ uname -o
> >>   Cygwin
> >>   $ 
> >>
> >> [ie. I don't think 'uname -o' returns Cygwin32 or similar. :( ]
> > 
> > Indeed, I'm guess it doesn't. 
> > 
> >> So, I don't know.
> > 
> > I see several possibilities:
> > 1)  just this patch, wich is OK for 64-bit platform/compiler
> >     where 32-bit needs to be forced with -m32
> > 2)  simply not define __CYGWIN32__ at all based on the
> >     conviction that it's only __CYGWIN__ that should be tested
> > 3a) in cgcc add 'm32=1' in the i386 part if $m64 is not set
> > 3b) in cgcc add 'm64=1' in the x86_64 part if $m32 is not set
> >     and change this patch to test $m64 instead of testing $m32
> > 4a) in sparse itself, add something like:
> > 	if (arch_mach == MACH_X86_64 && arch_os == OS_CYGWIN)
> > 		add_pre_buffer("#undef __CYGWIN32__");
> >     or:
> > 	if (arch_m64 != LP32 && arch_os == OS_CYGWIN)
> > 		add_pre_buffer("#undef __CYGWIN32__");
> > 4b) do not define __CYGWIN32__ in cgcc and add something like:
> > 	if (arch_mach == MACH_i386 && arch_os == OS_CYGWIN)
> > 		add_pre_buffer("#define __CYG_WIN32__ 1");
> >     or:
> > 	if (arch_m64 == LP32 && arch_os == OS_CYGWIN)
> > 		add_pre_buffer("#define __CYGWIN32__ 1");
> > 
> > For the long term, I would prefer something like 4a) or 4b)
> > but currently it would only work for native builds.
> > 
> > So, I think that 3a) should be the best.
> 
> I nearly sent this patch instead:
> 
> $ git diff
> diff --git a/cgcc b/cgcc
> index 2223c97d..ddc6de23 100755
> --- a/cgcc
> +++ b/cgcc
> @@ -252,10 +252,16 @@ sub add_specs {
>      } elsif ($spec eq 'unix') {
>         return ' -Dunix=1 -D__unix=1 -D__unix__=1';
>      } elsif ( $spec =~ /^cygwin/) {
> +       my $c32 = 0;
> +       my $m = `uname -m`;

This won't work correctly with:
	cgcc -target=i386 -target=cygwin ...
wich I'm using for some testing :)

> However, other than 'hand testing', I could not be sure it would
> work on an actual 32-bit cygwin system. (hand testing seems to
> imply that it should work, but well ... :-D ).

In this case, hand testing is perfectly fine.

Best regards,
-- Luc

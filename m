Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0A3421486A
	for <lists+linux-sparse@lfdr.de>; Sat,  4 Jul 2020 21:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgGDTcv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 4 Jul 2020 15:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgGDTcv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 4 Jul 2020 15:32:51 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1B3C061794
        for <linux-sparse@vger.kernel.org>; Sat,  4 Jul 2020 12:32:51 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id d18so25130456edv.6
        for <linux-sparse@vger.kernel.org>; Sat, 04 Jul 2020 12:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fKEOzP5yE+xVFBUEVqHpEBvwGxdUOtemhadB3CAOkRw=;
        b=lkmXDGQS2EzQmyn1WVFOT0vc23lZmXADWv0A601mUGp951MhPxXEnXT8dO1cqbmRW1
         ommkkCygxJVMtwOZei+kd5zSFWkI+EVXUTM/3N1b7EreAEtroRYwasEZUVwY8oJIyenN
         m+UdAW4DHKxpJzY6ed4PEfB12SbW9u21mEyXTJnWSNjHRFqnj1pBPJCInRB90vLylMVY
         rHFJTtW5o6i7BbQZwBE+BUDHL5aFvvoP8hzL9UC8i5ixeecDxPYRbigr8zhxcYpUU+Pq
         a8e2dwKG0DceB/HwjMIpLP7D16E3p7hquBl6nzLbR9aVRaKcwvosQRAn/J0QqrzxleyJ
         yAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fKEOzP5yE+xVFBUEVqHpEBvwGxdUOtemhadB3CAOkRw=;
        b=P/fQtQWPFAFdswX4xgaeiYzqfCAp9/ilZdBI5lT5ou3nv2W3WvlDHY8q1lkp8sAkuy
         CiPhLk25gGv7LqB0fPvvtI4uN543eO7tEzg5xCgQNwwW+0L5CMurBzzG2ufh1n67/OHA
         ONOsSLZPWQhIFKJyXi7YawZ+CQnQFr35T4MU/CMQT4AS0yvpES7BMU5jZleo+5RCunnY
         9Mqn9xR67FPaDhAGvXATudOt6NJbhTUx4bhM7TCe/ZfgWrE5a5q1u40xz84ygLH5lb6o
         15wy2egdl6iB1j7IN0ruxInQ23WzRkEVyxqFFUd8Jbg6bSV67QXYe8+zvA83yrT0Z4/d
         uXJw==
X-Gm-Message-State: AOAM532Tep/OzvEIG0x/7UHCnEAnTROEkVJ0waK/NjFxoLMICO7z1xBv
        e/iud2nGOkpgcprUQk5LUKh/xczP
X-Google-Smtp-Source: ABdhPJz1eDPixaLPVfwiK/KlwwVhp8zuugbj8OUeMbhYhLso4pXg7GKYHHf0uMI8uly6Pn9skaeJUw==
X-Received: by 2002:a50:cdc6:: with SMTP id h6mr46486533edj.111.1593891169895;
        Sat, 04 Jul 2020 12:32:49 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:9c84:fa:45f:8047])
        by smtp.gmail.com with ESMTPSA id g8sm18288953edk.13.2020.07.04.12.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2020 12:32:49 -0700 (PDT)
Date:   Sat, 4 Jul 2020 21:32:48 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 2/3] add memory asm constraint for PPC
Message-ID: <20200704193248.simtaedrt7gbiepy@ltop.local>
References: <20200704135747.87752-1-luc.vanoostenryck@gmail.com>
 <20200704135747.87752-3-luc.vanoostenryck@gmail.com>
 <693a3fa0-5202-3695-54cf-aa1cc1f514fd@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <693a3fa0-5202-3695-54cf-aa1cc1f514fd@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, Jul 04, 2020 at 06:44:53PM +0100, Ramsay Jones wrote:
> 
> Hi Luc,
> 
> All of the patches in this series look good to me! ;-)
> 
> (I have been following all patches on the list, I just
> haven't had anything to say about them - which is a good thing!)

Hi,

Yes, indeed. Thank you!
 
> On 04/07/2020 14:57, Luc Van Oostenryck wrote:
> > The 'Z' asm constraint is used for doing IO accessors on PPC but
> > isn't part of the 'common constraints'. It's responsible for
> > more than half of all warnings (with defconfig + allyesconfig).
> 
> Not a problem, but this made me think 'half of which warnings'. :-D
> I assume, but it's just a guess, this means 'half of all asm-constraints
> warnings on the kernel PPC build'.
> 
> How many warnings is that? What percentage is that of _all_ sparse
> warnings on a typical kernel build?

It's literally more than half of all warnings issued by sparse when doing
a build of the kernel with 'defconfig' and another one with 'allyesconfig'
(all my tests on kernel builds are done like so) on a ppc64 machine:
	$ grep ': \(error\|warning\):' log-master-master | wc -l
	138581
	$ grep ': \(error\|warning\):' log-arch-asm-mem | wc -l
	50006
So, this series eliminates about 64% of all warnings, a nice
improvement of the S/N ratio.
Now, most of these warnings are exactly the same, again and again:
	$ diff -U1 log-master-master log-arch-asm-mem
	--- log-master-master   2020-07-04 14:40:56.733110303 +0200
	+++ log-arch-asm-mem    2020-07-04 15:46:47.972595182 +0200
	@@ -1 +1 @@
	-SPARSE=fa1539620
	+SPARSE=69fedae3e
	@@ -24,8 +23,0 @@
	-./arch/powerpc/include/asm/io.h:143:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:144:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:148:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:149:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:143:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:144:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:148:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:149:1: warning: dereference of noderef expression
	@@ -41 +32,0 @@
	-./arch/powerpc/include/asm/io.h:144:1: warning: dereference of noderef expression
	@@ -56,4 +46,0 @@
	-./arch/powerpc/include/asm/io.h:143:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:144:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:148:1: warning: dereference of noderef expression
	-./arch/powerpc/include/asm/io.h:149:1: warning: dereference of noderef expression
	 ...

If you count only unique warnings, the result is quite different:
	@gcc203:~/dev $ grep ': \(error\|warning\):' log-master-master | sort -u | wc -l
	19071
	@gcc203:~/dev $ grep ': \(error\|warning\):' log-arch-asm-mem | sort -u | wc -l
	19067
Only 4 unique warnings are eliminated.

For comparison, on x86_64 the warnings are:
	$ grep ': \(error\|warning\):' log-master-master | wc -l
	29806
	$ grep ': \(error\|warning\):' log-master-master | sort -u | wc -l
	19234

> Thanks!
> 
> [BTW, I also noticed the (long running) 'luc/options' branch, which
> looks like it could prove to be a nice cleanup - I've only read the
> commit messages, not the actual commits.]

Yes, I think it's a nice cleanup because this code is quite messy but,
OTOH, moving around all this code break all its history (via 'git blame'
or 'git log -L') is is guaranteed to create really nasty conflicts with
anything touching the code for the options. This is really a downside.
 
Best regards,
-- Luc

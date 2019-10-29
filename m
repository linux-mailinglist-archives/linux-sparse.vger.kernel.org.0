Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E19FE846E
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 10:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfJ2J2M (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 29 Oct 2019 05:28:12 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51969 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbfJ2J2M (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 29 Oct 2019 05:28:12 -0400
Received: by mail-wm1-f68.google.com with SMTP id q70so1726524wme.1
        for <linux-sparse@vger.kernel.org>; Tue, 29 Oct 2019 02:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mrpnI7h3W1UUyPP8m/PZdAr6MT/vPvxNFbSiUjM4RCg=;
        b=kBsiIgXAx13wT+HRJS0quVg0CQuIYghK3olmRKJgLQAL3Bjp3RtXyFsSFk13koCvDH
         z5VrjrX9xcQrmbw3e7qxWcPLHjb8xGF+/NPG3hmjy3pGmqEPW+yAAc1VeNbdI0UI+T8c
         qJxI/Ce7JSUfcZgwtzydQ2ClRMLNACVshmTWbXo0I9XZlIqyYGdN0Q9t3CqnYJBcIuOW
         7I1R6fLZXOmgSxNhPSfP4rnzTpOsXzGX9WAeNifpSUGg6kTqngKaD8JAHS3mF7xGN0cg
         hvasgKA7k2+HA826UezLBgIw48nCwDBFNjk5N1c+kZPl7JmACMQ+Hza1nzCzHHl8md4U
         qKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mrpnI7h3W1UUyPP8m/PZdAr6MT/vPvxNFbSiUjM4RCg=;
        b=kXrYe//xTwKFFdxjR6L0E78WCXIWx32Z/awjdNUnLINv3tU3UolqXCQM8oUw2yZHDv
         gCgWztNY8mz4KYvgDgz7F3H4cjLeUVpk74GkkB1KJ7a4HZBMbjaBtiVfs8JVs6G+xcJw
         pHgu59q7a8Uc1HtlDZlRdUh7hwuZQRzgCwBKUvrWdEKN//oq4HfqEfoBs/90d5gN28An
         cDPW3IQmW+qHYxsXIg/kO5YU5UBnPOpfh6i9s+9Errq3uftfcnM7Z9gl6EIFpNTcwOVa
         nGeJTghhQpypIBr8wydiBlNdExYXoTp71Eey/Vs5+CcJH9exILT9aWsMUyT2HspbGgv3
         pAZw==
X-Gm-Message-State: APjAAAUKBaSizmciRR92Dvhwl4H2AnaIHAqNL0w5Mr0acBDizFl3xHc0
        DblYEiw3r53y3ukr+lxqclAqfIDA
X-Google-Smtp-Source: APXvYqzWKXBC6Fmf2fhfW50d13yeR+Jc9ZJaxo3EdZjldZdCzjLjFS6A4byZwthhlP1aU/ESXqti2g==
X-Received: by 2002:a1c:7313:: with SMTP id d19mr3216474wmb.16.1572341289821;
        Tue, 29 Oct 2019 02:28:09 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:c1a7:4ac0:2d11:a4f8])
        by smtp.gmail.com with ESMTPSA id i18sm14440267wrx.14.2019.10.29.02.28.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 02:28:08 -0700 (PDT)
Date:   Tue, 29 Oct 2019 10:28:08 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] options: allow to specify the desired arch with
 --arch=<arch>
Message-ID: <20191029092807.cvb7ipfexxfyr5nc@ltop.local>
References: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
 <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 29, 2019 at 02:32:15AM +0000, Ramsay Jones wrote:
> > +	static const struct arch {
> > +		const char *name;
> > +		int mach;
> > +		int bits;
> > +	} archs[] = {
> > +		{ "aarch64",	MACH_ARM64,	64 },
> > +		{ "arm64",	MACH_ARM64,	64 },
> > +		{ "arm",	MACH_ARM,	32 },
> > +		{ "i386",	MACH_I386,	32 },
> > +		{ "m68k",	MACH_M68K,	32 },
> > +		{ "mips",	MACH_MIPS64 },
> > +		{ "powerpc",	MACH_PPC64 },
> > +		{ "ppc",	MACH_PPC64 },
> > +		{ "riscv",	MACH_RISCV64 },
> 
> I would rather these were explicitly set to 0.

Hmm ... To me, the difference pop out better like so.
The absence of a value is supposed to mean "there is not
a known size for this, it needs to be calculated/guessed".
I find that an explicit 0 conveys this les well.
 
> > +		{ "s390",	MACH_S390X,	64 },
> > +		{ "s390x",	MACH_S390X,	64 },
> > +		{ "sparc",	MACH_MIPS64 },
> 
> Er, I suppose this should be MACH_SPARC64, right? (also 0 init).

Ooops, yes, thank you. Bad copy-paste, bad.
 
> > +			if (bits == 0) {
> > +				// guess the size of the architecture
> > +				if (!strcmp(suf, "")) {
> > +					if (arch_m64 == ARCH_LP32)
> > +						bits = 32;
> > +					else
> > +						bits = 64;
> 
> So, this is a 50-50 bet. ;-)

No, not really.
The -m32/-m64 flags are still taken in account, before the
--arch and after it too. If no -m32/-m64 is given at all
then the used size is the one of the native arch (because
arch_m64 is initialized so). I think it's quite natural to
use but it lacks some error checking (e.g.: --arch=arm -m64
will purposely *not* select arm64, aka aarach64, but no
warnings will be issued).

-- Luc

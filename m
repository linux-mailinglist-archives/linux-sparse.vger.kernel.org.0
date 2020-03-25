Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3EAA191E9F
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Mar 2020 02:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727253AbgCYBjY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 24 Mar 2020 21:39:24 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37821 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727243AbgCYBjX (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 24 Mar 2020 21:39:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id d1so812690wmb.2
        for <linux-sparse@vger.kernel.org>; Tue, 24 Mar 2020 18:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q04bxDG/Z/+J5NvWTaRJT5mmNjS+yLDSJ02lEwMtIiM=;
        b=CDZiPItFaUuT3bFVu/iX1HJ6MwcYb7xFFIx9OBRiiLOVDdHVS2oqHsJK7jXCw0Lxot
         L2/2JpQazlZ3Qr9akCMsSmNvB4A8NxsimLbgg+VW1S/YNJiHd3/oOg0ukTn8h+WIlm5G
         X3pjiOLtC7vbcDM1NBQG/dgw9HVruHFld0FbEvIHbYgDlWF1IKptYrnE3jSU276KvQNm
         T/taBtJEl6n9z4HPzO/3fqvVVXr7e8XAfcGOlOg3ABr0kUISbwR7v1bcw/bWKvF03wXu
         OWpaF96hJxgBFtfeB99MFuOo6DxrOHd2N3U81jU7Vc5bPcVb35iWt709xwSB3F1fPZ9Y
         exMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q04bxDG/Z/+J5NvWTaRJT5mmNjS+yLDSJ02lEwMtIiM=;
        b=NqmFcN4RRj7GJBZwvLi38dOsVdue+I9Ha68QqPceuYZHj3xruN5VmWWCPrJvqpTZTv
         MFmfq4x4bR2FNHb8KCb66+1yganVmG7r6Ti9rpGO3f7/fMPbm02QtuQEQ4xjyj1TX5vJ
         TGn3eMeDXdSwxpRM79S2Wq/PqUpb9MFH/DTHbZBO0izOf4FV6Xe7Meukb035b060YGxf
         sP29ehMh7BoZGwjfDiRdfPgT56BE74oBI5c71LJd66ghYM3J+g51L967HGj9X9qJv6w3
         9B8fbouzd08/E7QTa2HXBr04OtWkQavxld3V3SzMWEnRBJPhh5y4oixKHsytWbqZIkDf
         pL0w==
X-Gm-Message-State: ANhLgQ1j1otJQtd4AnPZfsPSaFA9wVjKPz53kUh6HH+9Yx1oBxGFNgWo
        OF+owNfirnovWYZpGF/v9aYOQ8kr
X-Google-Smtp-Source: ADFU+vssh797UsHEYFUBcGKUHVjmJ5Te/q+OZ5U24VnTK0Z6uDXVKfT0YjrSGqvXtb6DpNiC1gjGXA==
X-Received: by 2002:a05:600c:258:: with SMTP id 24mr843766wmj.59.1585100361835;
        Tue, 24 Mar 2020 18:39:21 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:6d4c:be31:47af:8c31])
        by smtp.gmail.com with ESMTPSA id i19sm6698376wmb.44.2020.03.24.18.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 18:39:21 -0700 (PDT)
Date:   Wed, 25 Mar 2020 02:39:20 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] add support for GCC's __auto_type
Message-ID: <20200325013920.ynrmmrnkcqyupdmm@ltop.local>
References: <20200324095711.84902-1-luc.vanoostenryck@gmail.com>
 <42f2b610-4a89-c4c5-2291-228610b01868@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42f2b610-4a89-c4c5-2291-228610b01868@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Mar 25, 2020 at 12:37:22AM +0000, Ramsay Jones wrote:
> On 24/03/2020 09:57, Luc Van Oostenryck wrote:
> > Despite the similarity with typeof, the approach taken here
> > is relatively different. A specific symbol type (SYM_TYPEOF)
> > is not used, instead a new flag is added to decl_state, another
> > one in the declared symbol and a new internal type is used:
> > 'autotype_ctype'. It's this new internal type that will be
> > resolved to the definitive type at evalution time.
> > 
> > It seems to be working pretty well, maybe because it
> > hasn't been tested well enough.
> 
> I haven't tested this (yet) either, but it looks good from what I see
> in my email client! ;-) (I deleted my Linux repo many years ago, because
> I was always over 90+% used on my disk - and I was only using it as a
> 'large' repo to test git!).

Yes, its size become interesting ;) 
But it shouldn't contain (yet) an occurence of __auto_type so
it wouldn't help here.

> BTW, I recently upgraded an 32-bit Linux Mint 18.3 to 19.2 using a
> 'nuke and pave' procedure, rather than the 'upgrade path' provided
> by Linux Mint. As part of that, I backed up my $HOME directory from
> 18.3 and 'restored' it to the new 19.2 (so far, so good). When I built
> sparse (before installing llvm), the test-suite failed all of the
> 'backend/' tests. Given that these tests should have been SKIPed, since
> sparse-llvm was disabled, I was a little surprised.
> 
> I am sure that you will have guessed by now, that I had an sparse-llvm
> executable from 18.3 laying around, ... :-D

For a moment you worried because I understood it as if it was
one in your PATH or so and this shouldn't be called from the
testsuite. But yes, it could happen if it comes from an old build
in the current directory.

> I thought about sending a patch to the Makefile to always include the
> sparse-llvm program in the clean target (it wouldn't hurt being in the
> 'rm' invocation twice), but decided that this is unlikely to happen very
> often, so ...

Mmmm, yes, it wouldn't hurt.
We could also do something like:

	ifeq ($(HAVE_LLVM),yes)
	... stuff ...
	else
	CLEAN += sparse-llvm
	endif

which has the advantage to not have to keep elsewhere the list
of extra targets for cleaning and keeping these things together.

> BTW, I noticed that we don't install 'sparse-llvm-dis' or 'sparsei' as
> part of the 'llvm programs' - should we?

I don't think so.
I only added sparse-llvm-dis to debug sparse-llvm and when sparsei
was added it also wasn't installed, for the same reason I think,
they're just dev tools. Now, if sparse-llvm would be more complete
and would more commonly used then yes, maybe.

In my opinion, none of the tools that depends on an external library
should be installed by default. Each of them should be, for the
distros, a separate package (like some distros do/did for inspect).

Keep safe,
-- Luc

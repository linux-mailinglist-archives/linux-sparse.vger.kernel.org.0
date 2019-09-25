Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10BFDBE82D
	for <lists+linux-sparse@lfdr.de>; Thu, 26 Sep 2019 00:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfIYWQO (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 18:16:14 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:35232 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728733AbfIYWQO (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 18:16:14 -0400
Received: by mail-ed1-f66.google.com with SMTP id v8so181650eds.2
        for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2019 15:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AwqDx9t8oguvqVi7UH4rUY+BobT6I8jViAT0+YzYEKQ=;
        b=D5oExpcVDxqvGAae4I9l7KKUjfyjSBUPbuEL/x2VnDVXmNJb3ICw+Hh90kVP/SevZm
         hauY0NCg3f1B//cAExLl4wIOQ0PyRSRvQxwjTdJIts2j0zfuJhbSTl7wbUUksEDkw1UU
         I7k6KUx/0lFm7oqwVX1nmPj/0UPAI0K7fLEFiFkqQqeBrqoTUF9AugOc4ARttKC5VZIn
         Q1Dz0prQHdEwLE+id0uAq4aOCfWbZwfjgDCqDKrs9COfPgB1lcl9wbQmtnWuQJQ08kNw
         U8YyEY3KDwC+a9W0UtR2+6Mvi0fbnVlcf61J3D1GQrHdODnRdUKc6ZQ8VDMYBrQQSxyk
         xa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AwqDx9t8oguvqVi7UH4rUY+BobT6I8jViAT0+YzYEKQ=;
        b=jFJqvNdoe+uTEfM2uGON5yJL8qNOqAtE4S4zIUWo+ouBytBj2YaUxVBEQPnyoubP4e
         v47GYixmTgGIt+AF3pI1cDk8sJbHCgTej0vK4jOTZymmpVZYFySnM/2N6g4k6W84JpUk
         6COt8FmY/YT0qhEBEsxK0BJBwYiQrHa3EUtELTU725wSNPbZCLB/aObouJDkYU2WwMUJ
         x9GVz5T4hM4QXlGBzuWUFKzOBW7kd2yj/2gF9R+C03MToAOeL47VWnpQp4YiqBQpgiWk
         v6Pb7xgsgVMkd/7RSjGS/Nb3bNBt722/fdHNQtKFZ9YbFWTg6lqft/w/rwtcG13OKrOu
         vX1Q==
X-Gm-Message-State: APjAAAW3s85vvqMVLoNY1/Tsn1uQLyOAb5N9p8NcjPd4UxT9ULEU3eKA
        0aoMfaIugygsdtR7os21bOPAzMQ0
X-Google-Smtp-Source: APXvYqxGdmLbnz9p7mXZ5PzFFTqvzdZHAZ7fH2HuarDdfcH+8H3Khx2Vk8u1kHhc3I/MF1m9Q2vteA==
X-Received: by 2002:aa7:c616:: with SMTP id h22mr303212edq.96.1569449773192;
        Wed, 25 Sep 2019 15:16:13 -0700 (PDT)
Received: from desk.local ([2a02:a03f:4080:1900:553b:deac:4ba3:2b98])
        by smtp.gmail.com with ESMTPSA id s22sm10222eja.91.2019.09.25.15.16.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 15:16:12 -0700 (PDT)
Date:   Thu, 26 Sep 2019 00:16:11 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: problem building sparse 0.6.0 (sparse-llvm)
Message-ID: <20190925221610.srmkmsqkmqh4uzd3@desk.local>
References: <5ebc73fc-1c4f-e97a-f626-ec0d35ec4e69@infradead.org>
 <c03600e0-057a-fb59-78b4-60f363c1b44d@infradead.org>
 <c037bde7-84ea-a7ed-ab81-f5a054093069@ramsayjones.plus.com>
 <f135aab3-5a94-f073-2fd2-c1890abe37b0@infradead.org>
 <54aaa827-4f31-69de-277b-f9723b829d02@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54aaa827-4f31-69de-277b-f9723b829d02@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Apr 26, 2019 at 05:46:22PM +0100, Ramsay Jones wrote:
> On 26/04/2019 16:20, Randy Dunlap wrote:
> [snip]
> > 
> > --- sparse-0.6.0.orig/Makefile
> > +++ sparse-0.6.0/Makefile
> > @@ -160,7 +160,8 @@ ifeq ($(shell expr "$(LLVM_VERSION)" : '
> >  LLVM_PROGS := sparse-llvm
> >  $(LLVM_PROGS): LD := g++
> >  LLVM_LDFLAGS := $(shell $(LLVM_CONFIG) --ldflags)
> > -LLVM_CFLAGS := -I$(shell $(LLVM_CONFIG) --includedir)
> > +LLVM_CFLAGS := -I$(shell $(LLVM_CONFIG) --includedir) \
> > +	$(shell $(LLVM_CONFIG) --cppflags)
> >  LLVM_LIBS := $(shell $(LLVM_CONFIG) --libs)
> >  LLVM_LIBS += $(shell $(LLVM_CONFIG) --system-libs 2>/dev/null)
> >  LLVM_LIBS += $(shell $(LLVM_CONFIG) --cxxflags | grep -F -q -e '-stdlib=libc++' && echo -lc++)
> 
> Thanks!
> 
> I just tested your patch on cygwin and, as expected, it does
> not introduce any regressions.
> 
> However, I should have made it clear that I meant to suggest
> that we should _replace_ the definition of LLVM_CFLAGS with
> that single call to llvm-config. So, I also tested the
> following on cygwin:
> 
>   $ git diff
>   diff --git a/Makefile b/Makefile
>   index f816a50..7e8c2ab 100644
>   --- a/Makefile
>   +++ b/Makefile
>   @@ -165,8 +165,7 @@ ifeq ($(shell expr "$(LLVM_VERSION)" : '[3-9]\.'),2)
>    LLVM_PROGS := sparse-llvm
>    $(LLVM_PROGS): LD := g++
>    LLVM_LDFLAGS := $(shell $(LLVM_CONFIG) --ldflags)
>   -LLVM_CFLAGS := -I$(shell $(LLVM_CONFIG) --includedir) \
>   -       $(shell $(LLVM_CONFIG) --cppflags)
>   +LLVM_CFLAGS := $(shell $(LLVM_CONFIG) --cppflags)
>    LLVM_LIBS := $(shell $(LLVM_CONFIG) --libs)
>    LLVM_LIBS += $(shell $(LLVM_CONFIG) --system-libs 2>/dev/null)
>    LLVM_LIBS += $(shell $(LLVM_CONFIG) --cxxflags | grep -F -q -e '-stdlib=libc++' && echo -lc++)
>   $ 
> 
> ... which also works! The only difference is that '-I/usr/include'
> is not passed to gcc twice.
> 
> Looking at commit 65840c61dc ("build: only need includedir from
> llvm-config", 2018-12-18), Luc only wanted the 'pre-processor'
> flags not all of the '--cflags'. The '--cppflags' argument to
> llvm-config is used for just that. ;-)
> 
> If you could confirm that the above works for you also, that
> would be great. Thanks!

Yes, I agree and applied.
Thank both and really sorry for the delay.

-- Luc

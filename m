Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39F9F156A16
	for <lists+linux-sparse@lfdr.de>; Sun,  9 Feb 2020 13:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbgBIMTz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 9 Feb 2020 07:19:55 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36263 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726378AbgBIMTz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 9 Feb 2020 07:19:55 -0500
Received: by mail-wr1-f66.google.com with SMTP id z3so4144531wru.3
        for <linux-sparse@vger.kernel.org>; Sun, 09 Feb 2020 04:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+MzLZXm5Zt6jq5yy02+/YkJD7L/rQlgDwts+qH+fEyw=;
        b=guG9dkzurj8mvJYv954u4lDYBUGxAO5t6GsHVUlQX61aHQSgri65r5gqBooigDm/23
         Qy/vb3RAO/QRjjyX87cyJETF5aCAbhwrCfWF03PA+xYQ5/V3RjXYmNX24tI+tKJDENQa
         lGVR+Zo/u4/920VfKmbBiv//tprSQPiQ+T1NiFyphk0ZHLq9Rc/NIHyYY8G9EfNg0tNM
         a7tQ2QDomSrtC3TT2eG1rMe9AMow4tvOGvEk2ECRiAIfrbM7lCwET3fM/PBlmZYnRdi8
         7CI+7p4vRKRR9VvpDiGVhPTyIXmS3mqZaz+sB89Z7y8zMLDHOKODEcQA8SmDAoj1K3V1
         FevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+MzLZXm5Zt6jq5yy02+/YkJD7L/rQlgDwts+qH+fEyw=;
        b=uQvTN+UKvan2Cyr3c1UG+BEVCcqkQtADOWNIenyxq0cJmE6B8wlUnjn2FvlY28PwzC
         bsuuAxC93gdIEKhm6bQzOkWy2OMsWvHjCt6rrQZEtoARx9rQIUDQOw7b0Gw5UWXhdOvI
         isqpbcr5aewsPIZVDgUbdvlbRjy3avvXkQqtXHogqDbTSyQYSZK4AHhogiwog0wM9xM8
         VC6rkhdCV2z0RzK5A6FhFUMWktWJO/IEebxtpKowJlKJHOeZKC67c9aiaZ9+MQuPjtuT
         k7Or4wRKrbjr13FASN5vd+ol029+TyKisBf6HltOoNYzrxNBFQdpk3RbGltR3LEU4N5y
         y9zQ==
X-Gm-Message-State: APjAAAX8xg2G7zoZEanqjhKoD/QamcHsbU2uTsyz0oz0gtQcuTC/7RrC
        +6vTfD4G99Svd2DYHuQPbLLUJ6olgpo=
X-Google-Smtp-Source: APXvYqyWq31xOwHXXwxxRgKnvv5oj3oOiWBRtEwF0F0HCwfTa7JaldDVL/iVi1Z+M7JOajRRaaxCZA==
X-Received: by 2002:a05:6000:192:: with SMTP id p18mr7437081wrx.218.1581250792330;
        Sun, 09 Feb 2020 04:19:52 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:d1b8:80d0:addd:f2ce])
        by smtp.gmail.com with ESMTPSA id 5sm12364659wrc.75.2020.02.09.04.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2020 04:19:51 -0800 (PST)
Date:   Sun, 9 Feb 2020 13:19:50 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH bpf] bpf: Improve bucket_log calculation logic
Message-ID: <20200209121950.gxnfnyr2tpnuqz47@ltop.local>
References: <20200207081810.3918919-1-kafai@fb.com>
 <CAHk-=wieADOQcYkehVN7meevnd3jZrq06NkmyH9GGR==2rEpuQ@mail.gmail.com>
 <CAHk-=wjbhawNieeiEig4LnPVRTRPgY8xag7NuAKuM9NKXCTLeQ@mail.gmail.com>
 <20200207204144.hh4n4o643oqpcwed@ltop.local>
 <CAHk-=whvS9x5NKtOqcUgJeTY7dfdAHcEALJT53cy3P7Hzfgr1g@mail.gmail.com>
 <20200208235459.xmliqf2ksbre53jj@ltop.local>
 <CAHk-=whqDZUo6yARXMgwHSJRerXM4tWgMPV=MC9wR80YCEon1A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whqDZUo6yARXMgwHSJRerXM4tWgMPV=MC9wR80YCEon1A@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, Feb 08, 2020 at 04:58:51PM -0800, Linus Torvalds wrote:
> 
> Anyway, your fixed patch looks good, and the numbers look lovely. I
> don't see why there would sometimes be extra memory use, but the patch
> feels like the right thing to do regardless.

Yes, I'm quite happy with it so. Thank you for the suggestion.

For the cases with extra memory consumption, I've investigated the
most extreme one and it's quite interesting. The extra memory was
used for basic blocks, instructions and pseudos, so more linearized
code. I reduced it to:

	static inline int get_order(long size)
	{
		return __builtin_constant_p(size) ? 0 : 1;
	}
	
	int foo(void)
	{
		return get_order(0);
	}

Sparse used to not recognized the size as a constant (I don't
understand why but haven't investigated). Strangely, the builtin
without the conditional gave the expected result.

Now, with the patch doing the inlining during expansion, the size
is correctly recognized as a constant, with or without the conditional.
The extra linearized code comes from some complex expression that is
now selected instead of a function call (while reducing, I had the
vague impression that the expression should have expanded further
but I haven't check that yet).

-- Luc

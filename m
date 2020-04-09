Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC8031A2F1D
	for <lists+linux-sparse@lfdr.de>; Thu,  9 Apr 2020 08:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgDIGXW (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 9 Apr 2020 02:23:22 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]:38698 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgDIGXW (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 9 Apr 2020 02:23:22 -0400
Received: by mail-wm1-f48.google.com with SMTP id f20so2928073wmh.3
        for <linux-sparse@vger.kernel.org>; Wed, 08 Apr 2020 23:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=noru5HY3SqBBnFYuFR5cInZKSxFay+MBq29p1cMa3Tk=;
        b=qIAQZY7Z5BxYqLoetMdD301Uw1LD6HDnHV/TYcuISYBAdcgQSG2yDkDIyQaP+53Wry
         YsTasJxdqxTQy6swltgSgfR283adkGfs5o6ULsTyRECGSBOjbKjSZNFGRru+qKuAOwDt
         ulpJizFPq/Tg/LrET1ezmp7Rcr0wMagkBeLljs51Ztu5FTIgykDOp4N+W1mD4SzHo996
         WI5uBsdPZ0KjkJ+D0pRraR9ZlhypOJQrh9QLMxolU7i4QKNJLaBatAlUmEIMTDRVQ07c
         Iytl6u+lp8hxgtVSyOwJEADIvTchislk03s/7tPZuVKunq5rxi+erReyNeWph/sAhPxW
         aEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=noru5HY3SqBBnFYuFR5cInZKSxFay+MBq29p1cMa3Tk=;
        b=cM1Um22i83swNWgN4crJimKFxSE5tX5h4J1haRlmR3pc+icolgVxz8mHfAQ7teEO1j
         46q+4bfN7ctzpTHx1+2cS62RJtummmlQcwz3a8hs7BK4E7Zibh8PWrjDXZ1gwu0gRvQL
         GbWKl2TlndTMOMFuWRPZAHCBjI1LmWC+YwVj/YLcMbrG1lFncFpR3D647C3A1PVr288Z
         r9DsFs8Bz7IFv8SUekLP2/jRFSNkB8FJ6VtbQaa11WV6AVJSbekk4cFcvhDUFi3Z+H1r
         1QC3U99nPP58HK64MAReRHTShwf09rGXRRhVm+49U9vW8HIoDtAVofUD0LgtO5rha5U7
         2ZKg==
X-Gm-Message-State: AGi0PubUK3eCvb3ckI26lkWx3A5u0uVzPOzLMHaCMlw4Ca91M2ewpJJL
        9Nk6ajyZ8pxNOn/AvEYTFow=
X-Google-Smtp-Source: APiQypKjM+iN+uTLgOfm4z9qBWXRLcYf2kDywHKRVHAwBPLr6mZmirBBd2s094wpXAZ2rOohB9rkZQ==
X-Received: by 2002:a1c:2007:: with SMTP id g7mr8288484wmg.70.1586413400706;
        Wed, 08 Apr 2020 23:23:20 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:41f1:931b:a455:d349])
        by smtp.gmail.com with ESMTPSA id r5sm2388169wmr.15.2020.04.08.23.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 23:23:19 -0700 (PDT)
Date:   Thu, 9 Apr 2020 08:23:19 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: Interesting (?) failure case
Message-ID: <20200409062319.ykuewl7z3dc3a55n@ltop.local>
References: <CAHk-=wg=Fs=EecQCNNzofn8+QXuB-sYy9m+YVPAmzDesmqFsbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wg=Fs=EecQCNNzofn8+QXuB-sYy9m+YVPAmzDesmqFsbg@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Apr 08, 2020 at 09:02:59PM -0700, Linus Torvalds wrote:
> Try linearizing this with 'sparse', and see it fail miserably:
> 
>    int t(void)
>    {
>         goto inside;
>         return 0 ?
>                  ({ inside: return 3; 1; })
>                 :
>                  2;
>    }
> 
> I came up with that disgusting example after talking to Nick
> Desaulniers about how sparse does some front-end optimizations early,
> and it made me go "Hmm... What about.."

Funny, I worked on something very similar last week:
	void f(int x, int y)
	{
		1 ? x : ({
	a:
			 y;
		});
		goto a;
	}

> There are two reasonable approaches for the above:
> 
>  - return 3 (due to the "goto inside")
> 
>  - tell the user to pound sand for doing crazy things and jumping into
> a statement expression from outside.
> 
> clang does #1. gcc does #2.
> 
> sparse does something bad, and just generates garbage silently.

Yes, the problem is caused at expand_conditional() where one of
the sides is throwed away if the condition is known. So the label
doesn't exist anymore and at linearization Sparse ends with a
jump to an unexisting BB.

I tried to simply discard the early optimization in expand but
then when testing the kernel I got a whole bunch of warnings
(bad type or dereference of noderef type, I don't remember).
So it seems that in general (when nobody jump into the expression
statement) the conditional needs to be simplified before evaluation.

I tried also to warn on gotos jumping into an expression statement.
The idea was to give a new 'label_scope' for each such statement.
Things are a bit complicated because the labels are implicitly
declared by the gotos.

I'll need to look a bit more at this.

-- Luc

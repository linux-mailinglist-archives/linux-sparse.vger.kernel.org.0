Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845421D3F65
	for <lists+linux-sparse@lfdr.de>; Thu, 14 May 2020 22:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgENU4I (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 May 2020 16:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726200AbgENU4H (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 May 2020 16:56:07 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60274C061A0C
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 13:56:07 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id 50so455637wrc.11
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 13:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vz/t/7Lq6zvW6RctxGLgO7XQXnVLn1psq0uhSSmk2Uk=;
        b=B916vywkEJpu5xp6vB3knUimjGlQC01liTrLaLQDfOmAhHdx2OCiupjbMVtKN7Htjs
         0HqIWj2XSm6pFptglgVogtVOD5cHDaoujHY/O3BRdncPwC2tg8Bf+H44wdGAGBhJy5n8
         fmTaNmqdnGGcl5z1NjlHJXjf4+FRtS1vwN3koEUmXLqzzBTKMB/cs9fPSm4IIpzL6cPS
         Z7OarNmNeaDqvatyYSCc7bhLDkq5pwVNWl0lDgAKG7QMi3XQSoYD1TJ4HX04+vb7c2Cm
         xt1E+lqfZx3rTKB1KAUKxXFJnlhkUXIfPLRPF86nHKyyiQtXROkfk3sH+j5aneZ8RBZc
         +ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vz/t/7Lq6zvW6RctxGLgO7XQXnVLn1psq0uhSSmk2Uk=;
        b=GRXOyO4Xmi+Z7y6NfBNDkuT0+7padyuwoWn2/JKe3/f2ikJzGiArFtgMMYfmgJXdkP
         BeB2SPS5wYWonkUmjy8tcGF3c3VtsBaNWgXfbRqGAfHt9dzsZcjHELPEEMgBinCsOUpo
         LxTunKGjQ4YzOf6K9Ws7LOyQFT6UfolHIHZbdIMmqgtcIwYthxRVCaV0GzY7r7PqYaxt
         ty7f7Tpzv90xK3ivahoHBqcw41E0O3EXiPV1cvY7Hk0tC78QuqUQHsq7xfZkbzwpA8iW
         rBkUxV2H/8q1JjjnJUVkVQw+Oac6CGsHdnDJErEZr2ghQ1p7ukeXwG5Nji2mqyXBU0cH
         ak9A==
X-Gm-Message-State: AOAM533BTu/hGzjmp9/5R0yOziwnrRaRbADD52SRCOZXtuZM2Fu1V8qn
        k6fJV2rVIJNVIOaxk39CR5SFsn1j
X-Google-Smtp-Source: ABdhPJxpdsKioFhjV4g3YGubaqHpeEE8l9I9ZPRAyXKz6tElzKujr8x2CVcu/6m85dHMJ47oE2k1gg==
X-Received: by 2002:a5d:4312:: with SMTP id h18mr284766wrq.393.1589489765820;
        Thu, 14 May 2020 13:56:05 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:d18:23cd:8cd7:8950])
        by smtp.gmail.com with ESMTPSA id q9sm362369wmb.34.2020.05.14.13.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 13:56:05 -0700 (PDT)
Date:   Thu, 14 May 2020 22:56:04 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: complain about re-declared functions with different modifiers
Message-ID: <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
References: <20200514140451.GD2078@kadam>
 <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, May 14, 2020 at 11:18:53AM -0700, Linus Torvalds wrote:
> On Thu, May 14, 2020 at 7:05 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > But then it's re-declared as not inline.
> >
> > Could Sparse print a warning for that?
> 
> I actually think that would be a bug.
> 
> Having a non-inline declaration for an inline function sounds normal
> and correct and even expected. I'd not be surprised at all if a
> function is declared in a header file as non-inline (because there it
> is), but then in the implementation it's defined as inline (because
> later uses in that same file might want to inline it).
> 
> So warning about inline/non-inline differences is I think actively wrong.
> 
> HOWEVER.
> 
> In this case I wonder if the real difference is that first we have a
> "static" definition of the symbol, and then later there's a non-static
> declaration of it. That, to me, smells a bit odd - one has file scope,
> the other has external scope, and particularly with the external scope
> coming _after_ the file scope, which version of that same symbol does
> a subsequent use then use?
> 
> Because a static symbol and a symbol with external linkage are clearly
> not the same symbol. It's perfectly fine to have an external symbol
> 'x' that is shadowed by a static symbol 'x' in file scope.
> 
> But I wonder if smatch sees the *external* symbol nvme_put_ctrl()
> (which doesn't have an inline definition!) rather than the static one
> (which does!) because the external declaration comes after the static
> definition.
> 
> So _that_ might be worth warning about: seeing an external declaration
> after a static one makes for confusion.
> 
> I'm not sure that is the problem here.

Not sure if it's related to Dan's problem or not but with the
following code:

	static inline int foo(void)
	{
		return 1;
	}
	
	extern int foo(void);
	
	int dummy(void)
	{
		return foo();
	}

the static definition of foo() and the extern declaration are
distinct symbols (in the sense that neither has its sym->same_symbol
pointing to the other). As far as I understand, this is correct
because they have a different 'scope'. The problem occurs later,
when doing the lookup in dummy(): which symbol should be returned?
It should be the static one but it's the extern one that is returned
(because it's the last one and symbols are added in stack order).
This can be easily with test-linearize showing that foo is not inlined.

It's not clear to me what can be done for this.

Also, as far as I understand the standard (6.9.2p2 ?), I think
that if the 'extern' keyword would not have been used (like in Dan's
example), then the second, non-inline, occurence of 'foo' should
refer to the first, inline, one and thus be the same symbol.
This is currently the case since last November when a non-static
non-extern definition follows a static declaration but not when
the declaration follows the definition.

-- Luc

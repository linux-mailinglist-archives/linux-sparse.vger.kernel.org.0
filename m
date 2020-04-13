Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B631A6C3F
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 20:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387775AbgDMSy5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 14:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387774AbgDMSy4 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 14:54:56 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F62C0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 11:54:56 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i10so11240843wrv.10
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 11:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HrSSW42vLPCyGDaToV+NWNH7nS/rQ8lhqQQezcnMGs0=;
        b=ipQ9dfA8WHyj0ASM7KKuYwN72BGlkMEwHP0SZXPH8pT9vlCh8qeHxnH5hXo5iqmTQz
         dnRdGwbFQiaCaoR7PdAig+zClg/TZza1Fcc23nCzVa4Oj+6YE1JIK/e5AKzBWAZSc9MM
         6GXGY0Q0K1p9IlZSettiFbASi7uvI9CFH+qX/6nKGRvOagNxEgePg54NvanhOGU1ktGn
         S84koF4d3HE7KWFLkIaiSD6+QcbZEQkhOs9hgAhdTc29e3aaAp90xkvWUx0ttbezBF3H
         4QnCQ7IJnnSS1Zg0GN+HHuyPCmKiFm2q50ivNIsoYLffPnCDaOF237ozRqZ5KaD3U0/L
         /P4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HrSSW42vLPCyGDaToV+NWNH7nS/rQ8lhqQQezcnMGs0=;
        b=O6tBp/ygP2hfZtED+lnCyM8uk669Lq+RHfWRYbuIu4Ju4lbx4rAaLXFOz0qvjZd5Qa
         wu9aO5zxxWaLInGbZZKseR/ddsr5TMjL7c5u/CeN6ktl5USfoxBAkMtyh6usC/JtlP3/
         4xD0m25gLrNreQa90xDtWIJuyEwDZG/phbgFtSH4SaiWY4opgA+0ltIUdCq+TnmHHP7J
         1VQICNMk6iXA2jAo9nkO9CrIxXdFuIj7wu9t+e3bgrwmBi+7DQI+bv3JK8hpFvjFosJa
         vKSsPcFLpvPj9MbP7fOcnzdW9/sixdQw1qtqhYkDaV+h8iKV5cgsMXHzmPzfsaFSaMyi
         Ue/Q==
X-Gm-Message-State: AGi0PubdQoMGnKRjLyeRgpdRlVJ02UZ288hPsTX6xH0WqwhRIZBoFhCp
        zJZNl/jgclINZotGRJahvTA=
X-Google-Smtp-Source: APiQypISRRcYbDGImy8iotH8N6x/OGntCJtnFbiqfmIC5dxPByHN+zGzzbIOKTn2gQw5kLYjvYMkfg==
X-Received: by 2002:a5d:4146:: with SMTP id c6mr19134426wrq.181.1586804094960;
        Mon, 13 Apr 2020 11:54:54 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:a133:3be6:37e3:4975])
        by smtp.gmail.com with ESMTPSA id a67sm16303000wmc.30.2020.04.13.11.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 11:54:54 -0700 (PDT)
Date:   Mon, 13 Apr 2020 20:54:52 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH 15/17] scope: give a scope for labels & gotos
Message-ID: <20200413185452.pgj75pj5g7a42kik@ltop.local>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
 <20200413161605.95900-16-luc.vanoostenryck@gmail.com>
 <CAHk-=wiy-BFXMpmm9-GNT_WtDKVLeR0ki4OTj83xPk=npuNSHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiy-BFXMpmm9-GNT_WtDKVLeR0ki4OTj83xPk=npuNSHA@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Apr 13, 2020 at 10:52:19AM -0700, Linus Torvalds wrote:
> On Mon, Apr 13, 2020 at 9:16 AM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > Note: the label's symbols are still created in the function
> >       scope since they belong to a single namespace.
> 
> Oh, I saw that 13/17 and was like "yeah, this is the right thing to
> do", because I thought you were going in a different direction.
> 
> But then here in 15/17 I think you're doing it wrong.
> 
> Just give the symbol the proper scope, and make it simply not even
> _parse_ right if somebody tries to use a label from the wrong scope,
> instead of making the symbol visible, and then having to check whether
> the scopes nested right later.
> 
> So I think you should just bite the bullet, and change the
> bind_symbol() function so that a NS_LABEL is bound to label scope.
> 
> Then you can remove this 15/17 entirely (and all the "is this scope
> nesting" code - nesting is automatically enforced by the symbol
> scope).
> 
> I think that's a much cleaner approach. Yes, it gives a different
> error from gcc, but I think it's a *better* error.
> 
> This:
> 
>    int fn1(int arg)
>    {
>       target:
>          return 0;
>    }
> 
>    int fn2(int arg)
>    {
>       goto target;
>    }
> 
> is invalid code, and 'target' isn't even visible in fn2, because it is
> a local label to fn1.
> 
> I think the exact same thing is the right thing to do for expression
> statements, so
> 
>    int fn(int arg)
>    {
>       goto inside;
>       return ({ inside: 0; });
>    }
> 
> should fail with the exact same error message of having an undefined
> label (which sparse currently gets wrong too, but you're fixing that
> elsewhere).
> 
> Because "inside" simply shouldn't be defined at all in the outer
> scope, and you can only branch _within_ a statement expression, the
> same way you can only branch within a function.
> 
> So I think statement expressions should basically work kind of like
> local "nested functions": they have access to the state outside, but
> the outside doesn't have access to the state inside that statement
> expression.

Yes, I agree and in fact (if I understand you correctly) it was what
I tried first, mainly because it was "conceptualy neat" and simpler.
But then it wasn't working correctly in all situations and I
convinced myself it couldn't. The problem was with code like:
	void foo(void)
	{
		... = ({ ...  goto out; ... });

	out:
		...;
	}

In this case, when 'goto out' is parsed, the corresponding label
symbol would be created in the inner scope and later when the label
is defined the symbol lookup will only look in the outer scope, see
nothing and declare another symbol for it, then the obvious scope
check will complain that the goto's label is undeclared.
But this code is legit and both occurences of the ident 'out' should
refer to the same label, right?

I didn't saw a proper solution for this, hence the current patch 15
where I'm keeping all labels in the usual function scope but where
the new label scope is associated to the STMT_GOTO & STMT_LABEL
and where evaluate_goto_statement() check in the scope of the
goto is contained in the one of the label definition via the
new helper is_in_scope(). This is less elegant than I would have
liked but again I don't see a better solution.

-- Luc

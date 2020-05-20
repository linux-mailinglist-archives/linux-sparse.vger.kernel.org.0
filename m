Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085011DC059
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 22:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgETUkF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 May 2020 16:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbgETUkF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 May 2020 16:40:05 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E742AC061A0E
        for <linux-sparse@vger.kernel.org>; Wed, 20 May 2020 13:40:04 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id a2so5831193ejb.10
        for <linux-sparse@vger.kernel.org>; Wed, 20 May 2020 13:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fP5Rj2OyAJzoBMhdSJl5hjL3uyDTj9l0R/yt112jcB4=;
        b=T3h2VYFwxkyjJW4XcVndQbunUwGos707BFNunA4ccHMqzghvV7eFJhvpH4/NKBMlgM
         WzwCWNatCrQp/Fy6k/+0n5/08MboEm8Onk+BSTd2zyCeoRS8VtlkBnooEB1R+TQF0Jig
         4Un8PVwOkdnM3MrATl3GwxLXpjsBK9bOwIED8ReRHOYCiyUk4AZl/GebPuND1sNDh9f3
         weUXy/QMFKrHgXZ3d36Mfw0KvMYYgL9luxoevQY52XQ/aPPIfVSW5To+k2J6kxjQLL1P
         OGYgSeAZaaCwzqsTE/YQcHWcIEk4ObvWkJDHbynSGU6T1srz32QXhk9K3jP7dT6pXRH6
         AF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fP5Rj2OyAJzoBMhdSJl5hjL3uyDTj9l0R/yt112jcB4=;
        b=KbibXFw/DmMU+Ycw1s6Mug152pskWvcdxnGzccKFuRlmM26IIYLeB5yHbJgeVgAtuk
         eGfTLhuCXuwdYTaa0WmdOe9PGl6uMjAUhG6Avyibh3XFmpwrz/bymxSbHQA3llJXimLu
         gJsqihTlSaLkPqiTrXikuuiTwwwUDwX+/bwTIIzIKSI2whWb97ukjIekSfff5OKgjH7B
         zOr29jhJjV/GMQTUCpErFP2nEufbCry/Bylc4MvQuyNIHPU99Mc8i2SjZKyqlqbMKcAn
         QWpxPk+NFnslqGYXoMgLJMXMo3wsB/LJkY2HM61UyJ10n3DGx4uezuXv+8wvV2jNoF96
         kDQA==
X-Gm-Message-State: AOAM530nG1LX1AZO/sMnVcAamYYjAYJVMM9tSdWKx2gw+9JcrdPHjpfD
        sMfatkqsOXBXt4awDfLfKLo=
X-Google-Smtp-Source: ABdhPJzKNfqV+BelhKU0ahFDRcWf9Y6pMxA5ukIdr2j9KaihZBtlGUaGP8c95Mvr7cHaps5ys46amQ==
X-Received: by 2002:a17:906:aad8:: with SMTP id kt24mr870463ejb.54.1590007203458;
        Wed, 20 May 2020 13:40:03 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:e0bf:687a:32d7:7f8a])
        by smtp.gmail.com with ESMTPSA id p7sm2914790edj.81.2020.05.20.13.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 13:40:02 -0700 (PDT)
Date:   Wed, 20 May 2020 22:40:01 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org, Junio C Hamano <gitster@pobox.com>,
        =?utf-8?B?xJBvw6BuIFRy4bqnbiBDw7RuZw==?= Danh 
        <congdanhqx@gmail.com>
Subject: Re: [SPARSE PATCH] univ-init: conditionally accept { 0 } without
 warnings
Message-ID: <20200520204001.2nkuowfeftp7uhpl@ltop.local>
References: <20200518235446.84256-1-luc.vanoostenryck@gmail.com>
 <2fcda487-733b-8ed1-e1f4-6c6204a68569@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fcda487-733b-8ed1-e1f4-6c6204a68569@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, May 20, 2020 at 01:22:22AM +0100, Ramsay Jones wrote:
> Hi Luc,
> 
> Sorry for not getting back to you sooner on this (you would
> think I was busy! ;-D ).

No problem, really. And I haven't been quite reactive myself lately. 

> I have now found (one of) the patch(es) I was referring to before
> (as a patch file on a memory stick - don't ask!).
I won't, promise ;) 

> On 19/05/2020 00:54, Luc Van Oostenryck wrote:
> > In standard C '{ 0 }' is valid to initialize any compound object.
> > OTOH, Sparse allows '{ }' for the same purpose but:
> > 1) '{ }' is not standard
> > 2) Sparse warns when using '0' to initialize pointers.
> > 
> > Some projects (git) legitimately like to be able to use the
> > standard '{ 0 }' without the null-pointer warnings
> > 
> > So, add a new warning flag (-Wno-universal-initializer) to
> > handle '{ 0 }' as '{ }', suppressing the warnings.
> 
> Hmm, I didn't think this would use a warning flag at all!
> 
> I remember the discussion (on lkml and sparse ml) in which
> there was general agreement that '{}' would be preferred
> solution (if only it was standard C!). However, I thought
> that (since some compilers don't support it e.g. msvc) the
> next best solution would be for sparse to suppress the
> warning if given the '= { 0 }' token sequence. (ie. no mention
> of it being conditional on a option).

Yes, I kinda agree but concerning the kernel, my understanding is
that the warning is desired (cfr. https://marc.info/?t=154704602900003 ) 
For example, for cases like:
	int *array[16] = { 0 };

So, I want to keep the current behavior as the default.

> ...  but this may well
> give the impression of a C++ like 'int i{}' type initializer!

This syntax is really terrible **shiver**.

> > @@ -2750,6 +2750,13 @@ static struct token *initializer_list(struct expression_list **list, struct toke
> >  {
> >  	struct expression *expr;
> >  
> > +	// '{ 0 }' is equivalent to '{ }' unless wanting all possible
> > +	// warnings about using '0' to initialize a null-pointer.
> > +	if (!Wuniversal_initializer) {
> > +		if (match_token_zero(token) && match_op(token->next, '}'))
> > +			token = token->next;
> > +	}
> > +
> 
> Ha! This made me LOL! (see my patch below).
> 
> So simple. (I did think, at first, that deleting the '0' token was
> not a good idea - then I realized that it's more like skipping/ignoring
> the token than deleting it.)

Well ... I'm lazy, so ... and it gave me the garantee that it will
behave exactly like '{ }'.

> The patch below was (I think) my third attempt. If memory serves
> me, the first patch attempted to determine the '{0}' initializer
> from the 'struct expession *' passed to bad_null() alone. However,
> that did not allow me to distinguish '= { 0 }' from '= { 0, }',
> so I needed to backup from evaluation to the parse.

I think it's fine to allow the comma, I probably need to change
this is my version.

> Also, I didn't test the initialization of embedded struct/array fields
> (and what should happen anyway? should '{ 0 }' also work for initializing
> the sub-structure(s), or should it only work at the top-level?).

In fact, it works for literally anything: simple arrays, multi-dimensional
arrays (it must be because the braces doesn't need to match:
	int a[2][2] = { 1, 2, 3, 4 };
is perfectly legal), structures with a scalar as first member, more complex
strutures, sub-structures, and more suprisingly even for simple types:
	int a = { 0 };
	_Bool b = { 0 };
	double f = { 0 };
	int *ptr = { 0 };

If it is fine for you, I'll reuse your testcases.

> Also, I have just noticed, it seems that I can't decide if it should
> be called 'zero aggregate initializer' or 'aggregate zero initializer'! :-P

I don't think it has a specfic name in the standard but has Danh said
in his reply, in some books, articles, GCC & clang patches it's
called "universal [zero] initializer".

Best regards,
-- Luc

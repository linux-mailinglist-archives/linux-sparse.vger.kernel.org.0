Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBECE1EC03D
	for <lists+linux-sparse@lfdr.de>; Tue,  2 Jun 2020 18:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgFBQmD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 2 Jun 2020 12:42:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbgFBQmC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 2 Jun 2020 12:42:02 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8697EC05BD1E
        for <linux-sparse@vger.kernel.org>; Tue,  2 Jun 2020 09:42:02 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id o26so7694313edq.0
        for <linux-sparse@vger.kernel.org>; Tue, 02 Jun 2020 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jHWPXDhC3dlwkh2FMy2fiFAyCNn0wpmE4JceJy1NATk=;
        b=pBHLfQAZwWSss1iMUENX0nbJGMFdUOBT4nS+zACfEOixHiRTPxibw2Zbs7YtNu3oEi
         tTJw7ykTsp7A7xGZ08jb8Riqckh9Xf2t2Rssm/YiSUW+uVHt1d2DWM+aA1XQVU67Azwo
         rHcY+DRagkmMSDIIuHr6eqB0c5Msz0cWTsfXIYztRHf/n+oYQSoi2PksFIFe3aixP9l7
         DTZvhwHOF/zQo/pWcyGdpI5gVMwmFw67l/LcvPAFsxya8QU83aB+GFxIA6OLwfqUteaH
         T49lw4hpL1HLiujYLRZic7N63mXAMU3Xpe0Gjo34ho3Z1tQ90c5Pnz45NGeMiCPuFV4p
         2mGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jHWPXDhC3dlwkh2FMy2fiFAyCNn0wpmE4JceJy1NATk=;
        b=BDqRdUo+aDt4Nq31O/FohWn/zaxTCmrMo+/+o1M3+VAAzXyMWwfvvqSGRVC7u3chr4
         5fAMpeOd9fXqPLqvBnc5XdYIoICrs63gWads5iChZcVSUMG7YQFj/d2Hozk7wK9qRWBQ
         ln2fnhWYUTPH3YzJFK6hhSvWFIeHlKl6XPgfmK0jgSWlgGKqQuYecpHDRbFF6VM++hAh
         lagxhSKzkxTVFVV6fkqwEfEZ4JbWM3IiN7cVHdX0jcxTWOry5YXBi/wycnOE89mpmyrf
         ykQvW7wQ+BZbi1B+j8+8gF8EDS3R1t1zqgvA8e93/1CcWfJraJyeMnWBQiaGTgwU6T4k
         4UQg==
X-Gm-Message-State: AOAM532FRhmgHcbiwlyHjTD6R7LNUWAbYUvQBI2KZhSHR6oaIIiQUH0a
        dZAAcCxTBlARcK8WGO17DUiPUKb/
X-Google-Smtp-Source: ABdhPJwCPCQttv4DV9sF/mUyOjMPsR4l/P3pzsiG8KS/z1PSFGreqUcCvfyXbPFxWU8QfOCuKecEkQ==
X-Received: by 2002:a50:9517:: with SMTP id u23mr5951366eda.332.1591116121252;
        Tue, 02 Jun 2020 09:42:01 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:6c23:5e0e:18a3:ef6])
        by smtp.gmail.com with ESMTPSA id h16sm1878734ejq.62.2020.06.02.09.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 09:42:00 -0700 (PDT)
Date:   Tue, 2 Jun 2020 18:41:58 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [SPARSE PATCH] univ-init: conditionally accept { 0 } without
 warnings
Message-ID: <20200602164158.lovn2dsuc2g74l55@ltop.local>
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
> >  
> > diff --git a/parse.c b/parse.c
> > index a29c67c8cf41..48494afc6f2c 100644
> > --- a/parse.c
> > +++ b/parse.c
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
> 
> I wish I had thought of it.

Well, it ended that it wasn't that smart after all because it
caused several regressions when used with scalars.
So, I finally had to do a sort of hybrid between your version
(for the parsing) and mine (dropping the '0' element from the list,
but now, later, at evaluation time).

-- Luc

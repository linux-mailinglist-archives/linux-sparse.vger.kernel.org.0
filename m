Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B57C61629F8
	for <lists+linux-sparse@lfdr.de>; Tue, 18 Feb 2020 16:59:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgBRP7f (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 18 Feb 2020 10:59:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:40437 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgBRP7e (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 18 Feb 2020 10:59:34 -0500
Received: by mail-wm1-f68.google.com with SMTP id t14so3480817wmi.5
        for <linux-sparse@vger.kernel.org>; Tue, 18 Feb 2020 07:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b9uq4DcgBdLPAh1/PGRMgKc7CoJ0lfpKDlKIX6bBQeo=;
        b=dIf+wRs23BmzQfrO5NE35E3VUTqfmd6UzNOxN/iWFr+5h5MT09VpY7cuQxKAo94An8
         sJoFtld7jmc2vA2Y0gobm8nSDmIQO/tVclyGnVzQCNBG532LdzWN8To8NUVN18EQzSbV
         oMpA9peg/a6jjmNdFp6tNIrS8fhwb33ykBZc6yRgbWso3e739nTbF3WEP/9mTbYegsyY
         JBCMB61r9ftX5fCej0k3VY0EblIgHbIPoaY5le/VsKKWr7w/zrorvOMFRy/CNPBkOB1e
         8KkcfMBvRUgGQV3MZYs0YHZdZ8FlsQzOprGEUOabQsg0Pj2ehqJhfZ4tnigjNH/wrFQE
         zGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b9uq4DcgBdLPAh1/PGRMgKc7CoJ0lfpKDlKIX6bBQeo=;
        b=LivlxMxmvIMbi402/PCi6mAtlbBqROvgTpqgGgUgTlfzAM7PVwE039YWdNtBlARceq
         zmTuElP4L1CTqfY1IBByXj2QmUwGGxviue7qne1eo9KWXVsdGPzYsTg8oVqcyi2q0gaK
         3jQLQ9jQ137lNqqgAwT38wEGOmLPbuouhOOGvSlhd6jPg9apYJaRpP4T5VnLGNWhY+UW
         9OkqtDiu3x7Fx+jfQJXFWyr7UKqLo3bBJXUC5JL0GHClSH1Gl8v11xn/K6BhgZ80nN4C
         ev7EUyPodnYerNNv/JQDq9G17QmkonKtaxea/fROLFss8tm63pdP5TomCll9uOge67Qx
         GbwQ==
X-Gm-Message-State: APjAAAUm5ZJvRHWghttetkVHcHRSVHahWkYSsqPXOuzHlxKTLZeMNupx
        mIBj7n794Nyxrwv+q1HSCFauk9l1
X-Google-Smtp-Source: APXvYqxDfnfwQgqtXUyNtpKO2ivsy77GcArVZxujLx4+rtVbpD1DR78X/OYgZhSycGEg+uUjafkBvQ==
X-Received: by 2002:a1c:a752:: with SMTP id q79mr3712121wme.64.1582041573456;
        Tue, 18 Feb 2020 07:59:33 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40bd:500:2dab:6127:5906:cf4f])
        by smtp.gmail.com with ESMTPSA id d22sm3768434wmd.39.2020.02.18.07.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 07:59:32 -0800 (PST)
Date:   Tue, 18 Feb 2020 16:59:30 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH 1/3] struct_union_enum_specifier: set MOD_TOPLEVEL if
 toplevel(sym->scope)
Message-ID: <20200218155930.ouldse3f47lna43z@ltop.local>
References: <20200214113320.GA31578@redhat.com>
 <20200217214610.uxbnfh5zooqve4yc@ltop.local>
 <20200218103837.GA3466@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218103837.GA3466@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Feb 18, 2020 at 11:38:38AM +0100, Oleg Nesterov wrote:
> On 02/17, Luc Van Oostenryck wrote:
> >
> > On Fri, Feb 14, 2020 at 12:33:20PM +0100, Oleg Nesterov wrote:
> > > With this change dissect can know the scope of SYM_STRUCT/UNION/ENUM,
> > > see the next patch.
> > >
> > > Note that MOD_TOPLEVEL can be set even if struct/union/enum type is
> > > private and bind_symbol() is not called.
> >
> > I don't like that very much. For example: why this is needed for
> > struct/union/enum and not other types?
> 
> Do you mean builtin types like int_ctype? OK, I agree, this is slightly
> inconsistent.

I was thinking of the other constructed types: arrays & pointers.
 
> > Should it be possible to use the function toplevel() or add and
> > helper for it in scope.c?
> 
> Well, toplevel() won't work if SYM_STRUCT/etc is anonymous, in this
> case bind_symbol() is not called and thus sym->scope = NULL.
> 
> Consider
> 
> 	struct { int m; } x;
> 
> 	void func(void)
> 	{
> 		struct { int m; } x;
> 
> 	}
> 
> we want to report the 2nd struct definition as "local"
> 
>    1:8                    def   s :x
>    1:14                   def   m :x.m                             int
>    1:19                   def   v x                                struct :x
>    3:6                    def   f func                             void ( ... )
>    5:16  func             def . s :x
>    5:22  func             def . m :x.m                             int
>    5:27  func             def . v x                                struct :x
> 
> so that this spam can be filtered out, but base->scope is NULL in both
> cases.

OK, I see.
 
> > > IIUC nobody else looks at SYM_STRUCT->ctype.modifiers, "make check"
> > > doesn't show any difference.
> >
> > Yes, it's true and it shouldn't make any difference but still I
> > would prefer to not mix symbols and types more than they already are.
> 
> OK, will you agree with one-liner below? This should make toplevel() work.

This will still be inconsistent with the other types but I can live
with this. If you could just add a comment explaining why it is needed
and using an helper instead of directly using 'block_scope' (like
set_[current_]scope() or something).

-- Luc

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC15165D5C
	for <lists+linux-sparse@lfdr.de>; Thu, 20 Feb 2020 13:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727553AbgBTMPs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 20 Feb 2020 07:15:48 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38848 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgBTMPr (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 20 Feb 2020 07:15:47 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so1804952wmj.3
        for <linux-sparse@vger.kernel.org>; Thu, 20 Feb 2020 04:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hdMHCKLprBnwT5uhH0YGFIS0ZDx2pNBy1g9hsggo8ug=;
        b=A6lflB79Pr2jX1mXn1oG6nwuzZIpYDj+jS7fUOe9poSYj+JSrbddSznR7IU95zdTb/
         jKL5e697heT2GLlHu3lHc6NzGmhhB0OfwJHwfqYJWhDqBP5w0Ts9Fy9GKpZuRSYLdek6
         /3QAhEYATfzS/uUD7HXVs1z+06OVUZQt6PYU8qXPTMAOGcuvf3w1D5hkAyY95vK8X+XK
         IjpI3SGuAkBOxe9FGAzEFwB78CBM8lSBAd+TTtQ8im08TNCRfcYHO6q78PVlhf5t25Fz
         7u+EhBrX3iUzSMESuePpc9ygHKur0gMK0txbNOMJ5o+LKyc6huFkJ2/oOudtN1XN4IpS
         Xwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hdMHCKLprBnwT5uhH0YGFIS0ZDx2pNBy1g9hsggo8ug=;
        b=dpzeaGAxIKzqnhxn1z2ekTWM3U0jus01kpH3BgsLuuwFMzgnbO6eRAMypOMHYBijPz
         qbCLjcu4wFV/8C1apiKx632wQqoB7B/BlDVTCDin/bqtTyDKkVTppTCwdD+AyJNMJ7pj
         th12OMjGqir3LNJZUZGYF63uNVbGdp0VQjlsj1dM9e5u5YquZVAv+KFhbMivt+lUA9y1
         DiFLT69J4VEWV5UMvoVqMAmWRstMEMk+6FmoQz3B+BcMfcKD1NDQL3AUJnBUcvf8mqK/
         5SOkvFAsFgAdgJrVVMYTQI7kamCej1EijUnmUtcWC40j/KSfQ4mNKKgVfhZR6ln6PH4H
         jX5g==
X-Gm-Message-State: APjAAAXodtd0YkKBJwaq+MPk2V6bb9k/V8rmWe4ozhKJTBZaO8iVPs/K
        MiGPqCaOY1d++sefQ9hF8yk=
X-Google-Smtp-Source: APXvYqyh4MxAx8OM3IEybL78P5a9BpMVmmTTMTj/mDv+vhj9BZ28Q1/PLZVXCZ1PZmJ1qoWYqOAcjQ==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr4414568wmi.25.1582200946297;
        Thu, 20 Feb 2020 04:15:46 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40bd:500:d959:171e:ab8c:1cb3])
        by smtp.gmail.com with ESMTPSA id h13sm4698379wrw.54.2020.02.20.04.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 04:15:45 -0800 (PST)
Date:   Thu, 20 Feb 2020 13:15:44 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2 1/2] struct_union_enum_specifier: always initialize
 sym->scope
Message-ID: <20200220121544.7kwxkuytjzahk7ed@ltop.local>
References: <20200219162911.GA26790@redhat.com>
 <20200220005602.gd22zbd7c5qy4t6k@ltop.local>
 <20200220115736.GB27143@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220115736.GB27143@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Feb 20, 2020 at 12:57:37PM +0100, Oleg Nesterov wrote:
> On 02/20, Luc Van Oostenryck wrote:
> >
> > On Wed, Feb 19, 2020 at 05:29:11PM +0100, Oleg Nesterov wrote:
> > > Currently it is not possible to figure out the scope of the private
> > > struct/union/enum type, its ->scope is NULL because bind_symbol() is
> > > not called.
> > >
> > > Change struct_union_enum_specifier() to set sym->scope = block_scope
> > > in this case, this is what bind_symbol() does when type has a name.
> >
> > Thanks.
> > I've just changed the comment to "used by dissect"
> 
> Great, thanks!
> 
> > because
> > elsewhere the scope or toplevel()s only relevant for symbols.
> 
> Cough... can't resist ;)
> 
> Not really, see struct_union_enum_specifier()->is_outer_scope(). But
> yes sure, this is only when ->ident != NULL.

Ah yes, sorry, I wasn't clear enough here. By 'symbol' here, I
effectively meant: "a name (with its associated semantic)", not
a 'struct symbol'.
 
-- Luc

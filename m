Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4981653E4
	for <lists+linux-sparse@lfdr.de>; Thu, 20 Feb 2020 01:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgBTA4G (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 19 Feb 2020 19:56:06 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52584 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbgBTA4G (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 19 Feb 2020 19:56:06 -0500
Received: by mail-wm1-f66.google.com with SMTP id p9so219740wmc.2
        for <linux-sparse@vger.kernel.org>; Wed, 19 Feb 2020 16:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sPx6rqvXFQb+JlsJy0mwHev2nRFIAqXSJXIcyadjlss=;
        b=MmjfWNRkQDolLN96HdZCEaOPVdJkRQnJ0F176NHzea6rnJ+8Y7OzZW4qbt3kPzGTw3
         p0hQgIQPO73Y+FSVjMl/g4hUWoWHmmuuWTRXN9DACt880Tml4XSGTE03WUeyv60ouFx7
         c6y8g81gv5CKps46S8ORnK0RxSA2ZTXhkkfX3zC43r+fLOb3qGRN9JoQclGheLQBaCnx
         lk4oqK6wJP9tSD5r1dnkxKX1tOt59WKXsDxbFGpkmyr+E62y5Qx2IN+8YoBsprUJonuD
         Agq5lZwQXkdfNxleO5HhKDM4aJ31BCys1Vc4d9HGXOPyWZWOtafoPszdkfd3C3+sBdxG
         c3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sPx6rqvXFQb+JlsJy0mwHev2nRFIAqXSJXIcyadjlss=;
        b=uHXbzjDAiA+hdpD36vjWULBWd/93PxstltW2RicZXYyQnC1Gj7WZPcUitbj8wZhhoE
         AXLqTMZe9R+O09srGAygk+d5BvuoPS4zFK6j4isV6mSMxhQRj/sR05zUHn4aOZAEQD4a
         Cs+/P+EdtYSpdHYq7sFdlDJukfxlFn6tFFP7o6Hb/l5CYsCV/nk+Sn3/jIB5pfDz0ArU
         1RTUnxdU3rj5Og1GK6I+7hbQ2KV9eLoWoA5wZct7CyJEFoG3G2Ggv4Q0PH5/2RIGc02k
         yEyKSPhtwlSyjDay9B0LoqtmqxQ6e7iSvinAD06UhKlUgTvDd0vxT1M/sMgi4HTjILNt
         hXGg==
X-Gm-Message-State: APjAAAUWQaBek7fCEItLKEjurKmWC4OJlzhypWRYHKt09ttynW6NBwgA
        NRDbeFWms8ZywhX1cXPUm2o=
X-Google-Smtp-Source: APXvYqxCP7OinWL9EBrdH8nmK4iWTFu+W7ZBoG0mu4Er6/cU+PlYSH1vTk3pBGU969W0f6lNCXt0Mw==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr545345wmc.145.1582160164607;
        Wed, 19 Feb 2020 16:56:04 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40bd:500:e534:20fb:e255:147b])
        by smtp.gmail.com with ESMTPSA id q130sm2390694wme.19.2020.02.19.16.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 16:56:03 -0800 (PST)
Date:   Thu, 20 Feb 2020 01:56:02 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2 1/2] struct_union_enum_specifier: always initialize
 sym->scope
Message-ID: <20200220005602.gd22zbd7c5qy4t6k@ltop.local>
References: <20200219162911.GA26790@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200219162911.GA26790@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Feb 19, 2020 at 05:29:11PM +0100, Oleg Nesterov wrote:
> Currently it is not possible to figure out the scope of the private
> struct/union/enum type, its ->scope is NULL because bind_symbol() is
> not called.
> 
> Change struct_union_enum_specifier() to set sym->scope = block_scope
> in this case, this is what bind_symbol() does when type has a name.

Thanks.
I've just changed the comment to "used by dissect" because
elsewhere the scope or toplevel()s only relevant for symbols.

-- Luc

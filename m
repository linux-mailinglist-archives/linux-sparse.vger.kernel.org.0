Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D155310C0C4
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 00:44:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727515AbfK0XoC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 18:44:02 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36588 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbfK0XoC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 18:44:02 -0500
Received: by mail-wr1-f68.google.com with SMTP id z3so28836444wru.3
        for <linux-sparse@vger.kernel.org>; Wed, 27 Nov 2019 15:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BNpHAtN/aIP/Ue0Yuuz+2jgOz/J+CrVhWwo+VNzrVxU=;
        b=t0e1pxkl+dpsrDEu9TxIp4ZTaVDOWHAXww/8u+PkGQw52EKz/xy7HSqV9bbygEHYtm
         qOvBOI1ekRujaO5DgTOoF+9Ixq/OkL/GcJylybE+Hb++9HlZy8SqcNKV9BMFB1XD5ttt
         ve7JpBTlovTwSijj2iCGZwa/3lPagzefQGhQkK3ZYX4ySXPaPW1a2zifwv0J8a7EvEH0
         UquYmsZzuYUt6aNLJdTXpMzMcCs5GbqD4nKvOxXt5/gMVnyGUi7u0FtUZFtikFjueUBI
         0tRfeQ1Mog/ggcwO1p8NnKLuDCVs8dLzmxeM1gcUGGcl+7oUMoL5OSyfwnmgkRT4/nE+
         je1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BNpHAtN/aIP/Ue0Yuuz+2jgOz/J+CrVhWwo+VNzrVxU=;
        b=Ko00niIYHFa8TL4VPJDRC+NKrGxdZDtI5Ixi9TLW5wdZU9HRjKwUeZv40NXavIFgRc
         II4vqMz1jmRpSIN9MikNs53NSOFMkznU5CWqGmUbyrX/nFF8Bga12+EeAAT5swOqs6pY
         cbl0Cx0ZnL0BBO8agA+8a4vZC4IN2b6MyX2lod68PcceBNMCe3AztaCbpCrjw5hhcPma
         KdT3WTCsy7UUaQ8R5PpgPlv58KaositO5gLo6doAz/5bGeBFQE5OdDCMpc0ptONzc6N5
         TbfHkoUbtU+n7ryc/BOJXnWazgwIZqhIXR77ZzXUWwSjJ7/mSImD04UAmEG+K1i9w2J6
         P/rA==
X-Gm-Message-State: APjAAAVmzjzpudopyyNE6oPyMSB46IZqxqGF4rMtl1YRaojjXQxFgCvL
        NxvPRmBEIsLG3JUw7kj/+PrqJ0JV
X-Google-Smtp-Source: APXvYqyM+RCrj3ixkX4b/gt17wEckFK2NYK5xNkbfyJqYA8WkcULTZEwLml2p3IdKeOiR26ZEkPbig==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr25724840wrw.126.1574898239144;
        Wed, 27 Nov 2019 15:43:59 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:2dc4:827a:b71a:1d2b])
        by smtp.gmail.com with ESMTPSA id q5sm8446495wmc.27.2019.11.27.15.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 15:43:58 -0800 (PST)
Date:   Thu, 28 Nov 2019 00:43:57 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2 03/12] arch: keep BSD & Darwin specifics with
 i386/x86-64 specifics
Message-ID: <20191127234357.nniyeyp2izx24xnr@ltop.local>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
 <20191127020643.68629-4-luc.vanoostenryck@gmail.com>
 <e86276dc-1458-cd45-7833-cfdb8f530f02@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e86276dc-1458-cd45-7833-cfdb8f530f02@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 27, 2019 at 04:01:16PM +0000, Ramsay Jones wrote:
> On 27/11/2019 02:06, Luc Van Oostenryck wrote:
> > Without more testing, the specific types for wint_t & int64_t
> > on FreeBSD & Darwin are only valid for i386/x86-64.
> > 
> > Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> > ---
> >  target.c | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
> > 
> > diff --git a/target.c b/target.c
> > index acafbd929..647817a22 100644
> > --- a/target.c
> > +++ b/target.c
> > @@ -83,6 +83,13 @@ void init_target(void)
> >  		wchar_ctype = &long_ctype;
> >  		/* fall through */
> >  	case MACH_X86_64:
> > +#if defined(__APPLE__)
> > +		int64_ctype = &llong_ctype;
> > +		uint64_ctype = &ullong_ctype;
> > +#endif
> > +#if defined(__FreeBSD__) || defined(__APPLE__)
> > +		wint_ctype = &int_ctype;
> > +#endif
> 
> Heh, OK, question answered! ;-)

Anyway, I would like to move all this in some arch-specific
files. Not for soon, though.

Best regards,
-- Luc

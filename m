Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF881135F6
	for <lists+linux-sparse@lfdr.de>; Wed,  4 Dec 2019 20:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfLDTvt (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 4 Dec 2019 14:51:49 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35549 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbfLDTvt (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 4 Dec 2019 14:51:49 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so698601wro.2
        for <linux-sparse@vger.kernel.org>; Wed, 04 Dec 2019 11:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l6WRm/nigCRjikGdzcl2eSA0rdTTu7SVvj/x704joK4=;
        b=aUVn+Nux0q/nCuRuz+B6hl+X60n5KaiSmY88kc//DjEd5p4TzgDgILCzje6mKM3ZCD
         GBWbNP1oYa3pp6KZQvdZ6iW4j5jVorD4tD1r8ujPv3UfLgxbwY5FFPnh0AL6eYNHqTFP
         mWgWGEjNR7v/d2X2nItDqtwYIZ7wQhtskbXjmq/pjKUtxGDX+XkJbewoONMquo3tKj08
         o9lfMNqCSulBugokQvFLafotYAIE3O2CQ2Y26pifgefw9NVNRSH6JzDTQ9FGPRVfClbO
         AF95/FMRTOrrjoZnF7+i+KLsTl3XroS33huVSRgeA5JwFVW2QN5jZ6QxuW4Sd+08KWrb
         x2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l6WRm/nigCRjikGdzcl2eSA0rdTTu7SVvj/x704joK4=;
        b=FgW5EHVVkbRvDu4C4TIGT0GnMhFk5kCvHmWjv9S9+CzfyCXV4fMIQgjE3eRV9kVezt
         yLA2Y7QjY9x8GNeE18D3ZKbkq+L08AP4CoJamLgbzjPYds6LCTQUB/kOTe4unWK7Xp+s
         vCbqma4iK+b1wp2dfMfpHIlCs+YeGsvhAf2uCoDygg/kwKrOHS1H6XAeYv7f3uxoBBmf
         sigezZp6YhHz9J9DrZJ7Wj++IGUDBsdhExozQLWfwfIz1nBBDpepuD4M/4wmUsTpyCNf
         I4DiR7iRMyc5WStppDCtH14DoXvLo9uFjVpS6A7j7KrUQByQplePOCRhJ/SdX8BY7QeH
         cf2w==
X-Gm-Message-State: APjAAAXxTDVR1utF8FbAEeahMqrEdJcjjFXN8pd4E6yZ3HrLWMAtqEwF
        PRERtL0TIw9UM+IeSVKU8vohU6+4
X-Google-Smtp-Source: APXvYqy20OBdegP+K27ho8+9awbRAfX+a5Ruoz6bZk98I4B6z06cz4tCzloc30YOQ00PnVc5aTubqA==
X-Received: by 2002:a5d:62c8:: with SMTP id o8mr5872810wrv.316.1575489107198;
        Wed, 04 Dec 2019 11:51:47 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:a07d:f2e4:abd1:6733])
        by smtp.gmail.com with ESMTPSA id a186sm7802638wmd.41.2019.12.04.11.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 11:51:46 -0800 (PST)
Date:   Wed, 4 Dec 2019 20:51:45 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [DRAFT] add support for GCC's __auto_type
Message-ID: <20191204195145.65as4uginf5j5luk@ltop.local>
References: <20191204030649.66699-1-luc.vanoostenryck@gmail.com>
 <baae182b-e824-64b1-f5a8-b691ba637f53@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baae182b-e824-64b1-f5a8-b691ba637f53@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Dec 04, 2019 at 05:28:04PM +0000, Ramsay Jones wrote:
> On 04/12/2019 03:06, Luc Van Oostenryck wrote:
> > +/*
> > + * check-name: autotype-ko
> > + * check-command: sparse -Wno-decl $file
> > + * checz-known-to-fail
> 
> s/checz-/check-/

Hehe, that was my extra-lazy way of temporarily disabling
the tag by changing a single character ...
 
> > +
> > +extern char ch;
> > +extern const int ci;
> > +
> > +__auto_type i = 0;		is_type(i, int);
> > +__auto_type m = 1UL;		is_type(m, unsigned long);
> > +__auto_type p = &i;		is_type(p, int *);
> > +__auto_type f = 0.0;		is_type(f, double);
> > +__auto_type s = (struct s){0};	is_type(s, struct s);
> > +__auto_type c = ch;		is_type(c, char);
> > +__auto_type ct = ci;		is_type(ct, int);
> 
> Hmm, this loses the 'const', ...
> 
> > +__auto_type pci = &ci;		is_type(pci, const int *);
> 
> ... but this doesn't?
> 
> Unfortunately, the gcc documentation that I have doesn't give a
> sufficiently detailed specification for me to tell if this is
> expected.

Yes, there is definitively a problem here.
In fact, I think it does the right thing because:
	extern const int ci;
	
	static void foo(void)
	{
		__auto_type ct = ci;
		ct++;
	}

rightfully complains we're trying to modify a const variable.
OTOH, the sparse-specifc type compare in the assert seems to ignore
the qualifiers at the first level. I suppose it's purposely so but ...

Another problem, maybe more important, is that the lines:
	__auto_type c = ch;
	__auto_type ct = ci;

at top-level are invalid because ch & ci are not constant
values/expressions and no warnings are issued.
It's orthogonal to __auto_type but quite annoying.

Thanks for noticing all this!
-- Luc

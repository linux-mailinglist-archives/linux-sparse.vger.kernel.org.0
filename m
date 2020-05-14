Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C67C31D40D0
	for <lists+linux-sparse@lfdr.de>; Fri, 15 May 2020 00:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgENWWn (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 May 2020 18:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728456AbgENWWn (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 May 2020 18:22:43 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F2BC061A0C
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 15:22:43 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g12so88835wmh.3
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 15:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rSTE5jh+NagD67+7MugC4M2xlcH8IUWuYQ7rPnFlVB0=;
        b=miq1T6aDPflkCaGvayzKrtDRkPC+i5Vy2zOF/dsh2Jz8i8hOCMtGrJhx6BnTZepqeP
         W5KP1e+cH9/ztlUJll/6X4KbRiP5e7Hj7O8rc0pJIRFNdvR+eUtAWIBc4iUtz7E54Iix
         1D+GwpcU+hIreLHNRhYhEDEdulJUob7cFkUGbU8NnkcULgYtqs1V/trhQ9W2Nh6olF0/
         vPYpHKVEdjYJ5k05oK9i77lV8X+Som4BYbJh2Yg+8ARBCqRDMjN5IKj6rcsc5FC1Ov3i
         ZOl72X4LpCUTvcRe5pM8rucgNiYNEYwiQ80X7H1dpnX+K+R3WNZvvgW+ouszRsmCw8E4
         hv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rSTE5jh+NagD67+7MugC4M2xlcH8IUWuYQ7rPnFlVB0=;
        b=tEg7mJPht1TAqpN/CVwLvzxPM/ct0UaybmqlSsFs2rBghKZBOcMQ2CVHgu8UPlkJf3
         8Ul8qQFHPw61A44KASynypmqlnhmC5oqDg/z5q+X7qOS0MuPWfr28PxmTmdAHVy8z2+W
         rGQ91mrmxqYFxuSVdEOl7cfUJwUgRoscEIaETcTyLEBhYlgP59jT616PMRPaPlm2E+wZ
         MDPmp2wgOgI1Zmpojh0aFefUC+K5gx0TcFl+Y4ADn2PlDrtncGiQZHMJzBbdGemFYcMC
         0YAXmJ0AyYmMvcgel0LWWQ/N3Jyaig1lncwqwoddDil3PNKota1RVpjbWh6yvuFrUIsF
         IShw==
X-Gm-Message-State: AOAM530LQtnzQzsYXQ6+aO8rHnpXDHkASscR5wkDx7wrKz96CmZc0y+x
        ifAUPjqAoN4VJJlc1tRoseDivhgP
X-Google-Smtp-Source: ABdhPJytjUHoAws4xUHehosV9sh2WLFQdARcprtvsjbOm3OWrKwQcOoa+V8yPycAuRWPhEU3mmuA5A==
X-Received: by 2002:a1c:65c1:: with SMTP id z184mr533800wmb.60.1589494961845;
        Thu, 14 May 2020 15:22:41 -0700 (PDT)
Received: from ltop.local (5.221-244-81.adsl-dyn.isp.belgacom.be. [81.244.221.5])
        by smtp.gmail.com with ESMTPSA id x23sm695295wmj.6.2020.05.14.15.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 15:22:40 -0700 (PDT)
Date:   Fri, 15 May 2020 00:22:39 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH 15/17] scope: give a scope for labels & gotos
Message-ID: <20200514222227.n3hvic3lndz5qcjv@ltop.local>
References: <20200413161605.95900-16-luc.vanoostenryck@gmail.com>
 <CAHk-=wiy-BFXMpmm9-GNT_WtDKVLeR0ki4OTj83xPk=npuNSHA@mail.gmail.com>
 <20200413185452.pgj75pj5g7a42kik@ltop.local>
 <CAHk-=wjMSeVVQHZ23=HJ3V-yYPooeuHNHmZtexUVRKg_e5VMXA@mail.gmail.com>
 <CAHk-=whNLSTtSsmMD5a6D3s_LtjEYwZPWOSvUdz4mCd5kFO26Q@mail.gmail.com>
 <20200413233900.t7fczyyqrees5gwr@ltop.local>
 <20200414074934.urvzzgpi2a36jdf2@ltop.local>
 <CAHk-=wiahqumRaQkkcQ_kFhknA9z==DCWNKK-j0GRJH7GUtPEw@mail.gmail.com>
 <20200414230908.kb44bx5fgu3hzq7r@ltop.local>
 <CAHk-=whoCQ9hiNsNS_PKJGt+dxhXng8+YLJ-CzGG0eESfv0f0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whoCQ9hiNsNS_PKJGt+dxhXng8+YLJ-CzGG0eESfv0f0g@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Apr 14, 2020 at 05:59:18PM -0700, Linus Torvalds wrote:
> On Tue, Apr 14, 2020 at 4:09 PM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > +                       if (s->scope != s->declared_scope) {
> >
> > This comparison can never succeed for labels declared with __label__
> > because s->scope is a block scope and s->declared_scope a label one.
> 
> Hold on.. I'm sure I tested it.
> 
> Oh.
> 
> What I tested wasn't what I sent you, and I'd fixed things due to the
> testing but not updated the patch file.
> 
> Oops.
> 
> The test is supposed to be
> 
>                         if (s->declared_scope != label_scope) {
> 
> which is the whole point of that 'declared_scope'.
> 
> So the concept of the patch is that the 'declared_scope' (and
> 'label_scope') are the same kind of scope (and comparable): it is the
> applicability of the label itself (either the whole function or some
> sub-expression statement).
> 
> And the the visibility of the -symbol- ends up being different, and is
> the s->scope thing.
> 
> But while my testing wasn't quite as limited as my wrong-version patch
> implied, it _was_ limited. So it might miss some other case.

Sorry for the late reply.

Yes, it's working OK wth this change but there are several issues that
make me think that this approach is not ideal:

1) these 2 functions would give very different error message:
	void foo(void)
	{
		goto l;
		({ l: 0; });
	}

	void bar(void)
	{
		({ l: 0; });
		goto l;
	}

  The first one gives the 'warning: jumping inside statement expression'
  while the second one can only give 'warning: goto with undeclared label'
  because indeed the 'l' label inside the statement isn't visible anymore.
  This second warning is of coure less informative than the first one
  but what I really find abnormal is that the warning would be different
  depending on the fact that the goto comes before or after the label
  definition. This seems incorrect to me, confusing and is different
  from GCC (clang doesn't seems to mind).

2) in the following case, no warning can be given:
	void foo(void)
	{
	l:
		({
		l:
			goto l;
			0;
		});
		goto l;
	}
  
   In this case both label definition are in a different scope and each goto
   sees its own label. This is different than GCC which would complain
   about 'l' being redeclared.

   There was also another issue related to the fact that GCC put all
   labels in a single namespace bit I forgot the details.


These two problems are linked to the fact of using the local namespace
for labels while GCC use a single one for all of them.
But well, then again I can't say I'm fully happy with my solution
using the label scope not for the labels but for their definition
and uses (gotos & label expressions) and then comparing these with
the helper is_in_scope().

I dunno. I've fixed a number of details, I'll repost everything soon.

-- Luc

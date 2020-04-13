Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6967F1A6FDC
	for <lists+linux-sparse@lfdr.de>; Tue, 14 Apr 2020 01:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727839AbgDMXjE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 19:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727804AbgDMXjD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 19:39:03 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38EAAC0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 16:39:03 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a201so11580311wme.1
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 16:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ufBfC6L7xM7Z2mUmNOQzp5qEH43OhfBV2rH8oUDLmM8=;
        b=gHVJQ4WULEkVlD/Zylwfls6oEGlf0mBStTVjjxfdpjATOoY0SHqExSCuYY5AAz9AUk
         /rgQFIrougOj+4m5bVtQdCkyftgthDtYkdS9l3tJt+UXLDhr38MK9XzjT79UiNIKrjso
         UhBAeLvg6cHKNIxA0NIYQV7Um8E2Fve2DS0smsUO5Mwt9Zp39+pEl0gB+YfXWZhRvDBF
         pE9GDZfdxCWwiFBznLGzNjXhuEP4V2oZBhu/uTmpbfy29DDPuwowwQO30KkzWx0OPhBi
         Voo5GvjAkOHvUtch65Uz5246CHqowJiz/1ezBQKRdHWm6cil3xeypLUHXedRsslAwQNQ
         lihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ufBfC6L7xM7Z2mUmNOQzp5qEH43OhfBV2rH8oUDLmM8=;
        b=GMlBpUxAstssVH/naASUrp944pTYeMe5osBnFqhkjxI17rYKNeHoDAHopONwgzo0Ag
         6xcML210xPaBc3VVijnsMtXf+MGRbV8teVjnwmO5LorzrvuoJsTAIQiWpwSCADgiQwtP
         t3zegKNEzybI0UiEiQatOmRta8WPgoUco51lvIJguzmALnY6tqEt8CGGLXmO+/krxXow
         ooY9tvpi7VxngM+Gk0mJt3Gzsmo5GFemA1Vp5C09WshdjDuQBRGcaFjSW94lmTwzaHQ+
         cI4zOTZq4TOX2YUSB4WGS5CHZHqGO/pK/+RaawciUl887F3XKS19893Ce7JXpkrTdwxP
         3pPQ==
X-Gm-Message-State: AGi0PubJk+CfHG8jSitaKXyVAKkFmLdJ+Cc8bSFgMKq/AzwKbAw8/xCf
        lqq5kLAFLPCn90iDHnjEWi4=
X-Google-Smtp-Source: APiQypJ+fK9nGnRJE6BY35kR2UEmHVKySnRTIEZmvKVCw9PO9Dq7iLgKyIczA6U64cKhDk+LXs3RwQ==
X-Received: by 2002:a1c:6a0b:: with SMTP id f11mr20482284wmc.123.1586821141932;
        Mon, 13 Apr 2020 16:39:01 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:192f:3a26:2ea6:42b9])
        by smtp.gmail.com with ESMTPSA id c17sm16873860wrp.28.2020.04.13.16.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 16:39:01 -0700 (PDT)
Date:   Tue, 14 Apr 2020 01:39:00 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH 15/17] scope: give a scope for labels & gotos
Message-ID: <20200413233900.t7fczyyqrees5gwr@ltop.local>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
 <20200413161605.95900-16-luc.vanoostenryck@gmail.com>
 <CAHk-=wiy-BFXMpmm9-GNT_WtDKVLeR0ki4OTj83xPk=npuNSHA@mail.gmail.com>
 <20200413185452.pgj75pj5g7a42kik@ltop.local>
 <CAHk-=wjMSeVVQHZ23=HJ3V-yYPooeuHNHmZtexUVRKg_e5VMXA@mail.gmail.com>
 <CAHk-=whNLSTtSsmMD5a6D3s_LtjEYwZPWOSvUdz4mCd5kFO26Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whNLSTtSsmMD5a6D3s_LtjEYwZPWOSvUdz4mCd5kFO26Q@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Apr 13, 2020 at 03:40:55PM -0700, Linus Torvalds wrote:
> On Mon, Apr 13, 2020 at 12:32 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I _feel_ like the fix to that should be that the only thing that
> > creates the actual symbol is the label definition, and that the goto
> > should only ever use the 'ident' and we'd tie the two together later.
> 
> Actually, how about something like this?
> 
> I've not signed off on these patches, and the commit logs are
> questionable, but part of that is that the two first ones are just
> quick-and-dirty versions of your rename cleanups.
> 
> The third patch is the serious one, which shows what I think might be
> the solution to the odd scoping rules for labels.
> 
> Basically, we always scope labels - but if a label is _used_ but not
> defined in an inner label, when we close the label scope, we move it
> out to the next level.
> 
> But a defined label is never moved out, and when we define it, we
> require that any previous use was in the same scope (where "same
> scope" might have been an inner scope that was moved out).
> 
> I think it gets the semantics right, and it's actually fairly simple.
> 
> But it has very little testing, so this is more of a "how about
> something like this" than a serious submission.
> 
> If you test it, and fix up the warnings and error cases (like the
> other patches in your series did), you are more than welcome to take
> credit and authorship for this.
> 
> I just felt that the best way to describe (and do _some_ testing) my
> idea was to have a quick implementation to show what I mean.
> 
> And by "_some_ testing" I literally mean "almost no testing at all". I
> didn't even run this on the kernel tree. I just used one stipid small
> test-case for this, and when it gave the warning I wanted, I said
> "good enough" and sent this email out ;)

I like the idea. I just gave it a very quick test with sparse's
"make check" (it covers a lot of simple but corner/dirty cases that
the kernel may/should not have). It seemed to pass all the tests but
the ones using __label__. For exemple, things like this complain:
	{
		__label__ l;

	l:
		goto l;
	}

I'll look more at it tommorow as it's a bit late here. I just fear
that __label__ will spoil things here or at least complicate them.

-- Luc

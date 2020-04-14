Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC7361A8EE7
	for <lists+linux-sparse@lfdr.de>; Wed, 15 Apr 2020 01:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634357AbgDNXJM (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 14 Apr 2020 19:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2634356AbgDNXJM (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 14 Apr 2020 19:09:12 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7BEC061A0C
        for <linux-sparse@vger.kernel.org>; Tue, 14 Apr 2020 16:09:11 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id f13so16564667wrm.13
        for <linux-sparse@vger.kernel.org>; Tue, 14 Apr 2020 16:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zSHilztTWWQAdeTRqlWMtJwnBvNO56AWACm+aEgnEmU=;
        b=LHnruy1lbxg8WZqwKJy+dJ0p4KEmQsABm/iisQhwRd9NQ+nqtEsZ3/piPG4HQjBVp6
         Jrf65Oz07ASechJrexDuQYzW3tzSwEnFMPBAsBoyLZqxFLD8Fqt+D9bhudU3YHnSCKVI
         e9al3JLghtPxL6aevFSVgW+Np4XrQ376wKLI1vl3L/Sli2E0vVCBtTLtuuJCuUZd2pyl
         W54LM5Sek38fgaxzCqBaWPRyokv86v0AVk9EgkTgh+JetPJFnT3W6cy4V52r3zWyxbeK
         //cbSgtsNFCJRxQFuOADX420j9ybz7kX0I3xOIOqhQCvzv+vma/rH2kvqzXWK0BDU9Ng
         iqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zSHilztTWWQAdeTRqlWMtJwnBvNO56AWACm+aEgnEmU=;
        b=jiNMa5cDlHDxAAvLA9paX7lJuLEFOPmXH47hyznW5cLo4iKXoTCFKrObjdn+W1tegB
         5X5Pu85/5In09QsYNbs361CnITiz02GWkjvdlnrFahwDHBXZCXHbOt9tk6kKlpMsfSpK
         8sKgWYrj6j/atnDPENSPtejYTTV+vD0pz+zZKZ9xseXIMvEbmE5wMAbbXhdWzcOXCb5I
         /QrnsET83sWOI+wR4QSXP0NwGiB8xWTQo2gQ8fQT/ztoMyp4N1rLIeTQ68pDeSFVIXSB
         fnYzCMDHy8ygxxDgRqRnGreAxwF386JVCme/LAXN1/Nl9S+qOI5ubP3IFDZvHfz2UbX/
         A2Bg==
X-Gm-Message-State: AGi0PuYZkX/4BQG87OUu8zbHFrEVWawMPcrt+at6l2exGPkQ1d+zMlny
        swWImdOl0eqrjDerbLGd9dxBfX6O
X-Google-Smtp-Source: APiQypKYy+9LS72rtBMU1HGKB0Y0M0PMtdapMjPFtHhZmgWoNp0Ti7ZNVpH32v+PrO7ZIkIo5dAjpg==
X-Received: by 2002:a5d:51c7:: with SMTP id n7mr25603325wrv.11.1586905750621;
        Tue, 14 Apr 2020 16:09:10 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:24ad:14a2:a350:d556])
        by smtp.gmail.com with ESMTPSA id m15sm19970560wmc.35.2020.04.14.16.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 16:09:09 -0700 (PDT)
Date:   Wed, 15 Apr 2020 01:09:08 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH 15/17] scope: give a scope for labels & gotos
Message-ID: <20200414230908.kb44bx5fgu3hzq7r@ltop.local>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
 <20200413161605.95900-16-luc.vanoostenryck@gmail.com>
 <CAHk-=wiy-BFXMpmm9-GNT_WtDKVLeR0ki4OTj83xPk=npuNSHA@mail.gmail.com>
 <20200413185452.pgj75pj5g7a42kik@ltop.local>
 <CAHk-=wjMSeVVQHZ23=HJ3V-yYPooeuHNHmZtexUVRKg_e5VMXA@mail.gmail.com>
 <CAHk-=whNLSTtSsmMD5a6D3s_LtjEYwZPWOSvUdz4mCd5kFO26Q@mail.gmail.com>
 <20200413233900.t7fczyyqrees5gwr@ltop.local>
 <20200414074934.urvzzgpi2a36jdf2@ltop.local>
 <CAHk-=wiahqumRaQkkcQ_kFhknA9z==DCWNKK-j0GRJH7GUtPEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiahqumRaQkkcQ_kFhknA9z==DCWNKK-j0GRJH7GUtPEw@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Apr 14, 2020 at 11:19:32AM -0700, Linus Torvalds wrote:
> On Tue, Apr 14, 2020 at 12:49 AM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > The problem is that now normal labels use the new label_scope
> > but the ones declared with __label__ use block_scope and these
> > 2 scopes are kinda in a different namespace of scope.
> 
> Oh, I forgot about the special __label__ thing that actually declares labels.
> 
> That one has an interesting behavior, in that the _lifetime_ of the
> symbol is the block scope, but the *use* of the symbol must remain in
> label scope.
> 
> The most obvious fix is probably something like the appended: make the
> 'sym->scope' remain the lifetime scope, but then attach a "must be
> used in this scope' thing to any NS_LABEL case.
> 
> That fairly clearly separates the two issues.

Yes, I see the principle but ... it doesn't work yet for __label__ 
and the more I think about it, the more I think it can't work.
The problem is that the block scopes and the label scopes are
never comparable. At the syntax level the label scope is a subset
of the block levels, less fine grained but for sparse 'struct scope'
they are never the same, even for the same { }.
So, in your patch (with things removed for simplicity):

diff --git a/parse.c b/parse.c
index 8e238f59..b6109516 100644
--- a/parse.c
+++ b/parse.c
@@ -2541,13 +2542,14 @@ static struct token *statement(struct token *token, struct statement **tree)
-			if (s->scope != label_scope) {
-				sparse_error(stmt->pos, "label '%s' used outside label expression", show_ident(s->ident));
+			if (s->scope != s->declared_scope) {

This comparison can never succeed for labels declared with __label__
because s->scope is a block scope and s->declared_scope a label one.

I'm sure it's fixeable in some way and problably it's just me
having a kind of 'mental blocage' but I don't see how the
normal scoping with lookup_symbol() can be really useful for
labels without losing the conceptual simplicity or without going
to something like my previous solution.

-- Luc

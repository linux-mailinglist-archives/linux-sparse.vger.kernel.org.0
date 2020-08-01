Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65532235302
	for <lists+linux-sparse@lfdr.de>; Sat,  1 Aug 2020 17:42:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726432AbgHAPmV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 1 Aug 2020 11:42:21 -0400
Received: from raptor.unsafe.ru ([5.9.43.93]:50454 "EHLO raptor.unsafe.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725841AbgHAPmV (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 1 Aug 2020 11:42:21 -0400
Received: from comp-core-i7-2640m-0182e6 (ip-89-102-33-211.net.upcbroadband.cz [89.102.33.211])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by raptor.unsafe.ru (Postfix) with ESMTPSA id 64330209AF;
        Sat,  1 Aug 2020 15:42:19 +0000 (UTC)
Date:   Sat, 1 Aug 2020 17:42:17 +0200
From:   Alexey Gladkov <gladkov.alexey@gmail.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] sindex.1: Use ' for a plain quote char
Message-ID: <20200801154217.xwwv4nezijuqwfoa@comp-core-i7-2640m-0182e6>
References: <20200731214125.21424-1-uwe@kleine-koenig.org>
 <20200801124004.567443cwhacqf2i3@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200801124004.567443cwhacqf2i3@ltop.local>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.1 (raptor.unsafe.ru [5.9.43.93]); Sat, 01 Aug 2020 15:42:19 +0000 (UTC)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, Aug 01, 2020 at 02:40:04PM +0200, Luc Van Oostenryck wrote:
> On Fri, Jul 31, 2020 at 11:41:25PM +0200, Uwe Kleine-K�nig wrote:
> > --- a/sindex.1
> > +++ b/sindex.1
> > @@ -128,8 +128,8 @@ struct member
> >  .
> >  .SH MODE
> >  The \fBMODE\fR is dumped as a 3-letter string. The first letter denotes address
> > -of part, 2-nd - access by value, 3-rd - access by pointer. A special value
> > -\'\fIdef\fR\' means a symbol definition.
> > +of part, 2-nd - access by value, 3-rd - access by pointer. A special
> > +value '\fIdef\fR' means a symbol definition.
> 
> This looks good to me.
> Thanks.
> 
> But maybe, in this case the single quotes are even not needed at all
> since the symbol is already emphasized with the italic? Or the italic
> is not needed because it's already between quotes?
> Alexey, do you have any preferences?

Nop. If you think that this will be better, then I am OK with these
changes.

-- 
Rgrds, legion


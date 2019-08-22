Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB0CA9982F
	for <lists+linux-sparse@lfdr.de>; Thu, 22 Aug 2019 17:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731590AbfHVPaA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 22 Aug 2019 11:30:00 -0400
Received: from movementarian.org ([178.79.150.28]:35522 "EHLO
        movementarian.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731844AbfHVP37 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 22 Aug 2019 11:29:59 -0400
Received: from movement by movementarian.org with local (Exim 4.92)
        (envelope-from <movement@movementarian.org>)
        id 1i0p2E-0003KJ-PB; Thu, 22 Aug 2019 16:29:58 +0100
Date:   Thu, 22 Aug 2019 16:29:58 +0100
From:   John Levon <levon@movementarian.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     smatch@vger.kernel.org, linux-sparse@vger.kernel.org,
        yuri.pankov@nexenta.com
Subject: Re: noreturn attribute doesn't work in smatch
Message-ID: <20190822152958.GA12745@movementarian.org>
References: <20190815005328.GA8004@movementarian.org>
 <20190815111237.GA20100@movementarian.org>
 <20190822132800.GJ4451@kadam>
 <20190822134603.GB9904@movementarian.org>
 <20190822150528.GL3964@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822150528.GL3964@kadam>
X-Url:  http://www.movementarian.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Aug 22, 2019 at 06:05:29PM +0300, Dan Carpenter wrote:

> On Thu, Aug 22, 2019 at 02:46:03PM +0100, John Levon wrote:
> > On Thu, Aug 22, 2019 at 04:30:34PM +0300, Dan Carpenter wrote:
> > > The code to handle that is really ancient.  You need to do:
> > >     ./smatch --info test.c | tee warns.txt
> > >     grep no_return_funcs warns.txt || echo FAIL
> > >     ./smatch_scripts/gen_no_return_funcs.sh warns.txt -p=levon
> > >     mv levon.no_return_funcs smatch_data/
> > > 
> > > Then pass -p=levon to smatch on the next run.
> > 
> > OK, thanks. That doesn't match too well with the way we use smatch, but
> > this is much less of a big deal (I only needed to annotate this in a
> > couple of places).
> 
> It should be the the DB, right?  Would that work for you?

There's few enough that it's preferable to just explicitly mark the
source as noreturn too, rather than keep a separate list.

regards
john

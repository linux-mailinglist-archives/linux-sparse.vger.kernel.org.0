Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F1599562
	for <lists+linux-sparse@lfdr.de>; Thu, 22 Aug 2019 15:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730803AbfHVNqF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 22 Aug 2019 09:46:05 -0400
Received: from movementarian.org ([178.79.150.28]:35388 "EHLO
        movementarian.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbfHVNqF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 22 Aug 2019 09:46:05 -0400
Received: from movement by movementarian.org with local (Exim 4.92)
        (envelope-from <movement@movementarian.org>)
        id 1i0nPf-0002aH-KU; Thu, 22 Aug 2019 14:46:03 +0100
Date:   Thu, 22 Aug 2019 14:46:03 +0100
From:   John Levon <levon@movementarian.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     smatch@vger.kernel.org, linux-sparse@vger.kernel.org,
        yuri.pankov@nexenta.com
Subject: Re: noreturn attribute doesn't work in smatch
Message-ID: <20190822134603.GB9904@movementarian.org>
References: <20190815005328.GA8004@movementarian.org>
 <20190815111237.GA20100@movementarian.org>
 <20190822132800.GJ4451@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822132800.GJ4451@kadam>
X-Url:  http://www.movementarian.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Aug 22, 2019 at 04:30:34PM +0300, Dan Carpenter wrote:

> On Thu, Aug 15, 2019 at 12:12:37PM +0100, John Levon wrote:
> > 
> > I took another pass, and this works for me:
> > 
> > diff --git a/parse.c b/parse.c
> > index ca4726b8..44c59707 100644
> > --- a/parse.c
> > +++ b/parse.c
> > @@ -2859,6 +2859,7 @@ struct token *external_declaration(struct token
> > *token, struct symbol_list **lis
> >         /* Parse declaration-specifiers, if any */
> >         token = declaration_specifiers(token, &ctx);
> >         mod = storage_modifiers(&ctx);
> > +       mod |= ctx.ctype.modifiers & MOD_NORETURN;
> >         decl = alloc_symbol(token->pos, SYM_NODE);
> >         /* Just a type declaration? */
> >         if (match_op(token, ';')) {
> > 
> > (I suppose a proper fix would collate all function-level attributes
> > but...)
> 
> This patch seems like a hack, but I will apply it...

I agree, it would be nice to see this cleaned up properly, but as the
above is sufficient for us, it'll do for us! Thanks!

> > However, it seems like smatch is still not quite passing its knowledge
> > along: if I have:
> > 
> > extern void die() __attribute((__noreturn__));
> > 
> > void mydie()
> > {
> > 	die();
> > }
> > 
> > then the die() call is nullified, but smatch doesn't realise that means
> > all paths of mydie() are __noreturn__ too.
> 
> The code to handle that is really ancient.  You need to do:
>     ./smatch --info test.c | tee warns.txt
>     grep no_return_funcs warns.txt || echo FAIL
>     ./smatch_scripts/gen_no_return_funcs.sh warns.txt -p=levon
>     mv levon.no_return_funcs smatch_data/
> 
> Then pass -p=levon to smatch on the next run.

OK, thanks. That doesn't match too well with the way we use smatch, but
this is much less of a big deal (I only needed to annotate this in a
couple of places).

regards
john

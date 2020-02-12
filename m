Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3E2515A435
	for <lists+linux-sparse@lfdr.de>; Wed, 12 Feb 2020 10:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgBLJGh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 12 Feb 2020 04:06:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38617 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728150AbgBLJGh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 12 Feb 2020 04:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581498396;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1kMMzjODc3RgXHq8MAV+JgWbs+N727zK6WWlZeTTpeo=;
        b=QK0igqHt729FuawY/KrZDA6laVN4T4ayOfVdi6EdPPFTIiQiIaxKcysKc7/pjyAnmZl02Y
        W/h9JK1JK/ZyS/K3GukP6o5HwUZUWSQOTwKgJNl2zdh50IOCFyoNZ1ni8ziufKUy4pU/Bj
        ZqQL2Fb9QOfUujiL13vgebZYESGjHqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-C-DqzZS2O7mbPbLIoH5rlg-1; Wed, 12 Feb 2020 04:06:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9698713E6;
        Wed, 12 Feb 2020 09:06:28 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id BC1915C12E;
        Wed, 12 Feb 2020 09:06:27 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 12 Feb 2020 10:06:28 +0100 (CET)
Date:   Wed, 12 Feb 2020 10:06:27 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] dissect: introduce sym_is_local() for reporter
Message-ID: <20200212090626.GA19406@redhat.com>
References: <20200211160136.GA14027@redhat.com>
 <20200212004135.cyzcqtwwcuewa4gj@ltop.local>
MIME-Version: 1.0
In-Reply-To: <20200212004135.cyzcqtwwcuewa4gj@ltop.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: C-DqzZS2O7mbPbLIoH5rlg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 02/12, Luc Van Oostenryck wrote:
>
> On Tue, Feb 11, 2020 at 05:01:36PM +0100, Oleg Nesterov wrote:
> > Can be used to filter out the usage of local variables.
>
> ...
>
> > diff --git a/dissect.h b/dissect.h
> > index efe2c0b..178dba5 100644
> > --- a/dissect.h
> > +++ b/dissect.h
> > @@ -27,6 +27,11 @@ struct reporter
> >
> >  extern struct symbol *dissect_ctx;
> >
> > +static inline bool sym_is_local(struct symbol *sym)
> > +{
> > +	return sym->kind == 'v' && !(sym->ctype.modifiers & MOD_TOPLEVEL);
> > +}
> > +
>
> Shouldn't MOD_STATIC be added to the test?

perhaps I misread bind_symbol() ... but it seems to me MOD_TOPLEVEL is
enough. bind_symbol() does

	scope = block_scope;
	if (ns == NS_SYMBOL && toplevel(scope)) {
		mod = MOD_ADDRESSABLE | MOD_TOPLEVEL;
		...
		sym->ctype.modifiers |= mod;
	}

toplevel(block_scope) should be true after start_file_scope() sets
"block_scope = file_scope" and until start_function_scope(), right?

> It depends on what exactly you want for 'local'.

Yes, it should only return T if the symbol was defined inside some function.
If we have

	static int I;

in file scope, sym_is_local() should return false and so it does, test-dissect
outputs

	1:12                   def   v I                                int

Thanks for looking!

Oleg.


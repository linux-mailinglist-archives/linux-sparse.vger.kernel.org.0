Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 516431816E5
	for <lists+linux-sparse@lfdr.de>; Wed, 11 Mar 2020 12:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgCKLeA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 11 Mar 2020 07:34:00 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50338 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726000AbgCKLeA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 11 Mar 2020 07:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583926438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VdlZ1FD8pPvgQpgof74QunaYx153or2aDGUViBAQ1mE=;
        b=hH816DrGCIqsuPyBeeYmZgjvsuW0Ahv3IpaCKFKNsLu/nvZMOSkq1VxpmArqkU4AxJULK5
        gxHCRgX7tWXy8agkjzqY2DXyYfLTPdNoVoPYoq8DyT1hwZ9ajfuviFnWLulbrajN43N08P
        Tgk571/z3dk45/62YHfp+VnuyWB32LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-tYZ-RSZYN861wbxUbNR63w-1; Wed, 11 Mar 2020 07:33:55 -0400
X-MC-Unique: tYZ-RSZYN861wbxUbNR63w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E223189D6C2;
        Wed, 11 Mar 2020 11:33:54 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 3017092D27;
        Wed, 11 Mar 2020 11:33:53 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 11 Mar 2020 12:33:53 +0100 (CET)
Date:   Wed, 11 Mar 2020 12:33:52 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Add symantic index utility
Message-ID: <20200311113351.GA19327@redhat.com>
References: <20200309152509.6707-1-gladkov.alexey@gmail.com>
 <20200309223701.dbnej7esb4qp56bm@ltop.local>
 <20200310150713.GB19012@redhat.com>
 <20200311090745.GD11561@kadam>
MIME-Version: 1.0
In-Reply-To: <20200311090745.GD11561@kadam>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 03/11, Dan Carpenter wrote:
>
> On Tue, Mar 10, 2020 at 04:07:14PM +0100, Oleg Nesterov wrote:
> > Annoyingly, this triggers a lot of sparse_error's in pre-process.c:collect_arg().
> > And just in case, of course this is not specific to dissect/sindex, ./sparse or
> > anything else will equally complain.
> >
> > For example,
> >
> >   1011  static inline bool page_expected_state(struct page *page,
> >   1012                                          unsigned long check_flags)
> >   1013  {
> >   1014          if (unlikely(atomic_read(&page->_mapcount) != -1))
> >   1015                  return false;
> >   1016
> >   1017          if (unlikely((unsigned long)page->mapping |
> >   1018                          page_ref_count(page) |
> >   1019  #ifdef CONFIG_MEMCG
> >   1020                          (unsigned long)page->mem_cgroup |
> >   1021  #endif
> >   1022                          (page->flags & check_flags)))
> >   1023                  return false;
> >   1024
> >   1025          return true;
> >   1026  }
> >
> > leads to
> >
> > 	mm/page_alloc.c:1019:1: error: directive in macro's argument list
> > 	mm/page_alloc.c:1021:1: error: directive in macro's argument list
>
> This does:
>
> 	/* Shut up warnings after an error */
> 	has_error |= ERROR_CURR_PHASE;
>
> so we probably end up not seeing some warnings.

Heh,

	./include/trace/events/neigh.h:127:1: error: directive in macro's argument list
	./include/trace/events/neigh.h:199:1: error: too many errors
	
so we probably end up not seeing some errors ;)

> > and it is not immediately clear why. Yes, because "unlikely" is a macro.
> >
> > Can't we simply remove this sparse_error() ? "#if" inside the macro's args
> > is widely used in kernel, gcc doesn't complain, afaics pre-process.c handles
> > this case correctly.
>
> s/correctly/the same as GCC/.  The behavior is undefined in c99.

Yes, yes, this is what I meant.

and just in case... there are other cases when GCC and sparse differ,

	if, within a macro invocation, that macro is redefined, then the new
	definition takes effect in time for argument pre-expansion, but the
	original definition is still used for argument replacement. Here is a
	pathological example:

		#define f(x) x x
		f (1
		#undef f
		#define f 2
		f)

	which expands to

		1 2 1 2

./sparse -E outputs

	/tmp/M.c:3:1: error: directive in macro's argument list
	/tmp/M.c:4:1: error: directive in macro's argument list
	2


but I think we don't care.

Oleg.


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 335FB18012D
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Mar 2020 16:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgCJPHT (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Mar 2020 11:07:19 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48703 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726825AbgCJPHT (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Mar 2020 11:07:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583852838;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ph3DFEpgtin0er1ThoNjsp+nsKsEl6708c3MwlXjlvQ=;
        b=ivU39RMr3wHBcRGJqbZUeMCy1rrWl7B6jNUbtoCZ87cFzZVyiN37VFzaSyl3l7mrk/Esvl
        ju5mfhqXtwb0gS3/FZQBui5PsYQPZh/WDB5Iu0DZ4xOZSe8B1YyQmuEZNaZuLdtVGELrKI
        IPdCwLkOTq110oI1f+MlVQZVg1Fo7aM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-KP_ZmoFVNgaHMTvbdOOFIA-1; Tue, 10 Mar 2020 11:07:17 -0400
X-MC-Unique: KP_ZmoFVNgaHMTvbdOOFIA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F33768017CC;
        Tue, 10 Mar 2020 15:07:15 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 2179727BD8;
        Tue, 10 Mar 2020 15:07:14 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue, 10 Mar 2020 16:07:15 +0100 (CET)
Date:   Tue, 10 Mar 2020 16:07:14 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Add symantic index utility
Message-ID: <20200310150713.GB19012@redhat.com>
References: <20200309152509.6707-1-gladkov.alexey@gmail.com>
 <20200309223701.dbnej7esb4qp56bm@ltop.local>
MIME-Version: 1.0
In-Reply-To: <20200309223701.dbnej7esb4qp56bm@ltop.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 03/09, Luc Van Oostenryck wrote:
>
> On Mon, Mar 09, 2020 at 04:25:09PM +0100, Alexey Gladkov wrote:
> > sindex is the simple to use cscope-like tool based on sparse/dissect.
> > Unlike cscope it runs after pre-processor and thus it can't index the
> > code filtered out by ifdef's, but otoh it understands how the symbol
> > is used and it can track the usage of struct members.
>
> Hi,
>
> This looks pretty good.
> I just have a few non-essential remarks I've added here below.

Great, thanks!

while Alexey is working on your comments...

> > To create an index for your linux kernel configuration:
> >
> > $ make C=2 CHECK="sindex add --"

Annoyingly, this triggers a lot of sparse_error's in pre-process.c:collect_arg().
And just in case, of course this is not specific to dissect/sindex, ./sparse or
anything else will equally complain.

For example,

  1011  static inline bool page_expected_state(struct page *page,
  1012                                          unsigned long check_flags)
  1013  {
  1014          if (unlikely(atomic_read(&page->_mapcount) != -1))
  1015                  return false;
  1016
  1017          if (unlikely((unsigned long)page->mapping |
  1018                          page_ref_count(page) |
  1019  #ifdef CONFIG_MEMCG
  1020                          (unsigned long)page->mem_cgroup |
  1021  #endif
  1022                          (page->flags & check_flags)))
  1023                  return false;
  1024
  1025          return true;
  1026  }

leads to

	mm/page_alloc.c:1019:1: error: directive in macro's argument list
	mm/page_alloc.c:1021:1: error: directive in macro's argument list

and it is not immediately clear why. Yes, because "unlikely" is a macro.

Can't we simply remove this sparse_error() ? "#if" inside the macro's args
is widely used in kernel, gcc doesn't complain, afaics pre-process.c handles
this case correctly.

With the patch below

	$ make -s -j4 C=2 CHECK='sindex add --'

in my dev tree is really silent:

	kernel/events/core.c:571:26: warning: function 'perf_pmu_name' with external linkage has definition
	arch/x86/kernel/kprobes/opt.c:468:13: warning: function 'arch_unoptimize_kprobes' with external linkage has definition

and both warnings look valid.

Oleg.

--- a/pre-process.c
+++ b/pre-process.c
@@ -271,8 +271,6 @@ static struct token *collect_arg(struct token *prev, int vararg, struct position
 	while (!eof_token(next = scan_next(p))) {
 		if (next->pos.newline && match_op(next, '#')) {
 			if (!next->pos.noexpand) {
-				sparse_error(next->pos,
-					     "directive in macro's argument list");
 				preprocessor_line(stream, p);
 				__free_token(next);	/* Free the '#' token */
 				continue;


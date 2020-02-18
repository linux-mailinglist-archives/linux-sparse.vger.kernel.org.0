Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C12BC1624B7
	for <lists+linux-sparse@lfdr.de>; Tue, 18 Feb 2020 11:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgBRKip (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 18 Feb 2020 05:38:45 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:37891 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726298AbgBRKio (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 18 Feb 2020 05:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582022323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=afeAkPDI3GsWddMDUcb3QNtdxoVKOQoerWbtn00q/KQ=;
        b=b3hVRa1w4EUJB2xrbmoepkWkk4AIJjl3G++DbjIcHbXyp6RS3R/s9WytjQaV6IQql56j7P
        03MEbxW9D2+mnzgJ/2PwuB43blEKMwDp+HwZrpOoYgz6+HZje5JO64u3DfDQ9Anzs9SdzS
        OcLILnTT97Ovstt41A4b6P3tB1DJ5E4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-dDNMHLRXN1GS6EsAOnxKJg-1; Tue, 18 Feb 2020 05:38:40 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B9560DB33;
        Tue, 18 Feb 2020 10:38:39 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id D990390F76;
        Tue, 18 Feb 2020 10:38:38 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue, 18 Feb 2020 11:38:39 +0100 (CET)
Date:   Tue, 18 Feb 2020 11:38:38 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH 1/3] struct_union_enum_specifier: set MOD_TOPLEVEL if
 toplevel(sym->scope)
Message-ID: <20200218103837.GA3466@redhat.com>
References: <20200214113320.GA31578@redhat.com>
 <20200217214610.uxbnfh5zooqve4yc@ltop.local>
MIME-Version: 1.0
In-Reply-To: <20200217214610.uxbnfh5zooqve4yc@ltop.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: dDNMHLRXN1GS6EsAOnxKJg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 02/17, Luc Van Oostenryck wrote:
>
> On Fri, Feb 14, 2020 at 12:33:20PM +0100, Oleg Nesterov wrote:
> > With this change dissect can know the scope of SYM_STRUCT/UNION/ENUM,
> > see the next patch.
> >
> > Note that MOD_TOPLEVEL can be set even if struct/union/enum type is
> > private and bind_symbol() is not called.
>
> I don't like that very much. For example: why this is needed for
> struct/union/enum and not other types?

Do you mean builtin types like int_ctype? OK, I agree, this is slightly
inconsistent.

> Should it be possible to use the function toplevel() or add and
> helper for it in scope.c?

Well, toplevel() won't work if SYM_STRUCT/etc is anonymous, in this
case bind_symbol() is not called and thus sym->scope = NULL.

Consider

	struct { int m; } x;

	void func(void)
	{
		struct { int m; } x;

	}

we want to report the 2nd struct definition as "local"

   1:8                    def   s :x
   1:14                   def   m :x.m                             int
   1:19                   def   v x                                struct :x
   3:6                    def   f func                             void ( ... )
   5:16  func             def . s :x
   5:22  func             def . m :x.m                             int
   5:27  func             def . v x                                struct :x

so that this spam can be filtered out, but base->scope is NULL in both
cases.

> > IIUC nobody else looks at SYM_STRUCT->ctype.modifiers, "make check"
> > doesn't show any difference.
>
> Yes, it's true and it shouldn't make any difference but still I
> would prefer to not mix symbols and types more than they already are.

OK, will you agree with one-liner below? This should make toplevel() work.

Oleg.

--- a/parse.c
+++ b/parse.c
@@ -772,6 +772,7 @@ static struct token *struct_union_enum_specifier(enum type type,
 	}
 
 	sym = alloc_symbol(token->pos, type);
+	sym->scope = block_scope;
 	token = parse(token->next, sym);
 	ctx->ctype.base_type = sym;
 	token =  expect(token, '}', "at end of specifier");


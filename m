Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5D88165D07
	for <lists+linux-sparse@lfdr.de>; Thu, 20 Feb 2020 12:57:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgBTL5q (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 20 Feb 2020 06:57:46 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53378 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727393AbgBTL5q (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 20 Feb 2020 06:57:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582199864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0HfpBfwgy2OkZLzHokYm3Yp8OkZPY3B3Ua5jifcPsOA=;
        b=Angq0DCeg+2Z/V16ZnAxOStcIq3j3oIXVO5EOvXVgLKheLP+pCyTTb3nyTQ9JhTdhNjalv
        khRg6Eq/BE8B72d2sfn4arae1/ET+8E9z+Jj3Q3FMkP8difZzRaG3/ZwV7cMS/vbmBFxA+
        YwSliUlGEfs57GKa69pKVxmDISftvcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-p6_Vyk9qPC2TlPaKxwuzMw-1; Thu, 20 Feb 2020 06:57:41 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A971213EA;
        Thu, 20 Feb 2020 11:57:39 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id D023519C4F;
        Thu, 20 Feb 2020 11:57:38 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 20 Feb 2020 12:57:38 +0100 (CET)
Date:   Thu, 20 Feb 2020 12:57:37 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2 1/2] struct_union_enum_specifier: always initialize
 sym->scope
Message-ID: <20200220115736.GB27143@redhat.com>
References: <20200219162911.GA26790@redhat.com>
 <20200220005602.gd22zbd7c5qy4t6k@ltop.local>
MIME-Version: 1.0
In-Reply-To: <20200220005602.gd22zbd7c5qy4t6k@ltop.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: p6_Vyk9qPC2TlPaKxwuzMw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 02/20, Luc Van Oostenryck wrote:
>
> On Wed, Feb 19, 2020 at 05:29:11PM +0100, Oleg Nesterov wrote:
> > Currently it is not possible to figure out the scope of the private
> > struct/union/enum type, its ->scope is NULL because bind_symbol() is
> > not called.
> >
> > Change struct_union_enum_specifier() to set sym->scope = block_scope
> > in this case, this is what bind_symbol() does when type has a name.
>
> Thanks.
> I've just changed the comment to "used by dissect"

Great, thanks!

> because
> elsewhere the scope or toplevel()s only relevant for symbols.

Cough... can't resist ;)

Not really, see struct_union_enum_specifier()->is_outer_scope(). But
yes sure, this is only when ->ident != NULL.

Oleg.


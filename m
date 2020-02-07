Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 629C215552F
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 11:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgBGKB6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 05:01:58 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26248 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726587AbgBGKB6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 05:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581069717;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZXUXMQY4bvovtDFeH31/k5TQWq57scW3kHvUju8lsKc=;
        b=cZTlaDkYsefehnjuAxuk+cYoGgxYV+SP8aN3pSEJqCjMwRv3FVlhKFJqtmp8ZfSVJxy2f5
        wM7iBHJM3Puq0nK7U6vDsRzku5i5tBgKSJBMgqojwnK55GwV8yU3d2MNaNQeiaAuWQB/k7
        F8bmafLGEahQ4fDRA2qFWaMx710XZ6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-GIQqx6bAPWuyhFejQutojg-1; Fri, 07 Feb 2020 05:01:53 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40115100551A;
        Fri,  7 Feb 2020 10:01:52 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 6ACA660BEC;
        Fri,  7 Feb 2020 10:01:51 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Fri,  7 Feb 2020 11:01:51 +0100 (CET)
Date:   Fri, 7 Feb 2020 11:01:50 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] dissect: introduce dissect_ctx
Message-ID: <20200207100150.GB9260@redhat.com>
References: <20200206170132.GA8908@redhat.com>
 <20200206204518.qx5qtyl52al37njy@ltop.local>
MIME-Version: 1.0
In-Reply-To: <20200206204518.qx5qtyl52al37njy@ltop.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: GIQqx6bAPWuyhFejQutojg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 02/06, Luc Van Oostenryck wrote:
>
> On Thu, Feb 06, 2020 at 06:01:32PM +0100, Oleg Nesterov wrote:
> > Points to the current function or to the global variable in case of
> > compound initializer.
> >
> > Kill the ugly test-dissect.c:storage() and change print_usage() to
> > report dissect_ctx->ident instead.
>
> Having the ful ident will be good, I think, but the cost is to have
> to maintain this context. I suppose it would be too painful to
> propgate this context via an additional argument to all involved
> functions?

Oh, I'd prefer to not do this. This needs to add the additional "ctx"
arg to every do_.*() function in dissect.c, and for what? IMHO, this
will just complicate the code for no reason.

I can unexport the global "struct symbol *dissect_ctx" introduced by
this patch and pass it as the additional (new) argument to every to
every callback, but I'd like to do this later, along with other
"incompatible" changes for the new tool Alexey is working on.

Thanks,

Oleg.


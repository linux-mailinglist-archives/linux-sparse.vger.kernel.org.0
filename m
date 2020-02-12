Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC97E15A484
	for <lists+linux-sparse@lfdr.de>; Wed, 12 Feb 2020 10:21:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728808AbgBLJVs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 12 Feb 2020 04:21:48 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:21582 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728595AbgBLJVr (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 12 Feb 2020 04:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581499306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=Kc01fmk770RlmcBo6Xzpq1OlqCb7ETGlh6IAahErtoM=;
        b=he/bea/2rdxDHG39kxtMfvXto+RtV4tE2OBrIAjzeRGvXjLvORSI02PWXQ9VOcpdnh2EaL
        xe9vHssMo9UInX+WirIh25v5nuJiGQHU6LGmEaZP/0wElVsaPyccEwph5jdXv0EjyM+3+s
        Uwhb/9wnJyJ+6Fd+/aRIAi5hD5c7w/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-krnnpBcfNYSyswhvKDJAkg-1; Wed, 12 Feb 2020 04:21:42 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA055801E6C;
        Wed, 12 Feb 2020 09:21:41 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 1A7BB60BF4;
        Wed, 12 Feb 2020 09:21:40 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 12 Feb 2020 10:21:41 +0100 (CET)
Date:   Wed, 12 Feb 2020 10:21:40 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH] dissect: use show_ident() to print dctx->ident
Message-ID: <20200212092140.GA21571@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: krnnpBcfNYSyswhvKDJAkg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

I didn't know show_ident() uses 4 buffers for the string it returns and
thus it is safe to call it twice in a row.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/dissect.c b/dissect.c
index 499e0a0..6706690 100644
--- a/dissect.c
+++ b/dissect.c
@@ -617,16 +617,13 @@ static inline struct symbol *do_symbol(struct symbol *sym)
 
 	break; case SYM_FN:
 		stmt = sym->ctype.modifiers & MOD_INLINE
-			? type->inline_stmt
-			: type->stmt;
+			? type->inline_stmt : type->stmt;
 		if (!stmt)
 			break;
 
 		if (dctx)
-			sparse_error(dctx->pos,
-				"dissect_ctx change %.*s -> %s",
-				dctx->ident->len, dctx->ident->name,
-				show_ident(sym->ident));
+			sparse_error(dctx->pos, "dissect_ctx change %s -> %s",
+				show_ident(dctx->ident), show_ident(sym->ident));
 
 		dissect_ctx = sym;
 		do_sym_list(type->arguments);
-- 
2.5.0



Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66DCB157F94
	for <lists+linux-sparse@lfdr.de>; Mon, 10 Feb 2020 17:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbgBJQUq (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 10 Feb 2020 11:20:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53037 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727722AbgBJQUq (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 10 Feb 2020 11:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581351644;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RaZshSmUsIJPu8zhrXtw20Xm6n9n3XhpniCiqC6p6ms=;
        b=jTF/NvcswYinXoX6AwnswqeO3I8ncspJympNkQU8YwaIpSra7xbj+sMBq6O/py2X89L67q
        2+0waUFbZBwhOROc0ysL+4S9NbQfgEHpI2LIz6Jc2QxV7tjcIPBtR/TIVZw8BG6xbNedcS
        M9rj7SZmX2M4xHwpNdrkZRC2EgY5GSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-f7748MgTOkewx9MYZ4sa6w-1; Mon, 10 Feb 2020 11:20:39 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E865DBA3;
        Mon, 10 Feb 2020 16:20:38 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id C796860BF3;
        Mon, 10 Feb 2020 16:20:37 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Mon, 10 Feb 2020 17:20:40 +0100 (CET)
Date:   Mon, 10 Feb 2020 17:20:38 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 2/2] dissect: enforce sym->kind='f' when it looks like a
 function call
Message-ID: <20200210162038.GA29643@redhat.com>
References: <20200210162018.GA29634@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200210162018.GA29634@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: f7748MgTOkewx9MYZ4sa6w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A separate change for documentation purposes.

dissect() tries to work even if the parsed code is buggy or incomplete,
thus it makes sense to change expr_symbol() to set kind = 'f' when it
likely looks like a function name.

We can safely abuse EXPR_SYMBOL->op to pass the hint to expr_symbol(),
it must be 0.

Test-case:

	void call(void)
	{
		func();
	}

before this patch

	1:14                   def f call                             void ( ... )
	3:17  call             --r v func                             bad type

after:

	1:14                   def f call                             void ( ... )
	3:17  call             --r f func                             bad type

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c      | 4 +++-
 test-dissect.c | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/dissect.c b/dissect.c
index 20456b2..d9ca142 100644
--- a/dissect.c
+++ b/dissect.c
@@ -166,7 +166,7 @@ static inline struct symbol *expr_symbol(struct expression *expr)
 			sym = alloc_symbol(expr->pos, SYM_BAD);
 			bind_symbol(sym, expr->symbol_name, NS_SYMBOL);
 			sym->ctype.modifiers = MOD_EXTERN;
-			sym->kind = 'v';
+			sym->kind = expr->op ?: 'v'; /* see EXPR_CALL */
 		}
 	}
 
@@ -374,6 +374,8 @@ again:
 		ret = do_expression(mode, expr->cond_false);
 
 	break; case EXPR_CALL:
+		if (expr->fn->type == EXPR_SYMBOL)
+			expr->fn->op = 'f'; /* for expr_symbol() */
 		ret = do_expression(U_R_PTR, expr->fn);
 		if (is_ptr(ret))
 			ret = ret->ctype.base_type;
diff --git a/test-dissect.c b/test-dissect.c
index 81cc89d..ece2253 100644
--- a/test-dissect.c
+++ b/test-dissect.c
@@ -55,7 +55,7 @@ static void r_symbol(unsigned mode, struct position *pos, struct symbol *sym)
 		goto err;
 
 	case 'f':
-		if (sym->ctype.base_type->type != SYM_FN)
+		if (sym->type != SYM_BAD && sym->ctype.base_type->type != SYM_FN)
 			goto err;
 	case 'v':
 		if (sym->type == SYM_NODE || sym->type == SYM_BAD)
-- 
2.5.0



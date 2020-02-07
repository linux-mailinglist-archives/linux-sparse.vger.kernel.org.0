Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF161555B5
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 11:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgBGKcS (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 05:32:18 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57811 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726890AbgBGKcS (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 05:32:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581071537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=tPfTqIsa+DssJsc4VmF+Fm4b9yBh1abit8rX0Kug8Go=;
        b=bg/ZtB5+qSHOMtBEXjALNRaZUH3rcNg0OcepxOtNyi2Ka5p/1uw6dr44l79bMYwOjitghw
        +UaM4XZd7nJg3RcQx4KlIbNftdiaVYDeuYYCzww8isiitpoTTL3J0lnVmmFnigZpUkTOjf
        lVnTCzgiZVdAM2YzmzRojV9qUvVl52A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-yJbWM_z6PhWGq5FqOWRo5Q-1; Fri, 07 Feb 2020 05:32:15 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7FD1800D5C;
        Fri,  7 Feb 2020 10:32:14 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 010BA8ECE3;
        Fri,  7 Feb 2020 10:32:13 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Fri,  7 Feb 2020 11:32:14 +0100 (CET)
Date:   Fri, 7 Feb 2020 11:32:13 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH] dissect: kill return_type
Message-ID: <20200207103213.GA17010@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: yJbWM_z6PhWGq5FqOWRo5Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Now that we have dissect_ctx do_statement(STMT_RETURN) can use
base_type(dissect_ctx->ctype.base_type) instead.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/dissect.c b/dissect.c
index b48cd85..85489a2 100644
--- a/dissect.c
+++ b/dissect.c
@@ -54,7 +54,6 @@ typedef unsigned usage_t;
 struct symbol *dissect_ctx;
 
 static struct reporter *reporter;
-static struct symbol *return_type;
 
 static void do_sym_list(struct symbol_list *list);
 
@@ -489,8 +488,10 @@ static struct symbol *do_statement(usage_t mode, struct statement *stmt)
 	break; case STMT_EXPRESSION:
 		ret = do_expression(mode, stmt->expression);
 
-	break; case STMT_RETURN:
-		do_expression(u_lval(return_type), stmt->expression);
+	break; case STMT_RETURN: {
+		struct symbol *type = dissect_ctx->ctype.base_type;
+		do_expression(u_lval(base_type(type)), stmt->expression);
+	}
 
 	break; case STMT_ASM:
 		do_expression(U_R_VAL, stmt->asm_string);
@@ -617,11 +618,9 @@ static inline struct symbol *do_symbol(struct symbol *sym)
 				show_ident(sym->ident));
 
 		dissect_ctx = sym;
-		return_type = base_type(type);
 		do_sym_list(type->arguments);
 		do_statement(U_VOID, stmt);
 		dissect_ctx = dctx;
-		return_type = NULL;
 	}
 
 	return type;
-- 
2.5.0



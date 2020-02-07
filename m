Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFCB1555B4
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 11:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726798AbgBGKcN (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 05:32:13 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38712 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726867AbgBGKcN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 05:32:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581071532;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=AZ9eMyxrjTc/EP0NSdTZDotR+mG2OTrf53wdMubozhY=;
        b=RZpaUYNOhs6jx8YeXB2GT58YA5OkNPuQmAtIFgo5DqR1hPGMqrg9oT1aeihUKxuHE2gf21
        5ZsEwzTS/ozg11ur6moj2eORL5KiAlu8TmaUayJtPRkKmdhyItU9pYp9E/DdmZG9GQwziX
        LxhgPvOvl1DsNJTBjLnCB7TR4j+dsM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-O2XkqfJhM-uauuDjMOinYQ-1; Fri, 07 Feb 2020 05:32:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21F018010F1;
        Fri,  7 Feb 2020 10:32:09 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 4AF08790FE;
        Fri,  7 Feb 2020 10:32:08 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Fri,  7 Feb 2020 11:32:08 +0100 (CET)
Date:   Fri, 7 Feb 2020 11:32:07 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH] dissect: change do_symbol(SYM_FN) to check base_type->stmt
 != NULL
Message-ID: <20200207103207.GA16991@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: O2XkqfJhM-uauuDjMOinYQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

examine_fn_arguments() silently degenerates function arguments into
pointers but dissect doesn't do evaluate_symbol_list(), that is why
do_sym_list(type->arguments) can report the bogus definitions.

Test case:

	void extf(int MUST_NOT_BE_REPORTED);
	typedef void (fptr_t)(int MUST_NOT_BE_REPORTED);

	void func1(fptr_t fptr) {}
	void func2(typeof(extf) fptr) {}
	void func3(void) { typeof(extf) fptr; };
	void func4(void (fptr)(int MUST_NOT_BE_REPORTED)) {}

without this patch:

	4:6                    def  func1                            void ( ... )
	4:12  func1            def  fptr                             void ( ... )
	2:23  fptr             def  MUST_NOT_BE_REPORTED             int
	5:6                    def  func2                            void ( ... )
	5:19  func2            ---  extf                             void ( ... )
	5:12  func2            def  fptr                             void ( ... )
	1:11  fptr             def  MUST_NOT_BE_REPORTED             int
	6:6                    def  func3                            void ( ... )
	6:27  func3            ---  extf                             void ( ... )
	6:33  func3            def  fptr                             void ( ... )
	1:11  fptr             def  MUST_NOT_BE_REPORTED             int
	7:6                    def  func4                            void ( ... )
	7:12  func4            def  fptr                             void ( ... )
	7:24  fptr             def  MUST_NOT_BE_REPORTED             int

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/dissect.c b/dissect.c
index 54e11d2..b48cd85 100644
--- a/dissect.c
+++ b/dissect.c
@@ -589,6 +589,7 @@ static inline struct symbol *do_symbol(struct symbol *sym)
 {
 	struct symbol *type = base_type(sym);
 	struct symbol *dctx = dissect_ctx;
+	struct statement *stmt;
 
 	reporter->r_symdef(sym);
 
@@ -603,12 +604,22 @@ static inline struct symbol *do_symbol(struct symbol *sym)
 		dissect_ctx = dctx;
 
 	break; case SYM_FN:
+		stmt = sym->ctype.modifiers & MOD_INLINE
+			? type->inline_stmt
+			: type->stmt;
+		if (!stmt)
+			break;
+
+		if (dctx)
+			sparse_error(dctx->pos,
+				"dissect_ctx change %.*s -> %s",
+				dctx->ident->len, dctx->ident->name,
+				show_ident(sym->ident));
+
 		dissect_ctx = sym;
 		return_type = base_type(type);
 		do_sym_list(type->arguments);
-		do_statement(U_VOID, sym->ctype.modifiers & MOD_INLINE
-					? type->inline_stmt
-					: type->stmt);
+		do_statement(U_VOID, stmt);
 		dissect_ctx = dctx;
 		return_type = NULL;
 	}
-- 
2.5.0



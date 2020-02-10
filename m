Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 289DA157F93
	for <lists+linux-sparse@lfdr.de>; Mon, 10 Feb 2020 17:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbgBJQU3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 10 Feb 2020 11:20:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56231 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727120AbgBJQU3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 10 Feb 2020 11:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581351628;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=g8PufvW42tEuGxVZWl8CGKo4qyL5sgLujJPwcrfuD2I=;
        b=HhkqS92r5ancweUPnyxbCcRX/LpViZbr1TZfR3FeIGUJ9UeWOB6B6Qiy88NCwDGQnuvQfN
        R+BvBjduLuNCQEaVLR+wsdgYG+BNr0MEvMiomFtEnus+RgX2K05Mj0dt7rodhtwRgjJ47F
        cIP3WZ8YdCc4z7lsArnrBysU2rz2lfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-9CQZgje0Pbepox8y1VP6uQ-1; Mon, 10 Feb 2020 11:20:19 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CCD4107ACC5;
        Mon, 10 Feb 2020 16:20:18 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 8827E82063;
        Mon, 10 Feb 2020 16:20:17 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Mon, 10 Feb 2020 17:20:19 +0100 (CET)
Date:   Mon, 10 Feb 2020 17:20:18 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 1/2] dissect: set sym->kind for reporter
Message-ID: <20200210162018.GA29634@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 9CQZgje0Pbepox8y1VP6uQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Change dissect to report ctags-like kind passed in sym->kind.
Currently only v,f,s and m kinds are possible.

SYM_UNION doesn't differ from SYM_STRUCT and has ->kind = 's'.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c      | 19 ++++++++++++++-----
 test-dissect.c | 34 ++++++++++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/dissect.c b/dissect.c
index 85489a2..20456b2 100644
--- a/dissect.c
+++ b/dissect.c
@@ -123,6 +123,7 @@ static inline struct symbol *no_member(struct ident *name)
 {
 	static struct symbol sym = {
 		.type = SYM_BAD,
+		.kind = 'm',
 	};
 
 	sym.ctype.base_type = &bad_ctype;
@@ -165,6 +166,7 @@ static inline struct symbol *expr_symbol(struct expression *expr)
 			sym = alloc_symbol(expr->pos, SYM_BAD);
 			bind_symbol(sym, expr->symbol_name, NS_SYMBOL);
 			sym->ctype.modifiers = MOD_EXTERN;
+			sym->kind = 'v';
 		}
 	}
 
@@ -206,20 +208,20 @@ static bool deanon(struct symbol *base, struct ident *node, struct symbol *paren
 
 static void report_memdef(struct symbol *sym, struct symbol *mem)
 {
+	mem->kind = 'm';
 	if (sym && mem->ident)
 		reporter->r_memdef(sym, mem);
 }
 
 static void examine_sym_node(struct symbol *node, struct symbol *parent)
 {
+	struct ident *name = node->ident;
 	struct symbol *base, *dctx;
-	struct ident *name;
 
 	if (node->examined)
 		return;
-
 	node->examined = 1;
-	name = node->ident;
+	node->kind = 'v';
 
 	while ((base = node->ctype.base_type) != NULL)
 		switch (base->type) {
@@ -230,16 +232,23 @@ static void examine_sym_node(struct symbol *node, struct symbol *parent)
 
 		case SYM_ARRAY:
 			do_expression(U_R_VAL, base->array_size);
-		case SYM_PTR: case SYM_FN:
+		case SYM_PTR:
+			node = base;
+			break;
+
+		case SYM_FN:
+			node->kind = 'f';
 			node = base;
 			break;
 
 		case SYM_STRUCT: case SYM_UNION: //case SYM_ENUM:
 			if (base->evaluated)
 				return;
+			base->evaluated = 1;
+			base->kind = 's';
+
 			if (!base->symbol_list)
 				return;
-			base->evaluated = 1;
 
 			dctx = dissect_ctx;
 			dissect_ctx = NULL;
diff --git a/test-dissect.c b/test-dissect.c
index d93a2a0..81cc89d 100644
--- a/test-dissect.c
+++ b/test-dissect.c
@@ -32,7 +32,7 @@ static void print_usage(struct position *pos, struct symbol *sym, unsigned mode)
 	if (dissect_ctx)
 		ctx = dissect_ctx->ident;
 
-	printf("%4d:%-3d %-16.*s %-5.3s",
+	printf("%4d:%-3d %-16.*s %s ",
 		pos->line, pos->pos, ctx->len, ctx->name, show_mode(mode));
 
 }
@@ -44,9 +44,30 @@ static void r_symbol(unsigned mode, struct position *pos, struct symbol *sym)
 	if (!sym->ident)
 		sym->ident = built_in_ident("__asm__");
 
-	printf("%-32.*s %s\n",
-		sym->ident->len, sym->ident->name,
+	printf("%c %-32.*s %s\n",
+		sym->kind, sym->ident->len, sym->ident->name,
 		show_typename(sym->ctype.base_type));
+
+	switch (sym->kind) {
+	case 's':
+		if (sym->type == SYM_STRUCT || sym->type == SYM_UNION)
+			break;
+		goto err;
+
+	case 'f':
+		if (sym->ctype.base_type->type != SYM_FN)
+			goto err;
+	case 'v':
+		if (sym->type == SYM_NODE || sym->type == SYM_BAD)
+			break;
+		goto err;
+	default:
+		goto err;
+	}
+
+	return;
+err:
+	warning(*pos, "r_symbol bad sym type=%d kind=%d", sym->type, sym->kind);
 }
 
 static void r_member(unsigned mode, struct position *pos, struct symbol *sym, struct symbol *mem)
@@ -59,10 +80,15 @@ static void r_member(unsigned mode, struct position *pos, struct symbol *sym, st
 	/* mem == NULL means entire struct accessed */
 	mi = mem ? mem->ident : built_in_ident("*");
 
-	printf("%.*s.%-*.*s %s\n",
+	printf("m %.*s.%-*.*s %s\n",
 		si->len, si->name,
 		32-1 - si->len, mi->len, mi->name,
 		show_typename(mem ? mem->ctype.base_type : sym));
+
+	if (sym->ident && sym->kind != 's')
+		warning(*pos, "r_member bad sym type=%d kind=%d", sym->type, sym->kind);
+	if (mem && mem->kind != 'm')
+		warning(*pos, "r_member bad mem->kind = %d", mem->kind);
 }
 
 static void r_symdef(struct symbol *sym)
-- 
2.5.0



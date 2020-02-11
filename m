Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDBF159425
	for <lists+linux-sparse@lfdr.de>; Tue, 11 Feb 2020 17:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729216AbgBKQBl (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 11 Feb 2020 11:01:41 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58940 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728389AbgBKQBl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 11 Feb 2020 11:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581436900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=3/2bjNRF3KEzijOinhlCi9fz2GsPse2SRNL6TFNtIGg=;
        b=AwjA7dXq62dnhYHSZdSGlL+aHXqmldeBXTwWeP+q+0UAvs3F5QW59T921ZKG/dDPs8wa7n
        mq48ajcattcEbCO0TQm2fydBEdphu1Mtr+Qt39T0Yxcfdef5cvbMd+bYjWQe1sphA/eLVm
        f9eHmYOxfAk5TcfqOVP2KZIihN3Ita8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-v0c7sS20N-OM4w8me9HHSQ-1; Tue, 11 Feb 2020 11:01:38 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6E898017CC;
        Tue, 11 Feb 2020 16:01:37 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id DB9555C1B2;
        Tue, 11 Feb 2020 16:01:36 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue, 11 Feb 2020 17:01:37 +0100 (CET)
Date:   Tue, 11 Feb 2020 17:01:36 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH] dissect: introduce sym_is_local() for reporter
Message-ID: <20200211160136.GA14027@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: v0c7sS20N-OM4w8me9HHSQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Can be used to filter out the usage of local variables.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c      |  2 +-
 dissect.h      |  5 +++++
 test-dissect.c | 18 ++++++++++++++----
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/dissect.c b/dissect.c
index d9ca142..823a348 100644
--- a/dissect.c
+++ b/dissect.c
@@ -165,7 +165,7 @@ static inline struct symbol *expr_symbol(struct expression *expr)
 		if (!sym) {
 			sym = alloc_symbol(expr->pos, SYM_BAD);
 			bind_symbol(sym, expr->symbol_name, NS_SYMBOL);
-			sym->ctype.modifiers = MOD_EXTERN;
+			sym->ctype.modifiers = MOD_EXTERN | MOD_TOPLEVEL;
 			sym->kind = expr->op ?: 'v'; /* see EXPR_CALL */
 		}
 	}
diff --git a/dissect.h b/dissect.h
index efe2c0b..178dba5 100644
--- a/dissect.h
+++ b/dissect.h
@@ -27,6 +27,11 @@ struct reporter
 
 extern struct symbol *dissect_ctx;
 
+static inline bool sym_is_local(struct symbol *sym)
+{
+	return sym->kind == 'v' && !(sym->ctype.modifiers & MOD_TOPLEVEL);
+}
+
 extern void dissect(struct symbol_list *, struct reporter *);
 
 #endif
diff --git a/test-dissect.c b/test-dissect.c
index ece2253..c4b454c 100644
--- a/test-dissect.c
+++ b/test-dissect.c
@@ -37,6 +37,16 @@ static void print_usage(struct position *pos, struct symbol *sym, unsigned mode)
 
 }
 
+static char symscope(struct symbol *sym)
+{
+	if (sym_is_local(sym)) {
+		if (!dissect_ctx)
+			warning(sym->pos, "no context");
+		return '.';
+	}
+	return ' ';
+}
+
 static void r_symbol(unsigned mode, struct position *pos, struct symbol *sym)
 {
 	print_usage(pos, sym, mode);
@@ -44,8 +54,8 @@ static void r_symbol(unsigned mode, struct position *pos, struct symbol *sym)
 	if (!sym->ident)
 		sym->ident = built_in_ident("__asm__");
 
-	printf("%c %-32.*s %s\n",
-		sym->kind, sym->ident->len, sym->ident->name,
+	printf("%c %c %-32.*s %s\n",
+		symscope(sym), sym->kind, sym->ident->len, sym->ident->name,
 		show_typename(sym->ctype.base_type));
 
 	switch (sym->kind) {
@@ -80,8 +90,8 @@ static void r_member(unsigned mode, struct position *pos, struct symbol *sym, st
 	/* mem == NULL means entire struct accessed */
 	mi = mem ? mem->ident : built_in_ident("*");
 
-	printf("m %.*s.%-*.*s %s\n",
-		si->len, si->name,
+	printf("%c m %.*s.%-*.*s %s\n",
+		symscope(sym), si->len, si->name,
 		32-1 - si->len, mi->len, mi->name,
 		show_typename(mem ? mem->ctype.base_type : sym));
 
-- 
2.5.0



Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB0C164A5D
	for <lists+linux-sparse@lfdr.de>; Wed, 19 Feb 2020 17:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbgBSQ3m (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 19 Feb 2020 11:29:42 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:51519 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726659AbgBSQ3m (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 19 Feb 2020 11:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582129781;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PpyT2DTJTvWvpsDNnsPWt4Un3+hdJkvG1VhWVhVYVfI=;
        b=iKMTwdHaWRLsVFdSULiOPbPNbOepvio7hxAMo+6huNIzbr2HzpO++yxF5cs0dbB9Ht4szJ
        h4c2b4FwrWAVoeNAiyHPNwKHuyTTlG9xej23zOQzhaBfrcxDKjySQpi2cJzGndMKevOG5c
        j++3VS8d1t470s5cFKEUveKaSvqEfaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-mT0UJiIdPw6foSqlbwoVDw-1; Wed, 19 Feb 2020 11:29:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F8398017CC;
        Wed, 19 Feb 2020 16:29:36 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id B019E91820;
        Wed, 19 Feb 2020 16:29:35 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 19 Feb 2020 17:29:36 +0100 (CET)
Date:   Wed, 19 Feb 2020 17:29:34 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH v2 2/2] dissect: fix sym_is_local(SYM_STRUCT/UNION/ENUM)
Message-ID: <20200219162934.GA26799@redhat.com>
References: <20200219162911.GA26790@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200219162911.GA26790@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: mT0UJiIdPw6foSqlbwoVDw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Now that struct_union_enum_specifier() always sets sym->scope we can
simplify sym_is_local(sym) and rely on toplevel() even if sym is type.

Test-case:

	// copied from linux kernel
	# define __force	__attribute__((force))
	#define WRITE_ONCE(x, val) \
	({							\
		union { typeof(x) __val; char __c[1]; } __u =	\
			{ .__val = (__force typeof(x)) (val) }; \
		__write_once_size(&(x), __u.__c, sizeof(x));	\
		__u.__val;					\
	})

	void func(int *p)
	{
		WRITE_ONCE(*p, 0);
	}

before this patch the widely used WRITE_ONCE() generates a lot of spam which
can't be filtered out using sym_is_local(),

	11:6                    def   f func                             void ( ... )
	11:11  func             def . v p                                int *
	13:9                    def   s :__u
	13:9                    --- . v p                                int *
	13:9                    def   m :__u.__val                       int
	13:9                    def   m :__u.__c                         char [1]
	13:9   func             def . v __u                              union :__u
	13:9   func             -w- . v __u                              union :__u
	13:9   func             -w-   m :__u.__val                       int
	13:9   func             --- . v p                                int *
	13:9   func             --r   f __write_once_size                bad type
	13:9   func             -r- . v p                                int *
	13:9   func             -r- . v __u                              union :__u
	13:9   func             m--   m :__u.__c                         char [1]
	13:9   func             --- . v p                                int *
	13:9   func             --- . v __u                              union :__u
	13:9   func             ---   m :__u.__val                       int

plus it triggers warning("no context") in test-dissect.c. With this patch
the only "nonlocal" report is __write_once_size() call.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 4 ++--
 dissect.h | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/dissect.c b/dissect.c
index 40baf64..c48214b 100644
--- a/dissect.c
+++ b/dissect.c
@@ -152,7 +152,6 @@ static inline struct symbol *expr_symbol(struct expression *expr)
 		if (!sym) {
 			sym = alloc_symbol(expr->pos, SYM_BAD);
 			bind_symbol(sym, expr->symbol_name, NS_SYMBOL);
-			sym->ctype.modifiers = MOD_EXTERN | MOD_TOPLEVEL;
 			sym->kind = expr->op ?: 'v'; /* see EXPR_CALL */
 		}
 	}
@@ -238,7 +237,8 @@ static void examine_sym_node(struct symbol *node, struct symbol *parent)
 				return;
 
 			dctx = dissect_ctx;
-			dissect_ctx = NULL;
+			if (toplevel(base->scope))
+				dissect_ctx = NULL;
 
 			if (base->ident || deanon(base, name, parent))
 				reporter->r_symdef(base);
diff --git a/dissect.h b/dissect.h
index 326d3dc..a77a932 100644
--- a/dissect.h
+++ b/dissect.h
@@ -4,6 +4,7 @@
 #include <stdio.h>
 #include "parse.h"
 #include "expression.h"
+#include "scope.h"
 
 #define	U_SHIFT		8
 
@@ -29,7 +30,7 @@ extern struct symbol *dissect_ctx;
 
 static inline bool sym_is_local(struct symbol *sym)
 {
-	return sym->kind == 'v' && !(sym->ctype.modifiers & MOD_TOPLEVEL);
+	return !toplevel(sym->scope);
 }
 
 extern void dissect(struct reporter *, struct string_list *);
-- 
2.5.0



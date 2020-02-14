Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6BB315D693
	for <lists+linux-sparse@lfdr.de>; Fri, 14 Feb 2020 12:33:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgBNLdu (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 14 Feb 2020 06:33:50 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:58640 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726092AbgBNLdu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 14 Feb 2020 06:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581680029;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oW5GadZ6z2R0vNM0LXhT94DeiCJdQj2uegtiuyhTRVY=;
        b=XapYpN/qzxwpWjYTp02iIxhMkGZisZZh2m2ToQ9tb42psdhK2TLiQVSJPp5TvdxIskhldk
        So5o0nn4PCDiJ2F4Z5Rs0JAYr1EM8ciRM3yr+ZvyZhIhyA+TsDyYvDCWQg3Et6pRllDlOM
        st58h0bsf/8axAyYqbwUjxDp95npg9g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-66kAHOi2OT63qv9Zx8OZLA-1; Fri, 14 Feb 2020 06:33:45 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83EA41857346;
        Fri, 14 Feb 2020 11:33:44 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id AB3BC5DA85;
        Fri, 14 Feb 2020 11:33:43 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Fri, 14 Feb 2020 12:33:44 +0100 (CET)
Date:   Fri, 14 Feb 2020 12:33:43 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 2/3] dissect: fix sym_is_local(SYM_STRUCT/UNION/ENUM)
Message-ID: <20200214113343.GA31587@redhat.com>
References: <20200214113320.GA31578@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200214113320.GA31578@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 66kAHOi2OT63qv9Zx8OZLA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Now that struct_union_enum_specifier() sets MOD_TOPLEVEL we can
simplify sym_is_local(sym) and rely on it even if "sym" is type.

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
 dissect.c | 3 ++-
 dissect.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/dissect.c b/dissect.c
index 40baf64..1465760 100644
--- a/dissect.c
+++ b/dissect.c
@@ -238,7 +238,8 @@ static void examine_sym_node(struct symbol *node, struct symbol *parent)
 				return;
 
 			dctx = dissect_ctx;
-			dissect_ctx = NULL;
+			if (base->ctype.modifiers & MOD_TOPLEVEL)
+				dissect_ctx = NULL;
 
 			if (base->ident || deanon(base, name, parent))
 				reporter->r_symdef(base);
diff --git a/dissect.h b/dissect.h
index 326d3dc..38ac877 100644
--- a/dissect.h
+++ b/dissect.h
@@ -29,7 +29,7 @@ extern struct symbol *dissect_ctx;
 
 static inline bool sym_is_local(struct symbol *sym)
 {
-	return sym->kind == 'v' && !(sym->ctype.modifiers & MOD_TOPLEVEL);
+	return !(sym->ctype.modifiers & MOD_TOPLEVEL);
 }
 
 extern void dissect(struct reporter *, struct string_list *);
-- 
2.5.0



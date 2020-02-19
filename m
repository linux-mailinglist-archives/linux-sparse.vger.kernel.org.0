Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F008164A59
	for <lists+linux-sparse@lfdr.de>; Wed, 19 Feb 2020 17:29:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgBSQ3U (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 19 Feb 2020 11:29:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:55403 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726712AbgBSQ3T (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 19 Feb 2020 11:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582129758;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=UbYnb0jCR7A3oVHTpUkgp0QYW/lTzekLOnCOLG5+pss=;
        b=HGNNlUIONPi8mtiST09cowBV5lbD7ubLqhkqyHN4bTQ+wZ9C9oHlyBmFV11du/SxrWRSgy
        L5RHfX5DPS/VSk2/JvYycDVEDqj+Fqnzy7NvJoDO3/sowUvr/fHjCdXrFhdRtyZRDy++S5
        xt9NbRMTZsUaR4QoVYCNbK/EYJ4lh5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-8XdLNDccNLqRshXlRGFXhw-1; Wed, 19 Feb 2020 11:29:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9174F801E74;
        Wed, 19 Feb 2020 16:29:13 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id B74FE1001B00;
        Wed, 19 Feb 2020 16:29:12 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 19 Feb 2020 17:29:13 +0100 (CET)
Date:   Wed, 19 Feb 2020 17:29:11 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH v2 1/2] struct_union_enum_specifier: always initialize
 sym->scope
Message-ID: <20200219162911.GA26790@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 8XdLNDccNLqRshXlRGFXhw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently it is not possible to figure out the scope of the private
struct/union/enum type, its ->scope is NULL because bind_symbol() is
not called.

Change struct_union_enum_specifier() to set sym->scope = block_scope
in this case, this is what bind_symbol() does when type has a name.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 parse.c | 2 ++
 scope.c | 5 +++++
 scope.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/parse.c b/parse.c
index a08165a..3e7c60e 100644
--- a/parse.c
+++ b/parse.c
@@ -772,6 +772,8 @@ static struct token *struct_union_enum_specifier(enum type type,
 	}
 
 	sym = alloc_symbol(token->pos, type);
+	/* make toplevel(sym->scope) work */
+	set_current_scope(sym);
 	token = parse(token->next, sym);
 	ctx->ctype.base_type = sym;
 	token =  expect(token, '}', "at end of specifier");
diff --git a/scope.c b/scope.c
index cbf2fcf..420c0f5 100644
--- a/scope.c
+++ b/scope.c
@@ -40,6 +40,11 @@ struct scope	*block_scope = &builtin_scope,		// regular automatic variables etc
 		*file_scope = &builtin_scope,		// static
 		*global_scope = &builtin_scope;		// externally visible
 
+void set_current_scope(struct symbol *sym)
+{
+	sym->scope = block_scope;
+}
+
 void bind_scope(struct symbol *sym, struct scope *scope)
 {
 	sym->scope = scope;
diff --git a/scope.h b/scope.h
index d9a14aa..3cad514 100644
--- a/scope.h
+++ b/scope.h
@@ -53,6 +53,7 @@ extern void end_symbol_scope(void);
 extern void start_function_scope(void);
 extern void end_function_scope(void);
 
+extern void set_current_scope(struct symbol *);
 extern void bind_scope(struct symbol *, struct scope *);
 extern void rebind_scope(struct symbol *, struct scope *);
 
-- 
2.5.0



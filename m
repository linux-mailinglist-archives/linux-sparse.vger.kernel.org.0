Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8ABED151E85
	for <lists+linux-sparse@lfdr.de>; Tue,  4 Feb 2020 17:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgBDQvx (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 4 Feb 2020 11:51:53 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53535 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727310AbgBDQvx (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 4 Feb 2020 11:51:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580835111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=kngIGKyAjsTD5aT4u2g/6g/TqiaEXOZRxEBarK8ahJ8=;
        b=UwmUWigATzCbBKZ9b9ZiBopBOq0Y0LzaueIpTez3BU5hMI+xpBhVhNQRWZOtNTnvgFmWUW
        bYgDMPWVORwjKk7NArP3J06lWaLqw0qJcx2aPIByoab865X+3x5oqCYDznxBM5kD1wF6ON
        Y8bXIUqTl3byLrDXUqNQyCaq+mKLpyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-qBkqYb7AMo6BlEvrp4IpjQ-1; Tue, 04 Feb 2020 11:51:46 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7C0A8C3420;
        Tue,  4 Feb 2020 16:51:45 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id D02AC77927;
        Tue,  4 Feb 2020 16:51:44 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue,  4 Feb 2020 17:51:45 +0100 (CET)
Date:   Tue, 4 Feb 2020 17:51:44 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 4/4] dissect: disallow NULL pointers in struct reporter
Message-ID: <20200204165144.GA24349@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200204165119.GA24330@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: qBkqYb7AMo6BlEvrp4IpjQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This makes dissect.c a bit more readable.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/dissect.c b/dissect.c
index 57dcdb2..88eaab1 100644
--- a/dissect.c
+++ b/dissect.c
@@ -135,7 +135,7 @@ static struct symbol *report_member(usage_t mode, struct position *pos,
 {
 	struct symbol *ret = mem->ctype.base_type;
 
-	if (mem->ident && reporter->r_member)
+	if (mem->ident)
 		reporter->r_member(fix_mode(ret, mode), pos, type, mem);
 
 	return ret;
@@ -146,9 +146,6 @@ static void report_implicit(usage_t mode, struct position *pos, struct symbol *t
 	if (type->type != SYM_STRUCT && type->type != SYM_UNION)
 		return;
 
-	if (!reporter->r_member)
-		return;
-
 	if (type->ident != NULL)
 		reporter->r_member(mode, pos, type, NULL);
 
@@ -184,8 +181,7 @@ static struct symbol *report_symbol(usage_t mode, struct expression *expr)
 	if (0 && ret->type == SYM_ENUM)
 		return report_member(mode, &expr->pos, ret, expr->symbol);
 
-	if (reporter->r_symbol)
-		reporter->r_symbol(fix_mode(ret, mode), &expr->pos, sym);
+	reporter->r_symbol(fix_mode(ret, mode), &expr->pos, sym);
 
 	return ret;
 }
@@ -238,10 +234,8 @@ static void examine_sym_node(struct symbol *node, struct symbol *parent)
 				return;
 			base->evaluated = 1;
 
-			if (base->ident || deanon(base, name, parent)) {
-				if (reporter->r_symdef)
-					reporter->r_symdef(base);
-			}
+			if (base->ident || deanon(base, name, parent))
+				reporter->r_symdef(base);
 			DO_LIST(base->symbol_list, mem,
 				examine_sym_node(mem, base->ident ? base : parent));
 		default:
@@ -577,19 +571,15 @@ static struct symbol *do_initializer(struct symbol *type, struct expression *exp
 
 static inline struct symbol *do_symbol(struct symbol *sym)
 {
-	struct symbol *type;
-
-	type = base_type(sym);
+	struct symbol *type = base_type(sym);
 
-	if (reporter->r_symdef)
-		reporter->r_symdef(sym);
+	reporter->r_symdef(sym);
 
 	switch (type->type) {
 	default:
 		if (!sym->initializer)
 			break;
-		if (reporter->r_symbol)
-			reporter->r_symbol(U_W_VAL, &sym->pos, sym);
+		reporter->r_symbol(U_W_VAL, &sym->pos, sym);
 		do_initializer(type, sym->initializer);
 
 	break; case SYM_FN:
-- 
2.5.0


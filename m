Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99AB0151E86
	for <lists+linux-sparse@lfdr.de>; Tue,  4 Feb 2020 17:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgBDQwC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 4 Feb 2020 11:52:02 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58062 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgBDQwC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 4 Feb 2020 11:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580835121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=pX/0u06vvgVJyVIdhkgSDT6H2c37kis2VRu6CjvuzJs=;
        b=h2JUCFtiqSzJaFzdqnWMwKaSi5NTu2R0nC0cfBYdQEyTrcDfG0WfO4IWOYJ1jTyR+lVI01
        ezkikWRYptBMtTwFFZ7GWr5lBDPMAeXHfZHXzx9DSo2xacb7Egpn6BiXCd2YMfR/qZ68Qg
        j48F8+yhK0X4DN5+gH0A7QnmoCXBocc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-bVrH_DqqOqqOS9jsalUfwQ-1; Tue, 04 Feb 2020 11:51:43 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2062D190B2AA;
        Tue,  4 Feb 2020 16:51:42 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 4A57560BF3;
        Tue,  4 Feb 2020 16:51:41 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue,  4 Feb 2020 17:51:41 +0100 (CET)
Date:   Tue, 4 Feb 2020 17:51:40 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 2/4] dissect: turn mk_name() into deanon()
Message-ID: <20200204165140.GA24343@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200204165119.GA24330@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: bVrH_DqqOqqOS9jsalUfwQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Preparation. Change mk_name() to initialize base->ident itself, simplify it,
and rename to deanon().

Also change examine_sym_node() to accept "struct symbol *parent" rather than
"struct ident *root". Currently it is only used as ->ident holder, but this
will be changed.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/dissect.c b/dissect.c
index ff3a313..d34b38a 100644
--- a/dissect.c
+++ b/dissect.c
@@ -190,18 +190,22 @@ static struct symbol *report_symbol(usage_t mode, struct expression *expr)
 	return ret;
 }
 
-static inline struct ident *mk_name(struct ident *root, struct ident *node)
+static bool deanon(struct symbol *base, struct ident *node, struct symbol *parent)
 {
+	struct ident *pi = parent ? parent->ident : NULL;
 	char name[256];
 
+	if (!node)
+		return false;
+
 	snprintf(name, sizeof(name), "%.*s:%.*s",
-			root ? root->len : 0, root ? root->name : "",
-			node ? node->len : 0, node ? node->name : "");
+		pi ? pi->len : 0, pi ? pi->name : NULL, node->len, node->name);
 
-	return built_in_ident(name);
+	base->ident = built_in_ident(name);
+	return true;
 }
 
-static void examine_sym_node(struct symbol *node, struct ident *root)
+static void examine_sym_node(struct symbol *node, struct symbol *parent)
 {
 	struct symbol *base;
 	struct ident *name;
@@ -232,12 +236,12 @@ static void examine_sym_node(struct symbol *node, struct ident *root)
 				return;
 			base->evaluated = 1;
 
-			if (!base->ident && name)
-				base->ident = mk_name(root, name);
-			if (base->ident && reporter->r_symdef)
-				reporter->r_symdef(base);
+			if (base->ident || deanon(base, name, parent)) {
+				if (reporter->r_symdef)
+					reporter->r_symdef(base);
+			}
 			DO_LIST(base->symbol_list, mem,
-				examine_sym_node(mem, base->ident ?: root));
+				examine_sym_node(mem, base->ident ? base : parent));
 		default:
 			return;
 		}
-- 
2.5.0


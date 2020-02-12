Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C31C15A59D
	for <lists+linux-sparse@lfdr.de>; Wed, 12 Feb 2020 11:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728715AbgBLKEo (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 12 Feb 2020 05:04:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43655 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728754AbgBLKEo (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 12 Feb 2020 05:04:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581501883;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xBZck5bzZE4EUv0OCYzqNOJufvtjsvnT6Rw10BX45Og=;
        b=Q1YjN6Y+b6KO5xqWKITG3tvK+lP/oq3pM6fVH3jB+9Fb8nn7hRxE/2O+VlHQJkEVBFY/no
        jIFQ0R6mDjb0RwbrRmHN0Vj1d9GvS61/9RDX72XhNtz6QvDz6blcPsEuUiFvh53gkELSpA
        aq5RUIHIO8zQ6rihhYKXjTvRnX52SdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-g7tOuGpAMqyNU0LdBIPR_g-1; Wed, 12 Feb 2020 05:04:40 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 092278017DF;
        Wed, 12 Feb 2020 10:04:39 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 2F33A5DA7B;
        Wed, 12 Feb 2020 10:04:38 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 12 Feb 2020 11:04:38 +0100 (CET)
Date:   Wed, 12 Feb 2020 11:04:37 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 2/2] dissect: kill no_member()
Message-ID: <20200212100437.GA23419@redhat.com>
References: <20200212100414.GA23415@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200212100414.GA23415@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: g7tOuGpAMqyNU0LdBIPR_g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It is trivial and has a single caller, lookup_member().

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/dissect.c b/dissect.c
index 05bddc8..40baf64 100644
--- a/dissect.c
+++ b/dissect.c
@@ -119,19 +119,6 @@ static usage_t fix_mode(struct symbol *type, usage_t mode)
 	return mode;
 }
 
-static inline struct symbol *no_member(struct ident *name)
-{
-	static struct symbol sym = {
-		.type = SYM_BAD,
-		.ctype.base_type = &bad_ctype,
-		.kind = 'm',
-	};
-
-	sym.ident = name;
-
-	return &sym;
-}
-
 static struct symbol *report_member(usage_t mode, struct position *pos,
 					struct symbol *type, struct symbol *mem)
 {
@@ -308,8 +295,20 @@ found:
 
 static struct symbol *lookup_member(struct symbol *type, struct ident *name, int *addr)
 {
-	return __lookup_member(type, name, addr)
-		?: no_member(name);
+	struct symbol *mem = __lookup_member(type, name, addr);
+
+	if (!mem) {
+		static struct symbol bad_member = {
+			.type = SYM_BAD,
+			.ctype.base_type = &bad_ctype,
+			.kind = 'm',
+		};
+
+		mem = &bad_member;
+		mem->ident = name;
+	}
+
+	return mem;
 }
 
 static struct expression *peek_preop(struct expression *expr, int op)
-- 
2.5.0



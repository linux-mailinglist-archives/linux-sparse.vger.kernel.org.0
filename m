Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE7BE151E83
	for <lists+linux-sparse@lfdr.de>; Tue,  4 Feb 2020 17:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgBDQvq (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 4 Feb 2020 11:51:46 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27067 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727310AbgBDQvq (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 4 Feb 2020 11:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580835105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=NAB4ts7Ahaob6uDSRvzMSPRXPcbM4FmW9IGDGSdyoSA=;
        b=P0XSAo7w4cKyeAwC7bgoq/jhzdyi+BxKNajpQn3JpjcKOa/piwJqGM+V35rlghXdSWAhGj
        1yPM8uTXHZmDDQLaJytmXSEKAo7RfMD5L9R70ob8wfKgNPjq2sbvqXvOJ85IXhmcz8L/yJ
        FYwUPl2pM0paz+KIBEG31AvIMjtZnNU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-1-679skLPeKMoaDiqHxZwQ-1; Tue, 04 Feb 2020 11:51:41 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58009190B2A1;
        Tue,  4 Feb 2020 16:51:40 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 81F9A19C69;
        Tue,  4 Feb 2020 16:51:39 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue,  4 Feb 2020 17:51:40 +0100 (CET)
Date:   Tue, 4 Feb 2020 17:51:38 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 1/4] dissect: don't report anonymous members in initializers
Message-ID: <20200204165138.GA24340@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200204165119.GA24330@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 1-679skLPeKMoaDiqHxZwQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Change report_member() to not call ->r_member(mem) if !mem->ident.
This can only happen in initializer, the output gives no useful info
but looks like a bug. Test-case:

	struct {
		union {
			int x;
		};
	} var = {
		{}
	};

before this patch:

	1:8   s def  :var
	5:3   g def  var                              struct :var
	5:3   g -w-  var                              struct :var
	6:9   s -w-  :var.?                           union <noident>

after:

	1:8   s def  :var
	5:3   g def  var                              struct :var
	5:3   g -w-  var                              struct :var

We also need to change no_member() to ensure we still report the bad
initializers, this will be cleanuped later.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c      | 4 ++--
 test-dissect.c | 7 +++----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/dissect.c b/dissect.c
index 14d57bf..ff3a313 100644
--- a/dissect.c
+++ b/dissect.c
@@ -125,7 +125,7 @@ static inline struct symbol *no_member(struct ident *name)
 	};
 
 	sym.ctype.base_type = &bad_ctype;
-	sym.ident = name;
+	sym.ident = name ?: built_in_ident("?");
 
 	return &sym;
 }
@@ -135,7 +135,7 @@ static struct symbol *report_member(usage_t mode, struct position *pos,
 {
 	struct symbol *ret = mem->ctype.base_type;
 
-	if (reporter->r_member)
+	if (mem->ident && reporter->r_member)
 		reporter->r_member(fix_mode(ret, mode), pos, type, mem);
 
 	return ret;
diff --git a/test-dissect.c b/test-dissect.c
index 266148b..af1212a 100644
--- a/test-dissect.c
+++ b/test-dissect.c
@@ -56,14 +56,13 @@ static void r_symbol(unsigned mode, struct position *pos, struct symbol *sym)
 
 static void r_member(unsigned mode, struct position *pos, struct symbol *sym, struct symbol *mem)
 {
-	struct ident *ni, *si, *mi;
+	struct ident *si, *mi;
 
 	print_usage(pos, sym, mode);
 
-	ni = built_in_ident("?");
-	si = sym->ident ?: ni;
+	si = sym->ident ?: built_in_ident("?");
 	/* mem == NULL means entire struct accessed */
-	mi = mem ? (mem->ident ?: ni) : built_in_ident("*");
+	mi = mem ? mem->ident : built_in_ident("*");
 
 	printf("%.*s.%-*.*s %s\n",
 		si->len, si->name,
-- 
2.5.0


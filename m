Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF4CF1595E5
	for <lists+linux-sparse@lfdr.de>; Tue, 11 Feb 2020 18:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbgBKREX (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 11 Feb 2020 12:04:23 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57146 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728369AbgBKREW (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 11 Feb 2020 12:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581440661;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=8qv/v+cG9IgjD1iUFD/UHyVg0RB2nfCTyHb2F2OFppk=;
        b=OtREucHMU15ohW/hMrbyX8eujZEgGtRHXaHvUcBjtmJczIfuDoWVEkCDWzdTysKvTU3f8f
        H7a+y2k15C7dnPZcX8tTmEytE6PX7MN3Ws3KdpOb0NksZ3q1C+mJqJyRzQD+jbhFyuezlo
        wA8SwaJFzZSiL1YkAvpeE37z0PErvrg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-ohgZq62cP-Sx1xVuv35R0g-1; Tue, 11 Feb 2020 12:04:18 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2535210054E3;
        Tue, 11 Feb 2020 17:04:17 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 4A5B65C100;
        Tue, 11 Feb 2020 17:04:16 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue, 11 Feb 2020 18:04:16 +0100 (CET)
Date:   Tue, 11 Feb 2020 18:04:15 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH] dissect: move __sparse() callsite from test-dissect.c to
 dissect.c
Message-ID: <20200211170415.GA18497@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: ohgZq62cP-Sx1xVuv35R0g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is more flexible. For example, we can change dissect() to inspect
file_scope->symbols too without changing its callers.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c      |  5 +++--
 dissect.h      |  2 +-
 test-dissect.c | 11 ++---------
 3 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/dissect.c b/dissect.c
index 823a348..499e0a0 100644
--- a/dissect.c
+++ b/dissect.c
@@ -642,8 +642,9 @@ static void do_sym_list(struct symbol_list *list)
 	DO_LIST(list, sym, do_symbol(sym));
 }
 
-void dissect(struct symbol_list *list, struct reporter *rep)
+void dissect(struct reporter *rep, struct string_list *filelist)
 {
 	reporter = rep;
-	do_sym_list(list);
+
+	DO_LIST(filelist, file, do_sym_list(__sparse(file)));
 }
diff --git a/dissect.h b/dissect.h
index 178dba5..326d3dc 100644
--- a/dissect.h
+++ b/dissect.h
@@ -32,6 +32,6 @@ static inline bool sym_is_local(struct symbol *sym)
 	return sym->kind == 'v' && !(sym->ctype.modifiers & MOD_TOPLEVEL);
 }
 
-extern void dissect(struct symbol_list *, struct reporter *);
+extern void dissect(struct reporter *, struct string_list *);
 
 #endif
diff --git a/test-dissect.c b/test-dissect.c
index c4b454c..4b2d3be 100644
--- a/test-dissect.c
+++ b/test-dissect.c
@@ -1,7 +1,5 @@
 #include "dissect.h"
 
-static unsigned dotc_stream;
-
 static inline const char *show_mode(unsigned mode)
 {
 	static char str[3];
@@ -119,15 +117,10 @@ int main(int argc, char **argv)
 		.r_symbol = r_symbol,
 		.r_member = r_member,
 	};
-	struct string_list *filelist = NULL;
-	char *file;
 
+	struct string_list *filelist = NULL;
 	sparse_initialize(argc, argv, &filelist);
-
-	FOR_EACH_PTR(filelist, file) {
-		dotc_stream = input_stream_nr;
-		dissect(__sparse(file), &reporter);
-	} END_FOR_EACH_PTR(file);
+	dissect(&reporter, filelist);
 
 	return 0;
 }
-- 
2.5.0



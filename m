Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABE1415312E
	for <lists+linux-sparse@lfdr.de>; Wed,  5 Feb 2020 13:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgBEMx0 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 5 Feb 2020 07:53:26 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50817 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726386AbgBEMxZ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 5 Feb 2020 07:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580907204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=C8mcnqmJN9mOwVRU5tiNbFW9QHXqlSjzOJ0eykH2FiQ=;
        b=KitosuMTtIbMtdc94g0duZntoiymhP/3GfjHAQxQp1BmiNfRC6LonqfVf/7LawmF2QNnQE
        E54ki0Uf62ZMjMmIElAapteh6MfWP7DO1ofGi8R5o9r6S3sQ6al0yGNBUHaqBkYvdZBPUR
        190Jw37UrKn6QpTeDzfMeU8sXFITGyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-lvhdQFwSN2eHlYLI6bXPug-1; Wed, 05 Feb 2020 07:53:20 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBAE2800D5C;
        Wed,  5 Feb 2020 12:53:19 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 22E9E5DA7B;
        Wed,  5 Feb 2020 12:53:18 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed,  5 Feb 2020 13:53:19 +0100 (CET)
Date:   Wed, 5 Feb 2020 13:53:18 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH] dissect: introduce reporter->r_memdef()
Message-ID: <20200205125318.GA14560@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: lvhdQFwSN2eHlYLI6bXPug-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

To report where is the member of struct/union defined.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c      | 12 +++++++++++-
 dissect.h      |  1 +
 test-dissect.c |  6 ++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/dissect.c b/dissect.c
index 88eaab1..60fccbd 100644
--- a/dissect.c
+++ b/dissect.c
@@ -203,6 +203,12 @@ static bool deanon(struct symbol *base, struct ident *node, struct symbol *paren
 	return true;
 }
 
+static void report_memdef(struct symbol *sym, struct symbol *mem)
+{
+	if (sym && mem->ident)
+		reporter->r_memdef(sym, mem);
+}
+
 static void examine_sym_node(struct symbol *node, struct symbol *parent)
 {
 	struct symbol *base;
@@ -236,8 +242,12 @@ static void examine_sym_node(struct symbol *node, struct symbol *parent)
 
 			if (base->ident || deanon(base, name, parent))
 				reporter->r_symdef(base);
+
+			if (base->ident)
+				parent = base;
 			DO_LIST(base->symbol_list, mem,
-				examine_sym_node(mem, base->ident ? base : parent));
+				examine_sym_node(mem, parent);
+				report_memdef(parent, mem));
 		default:
 			return;
 		}
diff --git a/dissect.h b/dissect.h
index 664736c..1f5b1d9 100644
--- a/dissect.h
+++ b/dissect.h
@@ -19,6 +19,7 @@
 struct reporter
 {
 	void (*r_symdef)(struct symbol *);
+	void (*r_memdef)(struct symbol *, struct symbol *);
 
 	void (*r_symbol)(unsigned, struct position *, struct symbol *);
 	void (*r_member)(unsigned, struct position *, struct symbol *, struct symbol *);
diff --git a/test-dissect.c b/test-dissect.c
index af1212a..e725eec 100644
--- a/test-dissect.c
+++ b/test-dissect.c
@@ -75,10 +75,16 @@ static void r_symdef(struct symbol *sym)
 	r_symbol(-1, &sym->pos, sym);
 }
 
+static void r_memdef(struct symbol *sym, struct symbol *mem)
+{
+	r_member(-1, &mem->pos, sym, mem);
+}
+
 int main(int argc, char **argv)
 {
 	static struct reporter reporter = {
 		.r_symdef = r_symdef,
+		.r_memdef = r_memdef,
 		.r_symbol = r_symbol,
 		.r_member = r_member,
 	};
-- 
2.5.0



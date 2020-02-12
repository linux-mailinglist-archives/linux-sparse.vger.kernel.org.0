Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B2815A59C
	for <lists+linux-sparse@lfdr.de>; Wed, 12 Feb 2020 11:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728754AbgBLKET (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 12 Feb 2020 05:04:19 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48060 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728715AbgBLKET (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 12 Feb 2020 05:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581501858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=uumdaIEXYYGDMErABrdLCFvAGjD6hcPTtc1RJC0UW+c=;
        b=Pp7azpGi5qbrGIFZicW5W37nnaGmqIIQ61SaMfYd/i4YM3p1FKtJI2t+lhyfVNjcHWZ2DZ
        kW+BokDpZ6h8Z4OV9nWSvv23htKEI/JpzVRGrayp5Us8nmL6V5h9og2FoLBw3kUHKIQT3b
        Ls2/hpn6VVLfmCzqpwV1zTVwFvzSdew=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-XJGpl5i-OGCCRoLJUrFWVg-1; Wed, 12 Feb 2020 05:04:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E02611005512;
        Wed, 12 Feb 2020 10:04:15 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 0E17460BF1;
        Wed, 12 Feb 2020 10:04:14 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 12 Feb 2020 11:04:15 +0100 (CET)
Date:   Wed, 12 Feb 2020 11:04:14 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 1/2] dissect: don't set ->ident = '?' in no_member()
Message-ID: <20200212100414.GA23415@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: XJGpl5i-OGCCRoLJUrFWVg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

no_member() sets ->ident = built_in_ident("?") for the case when dissect()
can't figure out the name of initialized member. For example:

	struct EMPTY {} var = { 10 };

the output:

	1:25  var        -w-   m EMPTY.?           bad type

This is useful, but dissect should not dictate the policy. Let r_member()
decide how this case should be reported.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c      | 6 +++---
 test-dissect.c | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/dissect.c b/dissect.c
index 6706690..05bddc8 100644
--- a/dissect.c
+++ b/dissect.c
@@ -123,11 +123,11 @@ static inline struct symbol *no_member(struct ident *name)
 {
 	static struct symbol sym = {
 		.type = SYM_BAD,
+		.ctype.base_type = &bad_ctype,
 		.kind = 'm',
 	};
 
-	sym.ctype.base_type = &bad_ctype;
-	sym.ident = name ?: built_in_ident("?");
+	sym.ident = name;
 
 	return &sym;
 }
@@ -137,7 +137,7 @@ static struct symbol *report_member(usage_t mode, struct position *pos,
 {
 	struct symbol *ret = mem->ctype.base_type;
 
-	if (mem->ident)
+	if (mem->ident || mem->type == SYM_BAD)
 		reporter->r_member(fix_mode(ret, mode), pos, type, mem);
 
 	return ret;
diff --git a/test-dissect.c b/test-dissect.c
index 4b2d3be..58b3e63 100644
--- a/test-dissect.c
+++ b/test-dissect.c
@@ -80,13 +80,14 @@ err:
 
 static void r_member(unsigned mode, struct position *pos, struct symbol *sym, struct symbol *mem)
 {
-	struct ident *si, *mi;
+	struct ident *ni, *si, *mi;
 
 	print_usage(pos, sym, mode);
 
-	si = sym->ident ?: built_in_ident("?");
+	ni = built_in_ident("?");
+	si = sym->ident ?: ni;
 	/* mem == NULL means entire struct accessed */
-	mi = mem ? mem->ident : built_in_ident("*");
+	mi = mem ? (mem->ident ?: ni) : built_in_ident("*");
 
 	printf("%c m %.*s.%-*.*s %s\n",
 		symscope(sym), si->len, si->name,
-- 
2.5.0



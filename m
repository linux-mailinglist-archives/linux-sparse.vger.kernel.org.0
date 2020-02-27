Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 306A1172224
	for <lists+linux-sparse@lfdr.de>; Thu, 27 Feb 2020 16:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729210AbgB0PVX (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 27 Feb 2020 10:21:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51525 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729084AbgB0PVX (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 27 Feb 2020 10:21:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582816882;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=lPgPGshjE6vVYLiZBrTh29HdGWFNQYGx6hNLwJNeTR0=;
        b=CTzK84CJF9HDcJeoWavAPXV8OwIcrc7h2boIgSUMtvd0OUFnAOG8qqI5y4nTLCSZaRG4Ii
        O715i+G6nOQada5xLJCvwesgWUP5ppV8MeHS072tRstwgTmi8XvjWFSiOoj9NZpLzzZWpH
        NoURJAb/7bV8gTC8+RqwNFIvQrqL+PQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-HX5O7AZAPvG1WzJx7r1xXQ-1; Thu, 27 Feb 2020 10:21:18 -0500
X-MC-Unique: HX5O7AZAPvG1WzJx7r1xXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82A2813E6;
        Thu, 27 Feb 2020 15:21:17 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id AB61719C58;
        Thu, 27 Feb 2020 15:21:16 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 27 Feb 2020 16:21:17 +0100 (CET)
Date:   Thu, 27 Feb 2020 16:21:15 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH] dissect: enforce toplevel() if SYM_STRUCT was not defined
Message-ID: <20200227152115.GA19970@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A separate change for documentation purposes.

Test-case:

	void func(void)
	{
		struct UNDEFINED x;
		x.member = 0;
	}

output:

   1:6                    def   f func                             void ( ... )
   3:26  func             def . v x                                struct UNDEFINED
   4:9   func             -w- . v x                                struct UNDEFINED
   4:10  func             -w- . m UNDEFINED.member                 bad type

but in this case is_sym_local(UNDEFINED) = F makes more sense, most
probably this struct was defined somewhere else but __sparse() didn't
see its definition.

Change lookup_member() to set type->scope = file_scope if !symbol_list.
This is not 100% correct, but struct_union_enum_specifier() does the
same check with the following comment:

	// The following test is actually wrong for empty
	// structs, but (1) they are not C99, (2) gcc does
	// the same thing, and (3) it's easier.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/dissect.c b/dissect.c
index c48214b9..1970e46f 100644
--- a/dissect.c
+++ b/dissect.c
@@ -304,6 +304,9 @@ static struct symbol *lookup_member(struct symbol *type, struct ident *name, int
 			.kind = 'm',
 		};
 
+		if (!type->symbol_list)
+			type->scope = file_scope;
+
 		mem = &bad_member;
 		mem->ident = name;
 	}
-- 
2.25.1.362.g51ebf55



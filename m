Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E27EA15D692
	for <lists+linux-sparse@lfdr.de>; Fri, 14 Feb 2020 12:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgBNLd2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 14 Feb 2020 06:33:28 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40222 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726092AbgBNLd2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 14 Feb 2020 06:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581680006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=VfeeFqoHFUkoAwUNztmsMpxzQB3iCmaSxcliPtPCSB0=;
        b=dbYXorQVKVsCKKvvfe0samZUHMSIjaEKGBf4lOvVSpSfKWJkJKfqJ3eV6yD/mM6YH7XBSo
        05actrc3QRkyREvqLRX6htD+0+Tr20RQQEK/mqdHp0TY5Ifo2DbfPBf9o7zpiaWTZWypZQ
        SrqYkCpIVPYVmWKGuiok48FtaPt5tZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142--UoPhyy1O0W0KbjVT-Dr0g-1; Fri, 14 Feb 2020 06:33:22 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97A121005512;
        Fri, 14 Feb 2020 11:33:21 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id BB1B260BF4;
        Fri, 14 Feb 2020 11:33:20 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Fri, 14 Feb 2020 12:33:21 +0100 (CET)
Date:   Fri, 14 Feb 2020 12:33:20 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 1/3] struct_union_enum_specifier: set MOD_TOPLEVEL if
 toplevel(sym->scope)
Message-ID: <20200214113320.GA31578@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: -UoPhyy1O0W0KbjVT-Dr0g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

With this change dissect can know the scope of SYM_STRUCT/UNION/ENUM,
see the next patch.

Note that MOD_TOPLEVEL can be set even if struct/union/enum type is
private and bind_symbol() is not called.

IIUC nobody else looks at SYM_STRUCT->ctype.modifiers, "make check"
doesn't show any difference.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 parse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parse.c b/parse.c
index a08165a..4492586 100644
--- a/parse.c
+++ b/parse.c
@@ -741,6 +741,8 @@ static struct token *struct_union_enum_specifier(enum type type,
 			// symbol being redefined.
 			sym = alloc_symbol(token->pos, type);
 			bind_symbol(sym, token->ident, NS_STRUCT);
+			if (toplevel(sym->scope))
+				sym->ctype.modifiers |= MOD_TOPLEVEL;
 		}
 		if (sym->type != type)
 			error_die(token->pos, "invalid tag applied to %s", show_typename (sym));
@@ -772,6 +774,8 @@ static struct token *struct_union_enum_specifier(enum type type,
 	}
 
 	sym = alloc_symbol(token->pos, type);
+	if (toplevel(block_scope))
+		sym->ctype.modifiers |= MOD_TOPLEVEL;
 	token = parse(token->next, sym);
 	ctx->ctype.base_type = sym;
 	token =  expect(token, '}', "at end of specifier");
-- 
2.5.0



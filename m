Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE38915D695
	for <lists+linux-sparse@lfdr.de>; Fri, 14 Feb 2020 12:34:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbgBNLeN (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 14 Feb 2020 06:34:13 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22223 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726092AbgBNLeN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 14 Feb 2020 06:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1581680052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6B0Q0GbmbyD4HrkIpftkWxqb7t9P4EHQkrcrykgsq5M=;
        b=MAz0GH4BLo89kyA90f+BezV0teT3dDH6exkJMMuola+bbw7LERwyvyy7Sv1yakq5GwSwej
        m5tY+psLxH7r+y79kAmONX+/g/RGzvJxsEiMuskdEB6A1wdfxVy3B3x+m7C4gFUDN24Pa4
        vd0sRBBBisWdykmlzKyxehxtA3dxDD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-CDkEi6EDOBSF13DEqzpjhQ-1; Fri, 14 Feb 2020 06:34:10 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A3B110CE781;
        Fri, 14 Feb 2020 11:34:09 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 5E937790F3;
        Fri, 14 Feb 2020 11:34:08 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Fri, 14 Feb 2020 12:34:09 +0100 (CET)
Date:   Fri, 14 Feb 2020 12:34:07 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 3/3] dissect: enforce MOD_TOPLEVEL if SYM_STRUCT was not
 defined
Message-ID: <20200214113407.GB31587@redhat.com>
References: <20200214113320.GA31578@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200214113320.GA31578@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: CDkEi6EDOBSF13DEqzpjhQ-1
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

Change lookup_member() to set MOD_TOPLEVEL if !SYM_STRUCT symbol_list.
This is not 100% correct, but struct_union_enum_specifier() does the
same with the following comment:

	// The following test is actually wrong for empty
	// structs, but (1) they are not C99, (2) gcc does
	// the same thing, and (3) it's easier.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dissect.c b/dissect.c
index 1465760..f60999e 100644
--- a/dissect.c
+++ b/dissect.c
@@ -305,6 +305,8 @@ static struct symbol *lookup_member(struct symbol *type, struct ident *name, int
 			.kind = 'm',
 		};
 
+		if (!type->symbol_list)
+			type->ctype.modifiers |= MOD_TOPLEVEL;
 		mem = &bad_member;
 		mem->ident = name;
 	}
-- 
2.5.0



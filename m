Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A13DC151E84
	for <lists+linux-sparse@lfdr.de>; Tue,  4 Feb 2020 17:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727321AbgBDQvv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 4 Feb 2020 11:51:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60002 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727310AbgBDQvv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 4 Feb 2020 11:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580835110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to; bh=xJaXTaBpjvq2ACMl1OOOou58n8Mm758zSo27FmcAo4k=;
        b=gyGedD+8WehYqD8JZ48gvJOZU37H/TP38gHLHYIbLBoUnh4NCgvLSqHNdiEhWzbo71LsTe
        K9ZwHcEfWjgKsIBE7wYGP5zhli74dJaETfcl6pKbsG3KR756fV74DZqLRSzTLm+nh4K3hm
        SZLszLsYI4eYjGG4DRAh2YEMLv4Oz0s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-bIwg5LZ2O9SvCRnzmX-ikQ-1; Tue, 04 Feb 2020 11:51:45 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9C9E108BD0C;
        Tue,  4 Feb 2020 16:51:43 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id 1293860BF3;
        Tue,  4 Feb 2020 16:51:42 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Tue,  4 Feb 2020 17:51:43 +0100 (CET)
Date:   Tue, 4 Feb 2020 17:51:42 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH 3/4] dissect: change deanon() to handle the !node case
Message-ID: <20200204165142.GA24346@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200204165119.GA24330@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: bIwg5LZ2O9SvCRnzmX-ikQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Change deanon() to always initialize base->ident when parent != NULL
but still return false to avoid the pointless ->r_symdef().

Test-case:

	struct {
		union {
			int x;
		};
	} var = {
		{ .x = 0 },
	};

before this patch:

	1:8   s def  :var
	5:3   g def  var                              struct :var
	5:3   g -w-  var                              struct :var
	6:12  s -w-  ?.x                              int

after:

	1:8   s def  :var
	5:3   g def  var                              struct :var
	5:3   g -w-  var                              struct :var
	6:12  s -w-  :var.x                           int

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 dissect.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/dissect.c b/dissect.c
index d34b38a..57dcdb2 100644
--- a/dissect.c
+++ b/dissect.c
@@ -195,8 +195,10 @@ static bool deanon(struct symbol *base, struct ident *node, struct symbol *paren
 	struct ident *pi = parent ? parent->ident : NULL;
 	char name[256];
 
-	if (!node)
+	if (!node) {
+		base->ident = pi;
 		return false;
+	}
 
 	snprintf(name, sizeof(name), "%.*s:%.*s",
 		pi ? pi->len : 0, pi ? pi->name : NULL, node->len, node->name);
-- 
2.5.0


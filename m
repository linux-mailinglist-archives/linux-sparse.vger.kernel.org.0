Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7E3713EB3F
	for <lists+linux-sparse@lfdr.de>; Thu, 16 Jan 2020 18:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394343AbgAPRsv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 16 Jan 2020 12:48:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34931 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2394372AbgAPRsu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 16 Jan 2020 12:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579196929;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Q/9dDHwRWNQXoX58uAcweA8Z/0wxyOZ+fRZtSsKmpX0=;
        b=XvWMEfbIXNZEWJZvPOo3xPTAfQEIGRHLrXO55RsnaGjohPSt5zqgkFLFmaskQe9AEm2DDv
        AlyaygLtqmOmdctaQNXFhbOrJo9UX5dY+GlirhnyKAd4oQ2b83ntS3/6KykUXFVC/w33EC
        FsTaG1NYLoPDWl7T1N6UTsxss9C+bnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-gzBSZOZwMEKW6n9RFhEhkw-1; Thu, 16 Jan 2020 12:48:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63DDD800D41;
        Thu, 16 Jan 2020 17:48:44 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (ovpn-204-21.brq.redhat.com [10.40.204.21])
        by smtp.corp.redhat.com (Postfix) with SMTP id 8CB375C1D8;
        Thu, 16 Jan 2020 17:48:40 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 16 Jan 2020 18:48:43 +0100 (CET)
Date:   Thu, 16 Jan 2020 18:48:38 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH] show_parse: avoid null pointer dereference in do_show_type()
Message-ID: <20200116174838.GA32100@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: gzBSZOZwMEKW6n9RFhEhkw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

do_show_type() checks sym->type inside the "if (!sym || ...)" block.

While at it, remove the trailing whitespaces.

Fixes: 0fe7ebb9 ("show-parse: do not display base type's redundant specifie=
rs")
Reported-by: Alexey Gladkov <gladkov.alexey@gmail.com>
Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 show-parse.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/show-parse.c b/show-parse.c
index f0ea9ca..044465e 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -300,12 +300,12 @@ deeper:
 =09=09if (as)
 =09=09=09prepend(name, "%s ", show_as(as));
=20
-=09=09if (sym->type =3D=3D SYM_BASETYPE || sym->type =3D=3D SYM_ENUM)
+=09=09if (sym && (sym->type =3D=3D SYM_BASETYPE || sym->type =3D=3D SYM_EN=
UM))
 =09=09=09mod &=3D ~MOD_SPECIFIER;
 =09=09s =3D modifier_string(mod);
 =09=09len =3D strlen(s);
-=09=09name->start -=3D len;   =20
-=09=09memcpy(name->start, s, len); =20
+=09=09name->start -=3D len;
+=09=09memcpy(name->start, s, len);
 =09=09mod =3D 0;
 =09=09as =3D NULL;
 =09}
--=20
2.5.0



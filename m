Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9668218175F
	for <lists+linux-sparse@lfdr.de>; Wed, 11 Mar 2020 13:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbgCKMEf (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 11 Mar 2020 08:04:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41411 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729084AbgCKMEf (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 11 Mar 2020 08:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583928274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=O9ejuxcA6xTjsOiacsCoZG2JVuVBFY6ZxkITJQt7tOQ=;
        b=fEbPHXVoLh79Ca8Yqa8xsnofaY3cUjd6DpIEovOjxTG5aS6FgqsSvKaXM5X0D5aKbGLV3E
        mpb+sT/QCdIc/GPAWDPmCvxUMABknT2QIQbVRZ/eoKhEEFEdvjCJt/vT+kmLrWHZk9oCcU
        ++fuXm5bs0lYRxzl3C/eInNPzY4CEVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-4HrhUPr7OuiS3RMYYyVfBA-1; Wed, 11 Mar 2020 08:04:30 -0400
X-MC-Unique: 4HrhUPr7OuiS3RMYYyVfBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E1F189D6C2;
        Wed, 11 Mar 2020 12:04:29 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id C5E188F370;
        Wed, 11 Mar 2020 12:04:28 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Wed, 11 Mar 2020 13:04:29 +0100 (CET)
Date:   Wed, 11 Mar 2020 13:04:27 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Add symantic index utility
Message-ID: <20200311120427.GB19327@redhat.com>
References: <20200309152509.6707-1-gladkov.alexey@gmail.com>
 <20200309223701.dbnej7esb4qp56bm@ltop.local>
 <20200310150713.GB19012@redhat.com>
 <20200310171202.y5rhsydmmbewoarm@ltop.local>
MIME-Version: 1.0
In-Reply-To: <20200310171202.y5rhsydmmbewoarm@ltop.local>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 03/10, Luc Van Oostenryck wrote:
>
> Anyway, only a warning should be issued (I'll send a patch for this).
> I also wouldn't mind to add a new warning flag to suppress it,
> something like -Wno-directive-within-macro.

OK, agreed. something like below?

Oleg.

diff --git a/lib.c b/lib.c
index f15e4d99..264a890e 100644
--- a/lib.c
+++ b/lib.c
@@ -264,6 +264,7 @@ int Wdecl = 1;
 int Wdeclarationafterstatement = -1;
 int Wdefault_bitfield_sign = 0;
 int Wdesignated_init = 1;
+int Wdirective_within_macro = 1;
 int Wdo_while = 0;
 int Wimplicit_int = 1;
 int Winit_cstring = 0;
@@ -740,6 +741,7 @@ static const struct flag warnings[] = {
 	{ "declaration-after-statement", &Wdeclarationafterstatement },
 	{ "default-bitfield-sign", &Wdefault_bitfield_sign },
 	{ "designated-init", &Wdesignated_init },
+	{ "directive-within-macro", &Wdirective_within_macro },
 	{ "do-while", &Wdo_while },
 	{ "enum-mismatch", &Wenum_mismatch },
 	{ "external-function-has-definition", &Wexternal_function_has_definition },
diff --git a/lib.h b/lib.h
index 72651cef..49db0117 100644
--- a/lib.h
+++ b/lib.h
@@ -153,6 +153,7 @@ extern int Wdecl;
 extern int Wdeclarationafterstatement;
 extern int Wdefault_bitfield_sign;
 extern int Wdesignated_init;
+extern int Wdirective_within_macro;
 extern int Wdo_while;
 extern int Wenum_mismatch;
 extern int Wexternal_function_has_definition;
diff --git a/pre-process.c b/pre-process.c
index 433d1bf8..e79a447a 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -271,8 +271,9 @@ static struct token *collect_arg(struct token *prev, int vararg, struct position
 	while (!eof_token(next = scan_next(p))) {
 		if (next->pos.newline && match_op(next, '#')) {
 			if (!next->pos.noexpand) {
-				sparse_error(next->pos,
-					     "directive in macro's argument list");
+				if (Wdirective_within_macro)
+					warning(next->pos,
+						"directive in macro's argument list");
 				preprocessor_line(stream, p);
 				__free_token(next);	/* Free the '#' token */
 				continue;


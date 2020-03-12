Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D540818341F
	for <lists+linux-sparse@lfdr.de>; Thu, 12 Mar 2020 16:09:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgCLPJR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 12 Mar 2020 11:09:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:41792 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727459AbgCLPJR (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 12 Mar 2020 11:09:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584025755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=dMdtYWxS1sK1A0bAC2M3+3UDlwEsd0DEnOeZo3b9jn8=;
        b=FS3Z4QOPPdBGJY4FSyQP85v139sJPBgfnIYa4TXW+DxomS2PFvrgw2uKSLi2l0biFGAqbL
        drbBPF2Lz2Ey+/gaEtk1jXcbw0uO0u36Oqa9kSyrFdJo1AXkyArcM1LBixLWbu4xhqC49X
        0j6bitqWu+KfVwLAxIKHxKD75+tg8XQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-0tZ3OPAiMy-rOA68cHlR1A-1; Thu, 12 Mar 2020 11:09:13 -0400
X-MC-Unique: 0tZ3OPAiMy-rOA68cHlR1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB0ED800D54;
        Thu, 12 Mar 2020 15:09:12 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.43.17.70])
        by smtp.corp.redhat.com (Postfix) with SMTP id AE8D119C6A;
        Thu, 12 Mar 2020 15:09:10 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
        oleg@redhat.com; Thu, 12 Mar 2020 16:09:12 +0100 (CET)
Date:   Thu, 12 Mar 2020 16:09:09 +0100
From:   Oleg Nesterov <oleg@redhat.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-sparse@vger.kernel.org
Subject: [PATCH] introduce Wdirective_within_macro
Message-ID: <20200312150909.GA3403@redhat.com>
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

When used on linux kernel, sparse issues a lot of "directive in macro's
argument list" errors, "#if" within a macro invocation is widely used in
the kernel code.

Downgrade this sparse_error() to warning() and add the new
-Wdirective-within-macro knob.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 cgcc                                     | 2 +-
 lib.c                                    | 2 ++
 lib.h                                    | 1 +
 pre-process.c                            | 5 +++--
 validation/preprocessor/preprocessor22.c | 8 ++++----
 5 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/cgcc b/cgcc
index 9c6ad883..9f5897e9 100755
--- a/cgcc
+++ b/cgcc
@@ -127,7 +127,7 @@ exit 0;
 
 sub check_only_option {
     my ($arg) = @_;
-    return 1 if $arg =~ /^-W(no-?)?(address-space|bitwise|cast-to-as|cast-truncate|constant-suffix|context|decl|default-bitfield-sign|designated-init|do-while|enum-mismatch|external-function-has-definition|init-cstring|memcpy-max-count|non-pointer-null|old-initializer|one-bit-signed-bitfield|override-init-all|paren-string|ptr-subtraction-blows|return-void|sizeof-bool|sparse-all|sparse-error|transparent-union|typesign|undef|unknown-attribute)$/;
+    return 1 if $arg =~ /^-W(no-?)?(address-space|bitwise|cast-to-as|cast-truncate|constant-suffix|context|decl|default-bitfield-sign|designated-init|directive-within-macro|do-while|enum-mismatch|external-function-has-definition|init-cstring|memcpy-max-count|non-pointer-null|old-initializer|one-bit-signed-bitfield|override-init-all|paren-string|ptr-subtraction-blows|return-void|sizeof-bool|sparse-all|sparse-error|transparent-union|typesign|undef|unknown-attribute)$/;
     return 1 if $arg =~ /^-v(no-?)?(entry|dead)$/;
     return 1 if $arg =~ /^-f(dump-ir|memcpy-max-count|diagnostic-prefix)(=\S*)?$/;
     return 1 if $arg =~ /^-f(mem2reg|optim)(-enable|-disable|=last)?$/;
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
diff --git a/validation/preprocessor/preprocessor22.c b/validation/preprocessor/preprocessor22.c
index fb28daaa..277334c6 100644
--- a/validation/preprocessor/preprocessor22.c
+++ b/validation/preprocessor/preprocessor22.c
@@ -20,10 +20,10 @@ define_struct(a, {
  * check-command: sparse -E $file
  *
  * check-error-start
-preprocessor/preprocessor22.c:6:1: error: directive in macro's argument list
-preprocessor/preprocessor22.c:8:1: error: directive in macro's argument list
-preprocessor/preprocessor22.c:10:1: error: directive in macro's argument list
-preprocessor/preprocessor22.c:12:1: error: directive in macro's argument list
+preprocessor/preprocessor22.c:6:1: warning: directive in macro's argument list
+preprocessor/preprocessor22.c:8:1: warning: directive in macro's argument list
+preprocessor/preprocessor22.c:10:1: warning: directive in macro's argument list
+preprocessor/preprocessor22.c:12:1: warning: directive in macro's argument list
  * check-error-end
  *
  * check-output-start
-- 
2.25.1.362.g51ebf55



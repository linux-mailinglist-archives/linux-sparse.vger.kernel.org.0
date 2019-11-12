Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE3CF96D8
	for <lists+linux-sparse@lfdr.de>; Tue, 12 Nov 2019 18:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKLRPi (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 12 Nov 2019 12:15:38 -0500
Received: from movementarian.org ([178.79.150.28]:45148 "EHLO
        movementarian.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfKLRPi (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 12 Nov 2019 12:15:38 -0500
X-Greylist: delayed 3698 seconds by postgrey-1.27 at vger.kernel.org; Tue, 12 Nov 2019 12:15:38 EST
Received: from jlevon by movementarian.org with local (Exim 4.92.3)
        (envelope-from <jlevon@movementarian.org>)
        id 1iUYnn-0002KM-5m; Tue, 12 Nov 2019 16:13:59 +0000
From:   John Levon <john.levon@joyent.com>
To:     linux-sparse@vger.kernel.org
Cc:     John Levon <john.levon@joyent.com>
Subject: [PATCH] Add -Wexternal-function-has-definition
Date:   Tue, 12 Nov 2019 16:13:58 +0000
Message-Id: <1573575238-8915-1-git-send-email-john.levon@joyent.com>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Some older codebases hit this warning all the time, so it's useful
to be able to disable it.

Signed-off-by: John Levon <john.levon@joyent.com>
---
 cgcc     | 2 +-
 lib.c    | 2 ++
 lib.h    | 1 +
 parse.c  | 8 +++++---
 sparse.1 | 7 +++++++
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/cgcc b/cgcc
index 93bdc64..201fbc9 100755
--- a/cgcc
+++ b/cgcc
@@ -127,7 +127,7 @@ exit 0;
 
 sub check_only_option {
     my ($arg) = @_;
-    return 1 if $arg =~ /^-W(no-?)?(address-space|bitwise|cast-to-as|cast-truncate|constant-suffix|context|decl|default-bitfield-sign|designated-init|do-while|enum-mismatch|init-cstring|memcpy-max-count|non-pointer-null|old-initializer|one-bit-signed-bitfield|override-init-all|paren-string|ptr-subtraction-blows|return-void|sizeof-bool|sparse-all|sparse-error|transparent-union|typesign|undef|unknown-attribute)$/;
+    return 1 if $arg =~ /^-W(no-?)?(address-space|bitwise|cast-to-as|cast-truncate|constant-suffix|context|decl|default-bitfield-sign|designated-init|do-while|enum-mismatch|external-function-has-definition|init-cstring|memcpy-max-count|non-pointer-null|old-initializer|one-bit-signed-bitfield|override-init-all|paren-string|ptr-subtraction-blows|return-void|sizeof-bool|sparse-all|sparse-error|transparent-union|typesign|undef|unknown-attribute)$/;
     return 1 if $arg =~ /^-v(no-?)?(entry|dead)$/;
     return 1 if $arg =~ /^-f(dump-ir|memcpy-max-count|diagnostic-prefix)(=\S*)?$/;
     return 1 if $arg =~ /^-f(mem2reg|optim)(-enable|-disable|=last)?$/;
diff --git a/lib.c b/lib.c
index fd45da5..e6d8bf4 100644
--- a/lib.c
+++ b/lib.c
@@ -269,6 +269,7 @@ int Wimplicit_int = 1;
 int Winit_cstring = 0;
 int Wint_to_pointer_cast = 1;
 int Wenum_mismatch = 1;
+int Wexternal_function_has_definition = 1;
 int Wsparse_error = 0;
 int Wmemcpy_max_count = 1;
 int Wnon_pointer_null = 1;
@@ -696,6 +697,7 @@ static const struct flag warnings[] = {
 	{ "designated-init", &Wdesignated_init },
 	{ "do-while", &Wdo_while },
 	{ "enum-mismatch", &Wenum_mismatch },
+	{ "external-function-has-definition", &Wexternal_function_has_definition },
 	{ "implicit-int", &Wimplicit_int },
 	{ "init-cstring", &Winit_cstring },
 	{ "int-to-pointer-cast", &Wint_to_pointer_cast },
diff --git a/lib.h b/lib.h
index f6dea8c..00c6081 100644
--- a/lib.h
+++ b/lib.h
@@ -154,6 +154,7 @@ extern int Wdefault_bitfield_sign;
 extern int Wdesignated_init;
 extern int Wdo_while;
 extern int Wenum_mismatch;
+extern int Wexternal_function_has_definition;
 extern int Wsparse_error;
 extern int Wimplicit_int;
 extern int Winit_cstring;
diff --git a/parse.c b/parse.c
index 4b0a156..f5b5e2d 100644
--- a/parse.c
+++ b/parse.c
@@ -2769,10 +2769,12 @@ static struct token *parse_function_body(struct token *token, struct symbol *dec
 	function_computed_target_list = NULL;
 	function_computed_goto_list = NULL;
 
-	if (decl->ctype.modifiers & MOD_EXTERN) {
-		if (!(decl->ctype.modifiers & MOD_INLINE))
-			warning(decl->pos, "function '%s' with external linkage has definition", show_ident(decl->ident));
+	if (Wexternal_function_has_definition &&
+		decl->ctype.modifiers & MOD_EXTERN &&
+		!(decl->ctype.modifiers & MOD_INLINE)) {
+		warning(decl->pos, "function '%s' with external linkage has definition", show_ident(decl->ident));
 	}
+
 	if (!(decl->ctype.modifiers & MOD_STATIC))
 		decl->ctype.modifiers |= MOD_EXTERN;
 
diff --git a/sparse.1 b/sparse.1
index be38f68..574caef 100644
--- a/sparse.1
+++ b/sparse.1
@@ -244,6 +244,13 @@ Sparse issues these warnings by default.  To turn them off, use
 \fB\-Wno\-enum\-mismatch\fR.
 .
 .TP
+.B \-Wexternal\-function\-has\-definition
+Warn about function definitions that are declared with external linkage.
+
+Sparse issues these warnings by default.  To turn them off, use
+\fB\-Wno\-external\-function\-has\-definition\fR.
+.
+.TP
 .B \-Winit\-cstring
 Warn about initialization of a char array with a too long constant C string.
 
-- 
2.17.1


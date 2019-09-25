Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D653DBDB96
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2019 12:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfIYKAT (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 25 Sep 2019 06:00:19 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:42951 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732908AbfIYKAT (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 25 Sep 2019 06:00:19 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iD45o-00024B-RC; Wed, 25 Sep 2019 11:00:16 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iD45o-0008Dp-6n; Wed, 25 Sep 2019 11:00:16 +0100
From:   Ben Dooks <ben.dooks@codethink.co.uk>
To:     linux-sparse@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 4/5] add -Wformat
Date:   Wed, 25 Sep 2019 11:00:14 +0100
Message-Id: <20190925100015.31510-5-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add option to enable/disable format checking (and default it to off)

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Changes since v1:
- Default -Wformat off

Changes since v2:
- Spelling fixes

fixup format docs
---
 evaluate.c | 4 ++--
 lib.c      | 2 ++
 lib.h      | 1 +
 sparse.1   | 9 +++++++++
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index b7c78a0..78cebe5 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -2762,7 +2762,7 @@ static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 	 * do this first, otherwise the arugment info may get lost or changed
 	 * later on in the evaluation loop by degenerate()
 	 */
-	if (fn->ctype.printf_va_start)
+	if (Wformat && fn->ctype.printf_va_start)
 		fmt_string = get_printf_fmt(fn, head);
 
 	PREPARE_PTR_LIST(argument_types, argtype);
@@ -2802,7 +2802,7 @@ static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
 	} END_FOR_EACH_PTR(expr);
 	FINISH_PTR_LIST(argtype);
 
-	if (fn->ctype.printf_va_start)
+	if (Wformat && fn->ctype.printf_va_start)
 		evaluate_format_printf(fmt_string, fn, head);
 
 	return 1;
diff --git a/lib.c b/lib.c
index 83e6a1e..b3bb2e6 100644
--- a/lib.c
+++ b/lib.c
@@ -269,6 +269,7 @@ int Wimplicit_int = 1;
 int Winit_cstring = 0;
 int Wint_to_pointer_cast = 1;
 int Wenum_mismatch = 1;
+int Wformat = 0;
 int Wsparse_error = 0;
 int Wmemcpy_max_count = 1;
 int Wnon_pointer_null = 1;
@@ -651,6 +652,7 @@ static const struct flag warnings[] = {
 	{ "implicit-int", &Wimplicit_int },
 	{ "init-cstring", &Winit_cstring },
 	{ "int-to-pointer-cast", &Wint_to_pointer_cast },
+	{ "format", &Wformat },
 	{ "memcpy-max-count", &Wmemcpy_max_count },
 	{ "non-pointer-null", &Wnon_pointer_null },
 	{ "old-initializer", &Wold_initializer },
diff --git a/lib.h b/lib.h
index 322408b..c606807 100644
--- a/lib.h
+++ b/lib.h
@@ -152,6 +152,7 @@ extern int Wdefault_bitfield_sign;
 extern int Wdesignated_init;
 extern int Wdo_while;
 extern int Wenum_mismatch;
+extern int Wformat;
 extern int Wsparse_error;
 extern int Wimplicit_int;
 extern int Winit_cstring;
diff --git a/sparse.1 b/sparse.1
index beb4844..f9450bd 100644
--- a/sparse.1
+++ b/sparse.1
@@ -262,6 +262,15 @@ trouble.
 Sparse does not issue these warnings by default.
 .
 .TP
+.B \-Wformat
+Warn about parameter mismatch to any variadic function which specifies
+where the format string is specified with the 
+.BI __attribute__((format( type, message, va_start )))
+attribute.
+
+Sparse does not issue these warnings by default. To turn them on, use
+\fB\-Wno\-format\fR
+.TP
 .B \-Wmemcpy\-max\-count
 Warn about call of \fBmemcpy()\fR, \fBmemset()\fR, \fBcopy_from_user()\fR, or
 \fBcopy_to_user()\fR with a large compile-time byte count.
-- 
2.23.0


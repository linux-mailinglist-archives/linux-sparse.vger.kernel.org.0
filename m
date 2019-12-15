Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5E011FB00
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 21:15:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfLOUPg (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 15:15:36 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38511 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726299AbfLOUPg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 15:15:36 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so4733002wrh.5
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 12:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nqLauIfIEp0MNeT1jOCYLPdtSNyfOh41zwWDkXOWSW4=;
        b=Oo1YIpmlsBeWDaqO3FbyIbXhVLZFq7HEF23IxyP46NvjVgFMq56l5PRIcNk0fFE8bB
         TahJfEOxuEwLHQp1rkbb1u2o5+3cLGTPP+zBbUrY2VWoNNNOZuFYh5nJuDzbvV/u+YGb
         Hwi4xGH9/tp9pYHVshIN7l0kqX6+rXVGWjz0V05RkTrvJ3cx0AOj7Hw0peDVLdVYahI2
         dKCQWMkjWZO4Ixyz29KbJHylny28XU2wpr5/7PbT24n4GIBqXHwnOUunKf+cg/Y4i4nN
         K9ZUFNYj6Vurdzx+jegST58cjroBhWEvfzqQrTGh6HJNsS3KjZdw509xUKYWWehCEoFy
         1n1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nqLauIfIEp0MNeT1jOCYLPdtSNyfOh41zwWDkXOWSW4=;
        b=P6v4/DcUVI3x1Uu0GpSVH/RZ6TpKFmPdWdBaxr4sIpxsO4uefLb+86oTHsTf4QNYUO
         zvHzJIbDQQCB6VojuopJDd+VjlBMSeNmtLfv8FqGPxnEb1V+NOAhxqhzp78VAjbsVxDT
         phHch8OAELXXU+ovFjl9pW2e2VnAJyHwgqvkxQknw5gl/LA4DKV8l3JLqbL4BzG90f1T
         xLCbrj/siRJoYROBG8DwS4o+60svhkCG/QB+c0kf9H2mvt903HOQldNVbkYOPRUiAWMV
         mYEiofmgbwCL/Gq6DwCRQQf9KeDPsLcC8k2pz3rdO6X+q//HKzIfCn14ELJAVwQn4bl4
         IMpQ==
X-Gm-Message-State: APjAAAX+eIALOhZlNiZgooFYUDCFSqSZVZ6E9Vn3sdBk4/7ZbjKjnloy
        sImr2qC44018vReHN0/XnFc=
X-Google-Smtp-Source: APXvYqxwaSwdjyPLHdntfWDBjzpFRzRYEjSZIJcI1KGRMF1CnXYGV/7OHKKGyAUfnw2Vw9bW97Zf/g==
X-Received: by 2002:a5d:6b88:: with SMTP id n8mr26990124wrx.288.1576440932886;
        Sun, 15 Dec 2019 12:15:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:4d3d:d98:1fc5:2616])
        by smtp.gmail.com with ESMTPSA id 16sm18367973wmi.0.2019.12.15.12.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 12:15:31 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v2] improve diagnostic message about wrong redeclaration
Date:   Sun, 15 Dec 2019 21:13:27 +0100
Message-Id: <20191215201327.12270-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <3037fb4a-aabd-6386-e14a-906a948510bf@ramsayjones.plus.com>
References: <3037fb4a-aabd-6386-e14a-906a948510bf@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The current message is very long (in most cases the position
of the previous declaration is past the 80th column) and,
while saying that the types differ, doesn't show these types.

Change this by splitting the message in 2 parts:
- first, on the current position, the main message
  and the type of the current declaration.
- then the type of the previous declaration on its
  own position.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---

Change since v1:
* add back to the message the 'typediff' which was inadvertently removed.

 evaluate.c                   |  8 +++---
 validation/c11-atomic.c      | 10 ++++++--
 validation/function-redecl.c | 50 ++++++++++++++++++++++++++++--------
 validation/restrict.c        | 10 ++++++--
 validation/typedef-redef.c   |  5 +++-
 5 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 4d08956e984c..8b1ae863b004 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3380,9 +3380,11 @@ void check_duplicates(struct symbol *sym)
 		declared++;
 		typediff = type_difference(&sym->ctype, &next->ctype, 0, 0);
 		if (typediff) {
-			sparse_error(sym->pos, "symbol '%s' redeclared with different type (originally declared at %s:%d) - %s",
-				show_ident(sym->ident),
-				stream_name(next->pos.stream), next->pos.line, typediff);
+			sparse_error(sym->pos, "symbol '%s' redeclared with different type (%s):",
+				show_ident(sym->ident), typediff);
+			info(sym->pos, "   %s", show_typename(sym));
+			info(next->pos, "note: previously declared as:");
+			info(next->pos, "   %s", show_typename(next));
 			return;
 		}
 	}
diff --git a/validation/c11-atomic.c b/validation/c11-atomic.c
index fc2c27ae9a65..17720861ffb7 100644
--- a/validation/c11-atomic.c
+++ b/validation/c11-atomic.c
@@ -69,8 +69,14 @@ void baz(void)
  * check-command: sparse -Wno-decl $file
  *
  * check-error-start
-c11-atomic.c:11:6: error: symbol 'f02' redeclared with different type (originally declared at c11-atomic.c:3) - incompatible argument 1 (different modifiers)
-c11-atomic.c:12:6: error: symbol 'f03' redeclared with different type (originally declared at c11-atomic.c:4) - incompatible argument 1 (different modifiers)
+c11-atomic.c:11:6: error: symbol 'f02' redeclared with different type (incompatible argument 1 (different modifiers)):
+c11-atomic.c:11:6:    void extern [addressable] [toplevel] f02( ... )
+c11-atomic.c:3:6: note: previously declared as:
+c11-atomic.c:3:6:    void extern [addressable] [toplevel] f02( ... )
+c11-atomic.c:12:6: error: symbol 'f03' redeclared with different type (incompatible argument 1 (different modifiers)):
+c11-atomic.c:12:6:    void extern [addressable] [toplevel] f03( ... )
+c11-atomic.c:4:6: note: previously declared as:
+c11-atomic.c:4:6:    void extern [addressable] [toplevel] f03( ... )
 c11-atomic.c:33:13: warning: incorrect type in assignment (different modifiers)
 c11-atomic.c:33:13:    expected int *extern [assigned] puo
 c11-atomic.c:33:13:    got int const *
diff --git a/validation/function-redecl.c b/validation/function-redecl.c
index 475f18e798f5..0315135932ab 100644
--- a/validation/function-redecl.c
+++ b/validation/function-redecl.c
@@ -48,15 +48,45 @@ void arg_vararg(int a, ...) { }			/* check-should-fail */
  * check-name: function-redecl
  *
  * check-error-start
-function-redecl.c:5:6: error: symbol 'ret_type' redeclared with different type (originally declared at function-redecl.c:4) - different base types
-function-redecl.c:9:11: error: symbol 'ret_const' redeclared with different type (originally declared at function-redecl.c:8) - different modifiers
-function-redecl.c:13:13: error: symbol 'ret_as' redeclared with different type (originally declared at function-redecl.c:12) - different address spaces
-function-redecl.c:17:12: error: symbol 'ret_mod' redeclared with different type (originally declared at function-redecl.c:16) - different modifiers
-function-redecl.c:21:6: error: symbol 'arg_type' redeclared with different type (originally declared at function-redecl.c:20) - incompatible argument 1 (different base types)
-function-redecl.c:29:6: error: symbol 'arg_as' redeclared with different type (originally declared at function-redecl.c:28) - incompatible argument 1 (different address spaces)
-function-redecl.c:33:6: error: symbol 'arg_mod' redeclared with different type (originally declared at function-redecl.c:32) - incompatible argument 1 (different modifiers)
-function-redecl.c:37:6: error: symbol 'arg_more_arg' redeclared with different type (originally declared at function-redecl.c:36) - different argument counts
-function-redecl.c:41:6: error: symbol 'arg_less_arg' redeclared with different type (originally declared at function-redecl.c:40) - different argument counts
-function-redecl.c:45:6: error: symbol 'arg_vararg' redeclared with different type (originally declared at function-redecl.c:44) - incompatible variadic arguments
+function-redecl.c:5:6: error: symbol 'ret_type' redeclared with different type (different base types):
+function-redecl.c:5:6:    void extern [addressable] [toplevel] ret_type( ... )
+function-redecl.c:4:5: note: previously declared as:
+function-redecl.c:4:5:    int extern [signed] [addressable] [toplevel] ret_type( ... )
+function-redecl.c:9:11: error: symbol 'ret_const' redeclared with different type (different modifiers):
+function-redecl.c:9:11:    int extern const [signed] [addressable] [toplevel] ret_const( ... )
+function-redecl.c:8:5: note: previously declared as:
+function-redecl.c:8:5:    int extern [signed] [addressable] [toplevel] ret_const( ... )
+function-redecl.c:13:13: error: symbol 'ret_as' redeclared with different type (different address spaces):
+function-redecl.c:13:13:    void <asn:1> *extern [addressable] [toplevel] ret_as( ... )
+function-redecl.c:12:6: note: previously declared as:
+function-redecl.c:12:6:    void *extern [addressable] [toplevel] ret_as( ... )
+function-redecl.c:17:12: error: symbol 'ret_mod' redeclared with different type (different modifiers):
+function-redecl.c:17:12:    void const *extern [addressable] [toplevel] ret_mod( ... )
+function-redecl.c:16:6: note: previously declared as:
+function-redecl.c:16:6:    void *extern [addressable] [toplevel] ret_mod( ... )
+function-redecl.c:21:6: error: symbol 'arg_type' redeclared with different type (incompatible argument 1 (different base types)):
+function-redecl.c:21:6:    void extern [addressable] [toplevel] arg_type( ... )
+function-redecl.c:20:6: note: previously declared as:
+function-redecl.c:20:6:    void extern [addressable] [toplevel] arg_type( ... )
+function-redecl.c:29:6: error: symbol 'arg_as' redeclared with different type (incompatible argument 1 (different address spaces)):
+function-redecl.c:29:6:    void extern [addressable] [toplevel] arg_as( ... )
+function-redecl.c:28:6: note: previously declared as:
+function-redecl.c:28:6:    void extern [addressable] [toplevel] arg_as( ... )
+function-redecl.c:33:6: error: symbol 'arg_mod' redeclared with different type (incompatible argument 1 (different modifiers)):
+function-redecl.c:33:6:    void extern [addressable] [toplevel] arg_mod( ... )
+function-redecl.c:32:6: note: previously declared as:
+function-redecl.c:32:6:    void extern [addressable] [toplevel] arg_mod( ... )
+function-redecl.c:37:6: error: symbol 'arg_more_arg' redeclared with different type (different argument counts):
+function-redecl.c:37:6:    void extern [addressable] [toplevel] arg_more_arg( ... )
+function-redecl.c:36:6: note: previously declared as:
+function-redecl.c:36:6:    void extern [addressable] [toplevel] arg_more_arg( ... )
+function-redecl.c:41:6: error: symbol 'arg_less_arg' redeclared with different type (different argument counts):
+function-redecl.c:41:6:    void extern [addressable] [toplevel] arg_less_arg( ... )
+function-redecl.c:40:6: note: previously declared as:
+function-redecl.c:40:6:    void extern [addressable] [toplevel] arg_less_arg( ... )
+function-redecl.c:45:6: error: symbol 'arg_vararg' redeclared with different type (incompatible variadic arguments):
+function-redecl.c:45:6:    void extern [addressable] [toplevel] arg_vararg( ... )
+function-redecl.c:44:6: note: previously declared as:
+function-redecl.c:44:6:    void extern [addressable] [toplevel] arg_vararg( ... )
  * check-error-end
  */
diff --git a/validation/restrict.c b/validation/restrict.c
index 80c437b01b24..d7cd8ad98f75 100644
--- a/validation/restrict.c
+++ b/validation/restrict.c
@@ -69,8 +69,14 @@ void baz(void)
  * check-command: sparse -Wno-decl $file
  *
  * check-error-start
-restrict.c:11:6: error: symbol 'f02' redeclared with different type (originally declared at restrict.c:3) - incompatible argument 1 (different modifiers)
-restrict.c:12:6: error: symbol 'f03' redeclared with different type (originally declared at restrict.c:4) - incompatible argument 1 (different modifiers)
+restrict.c:11:6: error: symbol 'f02' redeclared with different type (incompatible argument 1 (different modifiers)):
+restrict.c:11:6:    void extern [addressable] [toplevel] f02( ... )
+restrict.c:3:6: note: previously declared as:
+restrict.c:3:6:    void extern [addressable] [toplevel] f02( ... )
+restrict.c:12:6: error: symbol 'f03' redeclared with different type (incompatible argument 1 (different modifiers)):
+restrict.c:12:6:    void extern [addressable] [toplevel] f03( ... )
+restrict.c:4:6: note: previously declared as:
+restrict.c:4:6:    void extern [addressable] [toplevel] f03( ... )
 restrict.c:33:13: warning: incorrect type in assignment (different modifiers)
 restrict.c:33:13:    expected void **extern [assigned] pup
 restrict.c:33:13:    got void *const *
diff --git a/validation/typedef-redef.c b/validation/typedef-redef.c
index 3a60a773168a..f90f266af193 100644
--- a/validation/typedef-redef.c
+++ b/validation/typedef-redef.c
@@ -8,6 +8,9 @@ typedef long ko_t;
  * check-name: typedef-redef
  *
  * check-error-start
-typedef-redef.c:5:14: error: symbol 'ko_t' redeclared with different type (originally declared at typedef-redef.c:4) - different type sizes
+typedef-redef.c:5:14: error: symbol 'ko_t' redeclared with different type (different type sizes):
+typedef-redef.c:5:14:    long [usertype] ko_t
+typedef-redef.c:4:14: note: previously declared as:
+typedef-redef.c:4:14:    int [usertype] ko_t
  * check-error-end
  */

base-commit: f934193608415cff796694b5500f95e7b2e0fd17
-- 
2.24.0


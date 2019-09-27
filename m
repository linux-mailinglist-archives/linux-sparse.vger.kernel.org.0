Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12347C0EA2
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbfI0Xn2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:28 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46362 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728445AbfI0Xn2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:28 -0400
Received: by mail-ed1-f65.google.com with SMTP id t3so3695566edw.13
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ol1jRT0SJWYDcHPDPMZ0o5sbk8cyN8k2eMjWj5GCYfM=;
        b=fj2k5GxSptXXIe+7XnMjdzsgdJm8NsnAYGiBIPwjMc/uDMbsrMFPiC4t54igNyn+s+
         Po6AB/cRE3/N4dQCAvfxCHMQqyQHJpHLQkon29qkFDDlx8l0k6xf0zKMauRI89jVvnwg
         A+PjovnEazERpviIf5mNLJOLsBqCLaZDDbThEzpJ7ejYQGjdVxjN1S/kRYeKNGaiHhtm
         zP8aCzwGIpW2mMTOUNAwu/BT+TUwh7mxOTSo12JwjH4qGzfIVqLj2I0LrQZDCm+2rl1b
         0ARyjfK/hEPAfJQ4MK1Kxm67huCE0HnN9bmZf0CWxBZtUzmRrKS34c3yyGdp5WlWBcqA
         /i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ol1jRT0SJWYDcHPDPMZ0o5sbk8cyN8k2eMjWj5GCYfM=;
        b=EIuFydq6q4vYqfMaASVEeUOpiSWL8v40Rd9A6VbiLnJOQ1Bd4WwdgnC3pufI6KBYF3
         x9FhPSt8/GSVSgaN1tM7CCByosATu/6CcLg+P4gL7NFXYr28Q9rEcgEpeAqjefK6z4f7
         qeuI6liT3GW4pNClsMgBlN1g/OW3deaZwVwbQgRasgAHYpGVe15CoYOi93yBtHmw8mBz
         /tDXqts9fRRsHX5mqO8kx6fEirUE03FiplKQk9c7Z5Q2tcWOgPPKvvKRUZCjEHOK5EEQ
         OrWfUPqy9N96+QEFnujOz05fiasKPvxJ90RU5crFDKHof67JI7QX6KHNYVfkn+8iS+c0
         V6aQ==
X-Gm-Message-State: APjAAAUVaMt0NTOBCXaEm1ZE/vXoNyNTZgbfpZJoHiNQ0oKUXm8HsSp0
        AQu7gbrbiFybS61ilbUutlKih44f
X-Google-Smtp-Source: APXvYqwUvYMFZ9dIS4a9YAYxfBIqdyrivo6Ncni6q+TgjAtcV2Y2CDB1mTh0t+rGb4IPbH/DVaRZ8A==
X-Received: by 2002:a50:f0db:: with SMTP id a27mr7426899edm.17.1569627805632;
        Fri, 27 Sep 2019 16:43:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:25 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 01/18] more consistent type info in error messages
Date:   Sat, 28 Sep 2019 01:43:04 +0200
Message-Id: <20190927234322.5157-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Some error messages are displayed with auxillary information
about the concerned type(s).

However, this type information is displayed in various way:
just the type, "[left/right] side has type ...", "got ...", ...

Make these more consistent and simpler by just displaying
types when the error message is unambigous about the fact
that the problem is a type problem (and/or make the message
unambiguous when possible).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                       | 20 ++++++++++----------
 validation/bad-type-twice0.c     |  4 ++--
 validation/bad-type-twice1.c     |  6 +++---
 validation/compare-null-to-int.c |  6 +++---
 validation/cond_expr.c           |  4 ++--
 validation/conditional-type.c    | 32 ++++++++++++++++----------------
 validation/enum-mismatch.c       |  6 +++---
 7 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index cedd13300..3821bb3d7 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -283,9 +283,9 @@ warn_for_different_enum_types (struct position pos,
 		return;
 
 	if (typea->type == SYM_ENUM && typeb->type == SYM_ENUM) {
-		warning(pos, "mixing different enum types");
-		info(pos, "    %s versus", show_typename(typea));
-		info(pos, "    %s", show_typename(typeb));
+		warning(pos, "mixing different enum types:");
+		info(pos, "   %s", show_typename(typea));
+		info(pos, "   %s", show_typename(typeb));
 	}
 }
 
@@ -413,16 +413,16 @@ static struct symbol *bad_expr_type(struct expression *expr)
 	case EXPR_COMPARE:
 		if (!valid_subexpr_type(expr))
 			break;
-		sparse_error(expr->pos, "incompatible types for operation (%s)", show_special(expr->op));
-		info(expr->pos, "   left side has type %s", show_typename(expr->left->ctype));
-		info(expr->pos, "   right side has type %s", show_typename(expr->right->ctype));
+		sparse_error(expr->pos, "incompatible types for operation (%s):", show_special(expr->op));
+		info(expr->pos, "   %s", show_typename(expr->left->ctype));
+		info(expr->pos, "   %s", show_typename(expr->right->ctype));
 		break;
 	case EXPR_PREOP:
 	case EXPR_POSTOP:
 		if (!valid_expr_type(expr->unop))
 			break;
-		sparse_error(expr->pos, "incompatible types for operation (%s)", show_special(expr->op));
-		info(expr->pos, "   argument has type %s", show_typename(expr->unop->ctype));
+		sparse_error(expr->pos, "incompatible type for operation (%s):", show_special(expr->op));
+		info(expr->pos, "   %s", show_typename(expr->unop->ctype));
 		break;
 	default:
 		break;
@@ -910,8 +910,8 @@ static struct symbol *evaluate_conditional(struct expression *expr, int iterator
 		if (Waddress)
 			warning(expr->pos, "the address of %s will always evaluate as true", "an array");
 	} else if (!is_scalar_type(ctype)) {
-		sparse_error(expr->pos, "incorrect type in conditional (non-scalar type)");
-		info(expr->pos, "   got %s", show_typename(ctype));
+		sparse_error(expr->pos, "incorrect type in conditional (non-scalar type):");
+		info(expr->pos, "   %s", show_typename(ctype));
 		return NULL;
 	}
 
diff --git a/validation/bad-type-twice0.c b/validation/bad-type-twice0.c
index 5d107a625..45234699e 100644
--- a/validation/bad-type-twice0.c
+++ b/validation/bad-type-twice0.c
@@ -7,7 +7,7 @@ static int foo(a)
  * check-name: bad-type-twice0
  *
  * check-error-start
-bad-type-twice0.c:3:16: error: incorrect type in conditional (non-scalar type)
-bad-type-twice0.c:3:16:    got incomplete type a
+bad-type-twice0.c:3:16: error: incorrect type in conditional (non-scalar type):
+bad-type-twice0.c:3:16:    incomplete type a
  * check-error-end
  */
diff --git a/validation/bad-type-twice1.c b/validation/bad-type-twice1.c
index cc81662af..a9ba182cb 100644
--- a/validation/bad-type-twice1.c
+++ b/validation/bad-type-twice1.c
@@ -9,8 +9,8 @@ static unsigned long foo(unsigned long val, void *ref)
  * check-name: bad-type-twice1
  *
  * check-error-start
-bad-type-twice1.c:3:17: error: incompatible types for operation (>=)
-bad-type-twice1.c:3:17:    left side has type unsigned long val
-bad-type-twice1.c:3:17:    right side has type void *ref
+bad-type-twice1.c:3:17: error: incompatible types for operation (>=):
+bad-type-twice1.c:3:17:    unsigned long val
+bad-type-twice1.c:3:17:    void *ref
  * check-error-end
  */
diff --git a/validation/compare-null-to-int.c b/validation/compare-null-to-int.c
index 08e556b32..336c724de 100644
--- a/validation/compare-null-to-int.c
+++ b/validation/compare-null-to-int.c
@@ -4,8 +4,8 @@ static unsigned int comparison = (void *)0 == 1;
  * check-description: Sparse used to allow this.
  *
  * check-error-start
-compare-null-to-int.c:1:44: error: incompatible types for operation (==)
-compare-null-to-int.c:1:44:    left side has type void *
-compare-null-to-int.c:1:44:    right side has type int
+compare-null-to-int.c:1:44: error: incompatible types for operation (==):
+compare-null-to-int.c:1:44:    void *
+compare-null-to-int.c:1:44:    int
  * check-error-end
  */
diff --git a/validation/cond_expr.c b/validation/cond_expr.c
index e55711cce..9b8105c1c 100644
--- a/validation/cond_expr.c
+++ b/validation/cond_expr.c
@@ -13,7 +13,7 @@ int a(void)
  * check-name: Two-argument conditional expression types
  *
  * check-error-start
-cond_expr.c:10:16: error: incompatible types for operation (~)
-cond_expr.c:10:16:    argument has type double
+cond_expr.c:10:16: error: incompatible type for operation (~):
+cond_expr.c:10:16:    double
  * check-error-end
  */
diff --git a/validation/conditional-type.c b/validation/conditional-type.c
index 912672127..34cfcc687 100644
--- a/validation/conditional-type.c
+++ b/validation/conditional-type.c
@@ -79,21 +79,21 @@ static int good_if_ptr(void *ptr)
  * check-name: conditional-type
  *
  * check-error-start
-conditional-type.c:18:18: error: incorrect type in conditional (non-scalar type)
-conditional-type.c:18:18:    got void
-conditional-type.c:19:13: error: incorrect type in conditional (non-scalar type)
-conditional-type.c:19:13:    got struct state s
-conditional-type.c:24:18: error: incorrect type in conditional (non-scalar type)
-conditional-type.c:24:18:    got void
-conditional-type.c:29:21: error: incorrect type in conditional (non-scalar type)
-conditional-type.c:29:21:    got void
-conditional-type.c:30:16: error: incorrect type in conditional (non-scalar type)
-conditional-type.c:30:16:    got struct state s
-conditional-type.c:34:21: error: incorrect type in conditional (non-scalar type)
-conditional-type.c:34:21:    got void
-conditional-type.c:36:20: error: incorrect type in conditional (non-scalar type)
-conditional-type.c:36:20:    got void
-conditional-type.c:40:21: error: incorrect type in conditional (non-scalar type)
-conditional-type.c:40:21:    got void
+conditional-type.c:18:18: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:18:18:    void
+conditional-type.c:19:13: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:19:13:    struct state s
+conditional-type.c:24:18: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:24:18:    void
+conditional-type.c:29:21: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:29:21:    void
+conditional-type.c:30:16: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:30:16:    struct state s
+conditional-type.c:34:21: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:34:21:    void
+conditional-type.c:36:20: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:36:20:    void
+conditional-type.c:40:21: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:40:21:    void
  * check-error-end
  */
diff --git a/validation/enum-mismatch.c b/validation/enum-mismatch.c
index 1bdb1d6c2..a6e5d72db 100644
--- a/validation/enum-mismatch.c
+++ b/validation/enum-mismatch.c
@@ -12,8 +12,8 @@ static enum eb foo(enum ea a)
  * check-command: sparse -Wenum-mismatch $file
  *
  * check-error-start
-enum-mismatch.c:7:16: warning: mixing different enum types
-enum-mismatch.c:7:16:     unsigned int enum ea versus
-enum-mismatch.c:7:16:     unsigned int enum eb
+enum-mismatch.c:7:16: warning: mixing different enum types:
+enum-mismatch.c:7:16:    unsigned int enum ea
+enum-mismatch.c:7:16:    unsigned int enum eb
  * check-error-end
  */
-- 
2.23.0


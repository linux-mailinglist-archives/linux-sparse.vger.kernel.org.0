Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0770119EF3
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLJW7p (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:45 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34596 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbfLJW7p (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:45 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so21994196wrr.1
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=trnik3hp+CwVO2qEo8GM2UEPZkROfkBmfZGriDP/KOM=;
        b=FrBj2mhULcdowVCJ385LHYI0UWLaSUvo0NJTmsdstRpwnNTnIrUOlNCYaZkhQLIq1i
         JLN2wt+htkzORZWkpKOUvE+GXBrAVIkdGy6Ih4R161EVNGteO7AzxLvEXdZqi4PiXx2w
         ZTzG7QQqHQnJbf+g83+D4lSmdt0g+ADoRYmRPq0hzT4manPrcdzMkjig1SC8B8k+HWmV
         T08w3k7Fa2FnF8uLl7SdWur0kfr3A/Jbwhvdj9Ck8NQi+2oEbOK3t6eGQC0GwbqO9dwa
         LWIlO/6WoQOAmZH8CpBImNl/sFVMcqyARu/vG1qF1daih2C/FAbzDKhEtvev6NaDTpmC
         gdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=trnik3hp+CwVO2qEo8GM2UEPZkROfkBmfZGriDP/KOM=;
        b=gcE2YUj0d0+o/Bg2UDeJxWc5em3Gwo9uphSPrzXIvfmPn264L8Yx65xGVxdkR6/2+S
         PxRJVLbGjI9aPnpmov0KwfGajO5EpZTYzHiDwlolgbWqKgyYLM44czWP+MpCX5BK/24V
         oOpBfzTeZjUymq7/39UuhzIcPjDeaWJ1dZQsRoxDOzGhXEMY4v1XaTYxyWwgP8s1yWBW
         fgoJSf52jPYJ+8fVGpMBs3cOzDA/SKfDbSq/moaPy8O37yReCQGzyJXJ8YIz8Iugtjsk
         M11GaYtcY+E2pZeHCJY1yi3EsPrIX58siwyo/Fz0N+sGP+K94HOVcPfS+sN0EydRbY9h
         Y5eQ==
X-Gm-Message-State: APjAAAWXSzAMhoyvq3by5AK8TKcmCgZxcb6L1NTfibR9lIKlzDOcmhKS
        TkTns49nkxFIhz5N1jMKk0Boe0wX
X-Google-Smtp-Source: APXvYqyGLEkoO3rWIh5+dGxkhHW0S+3jymQH/f6BGeZj8xIDMwt8LRFQJl33+dXoqYf+kSywilU88Q==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr5997917wrm.241.1576018783408;
        Tue, 10 Dec 2019 14:59:43 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:42 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 12/17] fix expansion of initializer (mismatching type)
Date:   Tue, 10 Dec 2019 23:59:16 +0100
Message-Id: <20191210225921.94897-13-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, the expansion of constant initializers is done
whenever the offset in the initializer match the one
being expanded.

However, it's not correct to do this expansion of an
integer with the initializer for a float and vice-versa.

Fix this by adding the corresponding tests to the other
tests of the value.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expand.c                                   | 4 ++++
 validation/expand/constant-union-flt2int.c | 1 -
 validation/expand/constant-union-int2flt.c | 1 -
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/expand.c b/expand.c
index 04b072c53b5a..9ab259b13a82 100644
--- a/expand.c
+++ b/expand.c
@@ -694,6 +694,8 @@ static int expand_dereference(struct expression *expr)
 			if (ctype->bit_size != value->ctype->bit_size)
 				return UNSAFE;
 			if (value->type == EXPR_VALUE) {
+				if (!is_integral_type(ctype))
+					return UNSAFE;
 				if (is_bitfield_type(value->ctype))
 					return UNSAFE;
 				expr->type = EXPR_VALUE;
@@ -701,6 +703,8 @@ static int expand_dereference(struct expression *expr)
 				expr->taint = 0;
 				return 0;
 			} else if (value->type == EXPR_FVALUE) {
+				if (!is_float_type(ctype))
+					return UNSAFE;
 				expr->type = EXPR_FVALUE;
 				expr->fvalue = value->fvalue;
 				return 0;
diff --git a/validation/expand/constant-union-flt2int.c b/validation/expand/constant-union-flt2int.c
index 1c8f480b6c81..5e25b592b204 100644
--- a/validation/expand/constant-union-flt2int.c
+++ b/validation/expand/constant-union-flt2int.c
@@ -13,7 +13,6 @@ static int foo(void)
  * check-name: constant-union-float-to-int
  * check description: must not infer the int value from the float
  * check-command: test-linearize -fdump-ir $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-pattern(1): setfval\\.
diff --git a/validation/expand/constant-union-int2flt.c b/validation/expand/constant-union-int2flt.c
index ff0a642ad67d..16ce1c6f3fe3 100644
--- a/validation/expand/constant-union-int2flt.c
+++ b/validation/expand/constant-union-int2flt.c
@@ -13,7 +13,6 @@ static float foo(void)
  * check-name: constant-union-int-to-float
  * check description: must not infer the float value from the int
  * check-command: test-linearize -fdump-ir $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-pattern(1): load\\.
-- 
2.24.0


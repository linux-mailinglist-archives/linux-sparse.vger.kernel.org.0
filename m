Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B685B119EF2
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727378AbfLJW7o (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:44 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38240 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJW7o (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:44 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so21977077wrh.5
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PsR62Tb/c3E/HIKOTY7w0ALpqA7AZ3b0zxAqIpRIkzs=;
        b=YIeJR3SM9KiieEPd8S5mpYeCKFhzlzjgZwmYlf9K5P6K8zOP2S8eOsRZgNulMwrd+o
         AJAPvAfdpDyBvhSE7hK2VceorN7X4/EZRaOmoicDOSjeENCnwx2xN3sRiQVpfFIIAdnl
         /OnL6AXkMdIFbcBU+E66ZSMWcfYXI4grr2HtDxbSAgcBzXpMa45t3sYOqaHbKg1dMooI
         uHb5HzhbDWR8C86Xoq75DzoFgodgJ62khsuCudXbzyPgUjeJV3tpNFFudhoJDGoN6b76
         UgCXkVXaBeBatcd3ZB8nDJbJgOxLe+zt0CjfFuVXXQ29u7HiL00++xx9WVH1YGsXSs1w
         goGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PsR62Tb/c3E/HIKOTY7w0ALpqA7AZ3b0zxAqIpRIkzs=;
        b=MVzRWXfh9ckxfyYMExmYUcSXTGcDlvYqbcICsR0YUoDRDcXSu+4BQd7w5HzcbuY6sk
         IKZMX3RgLeZPGjgicsEsAygG17uN5BySnet2zMSvFjNvCXRR3Hqrh7oBw67b3oEb61n7
         bmiEv2jof4GepFOFyfQcBS48WgH9J+WfYSDdyH6uF2AsV22CJCj8oCFK81AhP7ojzggW
         3Lgj1GBE3Blb81ja0VfsKtqBzKssbaqbhHJEnIFLjBk5pwFcq9DAlq2A/67YFhxr9ale
         u0o+7hvRE9wR0fKCvkX+L3uMWMv/zSrUA2dB5utBpiQB8n+kxU3dy99TDXgpxyhPSeY8
         eEqQ==
X-Gm-Message-State: APjAAAUcO/OrUC43UaP1h96RoOihzTQWZvXlP18+8vhK38X5gByWAI6b
        NcDFcOi+2y65vTjKP52yNtcrpPL5
X-Google-Smtp-Source: APXvYqzC2f+o9YCQ3KDXdwdiEiXiKZtPE+qP8PYwLXvYxXJ18xo5x3cyBaHVM95OM4n3BW8oAna1cQ==
X-Received: by 2002:a5d:6206:: with SMTP id y6mr19141wru.130.1576018782044;
        Tue, 10 Dec 2019 14:59:42 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:41 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 11/17] fix expansion of initializer (mismatching size)
Date:   Tue, 10 Dec 2019 23:59:15 +0100
Message-Id: <20191210225921.94897-12-luc.vanoostenryck@gmail.com>
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
we're expanding.

However, it's not correct to do this expansion if their
size doesn't match since in this case the value of one
doesn't represent the value of the other.

Fix this by adding a check for the size.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expand.c                                | 8 ++++----
 validation/expand/constant-union-size.c | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/expand.c b/expand.c
index ae764153d3e7..04b072c53b5a 100644
--- a/expand.c
+++ b/expand.c
@@ -625,8 +625,6 @@ static int expand_addressof(struct expression *expr)
  * Look up a trustable initializer value at the requested offset.
  *
  * Return NULL if no such value can be found or statically trusted.
- *
- * FIXME!! We should check that the size is right!
  */
 static struct expression *constant_symbol_value(struct symbol *sym, int offset)
 {
@@ -688,11 +686,13 @@ static int expand_dereference(struct expression *expr)
 
 	if (unop->type == EXPR_SYMBOL) {
 		struct symbol *sym = unop->symbol;
+		struct symbol *ctype = expr->ctype;
 		struct expression *value = constant_symbol_value(sym, offset);
 
 		/* Const symbol with a constant initializer? */
-		if (value) {
-			/* FIXME! We should check that the size is right! */
+		if (value && value->ctype) {
+			if (ctype->bit_size != value->ctype->bit_size)
+				return UNSAFE;
 			if (value->type == EXPR_VALUE) {
 				if (is_bitfield_type(value->ctype))
 					return UNSAFE;
diff --git a/validation/expand/constant-union-size.c b/validation/expand/constant-union-size.c
index b6c3ac75ae4b..8a16bf3e8033 100644
--- a/validation/expand/constant-union-size.c
+++ b/validation/expand/constant-union-size.c
@@ -13,7 +13,6 @@ static int foo(void)
  * check-name: constant-union-size
  * check description: the size of the initializer doesn't match
  * check-command: test-linearize -fdump-ir $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: load\\.
-- 
2.24.0


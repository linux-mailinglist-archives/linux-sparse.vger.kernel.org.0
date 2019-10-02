Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4176C9399
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 23:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbfJBVpD (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 17:45:03 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39818 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbfJBVpD (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 17:45:03 -0400
Received: by mail-ed1-f65.google.com with SMTP id a15so549527edt.6
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 14:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWcAsNRYcWG1tBibVGSD9IxXM2As1REZiKMhOhtphxc=;
        b=m1kAN1e5/jiqWlUnw+5t6Mpe18DU7bx5AJBmy2YGnZUbUqpab46qn7sItD6UVTiK5c
         LDDXEvyQcbI1nmOiUo5sAJJQMATzXKBXBXep4xAmdHR9uXq71ibOoGCZQmzZMxVPY5FG
         6vREGL4lTZP9NGxml7x+S6wj7QXiW98iS0/2gKBo1VO8wMpPsu4IjItaKNnR3ZCP93S/
         EO3E3mLSkcAh5v4jz3GS/pf6pidHthiIwqZE1iBvnbxc/Ee4zbePsDmU0u0PQ8W4/RZI
         xtDFwz7BlOyZRieET9HfCg9Q/XSh8UIEtmMsIIHrT/enLGdQ3nvIK5B5Ie2bxG4l1sWp
         Be4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XWcAsNRYcWG1tBibVGSD9IxXM2As1REZiKMhOhtphxc=;
        b=JuNJ0zyPAjM3x2HbVCcb7kileuS4LI/k3JFzHLS4ICeIiX+y/jk60R2uHYJvWLmJAz
         cCR8r4AtGi/S51RlBl6a9L/3gZwrSM4HLG4FncLO3EpozXRO3l1e4HO1XojXG4ic/zU1
         09lGuinR8YAKZXrhTcjB70rXhkzOx76Cyf2K1Cy+WRT9mHt2UGWVJOEWavKncCDYsBQq
         kvS/Yj4vMls/kAB97Dp4028gOgJ4ewrZEgHGoTf1zehsfhZeo2qu6uDJmqe5+FjtkwfD
         Kqvgf7/vmk5jD9q1oyTduLQb5v/+4cuRQvqR7ufDHKQG8afjyewX9QirK3G3W4Bc1cCM
         EKEg==
X-Gm-Message-State: APjAAAWU/o4C+z6Xn+2zPOQ3txzL8VDb1HxsDGevru7SDAFEdYPkltYF
        4wR/LXErQSYbrfNbfc5DX7DsTW2/
X-Google-Smtp-Source: APXvYqw+CwTHcWKaUz4lVJCcBwByrd+lw8xfgTNVMov46bHoHCWDs31Q+v77sOeePWLxCnD4VDLdYQ==
X-Received: by 2002:aa7:d692:: with SMTP id d18mr6054841edr.95.1570052701107;
        Wed, 02 Oct 2019 14:45:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:3985:a315:dc4f:6706])
        by smtp.gmail.com with ESMTPSA id m1sm31680eji.29.2019.10.02.14.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 14:45:00 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] make 'directive in argument list' clearer
Date:   Wed,  2 Oct 2019 23:44:52 +0200
Message-Id: <20191002214452.60924-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The warning 'directive in argument list' is about macros'
arguments, not functions' ones.

Make this clearer in the warning message.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 pre-process.c                            | 2 +-
 validation/preprocessor/preprocessor22.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/pre-process.c b/pre-process.c
index df208bcf9..ca92ff06d 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -272,7 +272,7 @@ static struct token *collect_arg(struct token *prev, int vararg, struct position
 		if (next->pos.newline && match_op(next, '#')) {
 			if (!next->pos.noexpand) {
 				sparse_error(next->pos,
-					     "directive in argument list");
+					     "directive in macro's argument list");
 				preprocessor_line(stream, p);
 				__free_token(next);	/* Free the '#' token */
 				continue;
diff --git a/validation/preprocessor/preprocessor22.c b/validation/preprocessor/preprocessor22.c
index af5bcb37f..fb28daaa5 100644
--- a/validation/preprocessor/preprocessor22.c
+++ b/validation/preprocessor/preprocessor22.c
@@ -20,10 +20,10 @@ define_struct(a, {
  * check-command: sparse -E $file
  *
  * check-error-start
-preprocessor/preprocessor22.c:6:1: error: directive in argument list
-preprocessor/preprocessor22.c:8:1: error: directive in argument list
-preprocessor/preprocessor22.c:10:1: error: directive in argument list
-preprocessor/preprocessor22.c:12:1: error: directive in argument list
+preprocessor/preprocessor22.c:6:1: error: directive in macro's argument list
+preprocessor/preprocessor22.c:8:1: error: directive in macro's argument list
+preprocessor/preprocessor22.c:10:1: error: directive in macro's argument list
+preprocessor/preprocessor22.c:12:1: error: directive in macro's argument list
  * check-error-end
  *
  * check-output-start
-- 
2.23.0


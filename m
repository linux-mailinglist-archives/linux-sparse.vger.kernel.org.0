Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BB6AC0EA3
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728763AbfI0Xn3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:29 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36432 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbfI0Xn3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:29 -0400
Received: by mail-ed1-f65.google.com with SMTP id h2so3746130edn.3
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UdajxMr2+P+kt6tSUAwxxGAJHtZoSF/M61YKLkSgbeI=;
        b=BgVqKYGlry2BWrhvkjeFYe0NLvrsKqrXjKL1Tq0T/tbCFyAYU8vobwwnNCAv+93HOw
         bwF377Cry0bt2r8Rub0VT/VO9ORiQ53fH8FYVlcD3MUxh4WJ7Bxp/wF45o2YfB/wXEKp
         WV3PlAZbQf1ayDLlVvstL4c0PE9dxJLOLYulp2/I4fLZ+PL8I5iQm1N2yo3OGp8sxZkg
         5PCk1kuAy5jk7EjYHg6eULalEi9ChFvl8tFPurZzQtuCOTTWQnuG+qpifpSKYrHrSXGP
         TJFSBw9vi8x3SfPjppI+7swdtjtRtUGai4zCct4lM1jDc5ASvHq/UN37FsV2LwHc+e06
         Z1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UdajxMr2+P+kt6tSUAwxxGAJHtZoSF/M61YKLkSgbeI=;
        b=axK4Ezlqvu6sV4EmMJ4Ox4M8mCUKs+uapXDkCryomLcIQ0cY1SbV+rrDm09Y9xV7tf
         QogFJGaSwERIiqHcgZ57VQ6nnbiqOSNJsMgFAaigZcS1SRgzWENcmfZKfAKQc44jnHD1
         8grC7dq8BCcK0JgJTJ5YgmDYwDzHuN/Le7TlliNsbjgQ02FQwA5LXG8nXFhfE24wfhYA
         sQcPIKpSTB0Iy3kMX7OgBQnP4k9AwntOvWlPR13sM9WvfxUqxnuyk76I2b/pMYHC4iiK
         X+wo5wmnhBrhlBTvFsgceUq+pw9kSXtNQfRuU60DQ08q0lfQzmiSwx9EreSxaOR9mtWj
         fVRQ==
X-Gm-Message-State: APjAAAWR1nIE57VSPb166GyT16s/rnQqQjJtA4H5v2RHlbz6BtwbS5eM
        CJOMZosnCR6RrQU9ix1vK9KVLkg+
X-Google-Smtp-Source: APXvYqyxlAvDC8aKveJZ3+DVsPFOY9CptBLf2eUODnbreQS6cUYbJzpb8XhJFAr0AQUvMnuoTL5iRw==
X-Received: by 2002:a05:6402:1583:: with SMTP id c3mr7554772edv.286.1569627807081;
        Fri, 27 Sep 2019 16:43:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:26 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 02/18] shorter message for non-scalar in conditionals
Date:   Sat, 28 Sep 2019 01:43:06 +0200
Message-Id: <20190927234322.5157-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The diagnostic message is a bit long with the non-really-informative
part 'incorrect type' first and the explanation later in parentheses.

Change this by using a shorter message "non-scalar type in ...".

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                    |  2 +-
 validation/bad-type-twice0.c  |  2 +-
 validation/conditional-type.c | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 3821bb3d7..f6dfcced7 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -910,7 +910,7 @@ static struct symbol *evaluate_conditional(struct expression *expr, int iterator
 		if (Waddress)
 			warning(expr->pos, "the address of %s will always evaluate as true", "an array");
 	} else if (!is_scalar_type(ctype)) {
-		sparse_error(expr->pos, "incorrect type in conditional (non-scalar type):");
+		sparse_error(expr->pos, "non-scalar type in conditional:");
 		info(expr->pos, "   %s", show_typename(ctype));
 		return NULL;
 	}
diff --git a/validation/bad-type-twice0.c b/validation/bad-type-twice0.c
index 45234699e..9e834d47d 100644
--- a/validation/bad-type-twice0.c
+++ b/validation/bad-type-twice0.c
@@ -7,7 +7,7 @@ static int foo(a)
  * check-name: bad-type-twice0
  *
  * check-error-start
-bad-type-twice0.c:3:16: error: incorrect type in conditional (non-scalar type):
+bad-type-twice0.c:3:16: error: non-scalar type in conditional:
 bad-type-twice0.c:3:16:    incomplete type a
  * check-error-end
  */
diff --git a/validation/conditional-type.c b/validation/conditional-type.c
index 34cfcc687..6e2da9b52 100644
--- a/validation/conditional-type.c
+++ b/validation/conditional-type.c
@@ -79,21 +79,21 @@ static int good_if_ptr(void *ptr)
  * check-name: conditional-type
  *
  * check-error-start
-conditional-type.c:18:18: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:18:18: error: non-scalar type in conditional:
 conditional-type.c:18:18:    void
-conditional-type.c:19:13: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:19:13: error: non-scalar type in conditional:
 conditional-type.c:19:13:    struct state s
-conditional-type.c:24:18: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:24:18: error: non-scalar type in conditional:
 conditional-type.c:24:18:    void
-conditional-type.c:29:21: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:29:21: error: non-scalar type in conditional:
 conditional-type.c:29:21:    void
-conditional-type.c:30:16: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:30:16: error: non-scalar type in conditional:
 conditional-type.c:30:16:    struct state s
-conditional-type.c:34:21: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:34:21: error: non-scalar type in conditional:
 conditional-type.c:34:21:    void
-conditional-type.c:36:20: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:36:20: error: non-scalar type in conditional:
 conditional-type.c:36:20:    void
-conditional-type.c:40:21: error: incorrect type in conditional (non-scalar type):
+conditional-type.c:40:21: error: non-scalar type in conditional:
 conditional-type.c:40:21:    void
  * check-error-end
  */
-- 
2.23.0


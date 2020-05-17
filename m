Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC4271D6E07
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbgEQX11 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgEQX10 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:27:26 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9089EC061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:27:26 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id h4so7494332wmb.4
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H9eUSt/vJE51wq2u6BjuLxxpE8x0cQ180UjBnIf+Hz0=;
        b=sMWe7T7r1MCfOmA1zgTnilZQsKizwOTNvuMN4kLGj5jD/GPHw4YYzBBc009tUG0c48
         yBN6fLvH2JNNKsNhQeMIy3lU2j8CbvPViogLn+nc+ejD8XJJaUldnQMdCCk8g5dMNjIg
         IS0xIYVq42EWh/8YBCUUWFncg2NEEIsuySU4UZIR/v5E7O/l7gsDelGhWggYtt2ICQGk
         kcisLV5dwE8wlFS25svZoG2aw5LKpQIJecFMqMlQ5hSGj/EAzPgJGHCNcaFiVvyKGrt9
         pv4J2gjo3nlwHoc1VQiCOjBvok44sl+/SS82OUMXoX16jnetUdZYhSKwRwJyNVAVqXxU
         9pJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H9eUSt/vJE51wq2u6BjuLxxpE8x0cQ180UjBnIf+Hz0=;
        b=DRQeO2zb0DRH/7ZbB8wcA8Kh5ksRYMF3IsCfPXNjZCrhan4jeCtFvb+RLeZeeEYkWj
         CSIv59qDUCb8ms6XtC0fxAdR6GLnCy/4o28VODSlXewnCdPPoh4M78DvYgPBXbGzVKNy
         wH01bdli5hGWmXDct2Y2EN6uL9FP//27F1SylpdUc2mvIpyixQY1x3lNPTS7BTuUJ/b5
         fC0vXVwJywN2OPsEglSphj9tpeGqT4+BC+3bA603ZaS0LqZVsCVsUpVZNKaZBId/vK93
         Ge+N+m+fS14Qx5Y/LTsyhuSyDLqq6sEwtku7GyruGNPgwDv0qVgnCN2l8nXjlKXqo8i1
         vTug==
X-Gm-Message-State: AOAM530wMpqBeKemK2Df8LcYiTunxyruzg3uacpOZ6rF9R3bZcLjHapi
        FPZ6GyUe+UsTDfG2wHoqP0lC5iqq
X-Google-Smtp-Source: ABdhPJwvycxM6SCogAGLWBt3Y42n4PeQxQfYY+Kjjcjq87oZPWthhSmXQ/JF3tJfYR3F6I5t+Zlf+g==
X-Received: by 2002:a1c:81d0:: with SMTP id c199mr15489529wmd.125.1589758044984;
        Sun, 17 May 2020 16:27:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id d9sm14056278wmd.10.2020.05.17.16.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:27:24 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/3] doc: fix the warnings when building the doc
Date:   Mon, 18 May 2020 01:27:18 +0200
Message-Id: <20200517232719.1789-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200517232719.1789-1-luc.vanoostenryck@gmail.com>
References: <20200517232719.1789-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It seems that Markdown is now parsed slightly differently and
now generate some warnings.

So tweak the .md files to shut up the warnings.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 Documentation/TODO.md              |  6 +++++-
 Documentation/nocast-vs-bitwise.md | 34 ++++++++++++++++--------------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/Documentation/TODO.md b/Documentation/TODO.md
index cbda1c397e46..31826df33aae 100644
--- a/Documentation/TODO.md
+++ b/Documentation/TODO.md
@@ -32,7 +32,7 @@ Core
   ```
 
 Testsuite
---------
+---------
 * there are more than 50 failing tests. They should be fixed
   (but most are non-trivial to fix).
 
@@ -84,9 +84,13 @@ Longer term/to investigate
 * should support "-Werror=..." ?
 * All warning messages should include the option how to disable it.
   For example:
+
   	"warning: Variable length array is used."
+
   should be something like:
+
 	"warning: Variable length array is used. (-Wno-vla)"
+
 * ptrlists must have elements be removed while being iterated but this
   is hard to insure it is not done.
 * having 'struct symbol' used to represent symbols *and* types is
diff --git a/Documentation/nocast-vs-bitwise.md b/Documentation/nocast-vs-bitwise.md
index b649abcd5947..9ba5a789fc26 100644
--- a/Documentation/nocast-vs-bitwise.md
+++ b/Documentation/nocast-vs-bitwise.md
@@ -1,4 +1,5 @@
-# __nocast vs __bitwise
+__nocast vs __bitwise
+=====================
 
 `__nocast` warns about explicit or implicit casting to different types.
 HOWEVER, it doesn't consider two 32-bit integers to be different
@@ -16,25 +17,26 @@ harder to lose the type by mistake.
 
 So the basic rule is:
 
- - `__nocast` on its own tends to be more useful for *big* integers
-that still need to act like integers, but you want to make it much
-less likely that they get truncated by mistake. So a 64-bit integer
-that you don't want to mistakenly/silently be returned as `int`, for
-example. But they mix well with random integer types, so you can add
-to them etc without using anything special. However, that mixing also
-means that the `__nocast` really gets lost fairly easily.
-
- - `__bitwise` is for *unique types* that cannot be mixed with other
-types, and that you'd never want to just use as a random integer (the
-integer `0` is special, though, and gets silently accepted - it's
-kind of like `NULL` for pointers). So `gfp_t` or the `safe endianness`
-types would be `__bitwise`: you can only operate on them by doing
-specific operations that know about *that* particular type.
+- `__nocast` on its own tends to be more useful for *big* integers
+  that still need to act like integers, but you want to make it much
+  less likely that they get truncated by mistake. So a 64-bit integer
+  that you don't want to mistakenly/silently be returned as `int`, for
+  example. But they mix well with random integer types, so you can add
+  to them etc without using anything special. However, that mixing also
+  means that the `__nocast` really gets lost fairly easily.
+
+- `__bitwise` is for *unique types* that cannot be mixed with other
+  types, and that you'd never want to just use as a random integer (the
+  integer `0` is special, though, and gets silently accepted - it's
+  kind of like `NULL` for pointers). So `gfp_t` or the `safe endianness`
+  types would be `__bitwise`: you can only operate on them by doing
+  specific operations that know about *that* particular type.
 
 Generally, you want `__bitwise` if you are looking for type safety.
 `__nocast` really is pretty weak.
 
-## Reference:
+Reference:
+----------
 
 * Linus' e-mail about `__nocast` vs `__bitwise`:
 
-- 
2.26.2


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850591A69A0
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731406AbgDMQQY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731401AbgDMQQX (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:23 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD8CC0A3BE2
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:23 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id x4so9821316wmj.1
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HcMGBhGgYP7rGGer7xMYeIKG2OUaltk3M5QaYiQRZB0=;
        b=Inlm7Kk1ZrhPgB/9lyvv45VWe8OxFLukQO56egVnpo0xDK5N1FyFsU6DskN0SwCcqh
         aDfjYwGyRtXayhmAN0LUweOn5z6sQt9Gp6Jctnpnm3/A5MJ01ktD5JPIiVkX1msoF90V
         ittgQadqK6mST4XSV1hvLHYEYrWdzdaPh493V7HgBl8Ylm5wfNiOeLTFG49pQhHnYdjy
         9j5xOXC/U3c/enrzmnH7jsBU7fATy/n3DMzwFHOsPRbpCk7QcvBbtBWuBiADa4BOfnKo
         Exr8bN42yuIOX/MSVxsFNK0zVlpuxIhYr8AB4ikcgyR+vhvWryQ7tgKath5P3ep5J9KQ
         UGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HcMGBhGgYP7rGGer7xMYeIKG2OUaltk3M5QaYiQRZB0=;
        b=t6NiB1diGPZBH8Q7XEVN6ME1ZfKChozo+XfOoRVQi/y9EMyfS2/X9AK3ZkdDa4xIYk
         AIsl7lZvzNM3eoiw333O9dKfPBLSMBJP+q3BC5A26JJ4rCT3Q0apribu5HwUatqk/bZj
         oi0BSIHxg/G41xH+txENPenPzRWd4zfgHsM3royBbfYdGgrIKHLC4tp4FugN7c9S1c/0
         2HJgZex3FvZ/sqn21YyXdeKdaYvcpx1HkceEhCvKOMGBx8vTf+Mlj3D44KiQ6lj+A+0U
         ZRdKhrzdsFmuj8p/KNHJRreSW6zpU+087z994gFHsM2OPooQBdHIuimkvsWZMmmKKZgn
         Zo/A==
X-Gm-Message-State: AGi0PubLp86xGe0+RxnfbAuHV1XeTiGEKbBDJ1cafa8h4/VLc14g5VmW
        iFR+SEbqr/1lnxKvxiV94vt7Vb2a
X-Google-Smtp-Source: APiQypI1R+cNVTTxtUH9UFGm0Fuod3UGECZH8c+qSEjkhbvf2/02wVgBTaAwb3TzwOVVF97Q5E5Irw==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr19373947wmg.177.1586794581665;
        Mon, 13 Apr 2020 09:16:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:21 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 11/17] scope: make function scope the same as the body block scope
Date:   Mon, 13 Apr 2020 18:15:59 +0200
Message-Id: <20200413161605.95900-12-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, the function scope (only used for labels) and
the block scope of the function's body are distinct scopes,
none being a child from the other.

This is fine as these scopes are currently unrelated but:
* it's unneeded and somehow unintuitive
* checking that gotos doesn't jump inside and expression
  statement is easier if these scopes are properly nested.

So, make the function scope and the body's block scope one
single scope.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 scope.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scope.c b/scope.c
index 0e4fb3b42150..175d72c23762 100644
--- a/scope.c
+++ b/scope.c
@@ -91,8 +91,8 @@ void start_symbol_scope(void)
 
 void start_function_scope(void)
 {
-	start_scope(&function_scope);
 	start_scope(&block_scope);
+	function_scope = block_scope;
 }
 
 static void remove_symbol_scope(struct symbol *sym)
@@ -137,7 +137,7 @@ void end_symbol_scope(void)
 void end_function_scope(void)
 {
 	end_scope(&block_scope);
-	end_scope(&function_scope);
+	function_scope = block_scope;
 }
 
 int is_outer_scope(struct scope *scope)
-- 
2.26.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18A021A4A12
	for <lists+linux-sparse@lfdr.de>; Fri, 10 Apr 2020 21:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDJTAW (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 10 Apr 2020 15:00:22 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35479 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgDJTAW (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 10 Apr 2020 15:00:22 -0400
Received: by mail-wr1-f68.google.com with SMTP id g3so3330543wrx.2
        for <linux-sparse@vger.kernel.org>; Fri, 10 Apr 2020 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MRBqevuvOXA0o1VWm6XavN3K2Eyc0stFC4nXLvQSXoI=;
        b=JRbd2ci/BB0po2Ww0/VC/GVyfy5R8RPAKsTY13aoYq+ukJkdx2uRln4c4ZV62leGHg
         hmjvFHaS4yC3+oxR+cIBADqg7ikuE1U8dFy10hEd8KnDTzTgNxOTo4D7ER0VZhFZgYVe
         6OLhwKsQv7fnhLa2bZKsYZPO4B4IYsPI2tUEGeUR0iOd3UzAWr4r/2hIcA8IWcmnmGu2
         6OXiXCi5k47Ck9HcV0uXl9BRUwUkAn9iFEqXn6JgWVB3AqK7GxytOsoNvENO13RWDS84
         FDhFrlYGxEs5736QH/n/ox/tH/1tLOQ/76F9EjGZg7HcvO8G0pULV1U0jhfYMig+jQVX
         QdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MRBqevuvOXA0o1VWm6XavN3K2Eyc0stFC4nXLvQSXoI=;
        b=jt88dGuto+azZJjlkZVE62BqOFJfmUOOQ2KWMTuAe2419Jlce4lyRKRseKwFyaQ6+o
         o6Opjnq2EkCNpMo3q7ul0akI29ETKMFl/1bXGazn2dpdj3yzEdWUqmAowoeTHk49i2m/
         kvpf0qlIj0jjY8rSOGu3R/bwaIz+u9DwJ4iTo4PANuhwpHczTI1+4910v0OsGbGTX0hI
         y5dA7fPQCDeyw9IvOD1UmFBhgwYRUUY8gvnpL0qDkfLxkWYcutFIHmwkWNvIJqKfr3Ji
         t6qiY8t+voux5EJstWx9QmnCNLjWy6ysq+IYnMYolrE8OyvbRdZHm6W0RAm7RTupsvVi
         xuPg==
X-Gm-Message-State: AGi0PuYdFv09L+nq+KyeMiM81FgE5QDrfYnWid6R9K2XN36/CDLUMHf+
        Cmx+YzCQRe/BsBVt9NRa1te3X++R
X-Google-Smtp-Source: APiQypJgSK+ofjJLN/uzWQDevdgsGvdVVWH5fqQBDJ454JI1otge22QDsfttUqdnY6eE9cdMwjxbzw==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr3090190wri.385.1586545219296;
        Fri, 10 Apr 2020 12:00:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:957f:f707:be30:7cd4])
        by smtp.gmail.com with ESMTPSA id d2sm397239wmd.6.2020.04.10.12.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 12:00:18 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] no memset() needed after __alloc_scope()
Date:   Fri, 10 Apr 2020 20:58:16 +0200
Message-Id: <20200410185816.65557-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When starting some scopes, the newly allocated struct is
memset'ed with zero but this is unneeded since the allocator
always returns zeroed memory.

Remove the unneeded call to memset().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 scope.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scope.c b/scope.c
index 420c0f5a3f51..0e4fb3b42150 100644
--- a/scope.c
+++ b/scope.c
@@ -68,7 +68,6 @@ void rebind_scope(struct symbol *sym, struct scope *new)
 static void start_scope(struct scope **s)
 {
 	struct scope *scope = __alloc_scope(0);
-	memset(scope, 0, sizeof(*scope));
 	scope->next = *s;
 	*s = scope;
 }
@@ -77,7 +76,6 @@ void start_file_scope(void)
 {
 	struct scope *scope = __alloc_scope(0);
 
-	memset(scope, 0, sizeof(*scope));
 	scope->next = &builtin_scope;
 	file_scope = scope;
 
-- 
2.26.0


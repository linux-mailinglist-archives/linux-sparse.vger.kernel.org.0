Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08E641CD027
	for <lists+linux-sparse@lfdr.de>; Mon, 11 May 2020 05:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgEKDHB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 10 May 2020 23:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725830AbgEKDHA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 10 May 2020 23:07:00 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48AB0C061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 10 May 2020 20:06:59 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id l1so3321604qtp.6
        for <linux-sparse@vger.kernel.org>; Sun, 10 May 2020 20:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=i7IY87usJuGy1QqNB/Z7DvpuA4RuO4wg5MhYltde7Jg=;
        b=MDCjmAxGHfU1IDC3AKiGgTjxTdrAPdZrxnl1QKNprFxE40cTBVWdmxIh7cZC/SrJZZ
         Zez+q/KBSrKSsVgZHBwFvmo44PTLpKytiuixSEys3UZP07KFUXc4vMWxsDoUT8/DsuXc
         rb3OKmMMkC8z2bGa/8VcRh0kFj9aClYXt1LXd7LjuyZXMOS8TiDHgBYVzYfWl+nxQH0z
         bJ5r+8AbE8TAKW6wNtHHPkqR5kXkqfdlLiAWjW5mBbb5MZSRqEkCNM6wgc8KG26m9q6g
         452x/uJNJapYBRozcNj2ZYx3zrsvREbtCLifvuwDWtD+K3X0NXNS4f8WRW59NeWgrA15
         ik7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i7IY87usJuGy1QqNB/Z7DvpuA4RuO4wg5MhYltde7Jg=;
        b=c2amKsdnK3Y461FuUDbNFbv33GdxXAcgGnhTotLP5heyXCt8nadMWKNzHYQVyj0Xy7
         4TM6I76eir9Gi3W5YypXkGX4x4YYd1J3o8z2QjSAx3H19ryouacatnMkeFRC4YcCb0Kd
         ULcCPRc/Q0hjtaFV4tgFD8+RCakMu+/hDjwZUGe8kbn6u8zFm3eFIPlnWEm/9He/5XlE
         dMSHLX5AoT41eJ5CJHcXI8tMXXHgXrMgRhBBBnQOBxlkED+l1VpmiWTsaPVv3oncNrKx
         HymuIGi1qZOXn6ij8kCD/URq5vD0AHt5WsNb4lst4Z9G0I3DRTQQkUN0mJ66xdkaLbTC
         xgCw==
X-Gm-Message-State: AGi0Puax86rKfnjTUcXZ50ENB3DDMn5eT4O4B3P0AFgs6ieBfQ4WaVno
        Jx1+g7x9B/4CEJ+fvhFAxFguSty2
X-Google-Smtp-Source: APiQypJyXUhf60raLKqNWNqyn6RutbwXpjr5SLvgb34UUqC+ENwopHVPaJwqIYXorvjVqsB21n64Eg==
X-Received: by 2002:ac8:6159:: with SMTP id d25mr14716723qtm.70.1589166417804;
        Sun, 10 May 2020 20:06:57 -0700 (PDT)
Received: from darkstar.. ([2804:14c:5bd4:8264:f66d:4ff:fe73:55f5])
        by smtp.googlemail.com with ESMTPSA id y28sm2378419qtc.62.2020.05.10.20.06.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 May 2020 20:06:57 -0700 (PDT)
From:   Davidson Francis <davidsondfgl@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Davidson Francis <davidsondfgl@gmail.com>
Subject: [PATCH] show-parse: null pointer dereference in do_show_type()
Date:   Mon, 11 May 2020 00:06:20 -0300
Message-Id: <20200511030620.10329-1-davidsondfgl@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In do_show_type() the first if statement allows passing null
pointers, which can cause a null pointer dereference in some
cases, which I believe is not the desired behavior.

Fix this by changing the first if statement comparison.

Signed-off-by: Davidson Francis <davidsondfgl@gmail.com>
---
 show-parse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/show-parse.c b/show-parse.c
index 3aa06e47..11a487bc 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -300,7 +300,7 @@ static void do_show_type(struct symbol *sym, struct type_name *name)
 	int fouled = 0;
 
 deeper:
-	if (!sym || (sym->type != SYM_NODE && sym->type != SYM_ARRAY &&
+	if (sym && (sym->type != SYM_NODE && sym->type != SYM_ARRAY &&
 		     sym->type != SYM_BITFIELD)) {
 		const char *s;
 		size_t len;
-- 
2.11.0


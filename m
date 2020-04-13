Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F8A1A699F
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731402AbgDMQQY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731400AbgDMQQV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:21 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A2FC0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:21 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d77so9802459wmd.3
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MRBqevuvOXA0o1VWm6XavN3K2Eyc0stFC4nXLvQSXoI=;
        b=d3a2lqIk/JmcYLeOniCkSJDelhNTlkQqo1tbcOCzOlZImtu5LzvKZGvjVMDABh2VuL
         9dk/Gto8RW2HpG3l9qwjtJ5NvQ6EEJufSw2zxPec8THiUmCnsYPhDJ7he4RGqyGywy22
         n+dZOVw34dyOUQpNRrUWnqbcataSB81k8gqJR9FewQjNEihZ1kgpWvrTqRGdpb/+520m
         VJ2nram+EAuxMAPrefmlt2kh8Qwn2Ispdd8BFbYzS0v3xjEppc407OG5MnRcJg0N1A3d
         LoVLn4MRXr8lP+0aimGEMeBtmtnQxCnuwXzeTy1BiNpcIfSwIjuBizYXYN1Fe1A3I8cO
         STXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MRBqevuvOXA0o1VWm6XavN3K2Eyc0stFC4nXLvQSXoI=;
        b=nU7Ft8vgm6e7oi0GH/915aG/pUUOs2M1A07aN8O+26pwH/C5mAZnNwxflFARPiGFka
         wA4d4xHdpRT5TmotR033c/BkOt1CsBx4JT+0JOVjmn13Uk61UE8D0lscVeK+2KbpfV+d
         kibRG+shBfYXdJ3lP0vUF/LwgC6pIjROben7ms0MizBLb/B9QOLglbRGHvk8pZbEowkm
         V9tjXE/MeuIvmXKHjouM4el6TP8lFXgr2wsKYvP2u349z0kWMEW7/h5t2/IU1/J6zMhD
         n1qnEfQqDTMNpGcivZi9Lg3ir2ypzAHbsTz2a4109/JDcC9nFM2t8XPxrqPu/jUYxlmp
         Z6pQ==
X-Gm-Message-State: AGi0PuZGJw/BZE9XjIJxlbs9UAFHm4u4EiyphosYo8AJhphXCga1rkey
        r/m9op59WpysLr8vg9wYO0gz8Yhh
X-Google-Smtp-Source: APiQypLGGI4U/b3h9e1/SR7UjScAlEPOWYJVq8HhscJ7vICTE/RMIMASkblPrIaOMnqrcfW7c0SZ3A==
X-Received: by 2002:a7b:c250:: with SMTP id b16mr20115846wmj.100.1586794579537;
        Mon, 13 Apr 2020 09:16:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:18 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 09/17] scope: no memset() needed after __alloc_scope()
Date:   Mon, 13 Apr 2020 18:15:57 +0200
Message-Id: <20200413161605.95900-10-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
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


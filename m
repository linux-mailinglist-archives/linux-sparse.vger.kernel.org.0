Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4301EC0EB4
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728639AbfI0Xnl (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:41 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44905 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728565AbfI0Xnl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:41 -0400
Received: by mail-ed1-f68.google.com with SMTP id r16so3694356edq.11
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e4OmaF6OC3gjZP120sptRVAm/496uYugpt1ZAoFC1dw=;
        b=Ii3todN7AkzAtOmlhktxi3km/XjS8pVefR0czlVCODnDPHUJY/xGRgIAJPPlF+5ScF
         H85EF83BZykS/uDkQxWoTULFU2eQDS0o0rjVPva/naestq3m3e5HpPTrY4HPICNOZGVn
         87j+1qr7a3kyvvfUMTC34zr29SgJjVDB7l+av+X8+vMf97Z+8QBUxd7Pq2uSrpUSZ6qR
         MuXhKcn3hbRBzpyMSqjxZVqGDW67jIKvUTENW1BZjUPZ3J6XuKAPhftab2SORcmLgM4j
         uUZksKRpQERvcv2bF64voyLOg9M1ClPOlOOJG9FiQH4UOGJvkVO0vE+Yn1nPt1TeIV4Y
         fV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e4OmaF6OC3gjZP120sptRVAm/496uYugpt1ZAoFC1dw=;
        b=ufnsJgfJ/JfE1AIyTtZipSXqj4vPWy8h+dzxhK/++TYcVaFFRdpwOL1zG2+tCr5tVr
         yMGslqctuEODu1EI+qujtvKf0vWWbwaMcFIY5L4wGrySWP0WjMqBCLhcwg4VcWsIQltL
         RBnHBz5VtUl8eEQ/6ZFtvKVoofYQVPP5OnKv/7VF+RinuHnukaQjGALSeqwJBZ4FD4rc
         28rxI6vVTAPf42C14NuZzzu9Jy/tVeRSJC0/jQWcQcLFyg1lOhxyquFyKU/3ChCIyF9c
         Hvde6cbqCyH2pMdGfqwMIGtO51wy+qVg1PQqWXBYM8Y66qjkCSIYe6dRg/8qXuTOWa40
         swSw==
X-Gm-Message-State: APjAAAXwK3DI21MjJzHF8l6DUhhXFxFVn1vt5iVJa+AKK6q1Nuf/CWhE
        7u0qEf+islckRBCqgKeoU+jhHY2q
X-Google-Smtp-Source: APXvYqxGWxUKizdtIlfr5DvhAK/wOwlDmpkbdJ0e6AOMTQOibdCakqcw5Nn4KVEDcJ3IDY5EqIZ4sQ==
X-Received: by 2002:a17:906:3286:: with SMTP id 6mr9966972ejw.37.1569627819044;
        Fri, 27 Sep 2019 16:43:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:38 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 18/18] asm: arrays & functions in non-memory operand degenerate into pointers
Date:   Sat, 28 Sep 2019 01:43:22 +0200
Message-Id: <20190927234322.5157-21-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Non-memory asm operands are very much like the argument of a function
and as such any array (or function designator) given need to degenerate
into the corresponding pointer.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                  | 3 +++
 validation/eval/asm-degen.c | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index 4f7efc480..157260691 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3592,6 +3592,9 @@ static void evaluate_asm_memop(struct asm_operand *op)
 
 		evaluate_addressof(addr);
 		op->expr = addr;
+	} else {
+		evaluate_expression(op->expr);
+		degenerate(op->expr);
 	}
 }
 
diff --git a/validation/eval/asm-degen.c b/validation/eval/asm-degen.c
index 5f3191597..7bbed9255 100644
--- a/validation/eval/asm-degen.c
+++ b/validation/eval/asm-degen.c
@@ -29,7 +29,6 @@ static void qux(void)
 
 /*
  * check-name: asm-degen
- * check-known-to-fail
  *
  * check-error-start
 eval/asm-degen.c:12:24: warning: dereference of noderef expression
-- 
2.23.0


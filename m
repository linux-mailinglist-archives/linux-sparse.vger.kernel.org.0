Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 857491A699E
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731404AbgDMQQY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731402AbgDMQQU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:20 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59B9C008748
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:19 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id h2so9802740wmb.4
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OzTsH1p1RnezdIbMk73/uYEHpoHGztBYAp/2P07AW2w=;
        b=BkIyTvk/W5dLXVYkwpUiFIHXOAFpXTNGSKvoBgjxqzn8mKu5wshTZ2NlhiooeQ/v38
         g5O5ou0qlYiHRWBBsC51Lk3AKtREa3Etm7G1MWbjVrbjANKobHvlWWFmev4b5IErO7h/
         Vmm2wGFaRwrJBqlDvehZJKVCzGOa9TU37ET2FrpZzR8AxaQMIti3byjgn+UT6i4Ckiqn
         +r+x8UTDw8H1fXtENUwD1cKHHCDzKzkouV2xLhPH2+/xdvM00BQrFYo+p7BFCY0/VVsV
         61jhfZG+n6Ce06LraxhyOrwI8g5IDH/o1dz1jdvZm8ycoV7Nl2vMpem+7Fi8yOiokvey
         aFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OzTsH1p1RnezdIbMk73/uYEHpoHGztBYAp/2P07AW2w=;
        b=ogE+UgYK7kMjzdSjGtiAw0Z0sbpaviQ35n15Tt0ntqL0rIljXGlm8q9pBxsTHIYJzQ
         NMwzcUR1IA9WrSmauZaEBNQc/jr4zU3qopUTIILBZtznKCmTzHxciBj2G5vsmUFiYzxF
         xTFpi7+XA517tN1fEX10YOqgYI7u99DyYgAturbSvHYF08BvWGRE+PY1uUt+ZtqBAh0D
         Bg5ltc6LZF1w2C/4TRyJPm0r7fxIaRwB7L/Rl/V2XgPn3zwLrgC9PhzkCFPo1Bd7Ix3a
         oIc/rmSZjL+Pk5ycjZi+EJRGZRCEX5q/XIDQUuGUajgumuuCDH1Whvc2ZYmEn1fiKWfL
         qszg==
X-Gm-Message-State: AGi0Pubm7Hwgql/blvgXnBwcFZzTqfQfOqWO8QATbVBD8PM4zqxZb/KD
        N2525YsbDBDAsuq2wlpuF75av7UL
X-Google-Smtp-Source: APiQypIAhH1uSac6ZlPcHdEMI0qpdDL6b3CqG4iOW9a7HvpHalTimD6kNebds0HkVZ75bkmaDLtMyg==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr19473223wmb.93.1586794578404;
        Mon, 13 Apr 2020 09:16:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:17 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 08/17] bad-goto: catch labels with reserved names
Date:   Mon, 13 Apr 2020 18:15:56 +0200
Message-Id: <20200413161605.95900-9-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

If a reserved name is used as the destination of a goto,
its associated label won't be valid and at linearization
time no BB will can be created for it, resulting in an
invalid IR.

So, catch such gotos at evaluation time and mark the
function to not be linearized.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                          | 2 ++
 validation/linear/invalid-labels0.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index 14953f195fcc..99a9ee72d11f 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3751,6 +3751,8 @@ static void evaluate_goto_statement(struct statement *stmt)
 		sparse_error(stmt->pos, "label '%s' was not declared", show_ident(label->ident));
 		current_fn->bogus_linear = 1;
 	}
+	if (label->namespace == NS_NONE)
+		current_fn->bogus_linear = 1;
 }
 
 struct symbol *evaluate_statement(struct statement *stmt)
diff --git a/validation/linear/invalid-labels0.c b/validation/linear/invalid-labels0.c
index ae3bf7283fb8..a15e9d434011 100644
--- a/validation/linear/invalid-labels0.c
+++ b/validation/linear/invalid-labels0.c
@@ -11,7 +11,6 @@ void bar(void)
 /*
  * check-name: invalid-labels0
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-excludes: END
-- 
2.26.0


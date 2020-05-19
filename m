Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B7851D8CAC
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbgESA5q (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727902AbgESA5q (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:46 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6542C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:45 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id s3so10397922eji.6
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R2urzbgMrAAHAUm7A4wsMOp8T8bLdhV5gmocJXZk37Q=;
        b=j2TjJ0CyBu8a5IxBsNZF5M+VH0j3KqAK6TMyQOYpybgmUWx95rvzEteUWYBmFp4XYg
         60qa3nlQV2Vm2/V55/6BpTUljBCp06wst/r4ARJhCa8ljEmMW5clt3giNiV8e9g7KbsT
         SYgoIwSwF3vDILDkZd5EIuMwhzJQiOBIksdFf96FYyxOO6JdGy3SMYCUNjI7t8fH9qA3
         orp+GejHTaXMAwB6T/9tBSPGMF/ldHQ+VJIXSmTIHt9Y44ImO7uWQhj4lh8y7bNFZIv3
         +a1NFXGki4eKokNR9fB8dHpEHWF36yk3VGZW4nSg8ykV47HAWveHvbxgDH9X0//4BaU2
         orpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R2urzbgMrAAHAUm7A4wsMOp8T8bLdhV5gmocJXZk37Q=;
        b=mSgmzdETIa739CQ2XVzbZeecMyWaolm5jrO7NmxasHbKea0Wsv0V2juBNU/MUXSV2z
         8q2yKIPhdR187CvRC3mhgQ5+eqwA5PQ82jfMqj4IUlEbSW39ROeibHVUSrtmzF2sfBx3
         cUjYsF/CY92h4aEstN87fQK2/MGufZOFUL+D/ee/X8XqIIwHZvSdgChKHpnYkDhHewl5
         zAlY0v27rrxJHN4KJVCvu42uCtOwetp3ldwVnNOtQikiSvo+PuxSBPliHxrK1LOup8sf
         MkZ8CcLnM2G4frtdISzD9Cx4atqwPA8IVoc2qsaxA/xvWuWjz6Y1IMGXDtfNEGwTLg5J
         FWqQ==
X-Gm-Message-State: AOAM533nPreQ0c9Emch+MopN3Te5Mshg5v6tzRllhIu3X2bhjcanGtbY
        7HzJwYQ/BFBbN0WqaA80ay5uWTTy
X-Google-Smtp-Source: ABdhPJyQpuk/5bz6OXG2M8lxUtF3JNpkDMMg3vzayfqoLklhdlN4gk9a1YxLE0P1tOJrQio6hYegUQ==
X-Received: by 2002:a17:907:724e:: with SMTP id ds14mr11514900ejc.260.1589849864222;
        Mon, 18 May 2020 17:57:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:43 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 11/28] bad-goto: catch labels with reserved names
Date:   Tue, 19 May 2020 02:57:11 +0200
Message-Id: <20200519005728.84594-12-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
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
 evaluate.c                       | 2 ++
 validation/linear/goto-invalid.c | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index c757fc82b204..21d5d761627f 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3752,6 +3752,8 @@ static void evaluate_goto_statement(struct statement *stmt)
 		sparse_error(stmt->pos, "label '%s' was not declared", show_ident(label->ident));
 		current_fn->bogus_linear = 1;
 	}
+	if (label->namespace == NS_NONE)
+		current_fn->bogus_linear = 1;
 }
 
 struct symbol *evaluate_statement(struct statement *stmt)
diff --git a/validation/linear/goto-invalid.c b/validation/linear/goto-invalid.c
index 569d0b0d2db1..860b32a41ef9 100644
--- a/validation/linear/goto-invalid.c
+++ b/validation/linear/goto-invalid.c
@@ -11,7 +11,6 @@ void bar(void)
 /*
  * check-name: goto-invalid
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-error-ignore
  * check-output-ignore
-- 
2.26.2


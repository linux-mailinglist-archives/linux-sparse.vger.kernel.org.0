Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C04119EEF
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfLJW7l (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:41 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50443 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727313AbfLJW7l (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:41 -0500
Received: by mail-wm1-f67.google.com with SMTP id p9so5041913wmg.0
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=enqUqKi8TMXrJ+sAE3h1BzmZePnagWROYI3DQK5bfgA=;
        b=CTUM8Tw2PTxuPEoVS7/21UQS+beOtHCJRThlsw8523tceZ/RVFZgEcUqCMnRdkDtKa
         QlxXsgIuWENrwdeOXyZByEg99ZHjZlNLjrFKaYZ+BMv5UXwao+iAB4YRWDZe3JdDm4JY
         qf8J4DQoVby/Dy3tZ6ufeYpyIXHd3AL2LJXtxKJZrFhLG/MzKEHilqBYKTloiEDxcWaT
         y3TPKwgiNL8M7Ag1k6BeqIvqcbFwLHgxThAyaGuQAUfMnmRKoB1ELj93IAusVGzodwh9
         Vv9LJdR9o1z6Jd/cfdrkmSYx54a5vvXFNm0CtWI4Czg4y1y5rFZmj4Ne5Y6mEZiCAtEZ
         gdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=enqUqKi8TMXrJ+sAE3h1BzmZePnagWROYI3DQK5bfgA=;
        b=WafR2MczpnJcymldsgwO3wiEAU1wXE1ud/2YnQHUS4iCabwMM71CRBPRTmhQhPwxif
         7Zq9gQ/mcVnosGzYtLv2b3X8xaLG+AcEnVIRHzjDtgnq89NhMM3y60VE3OpKZrFdohkV
         5wzUOI9PiLBuQ565xwY2ofN/S/qWT7mmjn6qitxN0XTj8uxCGDIuNr0SPGkzwQ8An8X3
         WERwNmBYOI7eAxcLpSdIDL96dOk5n/yKhTLSn9oAmEjF/v3Iq/u2PZaK2VdNvtAL7f+b
         XZav6dp4LSV4DEBUAsNf2kL+U+akzrgcWPB7pKjO/aOgm9Os0yxKy9wtpvUGa8UZyv2s
         aMcA==
X-Gm-Message-State: APjAAAWLD2InKfajs9UndmRHs5lgRvqJxPL1wkijfy9RRUXRwIkVnhD1
        qtrsbnxGG8HLr+JGGcuRWZnEE4ok
X-Google-Smtp-Source: APXvYqz4PWcmb6oizNYY9J2H7vClsUm1bWqx+aBWle7YugqCrQSGQEAao3PYxVokJy/B1/xKQyyhTQ==
X-Received: by 2002:a1c:5981:: with SMTP id n123mr7386253wmb.52.1576018778579;
        Tue, 10 Dec 2019 14:59:38 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:37 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 08/17] extract mark_addressable() from evaluate_addressof().
Date:   Tue, 10 Dec 2019 23:59:12 +0100
Message-Id: <20191210225921.94897-9-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is just moving the 3 lines of code to mark a symbol
as addressable in a speparate function.

This is a preparatory step for one of the next patches.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 19bdab920009..d78de2edf1ed 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -1540,6 +1540,14 @@ static int compatible_argument_type(struct expression *expr, struct symbol *targ
 	return compatible_assignment_types(expr, target, rp, where);
 }
 
+static void mark_addressable(struct expression *expr)
+{
+	if (expr->type == EXPR_SYMBOL) {
+		struct symbol *sym = expr->symbol;
+		sym->ctype.modifiers |= MOD_ADDRESSABLE;
+	}
+}
+
 static void mark_assigned(struct expression *expr)
 {
 	struct symbol *sym;
@@ -1780,10 +1788,7 @@ static struct symbol *evaluate_addressof(struct expression *expr)
 	ctype = op->ctype;
 	*expr = *op->unop;
 
-	if (expr->type == EXPR_SYMBOL) {
-		struct symbol *sym = expr->symbol;
-		sym->ctype.modifiers |= MOD_ADDRESSABLE;
-	}
+	mark_addressable(expr);
 
 	/*
 	 * symbol expression evaluation is lazy about the type
-- 
2.24.0


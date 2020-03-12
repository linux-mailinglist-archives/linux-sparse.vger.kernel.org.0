Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB73C183AA9
	for <lists+linux-sparse@lfdr.de>; Thu, 12 Mar 2020 21:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgCLUc6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 12 Mar 2020 16:32:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:44581 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726706AbgCLUc6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 12 Mar 2020 16:32:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id l18so9198738wru.11
        for <linux-sparse@vger.kernel.org>; Thu, 12 Mar 2020 13:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JA3nfuyN+JC57eud1J3qZdoVJ0JYiTnnPLe6BiGqJsE=;
        b=XrIEpRcG8qwMsCuBfHKJm2iTVSQ8VHR4GmMEgfgvWAfhIjR/+ctEz95rnUOzhrdMAP
         G2e69XBt5GqGlwNm60jD7P5tpc1nR38+Y8tx0CKAZgEKWpSuRBd5eDe4gJ8ytaCrgWjE
         Alb6M0nsY4tX8KJcOivWsEWysB8UhQzrQjGEx6pnP4CIDruiMJZQrjkG1yeSiL5cLBEk
         51MeDOXfFseDuOfgaRUvvYFpfYbax2e+0DAtI57TG45m84rVTQR6I8fm9TpJkCnsgeGO
         V7PZRb2UDkVTjqk+hE3m6mq51W4atE2bhwV/QtsClzwcmqRJ6UeN8mZp16wqvF4I1zY+
         /CNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JA3nfuyN+JC57eud1J3qZdoVJ0JYiTnnPLe6BiGqJsE=;
        b=WalqQbVtvLl0DLCZkbcro7t+eh2t2O2P+OJ9c5E58dAigcDQoSPDB5rVXM4+mFG2eD
         P4hdXjiZT4UeqDRbDE+Li3xLhKod1tfSSEoXWJ5mIAZaskZ/ISxWtCfKurNp+87Mjxgh
         g4wzWQ/FRpg3iuiW5esSFMVHS5DNm0BSSR5fvGRcXz3mmBtiQXur6FdLtKHcvZZKUKCY
         jL4xnl+MowogvtxnJXkqRppK3hlkjZEV27LUIF+atnCOy8qcUawgNIDjERomoGnEVnUQ
         yFPHYzOZ+aPiWQv0T12D8l9Wz28SkDI4V8/w0bLZZMgcC/G7ZKIjpfdoLNViqPgDoivF
         UzSQ==
X-Gm-Message-State: ANhLgQ2f5BSQfSY8V1/GU1v5O9ObTBa+/ibnuPEWwikaQBubdmA6xRB9
        Tb8kxyv94hLe44UKQ2/GW+ZNbqHk
X-Google-Smtp-Source: ADFU+vtJoKh/D6j6svUP+CqzgCj4uy3f7+mTI+JHkcp8Nj7jjsJWnXn2nk1MbUYHdMsnA8j3v1eglQ==
X-Received: by 2002:a5d:5286:: with SMTP id c6mr12463502wrv.418.1584045175511;
        Thu, 12 Mar 2020 13:32:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4075:2100:dce0:d823:c691:d081])
        by smtp.gmail.com with ESMTPSA id f9sm25192656wrc.71.2020.03.12.13.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 13:32:55 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>
Subject: [PATCH] cpp: sanitize redefining a macro during its own expansion
Date:   Thu, 12 Mar 2020 21:30:52 +0100
Message-Id: <20200312203052.52764-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The presence of preprocessor directives within the arguments
of a macro invocation is Undefined Behaviour. Some of these
directives, like the conditionals, are harmless.

OTOH, the redefinition of a macro during its own expansion
is really nasty. However, it can be given a reasonable meaning:
* use the initial definition for the macro body
* use the new defintion for its arguments, in text order.
It's what gcc & clang do. But Sparse can't handle this
because during the expansion, a reference to the initial
macro's body is not kept. What is used instead is the
'body currently associated with the macro'.

Fix this by always using the body associated with the
macro at the time of its invocation.

Testcase-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 pre-process.c                          |  4 ++--
 validation/preprocessor/expand-redef.c | 15 +++++++++++++++
 2 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 validation/preprocessor/expand-redef.c

diff --git a/pre-process.c b/pre-process.c
index 2893c3ab65d4..6670fb0cd557 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -756,7 +756,7 @@ static int expand(struct token **list, struct symbol *sym)
 	struct token *last;
 	struct token *token = *list;
 	struct ident *expanding = token->ident;
-	struct token **tail;
+	struct token **tail, *expansion = sym->expansion;
 	int nargs = sym->arglist ? sym->arglist->count.normal : 0;
 	struct arg args[nargs];
 
@@ -776,7 +776,7 @@ static int expand(struct token **list, struct symbol *sym)
 	expanding->tainted = 1;
 
 	last = token->next;
-	tail = substitute(list, sym->expansion, args);
+	tail = substitute(list, expansion, args);
 	/*
 	 * Note that it won't be eof - at least TOKEN_UNTAINT will be there.
 	 * We still can lose the newline flag if the sucker expands to nothing,
diff --git a/validation/preprocessor/expand-redef.c b/validation/preprocessor/expand-redef.c
new file mode 100644
index 000000000000..4ca13e661fa4
--- /dev/null
+++ b/validation/preprocessor/expand-redef.c
@@ -0,0 +1,15 @@
+#define f(x) x x
+f(1
+#undef  f
+#define f 2
+  f)
+
+/*
+ * check-name: expand-redef
+ * check-command: sparse -E -Wno-directive-within-macro $file
+ *
+ * check-output-start
+
+1 2 1 2
+ * check-output-end
+ */
-- 
2.25.1


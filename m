Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 081CEC9371
	for <lists+linux-sparse@lfdr.de>; Wed,  2 Oct 2019 23:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbfJBVXt (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 17:23:49 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:38509 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728220AbfJBVXt (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 17:23:49 -0400
Received: by mail-ed1-f65.google.com with SMTP id l21so514850edr.5
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 14:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MWM7wygThjAfc6uAawOxVbl58aj9+AYU5Yq2CEmQu7c=;
        b=J3sV3RFzM48fN42bHM2G5suOBh6+zTx56B6l+h76UPd/AYHJsuk2l1Ajp0C0izl5wD
         Abvbq5n6LPGiV+YKlzp7roduefax7T3Br3iVIc2mzTT5newLlp75AGpuJUIYjbBYOzur
         v/NhQuJN0JEmxavK72/RBELvabV0vSHZzF5CzF7hAl98qQn/VbVpJHn+/ihs3o38KL8G
         M+sZBQtZwn4z6h8H/JZ/35fXVTNbE5obKDgTS63wvezKUrlQRFG6zDOhmnFgsHaxtBn+
         vr+PkGWlGNUJ6sUy42EKSRjBrXMVjiAUrdzDq7zg5HPr57b+JhqOXNX8ee6fBfupdIq/
         jbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MWM7wygThjAfc6uAawOxVbl58aj9+AYU5Yq2CEmQu7c=;
        b=DWqarJnZJlYmDdgCfZbfzUP6+h1pLWRiLFMqJWT/AkYvJ7o5TIqwmZIgv1G5Dk+FXd
         o6u1mjmKNUtdvPVK/GGoE3+sHXTJp6TZ13SY+tsJPhVlh/iRk0bMn+g8WjbB79LWWECM
         +MbZJvS6voviLXlgkWXPF/WZO6POut5eZHEXbZ9wgbLW1HhNwpZ6DzJcsEkoqT7otXdw
         55p6Op5D/vLigV8dB63bkGgsxB+WcP8vwbgaiUBCNjEVGc7prB6iqLM6w2RlhsWDaFeo
         9KmMy6IaUIhwJYjSe/epvkl47cglVfcloC7Z7IDc/pNpT94o/7PH673KqhyuoVDM0T31
         zk7A==
X-Gm-Message-State: APjAAAXgf6e5IW40EHAGBU1nao5Y3FAiCPxK96GCQINQ8n9y+w1LdWcB
        E3YVtioOP2iXSEnrBiFVI0P5nuFm
X-Google-Smtp-Source: APXvYqwFXnlcvk5rya7TorjVK7ybB4xRfFK0IJORrXABAXoiTIVfsj1OYw1aKe3UPldj/0w1a3ZEGw==
X-Received: by 2002:a50:e613:: with SMTP id y19mr6186775edm.290.1570051426588;
        Wed, 02 Oct 2019 14:23:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:3985:a315:dc4f:6706])
        by smtp.gmail.com with ESMTPSA id f36sm62847ede.28.2019.10.02.14.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 14:23:45 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] void-cond: allow void in conditional expression
Date:   Wed,  2 Oct 2019 23:23:33 +0200
Message-Id: <20191002212333.51017-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
References: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

As an extension, allow conditional expressions (?:) with one
side of type 'void' and consider the result to also be void.

The warning can be reinstated with the flag '-Wcond-void'.

Note: I only see a single occurrence of this in the kernel.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                   | 7 +++++++
 lib.c                        | 2 ++
 lib.h                        | 1 +
 sparse.1                     | 7 +++++++
 validation/cond-err-expand.c | 2 +-
 5 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/evaluate.c b/evaluate.c
index 919c944cf..fb1a0548d 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -1205,6 +1205,13 @@ static struct symbol *evaluate_conditional_expression(struct expression *expr)
 		goto out;
 	}
 
+	// extension: allow the result be void is one side is void
+	if (ltype == &void_ctype || rtype == &void_ctype) {
+		ctype = &void_ctype;
+		if (!Wcond_void)
+			goto out;
+	}
+
 	if ((lclass | rclass) & TYPE_PTR) {
 		int is_null1 = is_null_pointer_constant(*cond);
 		int is_null2 = is_null_pointer_constant(expr->cond_false);
diff --git a/lib.c b/lib.c
index 83e6a1e1b..c16d87778 100644
--- a/lib.c
+++ b/lib.c
@@ -257,6 +257,7 @@ int Wbitwise_pointer = 0;
 int Wcast_from_as = 0;
 int Wcast_to_as = 0;
 int Wcast_truncate = 1;
+int Wcond_void = 0;
 int Wconstant_suffix = 0;
 int Wconstexpr_not_const = 0;
 int Wcontext = 1;
@@ -639,6 +640,7 @@ static const struct flag warnings[] = {
 	{ "cast-from-as", &Wcast_from_as },
 	{ "cast-to-as", &Wcast_to_as },
 	{ "cast-truncate", &Wcast_truncate },
+	{ "cond-void", &Wcond_void },
 	{ "constant-suffix", &Wconstant_suffix },
 	{ "constexpr-not-const", &Wconstexpr_not_const},
 	{ "context", &Wcontext },
diff --git a/lib.h b/lib.h
index 697c977a1..2549c8872 100644
--- a/lib.h
+++ b/lib.h
@@ -145,6 +145,7 @@ extern int Wbitwise_pointer;
 extern int Wcast_from_as;
 extern int Wcast_to_as;
 extern int Wcast_truncate;
+extern int Wcond_void;
 extern int Wconstant_suffix;
 extern int Wconstexpr_not_const;
 extern int Wcontext;
diff --git a/sparse.1 b/sparse.1
index beb484423..71ac0c646 100644
--- a/sparse.1
+++ b/sparse.1
@@ -117,6 +117,13 @@ Sparse issues these warnings by default.  To turn them off, use
 \fB\-Wno\-cast\-truncate\fR.
 .
 .TP
+.B \-Wconditional\-void
+Warn if one side of a conditional expression (\fB? :\fR) is of type
+void and the other one not.
+As an extension, Sparse consider the result of such expressions as also
+having the type void.
+.
+.TP
 .B \-Wconstant\-suffix
 Warn if an integer constant is larger than the maximum representable value
 of the type indicated by its type suffix (if any). For example, on a
diff --git a/validation/cond-err-expand.c b/validation/cond-err-expand.c
index b52624bc9..714cb23eb 100644
--- a/validation/cond-err-expand.c
+++ b/validation/cond-err-expand.c
@@ -15,7 +15,7 @@ void bar(void)
 
 /*
  * check-name: cond-err-expand.c
- * check-command: test-linearize -Wno-decl $file
+ * check-command: test-linearize -Wcond-void -Wno-decl $file
  *
  * check-error-start
 cond-err-expand.c:8:11: error: incompatible types in conditional expression (different base types):
-- 
2.23.0


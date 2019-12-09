Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA72911796B
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Dec 2019 23:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbfLIWgL (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 9 Dec 2019 17:36:11 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42972 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfLIWgL (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 9 Dec 2019 17:36:11 -0500
Received: by mail-wr1-f67.google.com with SMTP id a15so17898450wrf.9
        for <linux-sparse@vger.kernel.org>; Mon, 09 Dec 2019 14:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aK5J+TuS7i0Ceaj4gHzHn0T5R4bSR2NBODkIA+tCmrY=;
        b=DQJOVK8zaCEPvQwJtlSfpV40L1c8mvAZzTv5RF1R2ea8sPh7+ibElakSaU4X2oOhA0
         nBdU9uGHhwLfZx8JblH97h1FVEsKHZQY61QXoOChbybgygESVeXhG9po1Rd15Kp6xLzW
         jswMFQSg/DsF1TrMfRwk0gS2UDk4OoXvolAlQipXNFeEIHGrg3BH+CN0MR9NqssbrPVy
         ByKdoUPF6FN03qWRvHC6dhf9ALxdnKJ5MQ76h+8EVJUSmCQk823xLyJjel7RhHRFUJXj
         4UTI92rHllmZGn+RYTOcXeiSgltTmwj4Y0AWMsV4ZWhVGp1N3Usygx9tjpMdA+d/4cep
         vztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aK5J+TuS7i0Ceaj4gHzHn0T5R4bSR2NBODkIA+tCmrY=;
        b=QwrrOPMSpc0+22hx/MwqnlE/qM3RiHFlgZLfU1tVqWJFP8U8GdYmaxDNniCIA+26IN
         R5tTweom6atwjLLbETfSqMAwUSSqk3Z7x+AdPXXED8UPr4+jHfRqsrFFg8F6N5vjFMdm
         fm2wuDUDyp+Y1LwpoJS8nh5v+l0G/38BGO0boLkGkxQH7zYFXRNHMGjIMrHimLOFjakT
         FzThdF1/9ypQdsG3mtcqzORUHG4CGdFfYoxOnvrAsQ+ZubzfEZI0l2iS73DG06gJPslJ
         9CW4p/46ftBaX6vfsSOmtPlEc4Xd/2DzFpW+cACPz4GaXnVpho7jL8axeLIAVz/l2K3x
         VV/A==
X-Gm-Message-State: APjAAAUv1C0ubUYEIF0+hw/rtTYHmGHptZt+djaKoteExGkewmwp6xBF
        nG9T8Q6g869JzbQko7Awi1BsWe+k
X-Google-Smtp-Source: APXvYqzPlgLi5AfqKUZbjDiXZe+Q2tX291P3EpfWRwUxFrFVDGBsT06SGSlsDM28LdCuZlHhiJ8e+Q==
X-Received: by 2002:adf:f2d0:: with SMTP id d16mr4412368wrp.110.1575930969071;
        Mon, 09 Dec 2019 14:36:09 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:28ec:96ef:ca6d:e5dd])
        by smtp.gmail.com with ESMTPSA id v17sm943346wrt.91.2019.12.09.14.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 14:36:08 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] fix premature examination of dereferenced object
Date:   Mon,  9 Dec 2019 23:34:05 +0100
Message-Id: <20191209223405.58657-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

in the fixes 696b243a5ae0 ("fix: evaluate_dereference() unexamined base type"),
the pointer's examination was done prematurely, before the undereferenceable
types are filtered out. This allows to examine the base abstract types when
the expression was in fact not dereferenceable.

Fix that by moving the examination to the top of the SYM_PTR's case
since only pointers are concerned.

Fixes: 696b243a5ae0 ("fix: evaluate_dereference() unexamined base type")
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                              |  2 +-
 validation/eval/premature-examination.c | 27 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 validation/eval/premature-examination.c

diff --git a/evaluate.c b/evaluate.c
index 19bdab920009..ff6938a5cfb4 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -1817,7 +1817,6 @@ static struct symbol *evaluate_dereference(struct expression *expr)
 		ctype = ctype->ctype.base_type;
 
 	target = ctype->ctype.base_type;
-	examine_symbol_type(target);
 
 	switch (ctype->type) {
 	default:
@@ -1827,6 +1826,7 @@ static struct symbol *evaluate_dereference(struct expression *expr)
 		*expr = *op;
 		return expr->ctype;
 	case SYM_PTR:
+		examine_symbol_type(target);
 		node = alloc_symbol(expr->pos, SYM_NODE);
 		node->ctype.modifiers = target->ctype.modifiers & MOD_SPECIFIER;
 		merge_type(node, ctype);
diff --git a/validation/eval/premature-examination.c b/validation/eval/premature-examination.c
new file mode 100644
index 000000000000..bd2ffa90051a
--- /dev/null
+++ b/validation/eval/premature-examination.c
@@ -0,0 +1,27 @@
+extern int i;
+
+int foo(void)
+{
+	return *i;
+}
+
+int bar(void)
+{
+	return i[0];
+}
+
+int *qux(void)
+{
+	return &i[0];
+}
+
+/*
+ * check-name: premature-examination
+ * check-command: sparse -Wno-decl $file
+ *
+ * check-error-start
+eval/premature-examination.c:5:16: error: cannot dereference this type
+eval/premature-examination.c:10:17: error: cannot dereference this type
+eval/premature-examination.c:15:18: error: cannot dereference this type
+ * check-error-end
+ */

base-commit: 9b2efc158c5c9700ffe355c59356879df7c9cc12
-- 
2.24.0


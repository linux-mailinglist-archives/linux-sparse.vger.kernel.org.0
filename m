Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D822F5F61
	for <lists+linux-sparse@lfdr.de>; Sat,  9 Nov 2019 14:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfKINf1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 08:35:27 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:45908 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfKINf1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 08:35:27 -0500
Received: by mail-wr1-f65.google.com with SMTP id z10so4672706wrs.12
        for <linux-sparse@vger.kernel.org>; Sat, 09 Nov 2019 05:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5/juAgA56dR1i/t9MlgOy7tTEugKYzVMvmb5FZ4zSNM=;
        b=G8atR775PSVYwydoSK6YFsoDRu3a35RCJzZFC/u83bD6rVWdSYjWBw2hTuFu//yOtp
         hI527SrZTU+ihYknK25FBOW+JxwlubrDfOLWK9oLj0J5JLJHyd6Q+8m6bZZSEvBcOcnc
         bnq0l4aGxa5CLbvb7M1Dw+W+ZFc/tbi7n3en9UbLlGldWMn/xwOCE4G82j6GYweFdLf0
         UklrhYJ5h6IjzpOTSk0IXZP/PaSK19ftw9fbvOaUS5wRAnhcXFmXypp8aZm/pMPhyOdQ
         BsysGumxLcG6bPgkhwowdCTEh4ENjhSXb8iNo2NZNRruNpoog3e8N9gzt7b6/MtLzB26
         tWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5/juAgA56dR1i/t9MlgOy7tTEugKYzVMvmb5FZ4zSNM=;
        b=i+UqE+NBuuV4Q8Qf4st9iteVhFooZp4hnUbvvfHWjaPJudqR7nvlMb0DNneKq5MpQg
         G4kriQqR+icDHDkYt+lndE04ySpqyCWcwKaVmb0wXN5LaL5LIrupPU3U/G+gX2Cp4bJ/
         ZyvlOgJwyzLQH8anP8k5TVF0+IqQAQoLJO3sMzCr7CvapondN5wWZ5W85SrYy6yahu34
         eInxUEgRpqtRtDdznz+uj6RNoZ6cArfqUHyPaCFFlfrtGHpzQSf8J0T6DDqmCK0MqTLk
         2Z2i+9nCWnr/Ip/e34BevESkiS3o2pl2QJQS9T5eJvjuY3BfmeTU4/dIqwAnzv/3oUBJ
         OyDg==
X-Gm-Message-State: APjAAAW6Ll+5cXLZ5ZjeevjzNDwb5QE8EGNPoAqJ8HBwIyGivesm9vQk
        lrNhJ1U6HJLTXbqAWjXLkofRu91e
X-Google-Smtp-Source: APXvYqxM9mQ5tLJDlvydF2Js5o5wjcIv1mx4tj3rzcDXAETN9sdDn1ssAojEKoaeXqM+o9+eGv84eQ==
X-Received: by 2002:adf:f905:: with SMTP id b5mr13165973wrr.122.1573306524884;
        Sat, 09 Nov 2019 05:35:24 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:417d:57dd:ed4c:6a6d])
        by smtp.gmail.com with ESMTPSA id j66sm8124422wma.19.2019.11.09.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Nov 2019 05:35:24 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/4] show-type: add a test program to test do_show_type() & friends
Date:   Sat,  9 Nov 2019 14:35:16 +0100
Message-Id: <20191109133519.63010-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
References: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add another small client doing nothing but display the type
of the toplevel symbols.

This will help to test further changes in do_show_type().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 .gitignore       |  1 +
 Makefile         |  1 +
 test-show-type.c | 28 ++++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 test-show-type.c

diff --git a/.gitignore b/.gitignore
index 7565fd56d..da103de82 100644
--- a/.gitignore
+++ b/.gitignore
@@ -20,6 +20,7 @@ compile
 graph
 test-dissect
 test-linearize
+test-show-type
 example
 test-unssa
 ctags
diff --git a/Makefile b/Makefile
index a87d06438..deab48976 100644
--- a/Makefile
+++ b/Makefile
@@ -80,6 +80,7 @@ PROGRAMS += test-dissect
 PROGRAMS += test-lexing
 PROGRAMS += test-linearize
 PROGRAMS += test-parsing
+PROGRAMS += test-show-type
 PROGRAMS += test-unssa
 
 INST_PROGRAMS=sparse cgcc
diff --git a/test-show-type.c b/test-show-type.c
new file mode 100644
index 000000000..8396fdcf5
--- /dev/null
+++ b/test-show-type.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: MIT
+
+#include <stdio.h>
+#include "lib.h"
+#include "symbol.h"
+
+static void show_symbols(struct symbol_list *list)
+{
+	struct symbol *sym;
+
+	FOR_EACH_PTR(list, sym) {
+		printf("%s;\n", show_typename(sym));
+	} END_FOR_EACH_PTR(sym);
+}
+
+int main(int argc, char **argv)
+{
+	struct string_list *filelist = NULL;
+	char *file;
+
+	sparse_initialize(argc, argv, &filelist);
+	Wdecl = 0;
+	FOR_EACH_PTR(filelist, file) {
+		show_symbols(sparse(file));
+	} END_FOR_EACH_PTR(file);
+
+	return has_error;
+}
-- 
2.24.0


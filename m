Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBCEB20A569
	for <lists+linux-sparse@lfdr.de>; Thu, 25 Jun 2020 21:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403935AbgFYTD6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 25 Jun 2020 15:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403781AbgFYTD6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 25 Jun 2020 15:03:58 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64C94C08C5C1
        for <linux-sparse@vger.kernel.org>; Thu, 25 Jun 2020 12:03:57 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id t21so5042884edr.12
        for <linux-sparse@vger.kernel.org>; Thu, 25 Jun 2020 12:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J0ZWG5LUk20dmd5DAm4JyYxPmCi8vWaSBYy/xN/ic5g=;
        b=Dvwly+qbNWD2ejfvAQ2p8fO5YYuvQEzJxZeW4Mzg0Jzhy4U8vkvjW8iqHP/khalFD+
         qjIsKl3YozuQD5+GeJ7ji67Vl5hHq1voublDdf+Q7IM7s297NfF1F3SDaA9VlVhxxf4k
         X9QLPRgbyaH+m1bqkGviFO4lhyAcpJytjeFsZq9NY1EP0/Oar49wCHVTitfGl6JPb5DF
         s89vBElo44jQhMIc+Twpcx3pNFVYpJ4c8Bxaa5oivxQKu7/CzXA3kmidBjO9O2zobgGe
         hnmKJfvTgT6niJeFPjywS/5pBWuPJKUP7ah4EcyxqfPnGO7lTTDZ5Z5Sw05T3UhQv9FB
         BLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J0ZWG5LUk20dmd5DAm4JyYxPmCi8vWaSBYy/xN/ic5g=;
        b=O4+CuLzHLgtUvbgbL8PqVokYg++tftnI9q5IxxYYxO6Ebt32jt+VTT14cURMScsRto
         9aA5z+8IIhl/DhEh16UUbSYSCREvmgAUFycGx2V+rw1Jg4TfsTpCKkgaUOo3GsHt3arB
         DS3YSxaRuKzKWT1dF8bC9ZF7juRYS2As0oHK/JnMjR34QKFxnbVvGSPWwklHCBbJzOtQ
         iMGsd5y5vU0PB3ex+yoKCBCTkk4XaevDBm6p19IOvET88ZRI2TL2vVto4Df4BLkQ5ZGy
         R7O96+wOAWwftK1sXIG2icAVLb/nQMXTU5nY/qBWlQWuoZ7TYtS92wyk3C7rP4rncUq4
         CNKQ==
X-Gm-Message-State: AOAM530mL9SEwUjuutL+g5eZVPa3QvV5vOv050XJ3yD7tbUpyFLAMs/8
        Htpe1JVD8uTvFVJae2XPb+bGUdgw
X-Google-Smtp-Source: ABdhPJz3aUzWaYKQVnkeQtPZMypztT/ckoovKaOORjPx1cS39S5/jpyHZ4yK8HClPAkTXRIIun4GIg==
X-Received: by 2002:aa7:c41a:: with SMTP id j26mr33878605edq.13.1593111835758;
        Thu, 25 Jun 2020 12:03:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:9929:bf7d:5bd8:ccd4])
        by smtp.gmail.com with ESMTPSA id di20sm10132365edb.26.2020.06.25.12.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 12:03:55 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] avoid multiple warnings when inlining undeclared calls
Date:   Thu, 25 Jun 2020 21:03:49 +0200
Message-Id: <20200625190349.3665-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

When inlining multiple times a function which contains an undeclared
function call, multiple error messages are issued. More annoyingly,
only the first one is meaningful, the other ones doesn't even show
the incriminated identifier:
	error: undefined identifier '...'
	error: not a function <noident>

Part of the problem is that the first message is displayed with
expression_error() which also sets the expression to &bad_ctype.
This change the way how the expression is handled when re-evaluated.

Current fix is to avoid the evaluation of function call if already
set to bad_ctype: it's known that an error message have already been
issued for them and that nothing good can done with them.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                         |  4 ++++
 validation/eval/undecl-no-indent.c | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 validation/eval/undecl-no-indent.c

diff --git a/evaluate.c b/evaluate.c
index 461c2547285f..3b9aec3c13c0 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3130,6 +3130,10 @@ static struct symbol *evaluate_call(struct expression *expr)
 
 	if (ctype->type != SYM_FN) {
 		struct expression *arg;
+
+		if (fn->ctype == &bad_ctype)
+			return NULL;
+
 		expression_error(expr, "not a function %s",
 			     show_ident(sym->ident));
 		/* do typechecking in arguments */
diff --git a/validation/eval/undecl-no-indent.c b/validation/eval/undecl-no-indent.c
new file mode 100644
index 000000000000..4aadf3d99235
--- /dev/null
+++ b/validation/eval/undecl-no-indent.c
@@ -0,0 +1,19 @@
+inline void fun(void)
+{
+	undecl();
+}
+
+void foo(void);
+void foo(void)
+{
+	fun();
+	fun();
+}
+
+/*
+ * check-name: undecl-no-indent
+ *
+ * check-error-start
+eval/undecl-no-indent.c:3:9: error: undefined identifier 'undecl'
+ * check-error-end
+ */
-- 
2.27.0


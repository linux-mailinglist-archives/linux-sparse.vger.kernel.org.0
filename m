Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 627F7119EEA
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfLJW7e (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:34 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35479 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbfLJW7e (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:34 -0500
Received: by mail-wm1-f65.google.com with SMTP id p17so646989wmb.0
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GjiF8yq5WD9voW0x1Hi/KZkZ0S4Kegr+L+6U1f5KOF4=;
        b=nZ6wsOc+6+Xt7HZQyICD17XHaIf8rz1hUzfl2zMF2wI4STUqJ4EJuDHs64ohatelZQ
         tu6zMfwIEhWdGRjCON52eRKGWz2rfNFoPp7N+CLjLlMf9oGQ8QMzlj16AusuZfpmvU68
         gQ9TP3QnYjlvx7QM/7451erkPuU6v3mmfPXPnI7+Z04NN5Ljk8bXUqQYOZn25uI1NXlj
         ytK94iJU/Ol84kosbHQc+KSvpijCVZ1ikypkCvggueH/fD19tRxjfOcB1NfBobVwzCHs
         uegrgjnE7kkOuJaUiYZivGQtI0CjfycSg86NsP8uX/IlaIGySuoznB7d5gdLlQ+uEH+P
         thLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GjiF8yq5WD9voW0x1Hi/KZkZ0S4Kegr+L+6U1f5KOF4=;
        b=Za01I8hP2haZaDVOsVExYYXUZnkzOPP7uiQW7T+IfIf1jbRJmSSS+7xJjEqYF6pBHn
         2BLQzABie3pbLpmMj/LqyflSBz/I5TaYeaBQd2usTJ3bKglAb6+KEoQ6ePTq9Bjc6+l1
         Tno+mxuoxwR9yHU+3WTJbFCQbG+wuhUMkq8utfcB33H8fnp/OBH5nVeDHjEakfOMYZXi
         8knylCoruYF2UR7LNrgMZGkH119xD7ljjoVXTujX/sS538YekhfD1mMrpecS2AeCorml
         TYTaT6Ve4z03sb6KCAdkf+unZlOId9qp8d+8PdAvnb0x8xPfljFjy/D5A0LUVEhjYrp0
         DUUA==
X-Gm-Message-State: APjAAAWy5N+bYMljSu9RVLz28tkbtRqIfafuPPM3cmKHv0zR6T3VxvtE
        /AogkDFPvCcnDnE4BvqR8cvnERpH
X-Google-Smtp-Source: APXvYqzMKspU9B1/xVhU/uy/YFzoznV7iwVagkJwlIcbhSIecKXVLrAlfyHNDX0gKm3ta43i1mdGOA==
X-Received: by 2002:a7b:c389:: with SMTP id s9mr7792656wmj.7.1576018771328;
        Tue, 10 Dec 2019 14:59:31 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:30 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 03/17] add testcase for addressability of degenerated symbol
Date:   Tue, 10 Dec 2019 23:59:07 +0100
Message-Id: <20191210225921.94897-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

An array or a function that degenerates into a pointer
has its address implicitly taken since the result is
equivalent to '&array[0]' or '&fun'.

So, the corresponding symbol needs to be marked as
addressable, like when its address is explicitly taken.

Add a testcase to illustrate this.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/eval/addressable-degen.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 validation/eval/addressable-degen.c

diff --git a/validation/eval/addressable-degen.c b/validation/eval/addressable-degen.c
new file mode 100644
index 000000000000..e1dc51079079
--- /dev/null
+++ b/validation/eval/addressable-degen.c
@@ -0,0 +1,18 @@
+extern void def(void *, unsigned int);
+
+static int bar(void)
+{
+	int x[2] = { 1, 2 };
+
+	def(x, sizeof(x));
+	return x[1];
+}
+
+/*
+ * check-name: eval/addressable-degen
+ * check-command: test-linearize -fdump-ir $file
+ * check-known-to-fail
+ *
+ * check-output-ignore
+ * check-output-contains: load\\.
+ */
-- 
2.24.0


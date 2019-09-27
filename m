Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED66BFCC5
	for <lists+linux-sparse@lfdr.de>; Fri, 27 Sep 2019 03:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbfI0Bl7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 26 Sep 2019 21:41:59 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33792 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfI0Bl7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 26 Sep 2019 21:41:59 -0400
Received: by mail-ed1-f65.google.com with SMTP id p10so947567edq.1
        for <linux-sparse@vger.kernel.org>; Thu, 26 Sep 2019 18:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lIBoOXtmPsiHKadSfcW/ICWo+eiSR3AbN/colqn7DN0=;
        b=MpZrd/HJpJ/Xanwyefx391xGb+BFo71nuO9ZkveefpSrwi3y9nCf0xL6Zt7MCozVWR
         SrRyj6lE3Iqinc6NXlS8hZsq8Od41Qn/89/HO1l7Ov86kmC2HM6dA+Nt09E7hfqRpzQL
         5DmiPmQ6ftr5yT6GD2lrbXfJ/YCLfMxnFZP5yj7t4EMIpRAcvcZ1ycIR16NGeOoLgVj5
         A0Q03BvQspdFmvKBE8VTaKSslb38pPnp2J3Nzw5ht4N4nV/UvGBJEBdpgMGVy1FIphdz
         fVS5YUYXC1Yi2+u/R4VHOlAqlNE0CWq23k+Fsa3KJS/1NS1EVojjD2NKXAxGNdmVxztw
         OdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lIBoOXtmPsiHKadSfcW/ICWo+eiSR3AbN/colqn7DN0=;
        b=N3vyqDZHte0LVVJCnq19mOZ5MUc9hr5HcU1sW+WRlCpTi+Z5CKJS+d5TysT3PeFcH7
         vbUQm/+6hAID2Ly/+7H60VeafOX+3RUwSw6y46cFFvXl99MBbeS72MrTzuNcTKWIz6kF
         ekPmcO7tglakOCoJEMhUUhY7BVE4pjuSFpgGdc8wXlDE9I+dLT2Met9YXcJ56oFfY4is
         Y1jMgIqeI4F+NGDAhmdfOeIDWt8jyGJvyQmwYGz8B34xgicud0aHZLJeIP8/R6yzSgG9
         p8223+9aZBkbQ9Srf3gq+04rdOJnWZ4timyS5zbVcmbACEbHR0OW5Vg0hiT3iMT1llhj
         a56w==
X-Gm-Message-State: APjAAAXRcLYa6yX2Ru5NjOV6TvYrY56cJSHdrfA4K785Jn0x8/PIr5Ig
        cch6gRWySvYxEtaagMQ2eF4Z8NL0
X-Google-Smtp-Source: APXvYqyDUyy9irq0zpFER/LW5l2AD34okGIL4fbkIV43yis9c5ca3Y7aeYpdLtJy+x/EoccXo2UTnQ==
X-Received: by 2002:aa7:c71a:: with SMTP id i26mr2011993edq.68.1569548517067;
        Thu, 26 Sep 2019 18:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:5de2:f287:160f:22])
        by smtp.gmail.com with ESMTPSA id i1sm425312ejv.92.2019.09.26.18.41.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 18:41:56 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/2] add test for evaluation of invalid assignments
Date:   Fri, 27 Sep 2019 03:41:49 +0200
Message-Id: <20190927014150.38705-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927014150.38705-1-luc.vanoostenryck@gmail.com>
References: <20190927014150.38705-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Due to the way compatible_assignment_types()'s handle type
incompatibilities and how expression with an invalid type
are nevertheless processed by linearize_expression(), some
invalid assignments retunr unwanted error messages (and
working around them can create some others).

Here are 2 relatively simple tests triggering the situation.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 validation/eval-bad-assign1.c | 15 +++++++++++++++
 validation/eval-bad-assign2.c | 22 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 validation/eval-bad-assign1.c
 create mode 100644 validation/eval-bad-assign2.c

diff --git a/validation/eval-bad-assign1.c b/validation/eval-bad-assign1.c
new file mode 100644
index 000000000..bce4d3d38
--- /dev/null
+++ b/validation/eval-bad-assign1.c
@@ -0,0 +1,15 @@
+static void kos(int *r, int a)
+{
+	r = ({ __builtin_types_compatible_p(int, int); });
+}
+
+/*
+ * check-name: eval-bad-assign1
+ * check-known-to-fail
+ *
+ * check-error-start
+eval-bad-assign1.c:3:11: warning: incorrect type in assignment (different base types)
+eval-bad-assign1.c:3:11:    expected int *r
+eval-bad-assign1.c:3:11:    got int
+ * check-error-end
+ */
diff --git a/validation/eval-bad-assign2.c b/validation/eval-bad-assign2.c
new file mode 100644
index 000000000..4d08cb907
--- /dev/null
+++ b/validation/eval-bad-assign2.c
@@ -0,0 +1,22 @@
+struct s {
+	char c[1];
+};
+
+struct s fun(void);
+
+
+static void foo(void)
+{
+	char c[1];
+	c = fun().c;
+}
+
+/*
+ * check-name: eval-bad-assign2
+ *
+ * check-error-start
+eval-bad-assign2.c:11:11: warning: incorrect type in assignment (invalid types)
+eval-bad-assign2.c:11:11:    expected char c[1]
+eval-bad-assign2.c:11:11:    got char *
+ * check-error-end
+ */
-- 
2.23.0


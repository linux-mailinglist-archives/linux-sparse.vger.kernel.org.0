Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC8AC0EA1
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728543AbfI0Xn1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:27 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42621 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbfI0Xn1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:27 -0400
Received: by mail-ed1-f67.google.com with SMTP id y91so3702997ede.9
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lIBoOXtmPsiHKadSfcW/ICWo+eiSR3AbN/colqn7DN0=;
        b=iIkkMQTZdlReBE0PNJQiSFfd5Jx7axs1tBdskgdYKfheHBZ4ydkKbzZN7jo37mDWk9
         fXXU97wtSlKZms7KeBKWFKtd7e5DEKZXxaEuMIPOVwsn9hTZkfgVAAGhCVjatg8r7LX7
         TUdesB6gf9tqsYeIg3NPWYocZKxu5wOzxghirOvDTI7bRt+pK9DzhEdjikjViPBbUhfS
         O/nDhx8ow3KZ18VcqHKwp+XqPilj5gN6ts53FiTezamK9gLrqcqdDoxAL8l8YZXxfav+
         ++2Zb6+BhbbkEvlH/wVT4nuNaolsGML6jsCZyximjenrnWwEQIZrZd5MOJqdkYhNUR/c
         Zzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lIBoOXtmPsiHKadSfcW/ICWo+eiSR3AbN/colqn7DN0=;
        b=Lde2tIo9AIf+dfrjXmyhol6IE9L0TKGzx4QU/gSx17iH0smkOreAiubIfRvM1RDCvs
         fxRaaMrKcvIYZRlQmFkwZiv6hGU/1rjhimvyIXt9MiXqVHa+8DAqmdDG6Ft6g7wHaeBj
         uaSIUPvyS8TGYzN8QFzM+PXo3xWxC5A6AYMZzPL4j1BQxv2w2OD6xm13muqqS4ikzLX8
         NfUarZXmA8plvA/brjLQdgWmi9uliDS0MGD2+t41C5l5EhDJ5v/oatXXUbl+H70H54Y0
         UBGKYQhr0+19+FyFa1LdrDxM9KsgpbHdWbsQ2u3OB3knJ32PUCKeGoivbY9splxhy0Eu
         mf6g==
X-Gm-Message-State: APjAAAWs+oiBWGBMEN14JA6vQm2pYXn7JKneexbyBDl/ePbb8wEwUKKU
        WJA0FKzXo4cwmpxwIR1r91IVPYzw
X-Google-Smtp-Source: APXvYqwtWyDhtzYnXii6X1EackTEKYmzGJc4RMTSk5ao9Ri2xEvn6bBRm2JKHXJ2aN+D+lY/ykfKhA==
X-Received: by 2002:a05:6402:1688:: with SMTP id a8mr7276561edv.225.1569627804880;
        Fri, 27 Sep 2019 16:43:24 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:24 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 1/2] add test for evaluation of invalid assignments
Date:   Sat, 28 Sep 2019 01:43:03 +0200
Message-Id: <20190927234322.5157-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
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


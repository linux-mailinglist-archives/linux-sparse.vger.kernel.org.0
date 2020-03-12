Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E4D183A8C
	for <lists+linux-sparse@lfdr.de>; Thu, 12 Mar 2020 21:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgCLUZl (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 12 Mar 2020 16:25:41 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]:52047 "EHLO
        mail-wm1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLUZk (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 12 Mar 2020 16:25:40 -0400
Received: by mail-wm1-f42.google.com with SMTP id a132so7580786wme.1
        for <linux-sparse@vger.kernel.org>; Thu, 12 Mar 2020 13:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CqkLzXNRCNwiWCfQ7QA1jDrDDQqrK2MzXO3M7+i66pc=;
        b=uXWOmcC0QxeNk7zqeJw4gYuhx+J1DXIWR1+pvtL0Ve9r27jxyvphTF6bWayl17iLRM
         JHRjEI2QQOhV+Dka4X9YoawUnQsz6wid9vnamENw97cf/bRHQRmSkUacuMlgStKt28Qk
         44y3z0dKeKWni4R2FOS+4f5IF+iYyRzVg6er4lrP7wolO6eZkjQeclTfbjUoYAZXiR7T
         yV9zp0M7DQzZGcXQXwWETe6yMLGzCtIWLb9RgvCrdpUU6+rwWeTrAaOrOx/96sd4BGaf
         V9RPHjo7r1b/E1H0oo+wsSZwH1WZcAaz59GY0wkks7zt3tymRaNj6Yi7zNumX51ognSb
         +hpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CqkLzXNRCNwiWCfQ7QA1jDrDDQqrK2MzXO3M7+i66pc=;
        b=oqHSmOrg60IskKJgI2DGLCgDaYcGBVDaprwqMXIQFNdP9X2BIp3HllF47c4CNchG9+
         fupMwlioEBn3iNqGkBnV85/snp2ssIUHb7T7mKGdp5eVQCogWy19iv9e2JgQp0w2W34O
         IdfSv2RjqofVYT9xzHTOI1nqwwsYSEosESa/35XmuYlxxdTR7XiOrGMCqj1h933p4auk
         DGDuggb2ts2JMc4U0cwCwXem5ZgxBE9BXTycB8Ihne2Q7hTO0YeTGudkCjU93Fb/YM5G
         7ohmtsViBwjiBTPAnz3a96yWVY9SicS6UaH9J4doTuWt+2xe/d8LZZH63WBpl3sx7jx1
         cMIg==
X-Gm-Message-State: ANhLgQ2Z++SaDJ4eJYEgSXB4DnTHQhHDNCyUz26UEXXVdviVANrwd81M
        gCN2wX9qLAkHCWFPcj4MwsZdxmm1
X-Google-Smtp-Source: ADFU+vsKYAVAu0CFsjGlJnfJuTazue78Qksj/2iSlRwNHjA8a0gyL+DbIRxnHBuY5HCFcO4lvFarHg==
X-Received: by 2002:a1c:2856:: with SMTP id o83mr6328860wmo.157.1584044739217;
        Thu, 12 Mar 2020 13:25:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4075:2100:dce0:d823:c691:d081])
        by smtp.gmail.com with ESMTPSA id a1sm36525215wru.75.2020.03.12.13.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 13:25:38 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [RFC] cpp: remove extra newlines during macro expansion
Date:   Thu, 12 Mar 2020 21:25:33 +0100
Message-Id: <20200312202533.52465-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

During macro expansion, Sparse doesn't strip newlines from
the arguments as required by 6.10.3p10 and done by gcc & clang.

So, remove these newlines.

Note: the current behaviour may make the preprocessed output
      more readable (and so may be considered as a feature).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 pre-process.c                           |  1 +
 validation/preprocessor/expand-and-nl.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 validation/preprocessor/expand-and-nl.c

diff --git a/pre-process.c b/pre-process.c
index 479c8d225602..2893c3ab65d4 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -306,6 +306,7 @@ static struct token *collect_arg(struct token *prev, int vararg, struct position
 		next->pos.stream = pos->stream;
 		next->pos.line = pos->line;
 		next->pos.pos = pos->pos;
+		next->pos.newline = 0;
 		p = &next->next;
 	}
 	*p = &eof_token_entry;
diff --git a/validation/preprocessor/expand-and-nl.c b/validation/preprocessor/expand-and-nl.c
new file mode 100644
index 000000000000..06f6ab5cd91b
--- /dev/null
+++ b/validation/preprocessor/expand-and-nl.c
@@ -0,0 +1,14 @@
+#define M(X) X-X
+
+M(a
+b)
+/*
+ * check-name: expand-and-nl
+ * check-command: sparse -E $file
+ * check-known-to-fail
+ *
+ * check-output-start
+
+a b-a b
+ * check-output-end
+ */
-- 
2.25.1


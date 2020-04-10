Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5508E1A4A06
	for <lists+linux-sparse@lfdr.de>; Fri, 10 Apr 2020 20:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgDJSte (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 10 Apr 2020 14:49:34 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46188 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgDJSte (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 10 Apr 2020 14:49:34 -0400
Received: by mail-wr1-f65.google.com with SMTP id f13so3228985wrm.13
        for <linux-sparse@vger.kernel.org>; Fri, 10 Apr 2020 11:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=52cKZqkwLqN6cY5ph333Oxc6A3+YDc5GsDTpTDr1Wg4=;
        b=nO6vaQvS9wzaA2plyH0Xn0F5uKdtb5836wSzMGMtaTTqB+8/jhwcWTWoSjXSwWQFu9
         dyFRMBLjIhloeuD28c//Th+2rcZNCtWXyltq5RnqSJ8HNsYp8haaxkqGKJXbO0EFAIoN
         paHMhl63hGTf7ABbafmVkTT2yy9WrFHqcNhyQ5o3ht7vBCjKDOHtbsucWrJ5yilZfP8d
         ojdbF3D6CsCZXdzMip/l+XOqrimNLx6GMTHd09zhfScQVSyLrHT+AUzupNQ2bZPuqIKZ
         YXkQhCL5vbUTfTpy2/yandQIoiOLpSEWBpB+yG/M5DdjMszq7MeBGfblpSuCJTi8685w
         LOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=52cKZqkwLqN6cY5ph333Oxc6A3+YDc5GsDTpTDr1Wg4=;
        b=p0ncJ0+gT4dGNQVh2PltF0iM/4n5swBAH7LYWNAWEv7wzz/tdYn9EaCrg+Qc4J38oR
         Vawjti78X2l9IPAV6GYoZeiRCTztaz40QYgHdblyKJPTkkEMP2UXxjBPA0WDUqvStqEZ
         IrRK7sm0qfzJ9szA+SAdP9MmcybAA1PGdZj9SasybBJVY4QYz5+HITjWpfJAPbFtaYZS
         1KMQgEsGyU/PnonkUBkO4uH4PGa2LPbEREhOy0iUw/V+dLtBapHbB/FfYxtSSGGG4ck4
         ZfDEGVU+ZghY+f6Q5EXBtPTRuV2kVGicmpdu13p1iSW3vyIuwf7O7G6Faxhn96H3Mez/
         cg7A==
X-Gm-Message-State: AGi0PubFF1ouDuNkUlMNlUgV9qSi5ZAoAxb8KOObKVMIaQ3Gs+Z51k8b
        cOF+8fPwQIp6lPKXovpOCZueCP95
X-Google-Smtp-Source: APiQypJhHZTxa9BVTPWLv4Tc3u3LpHSm4dELbbZXMXpIDy0e7BISTo0YVP8/hNGaSb92MiA1KhcmVw==
X-Received: by 2002:adf:82b1:: with SMTP id 46mr23190wrc.44.1586544571015;
        Fri, 10 Apr 2020 11:49:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:957f:f707:be30:7cd4])
        by smtp.gmail.com with ESMTPSA id u16sm3935364wro.23.2020.04.10.11.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 11:49:30 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [SPARSE PATCH 3/5] do not issue a branch to non-existent label
Date:   Fri, 10 Apr 2020 20:49:16 +0200
Message-Id: <20200410184918.64692-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
References: <20200410184918.64692-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

If the label doesn't exist, the corresponding BB will never
be created and the CFG will be invalid.

So, do not issue the branch for goto to these labels.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 linearize.c                         | 13 +++++++++++--
 validation/linear/invalid-labels0.c |  1 -
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/linearize.c b/linearize.c
index b040d345d469..4e9f9b3693e9 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2379,6 +2379,7 @@ static pseudo_t linearize_statement(struct entrypoint *ep, struct statement *stm
 	}
 
 	case STMT_GOTO: {
+		struct symbol *label;
 		struct symbol *sym;
 		struct expression *expr;
 		struct instruction *goto_ins;
@@ -2389,8 +2390,16 @@ static pseudo_t linearize_statement(struct entrypoint *ep, struct statement *stm
 		if (!bb_reachable(active))
 			break;
 
-		if (stmt->goto_label) {
-			add_goto(ep, get_bound_block(ep, stmt->goto_label));
+		label = stmt->goto_label;
+		if (label) {
+			if (!label->stmt) {
+				// do not issue a branch to non-existent labels
+				if (label->namespace == NS_LABEL)
+					break;
+				if (label->namespace == NS_NONE)
+					break;
+			}
+			add_goto(ep, get_bound_block(ep, label));
 			break;
 		}
 
diff --git a/validation/linear/invalid-labels0.c b/validation/linear/invalid-labels0.c
index ae3bf7283fb8..a15e9d434011 100644
--- a/validation/linear/invalid-labels0.c
+++ b/validation/linear/invalid-labels0.c
@@ -11,7 +11,6 @@ void bar(void)
 /*
  * check-name: invalid-labels0
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-excludes: END
-- 
2.26.0


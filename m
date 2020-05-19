Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244BB1D8CBB
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgESA6A (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgESA57 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:59 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D57C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:59 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id n24so2399519ejd.0
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wtfXoJqSxGDIJQoapk9pzujFO+5MkL4i6T5bKn8EtmY=;
        b=BmD8g/X1AeIoTsChTML0VdKL247FYQJgX/av1sIURrRos4O2oy/cJK+r9HbkxTkkvA
         wa1OY1nz0xTb+oXqvqR2Hn479eMIY+Gr6q7kW8KJ1qX5KOqAbOXsSiD591MbUoTOTCpo
         PuOwZDNb7bEkconePaUxIXIOXm38J042vqOj4UlaJGGln7b/jh4YxgafYhm2q9NtBjc0
         8gtdwjg0002+y5c4dgskYYrBRG4C33/KbqKlv+BcktZgx4pCeqmRcButGbedJ8zuAcXm
         ERZ8fvqzU5ckkeukJx2kz4eoGBtdRZVkx34R+BEjXqRgOm/4eckVU6u2pg+y2ivg67lY
         H27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wtfXoJqSxGDIJQoapk9pzujFO+5MkL4i6T5bKn8EtmY=;
        b=XGVkMMTNPIDkWvf2VPPoJE0LFj08z1ec4SursTit1PaC8EEkCE872hX6gFbkyHyXNR
         eSyV8mL0J5s+Gy7mDE/5VcCKxu/PWzcbWLa1TZJFjVRXmf1TiIg6bkac8PFGMJVQsVPW
         LbXnTwf18ySmJvrNzMUG/wQF6HZN1l9qCaMNpqpnEvzAxowIk/ta1HLtxzQqWvYt7VHr
         namLP0aIV8XtyDyAy4kdaLZ926g4RxIvAKENGdDYm309hTVx5gKI2QnDaUchc8yEBymX
         na1B22324OfDaIjwwuuyq+QKPkE+LH2azMg9IaFzD8LrS+PU39/1K3LdgBqaW5UqT68m
         kIwA==
X-Gm-Message-State: AOAM532vbpHPmj7Beprkj6u+LAXtt1By4njJih4FJRFu+sLhHnyNTMOh
        ByFMYlNIJN8BiHXj4o3AfwcJdiQU
X-Google-Smtp-Source: ABdhPJwny23K6SITFhOnFjswT+gJLMzN2BMmawh3x5y3L/3Tt9NnLHVe+uhdwWkgpq/pROAsV3trGA==
X-Received: by 2002:a17:906:8402:: with SMTP id n2mr16804356ejx.26.1589849878006;
        Mon, 18 May 2020 17:57:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:57 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 26/28] bad-label: check for unused labels
Date:   Tue, 19 May 2020 02:57:26 +0200
Message-Id: <20200519005728.84594-27-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Issue a warning if a label is defined but not used.

Note: this should take in account the attribute 'unused'.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 scope.c                   | 8 ++++++++
 validation/label-unused.c | 1 -
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/scope.c b/scope.c
index 017c0dcd8600..03593d823d6d 100644
--- a/scope.c
+++ b/scope.c
@@ -150,6 +150,14 @@ void start_label_scope(void)
 
 void end_label_scope(void)
 {
+	struct symbol *sym;
+
+	FOR_EACH_PTR(label_scope->symbols, sym) {
+		if (!sym->stmt || sym->used)
+			continue;
+		warning(sym->pos, "unused label '%s'", show_ident(sym->ident));
+	} END_FOR_EACH_PTR(sym);
+
 	end_scope(&label_scope);
 }
 
diff --git a/validation/label-unused.c b/validation/label-unused.c
index c136c7a8813e..a654ef7742be 100644
--- a/validation/label-unused.c
+++ b/validation/label-unused.c
@@ -15,7 +15,6 @@ l:
 
 /*
  * check-name: label-unused
- * check-known-to-fail
  *
  * check-error-start
 label-unused.c:3:1: warning: unused label 'l'
-- 
2.26.2


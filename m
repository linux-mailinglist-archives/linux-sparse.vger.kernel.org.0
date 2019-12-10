Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B41C6119EF7
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Dec 2019 23:59:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfLJW7u (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Dec 2019 17:59:50 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38247 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfLJW7u (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Dec 2019 17:59:50 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so21977223wrh.5
        for <linux-sparse@vger.kernel.org>; Tue, 10 Dec 2019 14:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WsP56QjgXWbas/s2njX9/d1C3XRf3eqUj+LW3UyRMiA=;
        b=C1ZmcN1tKWXlMTo2Q8TiedbRE5G0Fb6nozAyD3+CmopksIuQHPmVLBT4cU7S6WOaH1
         it6SHZ5xnblgLKgN1AJ/ZDrLv3Jh02yr5bybjpLGADo1TCyi4HmN5oAiu1tFXwl0eZv0
         KlLZwC/crWvJjSZi3yE3CIz3VRk8CiAU1VHgv3UhKCOqTNIsufXq5cUWxM4COpRZOyJS
         +mli8kB9NMXklcIP7u36MlVM0ls1spv4p+BnVhpedoW6IxIZLLuTXLSNDu2UiJuXgVPm
         A2DxaLA+chFsuaGxSIfs5Ku0H1gOFGHiEV1DKz6K8X9/r3cgqYUox1G33F7MV3u0RD/w
         le+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WsP56QjgXWbas/s2njX9/d1C3XRf3eqUj+LW3UyRMiA=;
        b=GpN4evS6J3iqnqNmaiiEFvdp9yqzKSEQkHfg/HT+SfayyHuNQ1oBQB8N4KGIsEUWaH
         iE69c/hk1MOodZ0IRR0ARa3Fg47yWO9xpoei7sSGtqvm861bgGOmKJLrw69iebIhqE8b
         /70TdY9aDukHqgZouALljYctkifSxPaSBDLP2z8TZp35bf08zPorsCuMiH0VrIUVRXQW
         GyIfWAQlRw+kW1ZkY7RmYewWDjJKIad8vNdIxBXW/ZWZMmU2JmtAdqVtjwUHIpPg2M9u
         k/PB0oGouXXNR7k6vIkRNvOdRwUhUY3LgOQf7UqgPVvLwuyir75rid/5lDq0NBaYTKor
         2EYg==
X-Gm-Message-State: APjAAAV2KF3uSJqNSoJrRgsBxDwE31dQuWjJeW4MlBETs0MJljGAW7z+
        aFuvIyHGXOdFjlFKAtC3yGKYKgld
X-Google-Smtp-Source: APXvYqyfWad58Bodn60WHin3u2v6yhfQAqQD8f84GhiBeNi5fiCvYUMP4ZesddGZx0UuwUrel0XQhg==
X-Received: by 2002:a05:6000:1044:: with SMTP id c4mr11711wrx.204.1576018787886;
        Tue, 10 Dec 2019 14:59:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:ccc5:3de6:2efd:b014])
        by smtp.gmail.com with ESMTPSA id j21sm33535wmj.39.2019.12.10.14.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 14:59:47 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 16/17] RFC: allow expansion of accessed constants if 'static const'
Date:   Tue, 10 Dec 2019 23:59:20 +0100
Message-Id: <20191210225921.94897-17-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
References: <20191210225921.94897-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, constant_symbol_value() safely refuses to convert
a symbol that is accessed.

But accessing a 'static const' object should be fine since
it should never be modified.

So, allow to also expand symbol marked as accessed but being
'static const'.

Note: a simple 'const' should be enough and 'static'
      doesn't make it 'more const'. In both cases, the
      object can be modified via a cast to a non-const
      pointer (which is UB). The only thing that 'static'
      changes is that *if* the object's address is not
      taken (so all accesses are const-expanded) then
      it's not needed to allocate memory for thsi object.

      OTOH, GCC also seems to do some these expansions only
      if the object is static const. So, I dunno.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expand.c                                |  7 +++++--
 validation/expand/constant-init-array.c |  4 ++--
 validation/expand/constant-static.c     | 16 ++++++++++++++++
 validation/expand/default-init-array.c  |  1 -
 4 files changed, 23 insertions(+), 5 deletions(-)
 create mode 100644 validation/expand/constant-static.c

diff --git a/expand.c b/expand.c
index 36612c8672dd..1885a4eaad2a 100644
--- a/expand.c
+++ b/expand.c
@@ -689,9 +689,12 @@ redo:
 static struct expression *constant_symbol_value(struct symbol *sym, int offset)
 {
 	struct expression *value;
+	unsigned long mods = sym->ctype.modifiers;
 
-	if (sym->ctype.modifiers & MOD_ACCESS)
-		return NULL;
+	if (mods & MOD_ACCESS) {
+		if ((mods & (MOD_STATIC | MOD_CONST)) != (MOD_STATIC | MOD_CONST))
+			return NULL;
+	}
 	value = sym->initializer;
 	if (!value)
 		return NULL;
diff --git a/validation/expand/constant-init-array.c b/validation/expand/constant-init-array.c
index 94949be54244..861885630f18 100644
--- a/validation/expand/constant-init-array.c
+++ b/validation/expand/constant-init-array.c
@@ -10,6 +10,6 @@ int test_array(int i)
  * check-command: test-linearize -Wno-decl -fdump-ir $file
  *
  * check-output-ignore
- * check-output-excludes: phisrc\\..*return.*\\$2
- * check-output-contains: load\\.
+ * check-output-contains: phisrc\\..*return.*\\$2
+ * check-output-excludes: load\\.
  */
diff --git a/validation/expand/constant-static.c b/validation/expand/constant-static.c
new file mode 100644
index 000000000000..df6673eeef47
--- /dev/null
+++ b/validation/expand/constant-static.c
@@ -0,0 +1,16 @@
+static const int a = 3;
+
+static int foo(void)
+{
+	int *p = (int*) &a;
+	return a;
+}
+
+/*
+ * check-name: constant-static
+ * check-command: test-linearize $file
+ *
+ * check-output-ignore
+ * check-output-contains: ret\\.32  *\\$3
+ * check-output-excludes: load\\.
+ */
diff --git a/validation/expand/default-init-array.c b/validation/expand/default-init-array.c
index b372ea09534b..5f2e44ef21a3 100644
--- a/validation/expand/default-init-array.c
+++ b/validation/expand/default-init-array.c
@@ -8,7 +8,6 @@ int test_array(int i)
 /*
  * check-name: default-init-array
  * check-command: test-linearize -Wno-decl -fdump-ir $file
- * check-known-to-fail
  *
  * check-output-ignore
  * check-output-contains: phisrc\\..*return.*\\$0
-- 
2.24.0


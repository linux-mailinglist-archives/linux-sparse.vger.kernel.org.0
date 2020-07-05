Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A6F214CA7
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgGENQO (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726898AbgGENQO (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:16:14 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B229DC061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:16:13 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id z17so32217271edr.9
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aH3vb5bxfRKpTA7fm7DUQKMrEHPNK5YGkT0/8otryN8=;
        b=QFEnw/6114irrjnOeX3C2QJev3cxja0GFikV4Xv1NCSbttl9S6yZuGQj+HUHWcW2Jc
         f6c6X5ITKiqOalR+oHdEXFcXhi+NOok1jwCZpwj3s1WxdvC1MRu5r/WUYQyUm41CalJh
         UXCKnoYREHBs7DVHV52/JKpdV2j5YlEwwckuAzbnqxwIhCNA42YOuEWPxLSmxXiacpQO
         kb4Uo8IOIG6qfTNkaS/kH0KBYWzJ6On/DQ4yOUbjm/5rclEtLN7RbTD8iDtB6sTC8f4b
         NqVY4wsSvz67l6W7Ykkj87XsInNfyeirB0lHgHvk4BQDxAKvG7uxGbDQpIgMcO/eksve
         6TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aH3vb5bxfRKpTA7fm7DUQKMrEHPNK5YGkT0/8otryN8=;
        b=gcV9Qaq51EeFQGNYS2ZKfCAHv0mVekXa49TaQBLTSAvSTCrMoQa6vtxEgYN82UE62G
         WniboxQETkwddJ8hgT7ysxRCHaoYqanj2WOMLe4mBOtDoS4V+glSdIWZhCv6zylfcurr
         KRy1UdNJcS6Gtd8z0mAvSadfPf4feNaRc+fP0jRKRtsOSa/FzjhkQ13F/lKe2mvQ70aD
         NGHUsImStOtasuTEq44a2OFcndm7T+SJNYiX6D3+yukHnmIBHUmRrdUb0tcAtWVnmww9
         V3E887NtApol/H9SmaghnSz3RPtKDdAx08LUGnzS/sQ/wwFjROw75m9YrK7v1NdtfDXt
         olug==
X-Gm-Message-State: AOAM530oMGaU3mdSwwHHYRfYPKobPqrCTNzV1gUNorPyrK0edUtAlsl3
        z7pJbmLo4o7q3XqyxI1N9cOBfplH
X-Google-Smtp-Source: ABdhPJzcdA5IWQTsw04ATiWjxRh+1atx/zzyghNOecvkKNmE2qGltLdW6reGn4GBzcFtKOvOCSth2w==
X-Received: by 2002:a05:6402:22d5:: with SMTP id dm21mr25789806edb.26.1593954972193;
        Sun, 05 Jul 2020 06:16:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id j21sm7915321edq.20.2020.07.05.06.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:16:11 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/2] predefine: add helper predefine_{strong,weak}()
Date:   Sun,  5 Jul 2020 15:16:03 +0200
Message-Id: <20200705131605.26551-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705131605.26551-1-luc.vanoostenryck@gmail.com>
References: <20200705131605.26551-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A lot of predefined macros are just set to the value '1' and
of them have a name that is not statically known. OTOH, the
function predefine() is designed for a statically known name
but a variable value.

Add a set of helpers to cover the first case: predefine_strong()
and predefine_weak().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.h         |  2 ++
 pre-process.c | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/lib.h b/lib.h
index 46483f2bed5c..a3288a3abf4e 100644
--- a/lib.h
+++ b/lib.h
@@ -127,6 +127,8 @@ enum phase {
 
 extern void add_pre_buffer(const char *fmt, ...) FORMAT_ATTR(1);
 extern void predefine(const char *name, int weak, const char *fmt, ...) FORMAT_ATTR(3);
+extern void predefine_strong(const char *name, ...) FORMAT_ATTR(1);
+extern void predefine_weak(const char *name, ...) FORMAT_ATTR(1);
 extern void predefine_nostd(const char *name);
 extern void predefined_macros(void);
 
diff --git a/pre-process.c b/pre-process.c
index 38167802f465..403e3507611c 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -1439,6 +1439,32 @@ void predefine_nostd(const char *name)
 		predefine(name, 1, "1");
 }
 
+static void predefine_fmt(const char *fmt, int weak, va_list ap)
+{
+	static char buf[256];
+
+	vsnprintf(buf, sizeof(buf), fmt, ap);
+	predefine(buf, weak, "1");
+}
+
+void predefine_strong(const char *fmt, ...)
+{
+	va_list ap;
+
+	va_start(ap, fmt);
+	predefine_fmt(fmt, 0, ap);
+	va_end(ap);
+}
+
+void predefine_weak(const char *fmt, ...)
+{
+	va_list ap;
+
+	va_start(ap, fmt);
+	predefine_fmt(fmt, 1, ap);
+	va_end(ap);
+}
+
 static int do_handle_define(struct stream *stream, struct token **line, struct token *token, int attr)
 {
 	struct token *arglist, *expansion;
-- 
2.27.0


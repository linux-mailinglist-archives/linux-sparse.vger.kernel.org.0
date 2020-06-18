Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF381FFCEB
	for <lists+linux-sparse@lfdr.de>; Thu, 18 Jun 2020 22:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgFRUtk (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 18 Jun 2020 16:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728196AbgFRUtj (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 18 Jun 2020 16:49:39 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BA6C0613EE
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:39 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n24so7898424ejd.0
        for <linux-sparse@vger.kernel.org>; Thu, 18 Jun 2020 13:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sz98MQSw+43ZlPZFydM8yE1484f/qrL810vDtRcD7U0=;
        b=TcltcenQa+27KOTBqrcm05HKkvyldA8JqkDsM2X28o1F8Uk7MbEaZl6OPri5iqhp03
         IP7F/Kfq8Bywa5uUgu+5mwuznqyWBKAzfKHw8blt70IZ6PjAGOOpEc1WqAKenYc/Zstz
         zmdVVvvqTkR46EtqJBr/zzRkPZAPWKlt2LhfN4A62a+f7K8BEJWFYOe+9F3aCUbVTXzR
         Aps6huQ3K1SpBvKSrd68SDoBH6y/R/I5IhsepnXjZnDg9zOSWpEWNpA1RQYTxvLaOUa0
         AuaKyppw47dfmq+wKoxT2ZLL0By9Eghk1LIclQCKAmB/41dnXjux2iaX6wSDYr35XvaM
         +vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sz98MQSw+43ZlPZFydM8yE1484f/qrL810vDtRcD7U0=;
        b=QcNP+sOzzdEOR+jKDDC46XtVLLMf/VQQFXEPgURyOzcfEWYY71IKB/iTdIsHCprDHJ
         su7LJrydTJX3irBBRORGTVVh4p7sw0DiNAnc5d9jglAiHkUXWXoiztaBA084N1tJFAlo
         1DvZlJGKZWFVnPOrE5MYp3c3d0YbZn0Z6r5D67AU5Joes81Kq2geQ6/tVRa2bLsHJMOk
         gFlH1MveQKkUhOWzj023E+8tnF0sG74Ze2GBczZAKZqkVl1bSkm1KPTrK88a0P+aclO3
         fHOQWktNfBA0E853tG4HfbDICB6ZtN8dsXZP0hOX09B6xBZS72cOEpCAR8wxNYbWDf0W
         Y+dQ==
X-Gm-Message-State: AOAM530fIz0hErAk/nIHqMDFgtUUe65a8M2MCIvf1c6tPUseZuPGQIb4
        145FxUjT7DHZBhnjDY+6txbgjxMK
X-Google-Smtp-Source: ABdhPJzTf/+szdZdI22d2ZbUQiqgtQe21baCQTTFLB1weq3nCGkwaFT4PpwwifhPT/wE8F3Y+8T6gw==
X-Received: by 2002:a17:906:e4b:: with SMTP id q11mr527859eji.302.1592513377694;
        Thu, 18 Jun 2020 13:49:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4c3c:7f8a:3583:598e])
        by smtp.gmail.com with ESMTPSA id s15sm2913160edw.54.2020.06.18.13.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 13:49:37 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/5] pre-process: add support for __has_feature() & __has_extension()
Date:   Thu, 18 Jun 2020 22:47:15 +0200
Message-Id: <20200618204716.3896-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
References: <20200618204716.3896-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Add the trivial methods for the expansion of these macros with:
c_alignas, c_alignof, c_generic_selections and c_static_assert.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 ident-list.h                          |  4 ++
 pre-process.c                         | 54 +++++++++++++++++++++++++++
 validation/preprocessor/has-feature.c |  1 -
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/ident-list.h b/ident-list.h
index 75740b9d9f77..a3a282587c67 100644
--- a/ident-list.h
+++ b/ident-list.h
@@ -61,6 +61,10 @@ IDENT(defined);
 IDENT(once);
 IDENT(__has_attribute);
 IDENT(__has_builtin);
+IDENT(c_alignas);
+IDENT(c_alignof);
+IDENT(c_generic_selections);
+IDENT(c_static_assert);
 __IDENT(pragma_ident, "__pragma__", 0);
 __IDENT(__VA_ARGS___ident, "__VA_ARGS__", 0);
 __IDENT(__func___ident, "__func__", 0);
diff --git a/pre-process.c b/pre-process.c
index d2e13400711e..7a39b1715f31 100644
--- a/pre-process.c
+++ b/pre-process.c
@@ -2003,6 +2003,58 @@ static int handle_nondirective(struct stream *stream, struct token **line, struc
 	return 1;
 }
 
+static bool expand_has_extension(struct token *token, struct arg *args)
+{
+	struct token *arg = args[0].expanded;
+	struct ident *ident;
+	bool val = false;
+
+	if (token_type(arg) != TOKEN_IDENT) {
+		sparse_error(arg->pos, "identifier expected");
+		return false;
+	}
+
+	ident = arg->ident;
+	if (ident == &c_alignas_ident)
+		val = true;
+	else if (ident == &c_alignof_ident)
+		val = true;
+	else if (ident == &c_generic_selections_ident)
+		val = true;
+	else if (ident == &c_static_assert_ident)
+		val = true;
+
+	replace_with_bool(token, val);
+	return 1;
+}
+
+static bool expand_has_feature(struct token *token, struct arg *args)
+{
+	struct token *arg = args[0].expanded;
+	struct ident *ident;
+	bool val = false;
+
+	if (token_type(arg) != TOKEN_IDENT) {
+		sparse_error(arg->pos, "identifier expected");
+		return false;
+	}
+
+	ident = arg->ident;
+	if (standard >= STANDARD_C11) {
+		if (ident == &c_alignas_ident)
+			val = true;
+		else if (ident == &c_alignof_ident)
+			val = true;
+		else if (ident == &c_generic_selections_ident)
+			val = true;
+		else if (ident == &c_static_assert_ident)
+			val = true;
+	}
+
+	replace_with_bool(token, val);
+	return 1;
+}
+
 static void create_arglist(struct symbol *sym, int count)
 {
 	struct token *token;
@@ -2081,6 +2133,8 @@ static void init_preprocessor(void)
 		{ "__TIME__",		expand_time },
 		{ "__COUNTER__",	expand_counter },
 		{ "__INCLUDE_LEVEL__",	expand_include_level },
+		{ "__has_extension",	NULL, expand_has_extension },
+		{ "__has_feature",	NULL, expand_has_feature },
 	};
 
 	for (i = 0; i < ARRAY_SIZE(normal); i++) {
diff --git a/validation/preprocessor/has-feature.c b/validation/preprocessor/has-feature.c
index 3ab7c3e039fa..e0f2e7f63cda 100644
--- a/validation/preprocessor/has-feature.c
+++ b/validation/preprocessor/has-feature.c
@@ -12,7 +12,6 @@ __has_feature()??? Quesako?
 /*
  * check-name: has-feature
  * check-command: sparse -E $file
- * check-known-to-fail
  *
  * check-output-start
 
-- 
2.27.0


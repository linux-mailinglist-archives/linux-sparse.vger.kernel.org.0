Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F26F10308F
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 01:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727512AbfKTAKU (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 19:10:20 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37201 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727399AbfKTAKU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 19:10:20 -0500
Received: by mail-wr1-f68.google.com with SMTP id t1so26018850wrv.4
        for <linux-sparse@vger.kernel.org>; Tue, 19 Nov 2019 16:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nHc2RHa9mV2EzwOVItsbWjxFPfwDmx5x6+1UxBAkh9I=;
        b=rzlT6xDplwBy6DhLd6jPx3dU/F2UJbQX1tninMtoE1YFuSWBVeM7eMuBfz/NBc4cvn
         K/bcqBQUxppozNG9u3erhp/bDZfu339owwi4Oex1VqDLULUj5ByMZS697A+xvCPIOV2c
         GSCd0WdZUfZFhHIOieK7NDibvOh/XHm36f2Cfw3DT2kZS4XhqQVTyX+4L6cIlLauSKvL
         tchav4lFiGcynUqyZQZ3E0SwiadMmKHlMQp9Nxw3/7ZOvckQi1NViEbcybGrggdydZKg
         mkP08arNMFdhr9GBNT+vBzfLwMWUlcz8Z9yzPskWTyuhvz889iB9veof67KWtrWmWjSb
         rKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nHc2RHa9mV2EzwOVItsbWjxFPfwDmx5x6+1UxBAkh9I=;
        b=GaS6NdKEqbutiIJ7ia9uccYptXz4lmdzhKF8XVEY84zPmVb3agYh3K8zTD/oEYJuFa
         KnJevq5VIyPzUXyQwGmvKQ5jNl5JL3kGt7y4fy6SYCKiaeQP8M6hvwbWuzxLlFsyUObK
         t4kMKkwDW1/uo9hyWgxiAnz76yUUeSApSMMk/iNA5dH2klN6Wb0Qf2NS49x2KmhFiDj3
         3/XG9rTyCIZP73s76jC7vV0K7qp8UMCttFHBMKkQ1eBlCBLn03g2RBmucR9sZXdnzP8h
         3fD4j90xZRU+sk89H1E4mbDA89+Jo4pkHoOAhhY4DilMEwzlwnkRf+X0nibyJianS2n9
         7Esg==
X-Gm-Message-State: APjAAAUeh+spNMTc6AEPnLgHMmFJki13onzkIssNT7ZSpILUWyVPJasF
        QmCKqBcCLmKgITFE70evu5aBt70U
X-Google-Smtp-Source: APXvYqy8dycbKgQv8PcBPOcubC9/NfeKCiKk0XXWfr91gLf5w4/DYH5LCrugXmxbGwV+IVt5NCoqxA==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr104086wrs.183.1574208618551;
        Tue, 19 Nov 2019 16:10:18 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40e1:9900:5dce:1599:e3b5:7d61])
        by smtp.gmail.com with ESMTPSA id c24sm33398808wrb.27.2019.11.19.16.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 16:10:17 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/5] allow omitted function attribute in definition
Date:   Wed, 20 Nov 2019 01:02:24 +0100
Message-Id: <20191120000224.30441-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's common to declare a function with the attribute
'pure' or 'noreturn' and to omit the attribute in the
function definition.

It make some sense since the information convoyed by
these attribute are destinated to the function users
not the function itself.

Silence the warnings emitted when the attributes are
omited by masking the corresponding modifier bits
when checking the type compatibility between a
function definition and its declarations.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c                              | 4 +++-
 validation/function-attribute-omitted.c | 1 -
 validation/function-redecl2.c           | 3 ---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 863750fab..4e1762eff 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3371,6 +3371,7 @@ void check_duplicates(struct symbol *sym)
 	int initialized = sym->initializer != NULL;
 
 	while ((next = next->same_symbol) != NULL) {
+		unsigned long fmods;
 		const char *typediff;
 		evaluate_symbol(next);
 		if (initialized && next->initializer) {
@@ -3381,7 +3382,8 @@ void check_duplicates(struct symbol *sym)
 			initialized = 0;
 		}
 		declared++;
-		typediff = type_difference(&sym->ctype, &next->ctype, 0, 0);
+		fmods = next->ctype.modifiers & MOD_FUN_ATTR;
+		typediff = type_difference(&sym->ctype, &next->ctype, fmods, 0);
 		if (typediff) {
 			sparse_error(sym->pos, "symbol '%s' redeclared with different type (originally declared at %s:%d) - %s",
 				show_ident(sym->ident),
diff --git a/validation/function-attribute-omitted.c b/validation/function-attribute-omitted.c
index 43b301d8f..c5eb50d31 100644
--- a/validation/function-attribute-omitted.c
+++ b/validation/function-attribute-omitted.c
@@ -10,5 +10,4 @@ void		n(void) { while (1) ; }
 
 /*
  * check-name: function-attribute-omitted
- * check-known-to-fail
  */
diff --git a/validation/function-redecl2.c b/validation/function-redecl2.c
index 3435aa00c..ef396137a 100644
--- a/validation/function-redecl2.c
+++ b/validation/function-redecl2.c
@@ -25,7 +25,4 @@ void func2(int a)
 
 /*
  * check-name: function-redecl2
- *
- * check-known-to-fail
- *
  */
-- 
2.24.0


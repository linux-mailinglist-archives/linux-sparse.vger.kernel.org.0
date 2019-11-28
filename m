Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDD7010CF54
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfK1Umh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:42:37 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53888 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726616AbfK1Umh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:42:37 -0500
Received: by mail-wm1-f65.google.com with SMTP id u18so12143244wmc.3
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KpO8rX8yPZpR2lbIJ85UX4H/CKaKpIFF7MBRnXMnWjI=;
        b=sku/McMuFpFPQi3OLoBjynEV4fWXHY7jLS3lxwvSnuR59wAa4FWubM0yqq6AeTnw7s
         hWRiS4dcBifa0EHOr6mxG5xjFocXz+MJcKvbiEK6kVxxSvbtwJSr55K3TheR45NJAGz1
         8gQXapU8c1TYGhCpNdt+DCw70xctx8o/JZ5oELIYq1V285wIfNJ+JS/TCairLj7uoL5X
         DITLeQLUf4f6m0vw6awGb7u2SO49qvK3UMTQU16PJTnjJWjlL0Pz/oVeCWkoDo+6hlzj
         t9XdNouyhIg+Hl0O7qo0ZcJ2DtRckfY9cEaQbIjj6uceRfzy8m4VxKju21M38f6A7EZj
         ehnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KpO8rX8yPZpR2lbIJ85UX4H/CKaKpIFF7MBRnXMnWjI=;
        b=Sn3A+283ceYQGnSRmZeb7X1Kt6pPaSJ7OElapBdVQKR/SdtLmBEOAJtaHT0reShVhw
         ZEw3MKfTacDC9tessw2mZbv/PhcOz6U0eFdB0G5OZDDokeplXl71+Lg1ElvkLzlWA3Cv
         WYymq3wSyrAvrmJutSmfrk9oofxI84FejiNAEqqx+i3ECc46kDN3G/A5dskS8OjEnqGA
         EBT4x3boMxzP9PjAihIbMcc4GPgRk1YpdVQnRhv6NnUT/q1yuyUHntHLXutJsLDSwjUK
         q65/Lf8rscWZFxoHO4RKF3ktNEwVQ3rUJbXqoyynzYDzucU9bTaZyVZQcbRyavC7DCPb
         9tDA==
X-Gm-Message-State: APjAAAUCov8v+Alg0fgHNlaOiVhf4y/jGboCHgSfjdXrFiMP8iH/rmF4
        vBRCwf/onJdxxoMfpf9TfSTI5SF8
X-Google-Smtp-Source: APXvYqzFX/uD1F7GPZjHvoHO+yb7t2I+M7Y0blqvQuewmzmIoX1QE9QCEFdcBFpj2rAn/7qFKGqaeQ==
X-Received: by 2002:a7b:cb86:: with SMTP id m6mr11956608wmi.124.1574973754092;
        Thu, 28 Nov 2019 12:42:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id k16sm12290150wru.0.2019.11.28.12.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:42:33 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/7] reorganize the __STDC_VERSION__/__STRICT_ANSI__ switch statement
Date:   Thu, 28 Nov 2019 21:42:22 +0100
Message-Id: <20191128204225.7002-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Move some of the cases so that each STANDARD_GNU* is just
under the its corresponding STANDRAD_C*.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/lib.c b/lib.c
index 97d8af390..02f6231e2 100644
--- a/lib.c
+++ b/lib.c
@@ -1405,24 +1405,21 @@ static void predefined_macros(void)
 
 	predefine("__STDC__", 1, "1");
 	switch (standard) {
+	default:
+		break;
+
 	case STANDARD_C89:
 		predefine("__STRICT_ANSI__", 1, "1");
+	case STANDARD_GNU89:
 		break;
 
 	case STANDARD_C94:
-		predefine("__STDC_VERSION__", 1, "199409L");
 		predefine("__STRICT_ANSI__", 1, "1");
+		predefine("__STDC_VERSION__", 1, "199409L");
 		break;
 
 	case STANDARD_C99:
-		predefine("__STDC_VERSION__", 1, "199901L");
 		predefine("__STRICT_ANSI__", 1, "1");
-		break;
-
-	case STANDARD_GNU89:
-	default:
-		break;
-
 	case STANDARD_GNU99:
 		predefine("__STDC_VERSION__", 1, "199901L");
 		break;
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB76510CF50
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfK1Umf (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:42:35 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39271 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfK1Umf (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:42:35 -0500
Received: by mail-wm1-f66.google.com with SMTP id s14so6102355wmh.4
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9cLS7TaGi1EPyQIzjOnM/kM2QHTCkjuHwF/5pvCfGks=;
        b=ZacEVF5wAKB4HkiwUpHoD5C1XTygAZX2R00OMNrQ9d6iWIxQrAxKE2YE3OlYeYEfZ3
         6J4VrUeCjx8Ks/BhVBGReshFyDOqYaZ4Eb0PfrZ7HITcqQSNIGxbZscijNFjP15z3jfb
         8B0OMrZg5z5vMetFQ0jHZ2UsPc4EdjvFcMr8Dzv+pv/bRUTVmfcX96vC3KvbxnLNw8lp
         ykY5VhgJfzB5IjJDJkc+07neXlKJo0pPmThJ1OIdqhmcutEz/voBwvug+gZOpzsSwzzy
         XYJhIe1fNH6KzVOhLLRV+6pw24Fb+P17pZpY+ytaSX+eACvXG0YZm35C8RRIpK/NdBzC
         Oorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9cLS7TaGi1EPyQIzjOnM/kM2QHTCkjuHwF/5pvCfGks=;
        b=b5cZ8gJqOajbYYhk3KUkHcbdd60fZDNY0Xvr2PAr6zXbFK7JuDvTHmbCNioQawrp5E
         4dvIz5ix7+RQGq2KiLfdy53Wf5VathwwCcPIOYhUk/nQZCYYv3obmYXEqHvMbU6k55Is
         h1im52MAQWE0fUVvwmeYtTn0+CyjrAYaDIiwMCHzba6cbxOUtxvujbkbSt43T0E5RQ8a
         uiwAApHOYL57m5sL/OqfYUGAMH4pP38NQuwXFgCHTEZs/MP/X4KczfYh7L241VwelAGW
         4c75Y8s5NjcFuiaPN9YPhsOStBO4fVoTQ3CL28eWvznoWqxwUWCePcVfwBVtQXw3slU5
         TF7w==
X-Gm-Message-State: APjAAAV2AqxeiNAmjPIxtRo4ESH6uD8l788dyXO5i2qk70vGqDiBMUwf
        RfaNLXeAbxnhIKTfJE1crv9fR7y4
X-Google-Smtp-Source: APXvYqzTTyu9KEh7xBEhrfGKhhO6LgI11Wq4QAWwx/LE9TmJO8Hh0QxW2Bg+VtnPyVSK9G503lnjSQ==
X-Received: by 2002:a7b:c773:: with SMTP id x19mr11630013wmk.109.1574973751646;
        Thu, 28 Nov 2019 12:42:31 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id k16sm12290150wru.0.2019.11.28.12.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:42:31 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 1/7] simplify initialization of Wdeclarationafterstatement
Date:   Thu, 28 Nov 2019 21:42:19 +0100
Message-Id: <20191128204225.7002-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In preparation for supporting C17 flags, remove unneeded
STANDARD_... cases and remove the impossible default assert(0).

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/lib.c b/lib.c
index f0b546889..7866800bf 100644
--- a/lib.c
+++ b/lib.c
@@ -890,27 +890,16 @@ static void handle_switch_W_finalize(void)
 	handle_onoff_switch_finalize(warnings, ARRAY_SIZE(warnings));
 
 	/* default Wdeclarationafterstatement based on the C dialect */
-	if (-1 == Wdeclarationafterstatement)
-	{
-		switch (standard)
-		{
+	if (-1 == Wdeclarationafterstatement) {
+		switch (standard) {
 			case STANDARD_C89:
 			case STANDARD_C94:
 				Wdeclarationafterstatement = 1;
 				break;
-
-			case STANDARD_C99:
-			case STANDARD_GNU89:
-			case STANDARD_GNU99:
-			case STANDARD_C11:
-			case STANDARD_GNU11:
+			default:
 				Wdeclarationafterstatement = 0;
 				break;
-
-			default:
-				assert (0);
 		}
-
 	}
 }
 
-- 
2.24.0


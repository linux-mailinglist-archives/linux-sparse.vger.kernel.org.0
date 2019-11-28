Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6644210CF56
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726401AbfK1Umj (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:42:39 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38717 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK1Umi (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:42:38 -0500
Received: by mail-wr1-f67.google.com with SMTP id i12so32659212wro.5
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4c6xagDJW9uwJk+80ATx18zIPs7jBRNc9llsfKmunso=;
        b=pdtS4wZ27Te7zK/74UX8i4zr45k45ThyxuiTqe++wFG6tuZGKgMSw/0qr2STrvkScx
         lIrcfajv854qvnXD9WJRjYRtIKcZ3Fkm2e7HlauycFOTXmtNiFo06z/2poiA2L6c1sqG
         Beeu57m7XiXm24gMimtIafbG5UX0zVatVvB6JKOuhYvliT9//G22eQI4UkZCqWkv6FvG
         g4gpU6YHpyyKTwkMVzMWIGaaZ5iok4mVD65DxOO8Bj04ayF/QID0Lrw7zualUT48dRFv
         yoJz5E15w0kh5NnxT5+XMcHDkZJLZd+tuTjnpLuQDO0bWDJ8Ls3IxZrVFj/jGwlANSA9
         DyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4c6xagDJW9uwJk+80ATx18zIPs7jBRNc9llsfKmunso=;
        b=Hn43TFHBrh9oRLxGfoKAGeXzuApFVPdqnRSAflzIOow+1l3lPhh199leqOh/g++CP0
         o9DBaWxZxxPbXgFb7CPph2WFn34Nkbn29ObtXVKo3Qy4Ag62JHZrpsMG65XlZFmuA/Wh
         pCF7Bni7ahMBTvoDvznCrCPJEqsG3/poc+MzcKP+WbQ0i6orVZi36aMVprwzLANiWjEO
         EI3aMvJaeioM8SVD20RqTCiErbvRFlcg6ICJvp4RK8dQne7n21EZegVQcDnGmSJxofBu
         NJI+TGglemWqbBxnodZecdW00iYbY+ozjxkXWJq/bNv/7aHfs4mKco6kECHHgl2/EA74
         S0LA==
X-Gm-Message-State: APjAAAVgSz7wRFlFughHhMYiDm0zTmWKadtc04cBwjhbICpl45MMwi4e
        HBND4qAcWNMhWM8Zl90+5r6//GZ+
X-Google-Smtp-Source: APXvYqwK+JwlzFV7xqbYmhnNTnTZh+g1ZQEnHSKc10a0KkfMyGH9B6KHawOQSKjVbD95nO5Hv9wWtA==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr51629203wri.378.1574973756763;
        Thu, 28 Nov 2019 12:42:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id k16sm12290150wru.0.2019.11.28.12.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:42:36 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 7/7] teach sparse about C17
Date:   Thu, 28 Nov 2019 21:42:25 +0100
Message-Id: <20191128204225.7002-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

No real support is done here (or is needed) but the __STDC_VERSION__
will return the correct value.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 13 +++++++++++++
 lib.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/lib.c b/lib.c
index 7f7ca846b..8fddae450 100644
--- a/lib.c
+++ b/lib.c
@@ -1079,6 +1079,15 @@ static char **handle_switch_s(const char *arg, char **next)
 		else if (!strcmp(arg, "gnu11"))
 			standard = STANDARD_GNU11;
 
+		else if (!strcmp(arg, "c17") ||
+			 !strcmp(arg, "c18") ||
+			 !strcmp(arg, "iso9899:2017") ||
+			 !strcmp(arg, "iso9899:2018"))
+			standard = STANDARD_C17;
+		else if (!strcmp(arg, "gnu17") ||
+			 !strcmp(arg, "gnu18"))
+			standard = STANDARD_GNU17;
+
 		else
 			die ("Unsupported C dialect");
 	}
@@ -1421,6 +1430,10 @@ static void predefined_macros(void)
 	case STANDARD_GNU11:
 		predefine("__STDC_VERSION__", 1, "201112L");
 		break;
+	case STANDARD_C17:
+	case STANDARD_GNU17:
+		predefine("__STDC_VERSION__", 1, "201710L");
+		break;
 	}
 	if (!(standard & STANDARD_GNU) & (standard != STANDARD_NONE))
 		predefine("__STRICT_ANSI__", 1, "1");
diff --git a/lib.h b/lib.h
index 7958359c1..3e565c6fd 100644
--- a/lib.h
+++ b/lib.h
@@ -235,6 +235,8 @@ enum standard {
 	STANDARD_GNU99 = STANDARD_C99 | STANDARD_GNU,
 	STANDARD_C11,
 	STANDARD_GNU11 = STANDARD_C11 | STANDARD_GNU,
+	STANDARD_C17,
+	STANDARD_GNU17 = STANDARD_C17 | STANDARD_GNU,
 };
 extern enum standard standard;
 
-- 
2.24.0


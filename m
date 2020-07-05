Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFDD214C89
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726957AbgGENCe (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgGENCe (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:02:34 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3448C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:02:33 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id d16so25544919edz.12
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26ZiewEHNxWX5EAuv9sa51RYGJG4O6qcJfTfVaArce0=;
        b=lf/kw4jmFI+1I8/5h62irQuzXUYqy4sFeN0Wt26nqmAXbchRJYi62NLxcpUThP93RU
         pfJIUt+EAHyljvY7LWbDoBBVW04LpdQ37kjZ5+1stVQzltyis0IYR905DYfKI4WkYa50
         ZlehkVrntxXLNPelyWvXhOJMk+64AnxshF9PxuFg/owBP5hEwQGjs5I2+Gp9Ja/1VtqK
         CvkioqKAHTSprgVHioaKCyqck5hjvhuoh/RfmnxdE2TjpxuPRl48NGRA/irp90U1hzNt
         Jc/976hw5TL72CJZB2I6vsJ2AZFJNRBFRVXmeLagtt7dsBHefkiu/bXIbOCYcPTAV/SY
         pAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26ZiewEHNxWX5EAuv9sa51RYGJG4O6qcJfTfVaArce0=;
        b=ibuBwpaGauF7O3Gd+IB8cv87kq8kL5mcm0kGu064u+Hi6geMkwrsX5ZuOrBE4J9qJ/
         as3TWDmT+7OZ4USlGYvW85ZXKVprJAiPM2Xe3yuW3xkKQH9AuZ8kIcWf5SDCpqWq3tjj
         ovpmTVHDz8UcbfFTP5MH4/vvPcIj7vazZX1K7uJHgeYXj7uGbPtzxI3UZhquIKQBj8//
         6dEzFnxu8QOmqiMsTA4RR598TMglNM68KTMggFcgzV/bzOP0vEU4ym9cvGgASwPCdMkK
         UIFHcqBKbYTgtbqPYzUpRizMo/RdgWpkQOosvW21XlbvZE2oxgwf1orKyrMQX1dnUcKx
         i5MA==
X-Gm-Message-State: AOAM532UY8aS5EhSB3KDg/rAGwq7KsU3CDcBat7VxGYQugJUpbI8dDTD
        8FybfmetFT8JEC2dafMedhdTEBr2
X-Google-Smtp-Source: ABdhPJxy8HMSRw8WqU5rlEtwAi7ZtbpecIYuYAXOiL23w5xIgldHxUW+DpD6+90RX5pak9dLoWD1Rw==
X-Received: by 2002:a50:fc97:: with SMTP id f23mr41005768edq.255.1593954152190;
        Sun, 05 Jul 2020 06:02:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id x16sm19535945edr.52.2020.07.05.06.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:02:31 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 05/15] options: handle_onoff_switch() can handle any flags, not only warnings
Date:   Sun,  5 Jul 2020 15:02:10 +0200
Message-Id: <20200705130220.26230-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
References: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

So, use 'flag' instead of 'warning' for variable and function names.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/lib.c b/lib.c
index 9acdc60fc416..c27773097127 100644
--- a/lib.c
+++ b/lib.c
@@ -250,10 +250,10 @@ void die(const char *fmt, ...)
 static struct token *pre_buffer_begin = NULL;
 static struct token *pre_buffer_end = NULL;
 
-enum warning_type {
-	WARNING_OFF,
-	WARNING_ON,
-	WARNING_FORCE_OFF
+enum flag_type {
+	FLAG_OFF,
+	FLAG_ON,
+	FLAG_FORCE_OFF
 };
 
 int Waddress = 0;
@@ -295,7 +295,7 @@ int Wshadow = 0;
 int Wshift_count_negative = 1;
 int Wshift_count_overflow = 1;
 int Wsizeof_bool = 0;
-int Wsparse_error = WARNING_FORCE_OFF;
+int Wsparse_error = FLAG_FORCE_OFF;
 int Wstrict_prototypes = 1;
 int Wtautological_compare = 0;
 int Wtransparent_union = 0;
@@ -529,9 +529,9 @@ static int opt_##NAME(const char *arg, const char *opt, TYPE *ptr, int flag)	\
 OPT_NUMERIC(ullong, unsigned long long, strtoull)
 OPT_NUMERIC(uint, unsigned int, strtoul)
 
-static char **handle_onoff_switch(char *arg, char **next, const struct flag warnings[])
+static char **handle_onoff_switch(char *arg, char **next, const struct flag flags[])
 {
-	int flag = WARNING_ON;
+	int flag = FLAG_ON;
 	char *p = arg + 1;
 	unsigned i;
 
@@ -540,12 +540,12 @@ static char **handle_onoff_switch(char *arg, char **next, const struct flag warn
 		p += 2;
 		if (p[0] == '-')
 			p++;
-		flag = WARNING_FORCE_OFF;
+		flag = FLAG_FORCE_OFF;
 	}
 
-	for (i = 0; warnings[i].name; i++) {
-		if (!strcmp(p,warnings[i].name)) {
-			*warnings[i].flag = flag;
+	for (i = 0; flags[i].name; i++) {
+		if (!strcmp(p,flags[i].name)) {
+			*flags[i].flag = flag;
 			return next;
 		}
 	}
@@ -722,7 +722,7 @@ static char **handle_switch_o(char *arg, char **next)
 }
 
 static const struct flag pflags[] = {
-	{ "pedantic", &Wpedantic, NULL, OPT_VAL, WARNING_ON },
+	{ "pedantic", &Wpedantic, NULL, OPT_VAL, FLAG_ON },
 	{ }
 };
 
@@ -793,8 +793,8 @@ static char **handle_switch_W(char *arg, char **next)
 	if (!strcmp(arg, "Wsparse-all")) {
 		int i;
 		for (i = 0; warnings[i].name; i++) {
-			if (*warnings[i].flag != WARNING_FORCE_OFF)
-				*warnings[i].flag = WARNING_ON;
+			if (*warnings[i].flag != FLAG_FORCE_OFF)
+				*warnings[i].flag = FLAG_ON;
 		}
 	}
 
@@ -858,13 +858,13 @@ static char **handle_switch_d(char *arg, char **next)
 }
 
 
-static void handle_onoff_switch_finalize(const struct flag warnings[])
+static void handle_onoff_switch_finalize(const struct flag flags[])
 {
 	unsigned i;
 
-	for (i = 0; warnings[i].name; i++) {
-		if (*warnings[i].flag == WARNING_FORCE_OFF)
-			*warnings[i].flag = WARNING_OFF;
+	for (i = 0; flags[i].name; i++) {
+		if (*flags[i].flag == FLAG_FORCE_OFF)
+			*flags[i].flag = FLAG_OFF;
 	}
 }
 
-- 
2.27.0


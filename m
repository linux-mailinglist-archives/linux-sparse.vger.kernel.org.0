Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A437214C85
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbgGENCa (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgGENCa (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:02:30 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03DA9C08C5DE
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:02:30 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id z17so32200812edr.9
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DbS74vQpmV1GX6dYv3vTq6zgY9FWesbjUccvShGMrLU=;
        b=B148VQCZmnZ47ylRFDEg9yfxB+dWa8gn1dmaN5J7+RfgX3uK/6CKsXLK6mHabRsVRf
         pAxGlyRSA/QMESADkzUk4CwRRfyiyQ2H/gPTIxu4rmJJe0y213N6gP5InUY/K2cFSvB9
         JSfd5N4N/BsObhv7MivDMSxZP25psO4D7IGCgZet1t8ZoB7qdiXUwr9sRd+H1DfCrAIP
         go15adJ3TFsKpcNcmHAYnf7RQ/VCKiQcpBI+1Co1it3267xXso4kvZOw3a7hv4fgAr+a
         cDUzx/y0YJ2jo4Hh4lDG3XC27xuVNZoigC8FCxc7sJDfULkB47M7VLxTdQCgNTJg+SMP
         L7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DbS74vQpmV1GX6dYv3vTq6zgY9FWesbjUccvShGMrLU=;
        b=he/lLIfPQvKOf2DgOICbRk2o1fG6eKnNBPrKGZNSBzStdXjmdlS2HfC7bQixYQIx3T
         qbfquNj1oH5yTm9pnJY1AajIFUcXLuKgNkOgWQlya0J/vllbH5n9XwabuXDKzcH5j3Xo
         ARnBTBZl9udfvViq9WtZnAVJPAaI7Mt11VzifzIHFfidxxJIkYGA1l2rDN+IM2JwLXbZ
         gGEaTkTWZL0xhaJQCG131iiA5UudBQRfIVOg0KgypJRNr9Flss/2uLTnbx6DJ71Dt6Qb
         uUNbfGhpIKvOZhOXV2U8kL2kWKr7npx36WBVToeMorNTWTNp6nxsGBB9Ceus877f9llp
         m+bw==
X-Gm-Message-State: AOAM532p1VWJMRm8GeMBvIvKP6NR3GKvuJLANORvVjbUeRaiKSTnsDGf
        AO5iiKJRfEwwmojz89Ol5BJUb/J6
X-Google-Smtp-Source: ABdhPJzZSxlegVXupAnPBrDyWP5XIMBwtiutzEhZfiKtLeiFSwy2OdJQhlDSgU5ET12Frkf8kwObvw==
X-Received: by 2002:a50:dacf:: with SMTP id s15mr52580116edj.136.1593954148510;
        Sun, 05 Jul 2020 06:02:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id x16sm19535945edr.52.2020.07.05.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:02:28 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 01/15] options: let handle_onoff_switch() use null terminated arrays
Date:   Sun,  5 Jul 2020 15:02:06 +0200
Message-Id: <20200705130220.26230-2-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
References: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This makes things slightly easier to use.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib.c b/lib.c
index e56788260cb7..709dd5176112 100644
--- a/lib.c
+++ b/lib.c
@@ -529,14 +529,14 @@ enum {
 	WARNING_FORCE_OFF
 };
 
-static char **handle_onoff_switch(char *arg, char **next, const struct flag warnings[], int n)
+static char **handle_onoff_switch(char *arg, char **next, const struct flag warnings[])
 {
 	int flag = WARNING_ON;
 	char *p = arg + 1;
 	unsigned i;
 
 	if (!strcmp(p, "sparse-all")) {
-		for (i = 0; i < n; i++) {
+		for (i = 0; warnings[i].name; i++) {
 			if (*warnings[i].flag != WARNING_FORCE_OFF && warnings[i].flag != &Wsparse_error)
 				*warnings[i].flag = WARNING_ON;
 		}
@@ -551,7 +551,7 @@ static char **handle_onoff_switch(char *arg, char **next, const struct flag warn
 		flag = WARNING_FORCE_OFF;
 	}
 
-	for (i = 0; i < n; i++) {
+	for (i = 0; warnings[i].name; i++) {
 		if (!strcmp(p,warnings[i].name)) {
 			*warnings[i].flag = flag;
 			return next;
@@ -789,11 +789,12 @@ static const struct flag warnings[] = {
 	{ "universal-initializer", &Wuniversal_initializer },
 	{ "unknown-attribute", &Wunknown_attribute },
 	{ "vla", &Wvla },
+	{ }
 };
 
 static char **handle_switch_W(char *arg, char **next)
 {
-	char ** ret = handle_onoff_switch(arg, next, warnings, ARRAY_SIZE(warnings));
+	char ** ret = handle_onoff_switch(arg, next, warnings);
 	if (ret)
 		return ret;
 
@@ -808,12 +809,13 @@ static struct flag debugs[] = {
 	{ "entry", &dbg_entry},
 	{ "ir", &dbg_ir},
 	{ "postorder", &dbg_postorder},
+	{ }
 };
 
 
 static char **handle_switch_v(char *arg, char **next)
 {
-	char ** ret = handle_onoff_switch(arg, next, debugs, ARRAY_SIZE(debugs));
+	char ** ret = handle_onoff_switch(arg, next, debugs);
 	if (ret)
 		return ret;
 
@@ -856,11 +858,11 @@ static char **handle_switch_d(char *arg, char **next)
 }
 
 
-static void handle_onoff_switch_finalize(const struct flag warnings[], int n)
+static void handle_onoff_switch_finalize(const struct flag warnings[])
 {
 	unsigned i;
 
-	for (i = 0; i < n; i++) {
+	for (i = 0; warnings[i].name; i++) {
 		if (*warnings[i].flag == WARNING_FORCE_OFF)
 			*warnings[i].flag = WARNING_OFF;
 	}
@@ -868,7 +870,7 @@ static void handle_onoff_switch_finalize(const struct flag warnings[], int n)
 
 static void handle_switch_W_finalize(void)
 {
-	handle_onoff_switch_finalize(warnings, ARRAY_SIZE(warnings));
+	handle_onoff_switch_finalize(warnings);
 
 	/* default Wdeclarationafterstatement based on the C dialect */
 	if (-1 == Wdeclarationafterstatement) {
@@ -886,7 +888,7 @@ static void handle_switch_W_finalize(void)
 
 static void handle_switch_v_finalize(void)
 {
-	handle_onoff_switch_finalize(debugs, ARRAY_SIZE(debugs));
+	handle_onoff_switch_finalize(debugs);
 }
 
 static char **handle_switch_U(char *arg, char **next)
-- 
2.27.0


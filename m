Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7011214C88
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 15:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgGENCd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 09:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726792AbgGENCd (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 09:02:33 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A01C061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 06:02:32 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id a8so30993232edy.1
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iQrFRXDP8rXNHQcWYNSe+JctoXgQP0kT+O7TInIWU9c=;
        b=Fnye3c6qFWEptJxKdM5KTBf0mpu5aHJobbgGL+lvC8Y292CFGCVKiQKyj1h2jEbMIG
         qQE+jfqhXZplBrXZk2QJH0obmELFDfsARhKJPvZqjoNrglX9FHNLa9CvKYL9JayMivOl
         wkea4ZAIrIVw7u9dlgD+dxe6mLnwJgqS49n5tyJFJHehDKLeeSG1wZvLjztR3Y3Io9PB
         jEmQ+fgrSA59Ao+5HSCtqB1OmaU7HfnoPSMNbsg5ysh9IgsNmxQIYYzBKiyQi47ggMjH
         aRF7klq+j+nNJSqlV7MgX3tf/v+QIGT2/d+20gDJkJwAIVqy4W0CVLy3pqRU0+S4Z4an
         4mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iQrFRXDP8rXNHQcWYNSe+JctoXgQP0kT+O7TInIWU9c=;
        b=DDNsnjBtsF8s93LlDiPLD2YEIr5EZLA44iCQCVG3ePDCWgxavrl1r0w0xRP58zuggP
         zYjwbidHFLFrhMvnpIBR5QZkMIpKsIkaqsBt66yAA0G5y383l4Q8DgeO3VLsrRmQmajq
         boJ544qSFjQ17Ve82+b92zVC60SDSkJkGOm4DIhJJ+DYv0RtnbqgKow3Kf8vBBF+XaQ2
         m55yUd12lyiqmZWl9LjXvmHcxkq41CKLGoZgek3iP/epVZXCP9+Dns4Sbc5377iOjwO1
         HXc0pZzac/ppkLP91ABHAe0xiFO7eY7uTPhe3BjQ0FqY1URJCLorEeeeqgT4Oxe50Rar
         eF8Q==
X-Gm-Message-State: AOAM533Ktqvhw31fngSvY0USHxgoSzFFGhRqmj7HWf2dka5vMVMadTxy
        M8giD3ZrZZz99VqZHFP2jBdjlk2C
X-Google-Smtp-Source: ABdhPJy86BGK5Mmg9jVNBhE5M/paQxHoI8s7yFKAXoeMX7K/5wkwI1AmlOYS6Q0n4j/oU2gBrXnvSQ==
X-Received: by 2002:a50:f392:: with SMTP id g18mr27960447edm.151.1593954151414;
        Sun, 05 Jul 2020 06:02:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id x16sm19535945edr.52.2020.07.05.06.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 06:02:31 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 04/15] options: make Wsparse_error less special
Date:   Sun,  5 Jul 2020 15:02:09 +0200
Message-Id: <20200705130220.26230-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
References: <20200705130220.26230-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

-Wsparse-error should not be enabled with -Wsparse-all, this is
special cased in the condition in loop handling -Wsparse-all.

However, the condition already handle warnings forced to off.
So instead of explicitly checking for &Wsparse_error, it's enough
to force Wsparse_error off.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib.c b/lib.c
index 43d55a0648ee..9acdc60fc416 100644
--- a/lib.c
+++ b/lib.c
@@ -276,7 +276,6 @@ int Winit_cstring = 0;
 int Wint_to_pointer_cast = 1;
 int Wenum_mismatch = 1;
 int Wexternal_function_has_definition = 1;
-int Wsparse_error = 0;
 int Wmemcpy_max_count = 1;
 int Wnewline_eof = 1;
 int Wnon_pointer_null = 1;
@@ -296,6 +295,7 @@ int Wshadow = 0;
 int Wshift_count_negative = 1;
 int Wshift_count_overflow = 1;
 int Wsizeof_bool = 0;
+int Wsparse_error = WARNING_FORCE_OFF;
 int Wstrict_prototypes = 1;
 int Wtautological_compare = 0;
 int Wtransparent_union = 0;
@@ -793,7 +793,7 @@ static char **handle_switch_W(char *arg, char **next)
 	if (!strcmp(arg, "Wsparse-all")) {
 		int i;
 		for (i = 0; warnings[i].name; i++) {
-			if (*warnings[i].flag != WARNING_FORCE_OFF && warnings[i].flag != &Wsparse_error)
+			if (*warnings[i].flag != WARNING_FORCE_OFF)
 				*warnings[i].flag = WARNING_ON;
 		}
 	}
-- 
2.27.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DC420DF7E
	for <lists+linux-sparse@lfdr.de>; Mon, 29 Jun 2020 23:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732539AbgF2UhZ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 29 Jun 2020 16:37:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgF2TUw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 29 Jun 2020 15:20:52 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F6D2C061755
        for <linux-sparse@vger.kernel.org>; Mon, 29 Jun 2020 12:20:52 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id d16so7268264edz.12
        for <linux-sparse@vger.kernel.org>; Mon, 29 Jun 2020 12:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6kLm0XLnXyE4TwBce8D7jDXFBSNDQY07cghJ240z8Ms=;
        b=h/P3TS2bFGYTYxoUI9ryM82tBOW8ZPzulMTeUrmZiyyI9litFAGE4t90qBdJNCWhbV
         /g67W1RBMC6QzpZNhAPdkYmKu1Q3VWLcEwM4Mp7pnxkG51e6qPFJ5+s5OwkghqKUVL3F
         8Y/6FiVvPMeCKt+X4y5d7rqNV8EEjpwYXcF51cn1pUM6+JgwA2whke5R7C2O3Tj5XbSB
         IWKgc2SdHrXvNeW3r88UPdo+7HIlcH41CuAkbs3EZ7si28tMvAmeYzRpPyjiEU1rFOqA
         0u5fylWBIpVrA+YgKyPP6f/8H2n5aRl8A1zg2xm214XGGbNIkMZXxDbs+vanqmzLbN5d
         Tsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6kLm0XLnXyE4TwBce8D7jDXFBSNDQY07cghJ240z8Ms=;
        b=tJHB9xDDdLc/vYqh+IfC6HJlca3G7qhUIysoSPYJm1BjwHxjv0MMjsgvmlyGOSSVg7
         JG/3rSWsj2raNEyzWD+XwRH0hPpkdLI5PlIoiTd4kJlYJIrL7uI7HDNgbKg2RE8IsPJO
         Wd4InYO7pbMKWkiBPIpZvYQoxMQCmhi9knHoLlDkQxWqRROrtFF8ffQqe1Mglt+ieGxr
         45W3D4q6B8PKyXVCLnkWrPV2W5bnQbgT6OI/qaFTzy33E7gFYB2nKJMFC1YOndXyYod/
         19RWGZOSdDutEhiSbLaHd97JFQ588o3b1UMRxxcgLyUgOicNfCoWBDtF0CDjz7112i49
         Yycw==
X-Gm-Message-State: AOAM531VhLOg4zsgiKgi318U5cvDJ9JfPHd9X0GPe+qP6smvU3yVhZ7g
        m7JIw8rX/xQ74kdXC0XMEXbRiR8o
X-Google-Smtp-Source: ABdhPJxsn012ci0kYr5OagDUjhN94CIxg4sfhbvnhOmmlgq7/J9oXJ81TVzAdEqseGuOrhjciD9Gbg==
X-Received: by 2002:a05:6402:1687:: with SMTP id a7mr18962017edv.358.1593458450728;
        Mon, 29 Jun 2020 12:20:50 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4d36:64ba:210e:1576])
        by smtp.gmail.com with ESMTPSA id s18sm176783ejm.16.2020.06.29.12.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 12:20:50 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] preprocess: use predefine() also for __%s__TYPE__
Date:   Mon, 29 Jun 2020 21:20:47 +0200
Message-Id: <20200629192047.92114-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Most predefined macros are created by predefine() which
avoid the 'write then parse' done with add_pre_buffer() but
those defined by predefined_type() did not.

So, convert predefine_type() to use predefine().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib.c b/lib.c
index e56788260cb7..d8fbe8b1a006 100644
--- a/lib.c
+++ b/lib.c
@@ -1274,7 +1274,10 @@ static void predefined_min(const char *name, struct symbol *type)
 static void predefined_type(const char *name, struct symbol *type)
 {
 	const char *typename = builtin_typename(type);
-	add_pre_buffer("#weak_define __%s_TYPE__ %s\n", name, typename);
+	char buf[32];
+
+	snprintf(buf, sizeof(buf), "__%s_TYPE__", name);
+	predefine(buf, 1, typename);
 }
 
 static void predefined_ctype(const char *name, struct symbol *type, int flags)
-- 
2.27.0


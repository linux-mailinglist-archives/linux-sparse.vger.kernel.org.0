Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6F4E10CF52
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfK1Umg (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:42:36 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:56264 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1Umg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:42:36 -0500
Received: by mail-wm1-f66.google.com with SMTP id a131so7814542wme.5
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/m3Bm97xbmDqG6WfAQuxFu8Ey/SntMc03Un9KkL6GrY=;
        b=ATdAyhexrVFjhF+etEq8rDy4gRn61m5wRrH+tOWKHb6WocH9cu485JUdA1yoSXxnHF
         eierQQTIZVdZcN15Hgr/GTXilQI6YUBknNfm+YpMQUYcz1v2Lg3J/vy1P9/YGhUPd17Q
         D3ywz3fsfwHKKqV3AOcJrWtFMO7ensuPChF3nHLUN+lzxO5Ji4rO1DWHCcbUu5eIWwb5
         ewY/3egP6kGYFyfJEzVLp9MyKzvu/8r1PXhj8RpFyaDFYnGxouRA3KpPSVl02Futc4xH
         E9bm2Y757hid5devsbyifdHpN6bMBLTJlQwI8R0DDoMISOKBl+pGJ+848JzGw6VLfFMR
         CSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/m3Bm97xbmDqG6WfAQuxFu8Ey/SntMc03Un9KkL6GrY=;
        b=GRIUoMdHcfWdj52Jm2ZjQ/QGIzz6hbqEle8LU0kPeVtMsTPUzoUeFM6rnfRQFY89eJ
         ebWaMqeMF8Vzf11NqSajuWWCJnT3bPtiEtmrl75l6YZI+kbwk0fLahenuucosuM4MVhe
         H0keTzEIQGSD/j6ArzbxT5bzaMz9rU9CPhdXdsAEIHb4cOABRq+x2MzvGC8ngfHiJC3i
         k8+3LZq3yFb5lesj06Oovay2I3LZtbdDvf57KHddtFFfTnEqE5uwvTmfKCyA2A4BKTjp
         5taDT/Pp17QEy7l3xDaVbDxLeyvRzN7jE+6o6F2aN8e2tKjvMLOViIGUFynHYTZkgtXu
         JNTQ==
X-Gm-Message-State: APjAAAUMee5wVztasKnEaDfsEiLR4G5DzTNJ8qyUF8/YGHTznrlKg3/W
        GYsOxVuJ0K0qomq6sZAhmyCC+pDO
X-Google-Smtp-Source: APXvYqx+qdZmXU+312J3RXq48YBF64VtlsEM7xrc3EdIDGUIlwZkImmtA9yZAC/FFsXu1+1Di7iCsQ==
X-Received: by 2002:a1c:560b:: with SMTP id k11mr12082962wmb.153.1574973752631;
        Thu, 28 Nov 2019 12:42:32 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id k16sm12290150wru.0.2019.11.28.12.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:42:32 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/7] allow to test the standard version outside of lib.c
Date:   Thu, 28 Nov 2019 21:42:20 +0100
Message-Id: <20191128204225.7002-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Since semantics and supported features can differ between
standard version we may need the supported version.

Allow this by moving the variable 'standard' and the corresponding
enum definition to lib.h

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 lib.c |  8 +-------
 lib.h | 11 +++++++++++
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/lib.c b/lib.c
index 7866800bf..97d8af390 100644
--- a/lib.c
+++ b/lib.c
@@ -318,13 +318,7 @@ int funsigned_char = -1;
 
 int preprocess_only;
 
-static enum { STANDARD_C89,
-              STANDARD_C94,
-              STANDARD_C99,
-              STANDARD_C11,
-              STANDARD_GNU11,
-              STANDARD_GNU89,
-              STANDARD_GNU99, } standard = STANDARD_GNU89;
+enum standard standard = STANDARD_GNU89;
 
 static int arch_msize_long = 0;
 int arch_m64 = ARCH_M64_DEFAULT;
diff --git a/lib.h b/lib.h
index 684a4955d..1eb455618 100644
--- a/lib.h
+++ b/lib.h
@@ -224,6 +224,17 @@ enum {
 };
 extern int arch_cmodel;
 
+enum standard {
+	STANDARD_C89,
+	STANDARD_C94,
+	STANDARD_C99,
+	STANDARD_C11,
+	STANDARD_GNU11,
+	STANDARD_GNU89,
+	STANDARD_GNU99,
+};
+extern enum standard standard;
+
 extern void dump_macro_definitions(void);
 extern struct symbol_list *sparse_initialize(int argc, char **argv, struct string_list **files);
 extern struct symbol_list *__sparse(char *filename);
-- 
2.24.0


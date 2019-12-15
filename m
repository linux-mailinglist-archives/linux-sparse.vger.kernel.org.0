Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461DC11F754
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 12:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfLOLGd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 06:06:33 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55825 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfLOLGd (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 06:06:33 -0500
Received: by mail-wm1-f67.google.com with SMTP id q9so3511768wmj.5
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 03:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wqokH0Rw7Ml11N7Dg3ko+cTdLX3mZ7jL0f+GYSEsri4=;
        b=DBEJb0bbMKJu/I0HocusLCQVYX1CU/SUCZ6kNtiCC6tq9mz+IEkRCqk9N7G7mncugi
         6zaYx6HDEvFokNSt3LTv34ypqnykew+WuDNOfLyfk73QuGDJVtnOzII2NU4cDP+mwWSF
         NhDdDHEUdPyYw87eylo5gWnEE74D9xnGilF+jYFvD/jQ2zB9NXIeLr6v/aU5qyXFD/tA
         IVj3YrfRxxFA/0HoQQs5MBnPvKCEBn7cl5RHSZ76wVlXesXn4iTJ6hWkyuFJjk3b8eX5
         9VGr+YfXACHjsNTr93U6tj+iJkLeAoX7UIx4ui5XVl+qXLAOHxhit7YwmtfjvZ+IgQNB
         +iUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wqokH0Rw7Ml11N7Dg3ko+cTdLX3mZ7jL0f+GYSEsri4=;
        b=tw2vqf+h2Q+m3dOGoFtwTg5k5VK83r0YiedqXjoElyUYlMi1jip59W9E2VuKsW5xgg
         wvBIvjqmGIa6IwGxTapEe+myxqFyArNjUFvEA5nFZtNt6MMT+eOhUnHxg93q+Fj47EzE
         SXCvTiG2MeIVi9rAApqlj0nkTuTy1+pCdSwZYH3ZNLgf9pZPbz4btRh27AonKInX2iav
         yYtRKw0+dlp2VEjV0Qll3NBYd5F1Qs3Du+YvSuRP34O3dteHp34YEZo/Vg5pL8hHIsub
         fUpmwjY+13gBAuuvG00fVHWwBimNt/XUwUshGf9VkuTIXfetL/E3fI3Iwl6OyzsV0fgB
         BRvA==
X-Gm-Message-State: APjAAAUaJvtjK4JOBuRKPygx2yzZWEAp8fYb7EylKRl1WAsqvThszSaO
        phnNCCngafVvxW1LoFoyjup2qiZh
X-Google-Smtp-Source: APXvYqxUep0vEClp6Ptm5Am+sYwF8DLBdDBR5gYnFobv4FhbOtg5MgISMD8uLBTwG5UnINxh/FM6rQ==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr23579199wma.72.1576407990944;
        Sun, 15 Dec 2019 03:06:30 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:40f6:4600:180:4f0:43c8:9084])
        by smtp.gmail.com with ESMTPSA id r5sm16760690wrt.43.2019.12.15.03.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 03:06:30 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/4] typeof: do not let classify_type() do its own SYM_TYPEOF expansion
Date:   Sun, 15 Dec 2019 12:04:23 +0100
Message-Id: <20191215110425.76533-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
References: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

SYM_TYPEOFs are expanded at examination type.
However, classify_type() does its own expansion of SYM_TYPEOFs.
Worse, it does this differently (address space & noderef are
not removed)..

So, to enforce the same expansion, also use examine_symbol_type()
to do the expansion in classify_type().

Note: it's not sure that it's currently possible to have
      SYM_TYPEOFs to expand in classify_type().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 evaluate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/evaluate.c b/evaluate.c
index 539ef8038587..038fd64ace9e 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -383,10 +383,8 @@ static inline int classify_type(struct symbol *type, struct symbol **base)
 	if (type->type == SYM_NODE)
 		type = type->ctype.base_type;
 	if (type->type == SYM_TYPEOF) {
-		type = evaluate_expression(type->initializer);
-		if (!type)
-			type = &bad_ctype;
-		else if (type->type == SYM_NODE)
+		type = examine_symbol_type(type);
+		if (type->type == SYM_NODE)
 			type = type->ctype.base_type;
 	}
 	if (type->type == SYM_ENUM)
-- 
2.24.0


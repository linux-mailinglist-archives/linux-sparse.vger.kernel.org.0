Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AA01F8998
	for <lists+linux-sparse@lfdr.de>; Sun, 14 Jun 2020 18:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbgFNQCm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 12:02:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbgFNQCl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 12:02:41 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869B5C05BD43
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 09:02:41 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id c35so9750491edf.5
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pn5unKFggrumAkSOqzaQU5EhknEf91EyT9CROq+X2Bg=;
        b=LcYtV6VVSuk9g2UHVhn17gu+27yZKUjNgV1VjlbEyYDyrohkNNB8HP3pZvMNdddzOu
         2ayp9t9GSFdC2ODPGUOrWiuoKm/KdXD1vMSoCCJs6n5oKd5/V6elXnIN92t+7SxE+pxZ
         tlM8uO1qiyGox0tKXn/SCs9/MoA7V4E4R68pR6nXoOFSEGu1WwLv2kM+N4sWV1C200l3
         8zNWR9vZk9F5IODoLUpUuiXyiao/EDyj9kn55S4S7ZwX2i6h5bi5oiaPYDbzdInT1f4s
         TgwghPZHngk9U1jvdTHpbiDZm6BIpvfF1U2e/4PQ5z1tNfZxsf4If9QincmPoDfdSV4e
         wohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pn5unKFggrumAkSOqzaQU5EhknEf91EyT9CROq+X2Bg=;
        b=PanxU5mC8UfU65A4gLnAdPGk4T4WaqLZQxUfu4OzuX785FiFMgY/a/j4j1y+Ag78dY
         aCMvY+ydF86GXPTNw6GpGqFUw4azEROXcDptkZ1MA1X3SfVL1j98soxwN/1DOnqtYyUF
         K62MFq08Y/6pibF2jDnE/EGnVdwP9lRk/DwcOqVoOh2htW3yB73s3seB6WF3wMm+bMd4
         ULnJRXw4e42ujjc6Gn8TQxvhXOEe7Yxm2C4FpJx7F1YfAgFvZ+Vakxj8rmnC670DKckd
         sqog9tvqNQ1RIWyeLaIaLGoQcB5GI3GiWqVOYTHCyQChbj5pDtFhKcHRjrqnx+jaquDr
         hCHA==
X-Gm-Message-State: AOAM531JOQ9LDaHUmtyWjH60h92wbFMxB2qZyMl0SgW1Lw5SOxB0w4b0
        V7Dc66QXQA9nG4JO+rc8cvXC3B+b
X-Google-Smtp-Source: ABdhPJzfsBXeefvAnhIbSgV1QgaidadAcXNk4smEZAvepaZyoZTKjMZM8SbDmNWMUJrKqZWlnuWzQA==
X-Received: by 2002:a50:f087:: with SMTP id v7mr19767794edl.225.1592150559589;
        Sun, 14 Jun 2020 09:02:39 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:f5a6:a3a1:7989:34e])
        by smtp.gmail.com with ESMTPSA id p23sm7363428ejw.125.2020.06.14.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 09:02:39 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] attribute: parse but ignore enum attributes
Date:   Sun, 14 Jun 2020 18:02:35 +0200
Message-Id: <20200614160235.22320-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Currently, sparse is confused whne encountering an enum attribute.

Teach sparse about these attributes and, for now, ignore them.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/parse.c b/parse.c
index 570b2516714f..70d8b237ce5e 100644
--- a/parse.c
+++ b/parse.c
@@ -937,8 +937,12 @@ static struct token *parse_enum_declaration(struct token *token, struct symbol *
 	while (token_type(token) == TOKEN_IDENT) {
 		struct expression *expr = NULL;
 		struct token *next = token->next;
+		struct decl_state ctx = { };
 		struct symbol *sym;
 
+		// FIXME: only 'deprecated' should be accepted
+		next = handle_attributes(next, &ctx, KW_ATTRIBUTE);
+
 		if (match_op(next, '=')) {
 			next = constant_expression(next->next, &expr);
 			lastval = get_expression_value(expr);
-- 
2.27.0


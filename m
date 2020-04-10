Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9BFC1A4A09
	for <lists+linux-sparse@lfdr.de>; Fri, 10 Apr 2020 20:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgDJS4r (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 10 Apr 2020 14:56:47 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55252 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgDJS4r (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 10 Apr 2020 14:56:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id h2so3367390wmb.4
        for <linux-sparse@vger.kernel.org>; Fri, 10 Apr 2020 11:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cgPAoUqRNgsMP0yFp9LB/ywh/tt65ksokIhhU9VQJWM=;
        b=XvfweoUxegkPkFXb6kyHGI53xXaQSnvBW3YFJUASOR6y+Bc9WR38DBGz16vhKHb83d
         6u1ZNWUE8d6/kLjnWaApgIJhhMq+3lZGI9XmIGlwcEZPONacjR2N0PdQGiFtvcmu2o/S
         rhMl/44DK8q0PfwUcoEDr+EdQgnmJkaMsyv6MOUpWoltmIak3iO5bTmifppr+hMS9JHG
         +Ijok2eCPltcPCCTD/M9ExVvCX0UxlfQT8YrFlwLMor/rdryfgQkXFy5FFt+Frzv7At/
         Nbok3jHhMyTJdy06POm6tvIaqXo6FIZ/Rw2sTrFSwIYcMHRJdfGXFpYEjWFS71yX09v6
         S34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cgPAoUqRNgsMP0yFp9LB/ywh/tt65ksokIhhU9VQJWM=;
        b=F1A2xyukpZ9cFJV+mnMc4/+YFxwxYbZyxZqkxejnm5DR5p17Z3Eio5HnukTZMKghk5
         rflQSasBtrVlSwGgiHObu7vFnXNDCmfrVtl+86iZqvTREQuiBOCsNGquEsZu1z94/9bN
         Lws58Zjn5ap2KXHzksjo6wxM2vVmSN6/YwxDv4Ng/lGkG2OOblpXbyukaNv06HtM31qm
         PTI1P3exKz0QdazmNORD7oWgVAz20+HEQWTAX3PDe/PEiO7zMQ+wKqQqkLJ2Xjw2dcbd
         BmGOrTD5MlKLdC2Jllv8u1dngVFNVJelVX0cYeElvatn9Rc5OWS3BiRgDjFIjXmy+Tg9
         9yRg==
X-Gm-Message-State: AGi0PuYRCkq3dtc2+50HriEfIUOJVlzUCB5VI5BAYnWOJO/+kFlj9l+y
        KTdp4wgI9Z9D/Zi6w1vC6kGeEsjz
X-Google-Smtp-Source: APiQypL9hAiSojALFjPZe9vf2Xss6yPUQ1a089RGBlbve/1erHSyqMyhvlEQM+qbeJ1FmeUxzwVSyQ==
X-Received: by 2002:a1c:bd89:: with SMTP id n131mr6263890wmf.3.1586545006592;
        Fri, 10 Apr 2020 11:56:46 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:957f:f707:be30:7cd4])
        by smtp.gmail.com with ESMTPSA id a7sm3849333wmj.12.2020.04.10.11.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 11:56:44 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] do not use expr->left for conditionals
Date:   Fri, 10 Apr 2020 20:56:40 +0200
Message-Id: <20200410185640.65301-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

expr->left & expr->conditional are unioned but 'left'
should only be used for binary operators.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expression.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/expression.c b/expression.c
index ffb6cb9dc415..5b9bddfe456e 100644
--- a/expression.c
+++ b/expression.c
@@ -873,7 +873,7 @@ struct token *conditional_expression(struct token *token, struct expression **tr
 	if (*tree && match_op(token, '?')) {
 		struct expression *expr = alloc_expression(token->pos, EXPR_CONDITIONAL);
 		expr->op = token->special;
-		expr->left = *tree;
+		expr->conditional = *tree;
 		*tree = expr;
 		token = parse_expression(token->next, &expr->cond_true);
 		token = expect(token, ':', "in conditional expression");
-- 
2.26.0


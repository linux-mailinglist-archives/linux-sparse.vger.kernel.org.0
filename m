Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A327D1D6E0E
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbgEQXba (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbgEQXb3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:31:29 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644A2C061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:29 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k12so7498236wmj.3
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wEn2Llv+7tQxz1GWIoIHc5RMU4LDdYNK1BXklsXeO7c=;
        b=EmXOWwxdV5gJhRLGsbV5rSO7WhCvkm2bM6yvnzKfTtWhzJl7uczN46WY3ZuHF9ImsN
         JjsF3wxtn3nd0biN1sStIGgSQ1kIjMQeCy3f95Di4f4cEsnl8z4xzWtUm7O7wvgHibwS
         6X2+8gWS9NnJlvHQrTfkBx1RtLr8Qdlooqd0AhhEixnoZJke2T1mqV3CnRnq021o3Bmj
         qjBBm99ibLpBAqpgHoviknYvh8ghQuqoaMj/CRy0rLF8vfPKh8PJHzew8CYuNeUQuqvN
         On1zX9os/xDyMpJnpdYqOR+uPIApjTWRK/6kNd+82Sly9M15D0P74FkYYCMP4NuFdp91
         gqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wEn2Llv+7tQxz1GWIoIHc5RMU4LDdYNK1BXklsXeO7c=;
        b=l3B90XR+OROYGJErm7QzF2+RbJYG+CKrY97MP5+5HDDVJ9lGk87kmjmvTx8Rd6PIF3
         0AnE4Trvr2SZ/30rIiy27N0HXIHa4Ep8lQeTZ+LYiWG+T6RhKHzJDsvVtzV04Ynn8i/P
         LAeR3PuRj8J9YtLYbTr+AOc0XqO3IDrsqzHSdJVxsf/8FKLvc5gNxG9tCNqt/wa7idcS
         4oAzZFGFoLgaBukVLmzZf8eenkiuDIW2tH1jit3K/CMpoXh+/niqItLdx8vWFZkBwSpF
         6M80TX+LbNP5ABijJdzBH1pCTzBoYkiNLwz88/01LjkTOzNusa+WCGyVelOE8S0ud3wv
         giwA==
X-Gm-Message-State: AOAM530PeQmInz9N164ixpy+i/mTe5e7wZ0v9/4CSayG/PHidE9okObU
        BQFHGaQuPrA7ct11xeY1dNXFx4z3
X-Google-Smtp-Source: ABdhPJx60h84QnNHsMccKswTBqyQ8jyaf6q9cAt6ktrmCfSFNooQ+x6MWGMYVwhgI1ZJ/vI9816DoQ==
X-Received: by 2002:a1c:2d14:: with SMTP id t20mr16438393wmt.28.1589758287919;
        Sun, 17 May 2020 16:31:27 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id 89sm14665016wrj.37.2020.05.17.16.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:31:27 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 2/6] attribute: add helper apply_mod() and use it
Date:   Mon, 18 May 2020 01:31:18 +0200
Message-Id: <20200517233122.1872-3-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200517233122.1872-1-luc.vanoostenryck@gmail.com>
References: <20200517233122.1872-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

to avoid duplicated code checking for ... duplicated modifiers!

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/parse.c b/parse.c
index a29c67c8cf41..974ff7a1961c 100644
--- a/parse.c
+++ b/parse.c
@@ -1127,11 +1127,16 @@ static struct token *attribute_aligned(struct token *token, struct symbol *attr,
 	return token;
 }
 
+static void apply_mod(struct position *pos, unsigned long *mods, unsigned long mod)
+{
+	if (*mods & mod)
+		warning(*pos, "duplicate %s", modifier_string(mod));
+	*mods |= mod;
+}
+
 static void apply_qualifier(struct position *pos, struct ctype *ctx, unsigned long qual)
 {
-	if (ctx->modifiers & qual)
-		warning(*pos, "duplicate %s", modifier_string(qual));
-	ctx->modifiers |= qual;
+	apply_mod(pos, &ctx->modifiers, qual);
 }
 
 static struct token *attribute_modifier(struct token *token, struct symbol *attr, struct decl_state *ctx)
@@ -1142,10 +1147,7 @@ static struct token *attribute_modifier(struct token *token, struct symbol *attr
 
 static struct token *attribute_function(struct token *token, struct symbol *attr, struct decl_state *ctx)
 {
-	unsigned long mod = attr->ctype.modifiers;
-	if (ctx->f_modifiers & mod)
-		warning(token->pos, "duplicate %s", modifier_string(mod));
-	ctx->f_modifiers |= mod;
+	apply_mod(&token->pos, &ctx->f_modifiers, attr->ctype.modifiers);
 	return token;
 }
 
-- 
2.26.2


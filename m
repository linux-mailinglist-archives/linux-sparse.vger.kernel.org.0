Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9291F5D29
	for <lists+linux-sparse@lfdr.de>; Wed, 10 Jun 2020 22:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgFJU1t (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 10 Jun 2020 16:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728694AbgFJU1s (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 10 Jun 2020 16:27:48 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE8EC03E96F
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:47 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id q19so4070223eja.7
        for <linux-sparse@vger.kernel.org>; Wed, 10 Jun 2020 13:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BrNjSVzFahrYdg1mXeizCo4LZYrYmllXh2OsyQZuulk=;
        b=JpvGPvaiRkbjAawka185cPddzh8ArrQimCO2BJPjRi090ZojwZfLrQImBGD4VrBH3n
         APhFwLZ7q3exDOvGA6VtlSZWvKjGl7FNGGcx30/SKfZVWHXJ/SAyEVLLlgki1LOzwIRG
         ketg8C7AsI1tvYPZZgTZUinxWxP2crEH0hkAnR2C/9lh70cT1Def7A9vmtJP6Yoqm5hY
         neXpuw23BTBcqwc57qCApqpoIc8BvQwRIpoNA/31SMkg1Pp1exRjBHDElZgdYPudMOx9
         xQSpTnIJVOiaadmK9nJ+mUmlfUTkhxDKTWnwXE7cwEOYmX6QjmFyrYoMUNfhU0C/20R+
         S9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BrNjSVzFahrYdg1mXeizCo4LZYrYmllXh2OsyQZuulk=;
        b=hrRvi4n1SbppvmIFpvzkhjOf32ksvWGtgzZjmii3OQCi9pGGX0gjwHTE5jiFFIOp8B
         ddSbdU9jfkRg1pIamGLMWKExad74wVtz6L9Z8Ub6oDxsHnNwXi4onySEpqkOAGFGmyqN
         gJ59/UG/nhPymXs+fbIE3rPv7b0hYHZfDQ4gk8/UiMAghdkBTKNtoVedCj/0gQF9Y8Gl
         LVTM+5OUnisbamxbezWnaGXrJ+Sl/4S6X+Tf82T9iOkHMbbcdud42JDM00DM1me0omhQ
         rRbi+aasIyOHGFQyuMkXrrteO8bwt9wtxrzzYPbvgqs0nVPvtyMDtkqdeX3iqM1Us3VL
         UGAQ==
X-Gm-Message-State: AOAM530QVfQ98k5Q2OK6unlAgcvb7A2q2H9pCRkqZmbwybpLuxI0RYrI
        vT5tEOgKFgSHwB5oghXaw3cyC60x
X-Google-Smtp-Source: ABdhPJxTu4BEph+N3syg+TFwlgiwtLcv68HHdKOdBxSEYkaPjhWr+7UHFPiHVke54yToV4XOz5tQLA==
X-Received: by 2002:a17:906:17c1:: with SMTP id u1mr5407901eje.47.1591820865947;
        Wed, 10 Jun 2020 13:27:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:4870:48de:5f59:675a])
        by smtp.gmail.com with ESMTPSA id m91sm391895ede.96.2020.06.10.13.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 13:27:45 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/7] builtin: add support for arch-specific builtins
Date:   Wed, 10 Jun 2020 22:27:32 +0200
Message-Id: <20200610202735.84968-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
References: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Now that a table is used for the declaration of builtin functions
it's easy to support arch-specific builtins.

The main objective is to not 'pollute' the main table with
arch-specfic entries for uncommon architectures.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 builtin.c | 4 ++++
 target.h  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/builtin.c b/builtin.c
index bb9ec65b2d20..dcf8200ec002 100644
--- a/builtin.c
+++ b/builtin.c
@@ -391,6 +391,9 @@ static void declare_one_builtin(const struct builtin_fn *entry)
 
 static void declare_builtins(const struct builtin_fn tbl[])
 {
+	if (!tbl)
+		return;
+
 	while (tbl->name)
 		declare_one_builtin(tbl++);
 }
@@ -587,5 +590,6 @@ void init_builtins(int stream)
 {
 
 	declare_builtins(builtins_common);
+	declare_builtins(arch_target->builtins);
 	init_linearized_builtins(stream);
 }
diff --git a/target.h b/target.h
index a89e21b63563..1202c0be1ac9 100644
--- a/target.h
+++ b/target.h
@@ -54,6 +54,8 @@ extern int bits_in_enum;
 extern int enum_alignment;
 
 
+struct builtin_fn;
+
 struct target {
 	enum machine	mach;
 	enum bitness	bitness;
@@ -71,6 +73,8 @@ struct target {
 	const struct target *target_32bit;
 	const struct target *target_64bit;
 
+	const struct builtin_fn *builtins;
+
 	void (*init)(const struct target *self);
 	void (*predefine)(const struct target *self);
 };
-- 
2.27.0


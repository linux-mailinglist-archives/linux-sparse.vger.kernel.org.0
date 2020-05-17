Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889E31D6E11
	for <lists+linux-sparse@lfdr.de>; Mon, 18 May 2020 01:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgEQXbc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 17 May 2020 19:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbgEQXbb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 17 May 2020 19:31:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63473C061A0C
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f13so7478658wmc.5
        for <linux-sparse@vger.kernel.org>; Sun, 17 May 2020 16:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7PDvGlMBU6WJjbOrqKVemkBxSLuxoCWv3rw+gpLR1dY=;
        b=iD43iW8w9dstKNh30UDH/LmyI9bUT7ABruKZWUEnfWsQZT9W35SXN4OxGVdmMHHlyN
         6QiK0PBDxpIdGKOgzAonNHKdey7Iv+XyNEBjWziMT0FMLpW6MR/0/NTYZtKRQ2BBZCAI
         2O/DPDz3P3Vy8taeh3vgvmsvyAPHdOcyYKwhGdVmQfpD8syMgN2c76ZCYTbQlTMH8G69
         XwYmiUSiRo71Gd+aG7ZnD2S1CJroC6F/9LGY6wy9VVOy+LPj9LLFzSu8Y7LzGjYYhPHA
         RNZspow1tEL6eBw7QjhplIbQK8hkhbLOocFaTU5nGZOV5+0amcod5TgxFeIBkS56GjSS
         uqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7PDvGlMBU6WJjbOrqKVemkBxSLuxoCWv3rw+gpLR1dY=;
        b=e8sVOLU8JiDPwhRgGC1JInFdmGHLX2fK3tf/Q41XnHcIxOwLMy8I96WY2PHTljpQFb
         MUZGY+GtHzSRl8pbymjuXvHYKFaXhTWhf6TLzw6pM4PGeYZmWh1ROtpWj+pVbX6XoAWW
         GoVWX3uN+NuWTvnaeVJ0ISdZpyCk9moY+Qk8LEiRwSQWNzilS0bgPmLXDAMY/hzVmRpZ
         N3c/gQiiKtDiIjbikqpHZR3+lhFBL49aMoN3SwC2R00nmbYlE9zvkBatWDWzHYnuX/7T
         rI4vCbxlrvsu/ikWluWjV0sJYSgJ1BELlGk+GxF88xua+AWaTlMG3UevcvxbAmThisfJ
         AVLA==
X-Gm-Message-State: AOAM531qD98EvGp6Cg9qgXfyUJW+Kp/CMHma4vPiyMeTEDKhpl/+yqay
        1KfRyAsGJEYdzRczRpAMnOpI/QHj
X-Google-Smtp-Source: ABdhPJy9nexZqfJtq248O4m2JAJHo8OVSH5PROBrub/Crg2wgXkC9/zL/ZrhfO620Qmacwaa388XwQ==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr15936190wmb.22.1589758288939;
        Sun, 17 May 2020 16:31:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:8065:6deb:a00f:4f2])
        by smtp.gmail.com with ESMTPSA id 89sm14665016wrj.37.2020.05.17.16.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 16:31:28 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 3/6] attribute: allow some attribute to be present multiple times
Date:   Mon, 18 May 2020 01:31:19 +0200
Message-Id: <20200517233122.1872-4-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200517233122.1872-1-luc.vanoostenryck@gmail.com>
References: <20200517233122.1872-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

A warning is issued when a qualifier or another modifier
is present more than once in a declaration.

This is fine but in the kernel some attributes, for example
'unused' & 'gnu_inline', are sometimes present multiple times
in the same declaration (mainly they are added in the define
used for 'inline'). This then creates a lot of useless noise.

So, use a (now empty) white list to not warn when these attributes
are present multiple times in the same declaration.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c  | 2 +-
 symbol.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/parse.c b/parse.c
index 974ff7a1961c..c1573b396840 100644
--- a/parse.c
+++ b/parse.c
@@ -1129,7 +1129,7 @@ static struct token *attribute_aligned(struct token *token, struct symbol *attr,
 
 static void apply_mod(struct position *pos, unsigned long *mods, unsigned long mod)
 {
-	if (*mods & mod)
+	if (*mods & mod & ~MOD_DUP_OK)
 		warning(*pos, "duplicate %s", modifier_string(mod));
 	*mods |= mod;
 }
diff --git a/symbol.h b/symbol.h
index 18476582aa8d..9ba764b596da 100644
--- a/symbol.h
+++ b/symbol.h
@@ -261,6 +261,8 @@ struct symbol {
 #define MOD_FUN_ATTR	(MOD_PURE|MOD_NORETURN)
 /* like cvr-qualifiers but 'reversed' (OK: source <= target) */
 #define MOD_REV_QUAL	(MOD_PURE|MOD_NORETURN)
+/* do not warn when these are duplicated */
+#define MOD_DUP_OK	0
 
 
 /* Current parsing/evaluation function */
-- 
2.26.2


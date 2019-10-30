Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E40A9E9A5C
	for <lists+linux-sparse@lfdr.de>; Wed, 30 Oct 2019 11:51:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfJ3KvV (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 30 Oct 2019 06:51:21 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46541 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726096AbfJ3KvV (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 30 Oct 2019 06:51:21 -0400
Received: by mail-wr1-f65.google.com with SMTP id n15so1703944wrw.13
        for <linux-sparse@vger.kernel.org>; Wed, 30 Oct 2019 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n5d5OfPnaj9U4y3vnknV8cPPaNcEnFKsUO8uvZ+KClY=;
        b=PtNuWsCfn6sCCJTfzww5N21gxlY2wRgRJmar2TTkU/ADxc4/lDFSHNu7fuboV5unlU
         gxg65YExHbPEG/zCkrsrzq6QiGYNuVbUtNX+CencGpNy7TXQBgeHbIt/I2XLceFoqaNq
         qBctsOaKcZr9j3RpidATdXnM+Kcxv3eimZrchdCn6Wd1O+GtpbnV/wRus3KZrsqhoTiZ
         11Dom0Q94XrPj+B9cJnEMteywmZF5Yg9XslTczxV5SJoUpWM3Py5FFuEFzHCMr3muj8K
         kAGNmiXlcqtYHsye0xVntKKFqaMIwS4jb128vZ58W9SPl37vPpdKoDnoad0MsSyYXyni
         2/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n5d5OfPnaj9U4y3vnknV8cPPaNcEnFKsUO8uvZ+KClY=;
        b=IzWSxW3b52tO6yGMlHkz7ABjDZa8+P7Rr+qNHQUsvE30bW4XN8C8YuiBGIHP3wjgRN
         KPwgIQ/98HhUZvIiaZQxuOIu+M0drxjzmpWDYw4kZiKEf61MNI7YqUpp1l05YuKXS9D8
         N73uhi7ZjMeDBtpgsJDYQ36qQUHxPqfuY2AXXlOAjqC2A03Ff/JRWEcnGF40vQvhJ7WS
         Heb3TNF+5gdfmrfS6EAJTTjz9hv+zxQGTA3flW4Vv5hqBMB/dLV5TgHg0U9DOUsGB0ku
         qLc2Emtwkdghbyt37cCMzUZA/+QyCyK4dohVVCP5ifhQrI1T4Xygj2u5Eo+h7yyp6/Ew
         ucsw==
X-Gm-Message-State: APjAAAUV4vhn55sjo9xcyPha07Eb5VHawSjT2auxogu8v3Dn9P5NkHXN
        rbeidcbsTW2s4YA6l/ndNNLxo4pd
X-Google-Smtp-Source: APXvYqyFsY2cT8H96BOCdUtgVtZLYAunqjaayz+oKzXM+dhdIrD+mkdNve1zJmtBd5zVrukqKCbmUg==
X-Received: by 2002:adf:9ec7:: with SMTP id b7mr24428826wrf.221.1572432678639;
        Wed, 30 Oct 2019 03:51:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:40ac:ce00:f5ff:f33b:6735:4cb6])
        by smtp.gmail.com with ESMTPSA id m3sm2110545wrb.67.2019.10.30.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 03:51:17 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Joe Perches <joe@perches.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH] Add '__' prefix and suffix to all __attribute__ #defines
Date:   Wed, 30 Oct 2019 11:50:57 +0100
Message-Id: <20191030105057.4703-1-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

From: Joe Perches <joe@perches.com>

To avoid macro name collisions and improve portability
the kernel want to use a double underscore prefix and
suffix on all attributes.

However, for some of them (mainly sparse's extensions),
Sparse know only about the plain name.

Teach Sparse about the double underscore for all
attributes.

Link: https://lore.kernel.org/r/7a15bc8ad7437dc3a044a4f9cd283500bd0b5f36.camel@perches.com
Link: https://lore.kernel.org/r/19fd23e98bab65a1ee624445193bd2ed86108881.camel@perches.com
Originally-by: Joe Perches <joe@perches.com>
Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/parse.c b/parse.c
index 48a63f22f..4b0a1566c 100644
--- a/parse.c
+++ b/parse.c
@@ -345,6 +345,7 @@ static struct symbol_op goto_op = {
 
 static struct symbol_op __context___op = {
 	.statement = parse_context_statement,
+	.attribute = attribute_context,
 };
 
 static struct symbol_op range_op = {
@@ -537,6 +538,7 @@ static struct init_keyword {
 	{ "while",	NS_KEYWORD, .op = &while_op },
 	{ "do",		NS_KEYWORD, .op = &do_op },
 	{ "goto",	NS_KEYWORD, .op = &goto_op },
+	{ "context",	NS_KEYWORD, .op = &context_op },
 	{ "__context__",NS_KEYWORD, .op = &__context___op },
 	{ "__range__",	NS_KEYWORD, .op = &range_op },
 	{ "asm",	NS_KEYWORD, .op = &asm_op },
@@ -549,13 +551,17 @@ static struct init_keyword {
 	{ "aligned",	NS_KEYWORD, .op = &aligned_op },
 	{ "__aligned__",NS_KEYWORD, .op = &aligned_op },
 	{ "nocast",	NS_KEYWORD,	MOD_NOCAST,	.op = &attr_mod_op },
+	{ "__nocast__",	NS_KEYWORD,	MOD_NOCAST,	.op = &attr_mod_op },
 	{ "noderef",	NS_KEYWORD,	MOD_NODEREF,	.op = &attr_mod_op },
+	{ "__noderef__",NS_KEYWORD,	MOD_NODEREF,	.op = &attr_mod_op },
 	{ "safe",	NS_KEYWORD,	MOD_SAFE, 	.op = &attr_mod_op },
+	{ "__safe__",	NS_KEYWORD,	MOD_SAFE, 	.op = &attr_mod_op },
 	{ "force",	NS_KEYWORD,	.op = &attr_force_op },
+	{ "__force__",	NS_KEYWORD,	.op = &attr_force_op },
 	{ "bitwise",	NS_KEYWORD,	MOD_BITWISE,	.op = &attr_bitwise_op },
 	{ "__bitwise__",NS_KEYWORD,	MOD_BITWISE,	.op = &attr_bitwise_op },
 	{ "address_space",NS_KEYWORD,	.op = &address_space_op },
-	{ "context",	NS_KEYWORD,	.op = &context_op },
+	{ "__address_space__",NS_KEYWORD,	.op = &address_space_op },
 	{ "designated_init",	NS_KEYWORD,	.op = &designated_init_op },
 	{ "__designated_init__",	NS_KEYWORD,	.op = &designated_init_op },
 	{ "transparent_union",	NS_KEYWORD,	.op = &transparent_union_op },
-- 
2.23.0


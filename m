Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF1FF7559
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfKKNsE (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:48:04 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35115 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbfKKNr7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:47:59 -0500
Received: by mail-wr1-f67.google.com with SMTP id s5so3618502wrw.2
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oAD7nJkcojlVEh/iOs29rblOin1qKm/mis780XOEnAE=;
        b=Yphl4cMo8ATjiMS+/pCEzRq4VWkfRstcKsmzTvNbbJDQJ8MrX8lRXJuMiqSB0YSIyw
         c010Aii5/6leMQK52G82VZ2rKmdw46TK58ApLVpICgZTfR3aEJqLjBBJf+iJiig1wQP2
         +6WwLtbi35T/aF1pkhI+dbVWYVZQlDv4+Z9Au2wh9DmWeZG9aOIhG1VtxOM1GAokhp/v
         fdT8vRQDX+F6iMjQbA416HFCsgG7aQUc7L2HWNazJrInP5v+hMP6gSI+XWZjpiCHHffo
         z8QJoYcW/1P/Ldp+BxdgadD+LaAApyHjvkv1HIwlkNnQHpmqSvutW+gz6IymXLwhl82n
         dP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oAD7nJkcojlVEh/iOs29rblOin1qKm/mis780XOEnAE=;
        b=JCczp7W0x+V99x0MJrgyOqDgE3VaLIUEjzhCgekB/X6BVhfAI8FklB6VtF6/JLk8Ag
         RfnG3KTMBCmuFQZTt63xNW0pUJGi1j8irmAFW6sF7whL+3j88KZMFLKrcZO5Cu3RAtJh
         H8SaacupN55YFS28Ifckz/X6GuMl2ev75Y2VH+UpuhQYkrolqwkRf+qw4g+blMf9sg4z
         hNAKHGZqTjqAeQ1iK0MCdEbFlPAjs3AOWtXyQr6ISzLBiQTi5QBRdMoLwQ8aloc05V4y
         /aKoNdteGLiMQeoQeih22y04O/Us5X5mvjsbrB0LZT3/+uhir2IFd0i4qUaJ4LHh80xQ
         39rA==
X-Gm-Message-State: APjAAAXKsyEajUXO8F71dyVVXjJjoanK+z82VQg+IMQQfUvB5p8ZhvZY
        3BDHyqL0PAQwhjEgurrFm1tORAvA
X-Google-Smtp-Source: APXvYqyUYHBf8Le9A1ZJ5tFmc/sHEEgWgq24sjj9GLfUCxPXkeOJcGYCv5vZc8GPX6BvURVM+9hjVg==
X-Received: by 2002:a5d:6203:: with SMTP id y3mr4504581wru.142.1573480076181;
        Mon, 11 Nov 2019 05:47:56 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:55 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 5/9] spec: KW_SHORT is not needed
Date:   Mon, 11 Nov 2019 14:47:43 +0100
Message-Id: <20191111134747.79516-6-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
References: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

To determine the rank of shorts & floats, the keyword type
KW_SHORT is used but there is no need for a specific keyword
since testing for 'Set_Short' or 'Set_Float' has the same
effect.

So, remove this keyword and test the Set_... flags instead
as this somehow clarify the processing of specifiers.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c  | 6 +++---
 symbol.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/parse.c b/parse.c
index c71f34a39..3526bf37e 100644
--- a/parse.c
+++ b/parse.c
@@ -266,14 +266,14 @@ static struct symbol_op double_op = {
 };
 
 static struct symbol_op float_op = {
-	.type = KW_SPECIFIER | KW_SHORT,
+	.type = KW_SPECIFIER,
 	.test = Set_T|Set_Signed|Set_Unsigned|Set_Short|Set_Long,
 	.set = Set_T|Set_Float,
 	.class = CReal,
 };
 
 static struct symbol_op short_op = {
-	.type = KW_SPECIFIER | KW_SHORT,
+	.type = KW_SPECIFIER,
 	.test = Set_S|Set_Char|Set_Float|Set_Double|Set_Long|Set_Short,
 	.set = Set_Short,
 	.class = CInt,
@@ -1624,7 +1624,7 @@ static struct token *declaration_specifiers(struct token *token, struct decl_sta
 			}
 			seen |= s->op->set;
 			class += s->op->class;
-			if (s->op->type & KW_SHORT) {
+			if (s->op->set & (Set_Short|Set_Float)) {
 				size = -1;
 			} else if (s->op->set & Set_Char) {
 				size = -2;
diff --git a/symbol.h b/symbol.h
index 4e7e437bf..5b25c040c 100644
--- a/symbol.h
+++ b/symbol.h
@@ -81,7 +81,7 @@ enum keyword {
      // KW UNUSED	= 1 << 4,
 	KW_ASM		= 1 << 5,
 	KW_MODE		= 1 << 6,
-	KW_SHORT	= 1 << 7,
+     // KW UNUSED	= 1 << 7,
 	KW_LONG		= 1 << 8,
 	KW_EXACT	= 1 << 9,
 };
-- 
2.24.0


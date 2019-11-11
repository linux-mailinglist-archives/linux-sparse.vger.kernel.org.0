Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50BB6F7550
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727073AbfKKNr7 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:47:59 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39102 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbfKKNr6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:47:58 -0500
Received: by mail-wr1-f66.google.com with SMTP id l7so3127572wrp.6
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VX4/TZfFPAlgzUu5ZuJ5Nh+yw64iDGlsNoT1o9oARQc=;
        b=WudQ4AFojtsfG9EuvYW2JUWeULL0fRKWK85T7naDkdjVn2ypuAr/YOthPG7BTOyYLA
         yzzQaFYcCXN0QFYfP4Y5geSH/2R1om8yOijmAMNLNrmfmYu/tW8MH1mcqCeNBz0RPt/2
         JvqkIj+4fQ09qC/WJw+rSvpR6G6WwjX/x0v0QBG/Q6nZPv5vUGnghoEZFD+Bg95rM4VO
         8QCkC2Rn+af7QV6uXSTrsJzomnfpHwjqwcOFT7Df1k1piOUNxfxZdB4URZXTdSdVkwJ0
         e0oAtTCBPFM7pqxm64I8CMslSbGLaAfR4gInpqdaywGPV9Pd7Umb9SCc5ZxfV3l2KhGZ
         Xzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VX4/TZfFPAlgzUu5ZuJ5Nh+yw64iDGlsNoT1o9oARQc=;
        b=SHarK3q5j1fBVbAzzDw+eU3mVK8K7Mt/ENV9+WH3l7+jIGwdG1lmZAxHAdJrfMMky0
         qe7EmaYKW9SCrCBpIJb6iXIWvb+WVB/J64kq2hik4aS04XYwEt646j+s6o6w5N/CDNGM
         i1SSR3IXxXH1cNo3U+GACeqx5fUjOgfaI2f+TbJtWS598uL1ualWmXW3VV2DPvAQIZQ1
         K0ysjmCSuPFc4l4XzGPntjU+h62Jnnj3623KWQoI78XH7dpzO2TmvqSSTyABZGjTSIN9
         /x6dLJHk2BAiEbnTu+yqxMBVxB4Fsmyj099Zp2j6REPttVQgWq2O3LL0nEbUxgeyYkzk
         AWGA==
X-Gm-Message-State: APjAAAXa+8vWteYvnf7KlIvxPXODe5+GKrZ0eSt4vgPzuYLe65USW6Tm
        aJn5GQLAaB4oEvCFrCNQfVj10cOA
X-Google-Smtp-Source: APXvYqzMLfy/J9O8AazSz8Fme1jscj+0nOcFxwzIfvQR0AJQwKT1/LMFD9KzaC+ZCqaHjFVRUdwAFQ==
X-Received: by 2002:a5d:458d:: with SMTP id p13mr20761732wrq.181.1573480075400;
        Mon, 11 Nov 2019 05:47:55 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:54 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 4/9] spec: improve parsing of __int128
Date:   Mon, 11 Nov 2019 14:47:42 +0100
Message-Id: <20191111134747.79516-5-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
References: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

__int128 is processed as-if 'long' is applied to a
'long long'-like type. But this is not necessary or
desirable: better to be more direct and process it
as a kind of 'long long long' type.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/parse.c b/parse.c
index 797b3971e..c71f34a39 100644
--- a/parse.c
+++ b/parse.c
@@ -300,9 +300,9 @@ static struct symbol_op long_op = {
 };
 
 static struct symbol_op int128_op = {
-	.type = KW_SPECIFIER | KW_LONG,
+	.type = KW_SPECIFIER,
 	.test = Set_S|Set_T|Set_Char|Set_Short|Set_Int|Set_Float|Set_Double|Set_Long|Set_Vlong|Set_Int128,
-	.set =  Set_T|Set_Int128,
+	.set =  Set_T|Set_Int128|Set_Vlong,
 	.class = CInt,
 };
 
@@ -1624,12 +1624,12 @@ static struct token *declaration_specifiers(struct token *token, struct decl_sta
 			}
 			seen |= s->op->set;
 			class += s->op->class;
-			if (s->op->set & Set_Int128)
-				size = 2;
 			if (s->op->type & KW_SHORT) {
 				size = -1;
 			} else if (s->op->set & Set_Char) {
 				size = -2;
+			} else if (s->op->set & Set_Int128) {
+				size = 3;
 			} else if (s->op->type & KW_LONG && size++) {
 				if (class == CReal) {
 					specifier_conflict(token->pos,
-- 
2.24.0


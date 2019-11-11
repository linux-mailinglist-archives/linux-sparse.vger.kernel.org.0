Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2E4AF7557
	for <lists+linux-sparse@lfdr.de>; Mon, 11 Nov 2019 14:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfKKNsB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 11 Nov 2019 08:48:01 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43657 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbfKKNsA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 11 Nov 2019 08:48:00 -0500
Received: by mail-wr1-f68.google.com with SMTP id n1so14671134wra.10
        for <linux-sparse@vger.kernel.org>; Mon, 11 Nov 2019 05:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mZXNXY+6xe415JuXFu6oaGeh2uXAmJtbbPwMOJ1hcw4=;
        b=r/bJJv+cSy8teaSnCaoo3RNVpCI10kKZBDlMOwAH9A+HA0vhKsZcLZsY5v+6UP1ibC
         IjwCSqXCSLxr3qXISWaaCVQYZpkSutDDUXGsFH6axrFRpwp73xi1jbnmTuRsPpw47PQP
         uR93B93iAeWYb0ukP3sTHrtXxT66XzFzJYD2lHv0ZbbQaF8Q2pmgp86+mL+GiDVd4LEK
         JwTD/iO8ike9jbqMmFK1w/S58qkNtxPL4D2fGcVheH5IDuJiwgpRIFQrT9+4oplLlGxY
         xILnwhhKfpc2IMNSTlzCetva8Tdtjfavs/L9HlimNVNqo8CsiK+XLnAUm4b/5Y6V/C6b
         jOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mZXNXY+6xe415JuXFu6oaGeh2uXAmJtbbPwMOJ1hcw4=;
        b=UvbE+Eojn1xUAI4Ex0eZwYqNLqBoHuw73d/bzxvMoJ8kWWZuMTHXVOjQ1t5CyWl/wy
         ts/2VXWUglOLtzh3Hjh6dVj8d+C2v0oPwirDxXy3K71cm2fMkZu6aoWhFGVyMTHffl7F
         oLg+tlMO0L4G4elYRwP2hhmrQOR6+LZNsn0hkXOPg6yukL06cczCTBW4kcser+ItCfNn
         YInqzQmwxVoK9NbobFSzkb7uST5m3jqk9z/8HRo6Qb8KZ9ii2JBgJPWPySL28Rk4iYs0
         +LwePIs52w/HbMYj+ODC0vsvmTt2dMV4WY1OK6yA9vaS9/1MMiFw0Ec25fH+Ilh9kJFv
         eggw==
X-Gm-Message-State: APjAAAX0VEO6RrXyNhW/JvzG2+4GIwog2rOLIQmfhWmDvGhXemAvPzg/
        70ERkLtwZHahwOQ3q+VAaxKJ3Eut
X-Google-Smtp-Source: APXvYqzq8VTdBBxKi+MkmbnxOry5PH5Kvte3tcxBg4rdNgDqAj/Odxr2F2dMXHCAgu1hTShqP7dvZg==
X-Received: by 2002:a5d:6944:: with SMTP id r4mr20092110wrw.238.1573480077974;
        Mon, 11 Nov 2019 05:47:57 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:4058:bc00:7107:cc84:c820:8cf8])
        by smtp.gmail.com with ESMTPSA id u187sm18384031wme.15.2019.11.11.05.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 05:47:57 -0800 (PST)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 7/9] spec: s/size/rank/
Date:   Mon, 11 Nov 2019 14:47:45 +0100
Message-Id: <20191111134747.79516-8-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
References: <20191111134747.79516-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In declaration_specifiers() the variable 'size' is used to
make the distinction between char/short/int/long/long long/...
but this correspond more closely to the notion of 'rank' since
some of these types can have the same bit-size.

Rename the variable 'size' to 'rank'.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/parse.c b/parse.c
index 0ace13514..46136ec66 100644
--- a/parse.c
+++ b/parse.c
@@ -1599,7 +1599,7 @@ static struct token *declaration_specifiers(struct token *token, struct decl_sta
 {
 	int seen = 0;
 	int class = CInt;
-	int size = 0;
+	int rank = 0;
 
 	while (token_type(token) == TOKEN_IDENT) {
 		struct symbol *s = lookup_symbol(token->ident,
@@ -1625,12 +1625,12 @@ static struct token *declaration_specifiers(struct token *token, struct decl_sta
 			seen |= s->op->set;
 			class += s->op->class;
 			if (s->op->set & (Set_Short|Set_Float)) {
-				size = -1;
+				rank = -1;
 			} else if (s->op->set & Set_Char) {
-				size = -2;
+				rank = -2;
 			} else if (s->op->set & Set_Int128) {
-				size = 3;
-			} else if (s->op->set & Set_Long && size++) {
+				rank = 3;
+			} else if (s->op->set & Set_Long && rank++) {
 				if (class == CReal) {
 					specifier_conflict(token->pos,
 							   Set_Vlong,
@@ -1652,7 +1652,7 @@ static struct token *declaration_specifiers(struct token *token, struct decl_sta
 	if (!(seen & Set_S)) {	/* not set explicitly? */
 		struct symbol *base = &incomplete_ctype;
 		if (seen & Set_Any)
-			base = types[class][size];
+			base = types[class][rank];
 		ctx->ctype.base_type = base;
 	}
 
-- 
2.24.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E262C0EAB
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbfI0Xne (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:34 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42625 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728520AbfI0Xne (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:34 -0400
Received: by mail-ed1-f65.google.com with SMTP id y91so3703090ede.9
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WrqyW+/Ecoy8saG0Oe3STO1BJadEoUJzHWhA/P0uqSc=;
        b=TvuN3+yJFekRh0LwjUmTSZf1q4r+xakh4I1Oj/f2+nznzMeUPZsaLjN3/+p7gqohQp
         5hd4NKcBfTuhZXc8GxBBgbEOqW3vnzC0uTNnL+wZQ1SNEgCdIG+EeNS1nipW9KqRmurn
         4SvpgzHWql4gn7RQ0XlBu3vlAnP3UadJg6uuAxFTWCxlPZug1qTDcEUADhCLe+I+EZEH
         RLVhWuge3sXCg4BMrNPp00ORvSxMtl89r0WubiMIi21W1drALR4JQWujE49tSvKfRqOg
         DH5DN3roW5eAnUnaYkQ5q643nkFH3NkwoIEmsBR0SbBKgdwsV1p7Agpl7zgOWwEzs3XK
         GNew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WrqyW+/Ecoy8saG0Oe3STO1BJadEoUJzHWhA/P0uqSc=;
        b=tmedZZ7UO7Ddhtu0Ym4Obg6Gt8KGrD41jOpEYHYGxTEFtgNRpp1fl54FZq9EYyvsKU
         ORFgVIqkpUFn2bXzKd+F+uv6zyXNbWvY++25G5RW7We/ijRN7w/i0yxLv4SI2i35fGra
         wHBaHBiwdusglQKP/dT5X3+M3aw8dcDrO0bA60GQgl/HEUa2+KBp9lpJZcAwNxD9QbWI
         u8ttmyxvV5C3nv45UvS9HlSb89k/PGGNJydQsL/HhW7/jpkajl3z03ylqaxuMacO0yAZ
         ugIPvrRH7IxgBLhxCagqyQUg8qzhpFG15n/Y9dVqjcCSGvkAuVsSYR5eLIM5nCdZMUro
         cZxg==
X-Gm-Message-State: APjAAAXNYYL+n0cTkWN7T75j4QmMoiWDHvUmRKcxjaNt4/AwuiVeJlu9
        c2hrYLdFTsrSlYeMtm2CIv7oL3Ie
X-Google-Smtp-Source: APXvYqzTo/hULhZvdY90j/AtAiqHmjtXxuxmtq8cERqfO7788FmIpRQxKoyGqzHXtcCBFcLrvDw5vw==
X-Received: by 2002:a05:6402:713:: with SMTP id w19mr7363690edx.126.1569627810804;
        Fri, 27 Sep 2019 16:43:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:30 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 07/18] string: use string_expression() in parse_static_assert()
Date:   Sat, 28 Sep 2019 01:43:11 +0200
Message-Id: <20190927234322.5157-10-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

The error handling during the parsing of _Static_assert()'s
message string is relatively complex.

Simplify this by using the new helper string_expression().

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c                    | 9 ++-------
 validation/static_assert.c | 6 +++---
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/parse.c b/parse.c
index 795434322..401f91a1f 100644
--- a/parse.c
+++ b/parse.c
@@ -2132,14 +2132,9 @@ static struct token *parse_static_assert(struct token *token, struct symbol_list
 	if (!cond)
 		sparse_error(token->pos, "Expected constant expression");
 	token = expect(token, ',', "after conditional expression in _Static_assert");
-	token = parse_expression(token, &message);
-	if (!message || message->type != EXPR_STRING) {
-		struct position pos;
-
-		pos = message ? message->pos : token->pos;
-		sparse_error(pos, "bad or missing string literal");
+	token = string_expression(token, &message, "_Static_assert()");
+	if (!message)
 		cond = NULL;
-	}
 	token = expect(token, ')', "after diagnostic message in _Static_assert");
 
 	token = expect(token, ';', "after _Static_assert()");
diff --git a/validation/static_assert.c b/validation/static_assert.c
index d9e96294f..dd5e0c08c 100644
--- a/validation/static_assert.c
+++ b/validation/static_assert.c
@@ -61,11 +61,11 @@ static_assert.c:19:16: error: static assertion failed: "expected assertion failu
 static_assert.c:22:16: error: bad constant expression
 static_assert.c:25:16: error: bad constant expression
 static_assert.c:27:16: error: bad constant expression
-static_assert.c:35:19: error: bad or missing string literal
+static_assert.c:35:19: error: string literal expected for _Static_assert()
 static_assert.c:37:18: error: bad constant expression
-static_assert.c:52:19: error: bad or missing string literal
+static_assert.c:52:19: error: string literal expected for _Static_assert()
 static_assert.c:53:16: error: Expected constant expression
 static_assert.c:54:16: error: Expected constant expression
-static_assert.c:54:17: error: bad or missing string literal
+static_assert.c:54:17: error: string literal expected for _Static_assert()
  * check-error-end
  */
-- 
2.23.0


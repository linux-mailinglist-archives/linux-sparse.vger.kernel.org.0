Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16311C0EA7
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728445AbfI0Xnc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:32 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34519 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728430AbfI0Xnb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:31 -0400
Received: by mail-ed1-f65.google.com with SMTP id p10so3756023edq.1
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Iyo07vaFi/DcIHZMVGbaIxl3tAsuXZpqlLgs54vokRM=;
        b=Ph/UHqYyiZBacQBq6eOXi6QhD6NQVuiWOI3cTHy5l6ESSMYZUiknymSwGVNyA6Qk8v
         zd9RM2VxqmlM/QD0reXcI7YuMc2QAB/I5W9kjZ2trKHd/wAf5Dy62fcEmY8r75eUbUpN
         1ctTiOg8RIe1bmT2x8J9zIYEVYAYR5gj6KGp+kTd584ba3At9ELwc5woZeSXFRpZ7YoP
         ZlYF2CjmUxzRPc7hp9P82NTUOhRvRTgce1TU18HzUgaCKQ+LN2nXfiWUJcg5B3UgaOu+
         oO+s6wZxILeovJ6I9HGcvNLAegPLX2iH0ofCxNW7JqLJOejYPTgsYjKV4QSnc7/5ZHDY
         zoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iyo07vaFi/DcIHZMVGbaIxl3tAsuXZpqlLgs54vokRM=;
        b=BoNNHuFCLqHlI3d0DJn8ocuqBl9w0o6ucRYXsSZRoi9H0LoOwQxpoX9CnITAXkdjvr
         g9lFLN8nhu+5SmFRVLNKXDenVb4qcBdhkbKrP5icfWlh6JatmcFNd8ma/dYPt0zbyneq
         1HaagiUyo+eaf5qP+BwDykEEJ8QUMYLoMkQ9a/bJskRxN6yVl4AoB576/dI0+Qr57D0L
         rLtOE8WN45jngnlpovEleOjvUV84YME+YXhY359svJd2Y89TRHEk9FqRBGhv9kk6890d
         4BL8aIeTNtfRaNUWeF6z4IBy0L+i4adNGyd24IMEoWFTkK87O0nuuhULyubxbdLfTu3r
         fR5A==
X-Gm-Message-State: APjAAAUTKeY4Uz70040mUgIYSTEs1CIDXyXeeHe3ovMqaco0KerLPQBh
        8QE2aH233ldtU7QipYcfs7evSUEz
X-Google-Smtp-Source: APXvYqx/fSAdz2CZjB5SJe6ssDRbJ2gWAH24YCWijIc0g0h5d0caCNCL92AcEw5CK+pwN2aLyJMUaw==
X-Received: by 2002:aa7:dc55:: with SMTP id g21mr7401947edu.210.1569627810048;
        Fri, 27 Sep 2019 16:43:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:29 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 06/18] string: add helper string_expression()
Date:   Sat, 28 Sep 2019 01:43:10 +0200
Message-Id: <20190927234322.5157-9-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This will help to detect earlier syntax errors concerning
string constants.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expression.c | 11 +++++++++++
 expression.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/expression.c b/expression.c
index f955fb159..ffb6cb9dc 100644
--- a/expression.c
+++ b/expression.c
@@ -83,6 +83,17 @@ struct token *parens_expression(struct token *token, struct expression **expr, c
 	return expect(token, ')', where);
 }
 
+struct token *string_expression(struct token *token, struct expression **expr, const char *where)
+{
+	struct token *next = primary_expression(token, expr);
+
+	if (!*expr || (*expr)->type != EXPR_STRING) {
+		sparse_error(token->pos, "string literal expected for %s", where);
+		*expr = NULL;
+	}
+	return next;
+}
+
 /*
  * Handle __func__, __FUNCTION__ and __PRETTY_FUNCTION__ token
  * conversion
diff --git a/expression.h b/expression.h
index ed6f4d65d..13f35e64b 100644
--- a/expression.h
+++ b/expression.h
@@ -270,6 +270,7 @@ struct token *parse_expression(struct token *token, struct expression **tree);
 struct token *conditional_expression(struct token *token, struct expression **tree);
 struct token *primary_expression(struct token *token, struct expression **tree);
 struct token *parens_expression(struct token *token, struct expression **expr, const char *where);
+struct token *string_expression(struct token *token, struct expression **expr, const char *where);
 struct token *assignment_expression(struct token *token, struct expression **tree);
 
 extern int expand_symbol(struct symbol *);
-- 
2.23.0


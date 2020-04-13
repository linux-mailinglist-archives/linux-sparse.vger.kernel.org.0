Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A485B1A69A3
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 18:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731400AbgDMQQ2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 12:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731401AbgDMQQ0 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 12:16:26 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C38BC008748
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:26 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a25so10742577wrd.0
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+xXsNQ4yF9C8DBi5DxDRB9g/EgNLdzpl0+0grIxEPFQ=;
        b=LCw6q0zVimlEImK9yic8lFP0h/FfO5xvA3e2H75Yv3hqONLE44Ls9P7I1lfn8APs3a
         Fg+RYKZFiLm/2V0nXxNgghWchbOm7m/pyv+pOuylNWPBq9W223P9OQgP+G+7Fhj/a3cc
         y0d47v5hYwTiNz/Aw8GOZnB/PBp9ItN49qTInL04svFvl+RxG90ElssyVkUhWcRoiJgb
         fyYoidrkyPiiuIZn1vzERUl0xTkpTi9uTCcKlbNgqzWwH30eCtdn5qtm3ZsmgNron/Aa
         l0LK3046ya+55SbCAbS/WmAgB7wx+kBovJrvanPx4ywpoOReHW7vwIwEp90wUGG6+jyd
         0/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+xXsNQ4yF9C8DBi5DxDRB9g/EgNLdzpl0+0grIxEPFQ=;
        b=PdkRxr15/+MBimWq36HfjNYLdkb3knRP/JMfGDThtoV7TQvJy1A5tRyNQrCnCUCob0
         2FmWLlolAnTh+n2uFGmKczpROUY5XjQVGGkkUGNiPoOeaHTIkRDsmStgNoNGqvtwXtqy
         8bctIe2ZetAqNbpkarMsAEoZlXrPUddn+JsclXLdrIFdebRAqK6GUuuktiujo91doXQe
         pFljAlBkZ81IgLZ3ZHQX4d63tganoBlp8QdThxai+UF5RdKZnrVRnJKx30BEB/uGIXRX
         yMlQEmC/kE5DLrOiTiifiKpRgg9oMy7ppwnd4C3FEkmPPelwwWZPc0KbsD7qlxdSL6nb
         YyDw==
X-Gm-Message-State: AGi0PubFxT/y7LyV1JuDvfyaLr/lH9edZnamfVN2J/4FM3SRxs3elatl
        khMluO7prHjR1iW3EcqfbA6iMn+l
X-Google-Smtp-Source: APiQypI5ZKcoM+mqLcPPijOXk50HmCUIHBX9wVu8nU0Zqn/ex5UrreDeVZE+g/4ePMWeGtLCGRGQ1Q==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr20023465wrx.185.1586794585113;
        Mon, 13 Apr 2020 09:16:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:75ee:1bf8:e5e6:f950])
        by smtp.gmail.com with ESMTPSA id m1sm10113838wro.64.2020.04.13.09.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 09:16:24 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH 15/17] scope: give a scope for labels & gotos
Date:   Mon, 13 Apr 2020 18:16:03 +0200
Message-Id: <20200413161605.95900-16-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

One way of detecting gotos inside an statement expression
is to use a new kind of scope for the gotos & labels.
Since gotos don't need to have their label predeclared,
nothing can be checked at parsing time but later it can
be checked that a goto doesn't jump inside one of the
label scope created by statement expressions.

So, add additional scope information to gotos and labels
to allow such check to be done.

Note: the label's symbols are still created in the function
      scope since they belong to a single namespace.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c  | 2 ++
 parse.h  | 1 +
 symbol.h | 3 +++
 3 files changed, 6 insertions(+)

diff --git a/parse.c b/parse.c
index 1a2c7af22ff4..244991c1c4f5 100644
--- a/parse.c
+++ b/parse.c
@@ -2481,6 +2481,7 @@ static struct token *parse_goto_statement(struct token *token, struct statement
 		add_statement(&function_computed_goto_list, stmt);
 	} else if (token_type(token) == TOKEN_IDENT) {
 		stmt->goto_label = label_symbol(token);
+		stmt->goto_scope = label_scope;
 		token = token->next;
 	} else {
 		sparse_error(token->pos, "Expected identifier or goto expression");
@@ -2533,6 +2534,7 @@ static struct token *statement(struct token *token, struct statement **tree)
 
 		if (match_op(token->next, ':')) {
 			struct symbol *s = label_symbol(token);
+			s->label_scope = label_scope;
 			token = skip_attributes(token->next->next);
 			if (s->stmt) {
 				sparse_error(stmt->pos, "label '%s' redefined", show_ident(s->ident));
diff --git a/parse.h b/parse.h
index 0742a2a87e9d..5995eb56849f 100644
--- a/parse.h
+++ b/parse.h
@@ -99,6 +99,7 @@ struct statement {
 		};
 		struct /* goto_struct */ {
 			struct symbol *goto_label;
+			struct scope *goto_scope;
 
 			/* computed gotos have these: */
 			struct expression *goto_expression;
diff --git a/symbol.h b/symbol.h
index de13d60b8b75..f9d7bcaa997f 100644
--- a/symbol.h
+++ b/symbol.h
@@ -167,6 +167,9 @@ struct symbol {
 			int (*handler)(struct stream *, struct token **, struct token *);
 			int normal;
 		};
+		struct /* NS_LABEL */ {
+			struct scope *label_scope;
+		};
 		struct /* NS_SYMBOL */ {
 			unsigned long	offset;
 			int		bit_size;
-- 
2.26.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908E11D8CBC
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727123AbgESA6B (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:58:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgESA6A (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:58:00 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66729C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:58:00 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id h21so10388267ejq.5
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CDQ4MxtpHWUO8C8YatYM963cum6QxYCKy38Pw/r3i70=;
        b=AOSezXhbyVmb5dc+Pe6LBjCT6M4cOyNrp1qnj93rEJlF9EaevKGU2y+KlYc7ux+1pv
         WyHWwhzMqkp/pEu5Y4yKPrMIC0ex9piR2XQdvWzts1skdGd2+dNrylsxWtWcT1IKpw2Y
         YOGrfTlAWhiVdBP6oxJiSq2a/QZmUL4fBQ0pqNjj/+s+SG3h+OVc3pERUJQsRhDkMhMp
         0OWrqM89BLqEmVaVSWvNnAkvBkyoeMtW6Gya4NkGLtZgH8Ewa2wz+u/r7WjysPZAzZhl
         gU++3oKbDtQPwuiz+k0/nBeIzvGMtFwuwJrtsselulAdKZtyLUuROgg/ZXT2zvnGdyt/
         wZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CDQ4MxtpHWUO8C8YatYM963cum6QxYCKy38Pw/r3i70=;
        b=QBkO2MBU9pDFJh4dA06Bh6keqWsZWQqHwRuniZRt/TOF0veL7EwAhnPWz1r7iSOs5t
         XxAvSOvFZJMyTMA0nglq+u01qR+Y5g1JO6gMFiglzKlLUAG8bQwNTMgiPlk/lph8RhOE
         xrUubsGbXsocg/olKvQ8u4znBJ1UywbValmZDnD1Cuy78gD29eEt/N0Rx7mF9jZHejXN
         A+JomdkuD4k9ZtXSJBBclJ7Lb+CQVzeHKJ8nYHKlpVJkfPxWCTD06vK+Ome4ojxEq2zM
         +cLfoy4PJyqcXpEdEjZzobXUEobRemGRmytrkd6EcEIOjqcw5lP3CRkIvCaP320xaYed
         dSPA==
X-Gm-Message-State: AOAM533NkJEGx0UYWV9E39xvScRPyKeH87RMj5Q5PzrdhEhVgGIjhFhE
        bqUtss+eUIrKBfTGURaXK1g0QYSc
X-Google-Smtp-Source: ABdhPJw4zwnb3mgqDwRJFzsnn1Ukce47NFF67GRDmGQr8ek3K4fnJl12BuhhZoiCDf6PYyRiU36RnA==
X-Received: by 2002:a17:906:16d3:: with SMTP id t19mr7679540ejd.36.1589849878857;
        Mon, 18 May 2020 17:57:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:58 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 27/28] bad-label: mark labels as used when needed
Date:   Tue, 19 May 2020 02:57:27 +0200
Message-Id: <20200519005728.84594-28-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

In most cases symbols are automatically marked as being used via
a successfull call to lookup_symbols(), the idea being that the
symbol will be created at its declaration and then any (successfull)
lookup will correspond to an use.

For labels, things are slightly different because labels are
created on-demand via label_symbol() and their use can precede their
'declaration'. And of, course, label_symbol() has no ways to know
if it is used for a definition or an use.

So, fix this by adding an argument to label_symbol(), explictly
telling if the call correspond to an use or not.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 expression.c |  2 +-
 parse.c      | 10 ++++++----
 parse.h      |  2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/expression.c b/expression.c
index bbbc24e6b561..99a6d7568222 100644
--- a/expression.c
+++ b/expression.c
@@ -686,7 +686,7 @@ static struct token *unary_expression(struct token *token, struct expression **t
 		if (match_op(token, SPECIAL_LOGICAL_AND) &&
 		    token_type(token->next) == TOKEN_IDENT) {
 			struct expression *label = alloc_expression(token->pos, EXPR_LABEL);
-			struct symbol *sym = label_symbol(token->next);
+			struct symbol *sym = label_symbol(token->next, 1);
 			if (!(sym->ctype.modifiers & MOD_ADDRESSABLE)) {
 				sym->ctype.modifiers |= MOD_ADDRESSABLE;
 				add_symbol(&function_computed_target_list, sym);
diff --git a/parse.c b/parse.c
index b9d4940e77fb..a8e4a02e90e4 100644
--- a/parse.c
+++ b/parse.c
@@ -726,12 +726,14 @@ static struct symbol * alloc_indirect_symbol(struct position pos, struct ctype *
  * it also ends up using function scope instead of the
  * regular symbol scope.
  */
-struct symbol *label_symbol(struct token *token)
+struct symbol *label_symbol(struct token *token, int used)
 {
 	struct symbol *sym = lookup_symbol(token->ident, NS_LABEL);
 	if (!sym) {
 		sym = alloc_symbol(token->pos, SYM_LABEL);
 		bind_symbol(sym, token->ident, NS_LABEL);
+		if (used)
+			sym->used = 1;
 		fn_local_symbol(sym);
 	}
 	return sym;
@@ -2139,7 +2141,7 @@ static struct token *parse_asm_labels(struct token *token, struct statement *stm
 		token = token->next; /* skip ':' and ',' */
 		if (token_type(token) != TOKEN_IDENT)
 			return token;
-		label = label_symbol(token);
+		label = label_symbol(token, 1);
 		add_symbol(labels, label);
 		token = token->next;
 	} while (match_op(token, ','));
@@ -2509,7 +2511,7 @@ static struct token *parse_goto_statement(struct token *token, struct statement
 		token = parse_expression(token->next, &stmt->goto_expression);
 		add_statement(&function_computed_goto_list, stmt);
 	} else if (token_type(token) == TOKEN_IDENT) {
-		struct symbol *label = label_symbol(token);
+		struct symbol *label = label_symbol(token, 1);
 		stmt->goto_label = label;
 		check_label_usage(label, stmt->pos);
 		token = token->next;
@@ -2563,7 +2565,7 @@ static struct token *statement(struct token *token, struct statement **tree)
 			return s->op->statement(token, stmt);
 
 		if (match_op(token->next, ':')) {
-			struct symbol *s = label_symbol(token);
+			struct symbol *s = label_symbol(token, 0);
 			token = skip_attributes(token->next->next);
 			if (s->stmt) {
 				sparse_error(stmt->pos, "label '%s' redefined", show_ident(s->ident));
diff --git a/parse.h b/parse.h
index 2cfdd872e621..5ac9a23ba363 100644
--- a/parse.h
+++ b/parse.h
@@ -124,7 +124,7 @@ extern struct symbol_list *function_computed_target_list;
 extern struct statement_list *function_computed_goto_list;
 
 extern struct token *parse_expression(struct token *, struct expression **);
-extern struct symbol *label_symbol(struct token *token);
+extern struct symbol *label_symbol(struct token *token, int used);
 extern void check_label_usage(struct symbol *label, struct position use_pos);
 
 extern int show_statement(struct statement *);
-- 
2.26.2


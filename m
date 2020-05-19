Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E38691D8CB6
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:58:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgESA5z (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgESA5z (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:55 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11D82C061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:55 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id e10so10222217edq.0
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ER4fRcF8Gp5oTGN207/RRPI+Kp4MhGKDr6rYcEEb+0=;
        b=XBzAYTDMe02yWOlU9PN4gOg+lBZwzaZF8QXTHjy9yhyLGgtEPtj4QZVCAkVXCDLu4t
         vCX+E4gOnxHOyaOVHFvaKbhgRBqTvbvDJ2RlMmlLFIdc8zfmviVaqHZjTdEIqiL/2IsI
         VCBXX2T8kDi8xdLEI7WEZL08zU3RkLe+V7B+WpjZQHRjYRuHN64WNDjhJuC5zccPjPdF
         /7Y9UBUGBYX2VJu/r+adxLlRHAlscyTc9pjPsvn4/epMzLx05Xgj/fJShvJb1Ooqcbv9
         L9Q7SQnBHKejiTc18UneWqDK1KXEIuTLvRG1OMdEc3fXBuk4ohR4uS4b2+8VFo5luAHd
         7CUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ER4fRcF8Gp5oTGN207/RRPI+Kp4MhGKDr6rYcEEb+0=;
        b=nXBRmlHq1moW6eGZu2G1TLNiHtKcdCEqFqjGJS06+nBH7alh/UYoSJUiFR95XDBKjs
         n27iClgxdDuSDobTSgYrZfGjK+vuEJ+zSG6nkESH8fcCccoI6wSFfeIfpNV8Mb5ZT8Xs
         dusnLBVeHBxPzXXnIOn3zGHIUGLG0bkgxgQqeK9kIm6/C/2koZpIbsWtFkaMFXjYy2K/
         wcyBarf4zG5XeLgrhl6dBR3uVkYZ0X8pkQgi72W3R1O7maf6qRxLc9iUvKJ+sMlBxmhB
         C3pPWSy2+iPkysbmrrBkRpUkeLoTu+j2TR/z+Ln/yB9xsdGLLP8zAcUVCRN8at6q0Msl
         39rA==
X-Gm-Message-State: AOAM533W50V+VUCu7QJdEKsWDgr82ZBRe/8/i8Slr+BXy3gcsfbVNO0p
        gDEWUZcrdnGgOcTPt11x6ifATEoO
X-Google-Smtp-Source: ABdhPJyodtiDX00ecChiY6VCXbNO7mJPZOg4BUhzg1E7avffRDPavuP4GhsZZnw9xsax5mrRc5Ml2g==
X-Received: by 2002:a50:d785:: with SMTP id w5mr15461580edi.212.1589849873553;
        Mon, 18 May 2020 17:57:53 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:53 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 21/28] scope: give a scope for labels & gotos
Date:   Tue, 19 May 2020 02:57:21 +0200
Message-Id: <20200519005728.84594-22-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
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
 parse.c  | 8 +++++++-
 parse.h  | 1 +
 symbol.h | 4 ++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/parse.c b/parse.c
index ecc33765e1ef..bf45e3b0ea44 100644
--- a/parse.c
+++ b/parse.c
@@ -2488,7 +2488,12 @@ static struct token *parse_goto_statement(struct token *token, struct statement
 		token = parse_expression(token->next, &stmt->goto_expression);
 		add_statement(&function_computed_goto_list, stmt);
 	} else if (token_type(token) == TOKEN_IDENT) {
-		stmt->goto_label = label_symbol(token);
+		struct symbol *label = label_symbol(token);
+		stmt->goto_label = label;
+		if (!label->stmt && !label->label_scope) {
+			label->label_scope = label_scope;
+			label->label_pos = stmt->pos;
+		}
 		token = token->next;
 	} else {
 		sparse_error(token->pos, "Expected identifier or goto expression");
@@ -2549,6 +2554,7 @@ static struct token *statement(struct token *token, struct statement **tree)
 			}
 			stmt->type = STMT_LABEL;
 			stmt->label_identifier = s;
+			stmt->label_scope = label_scope;
 			s->stmt = stmt;
 			return statement(token, &stmt->label_statement);
 		}
diff --git a/parse.h b/parse.h
index 0742a2a87e9d..daef243938b2 100644
--- a/parse.h
+++ b/parse.h
@@ -72,6 +72,7 @@ struct statement {
 		};
 		struct /* labeled_struct */ {
 			struct symbol *label_identifier;
+			struct scope *label_scope;
 			struct statement *label_statement;
 		};
 		struct /* case_struct */ {
diff --git a/symbol.h b/symbol.h
index c297c778dfdf..2293d06dd4fb 100644
--- a/symbol.h
+++ b/symbol.h
@@ -167,6 +167,10 @@ struct symbol {
 			int (*handler)(struct stream *, struct token **, struct token *);
 			int normal;
 		};
+		struct /* NS_LABEL */ {
+			struct scope *label_scope;
+			struct position label_pos;
+		};
 		struct /* NS_SYMBOL */ {
 			unsigned long	offset;
 			int		bit_size;
-- 
2.26.2


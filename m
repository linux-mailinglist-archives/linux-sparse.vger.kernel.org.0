Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7F71D8CB7
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 02:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgESA54 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 20:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726731AbgESA54 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 20:57:56 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060BCC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:56 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id h21so10388156ejq.5
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 17:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7fZnCgeK0yjkuvNZwljEvHQZcrG6PMs2cD80+mu4l+Q=;
        b=ubp/uVfsvxRuXAAhJR7nv+f5nKJOtQFwo34kBLUX/o2a7gvsTpVQWr1RuJMyuBvDKm
         ZLhblMHNP0WpUqT0j1aCK36wVudYFwGiabDbN4PzkwIBv2VtnFXFKzlbbCIFFoPxCcI5
         rNKfD1B0cXB59atg16H4a6mwHed56ODxBwSLsMz07/ZJAqKx4vYPk7arq6LIf1Dwq/hL
         g2PJh45BW4khi4IeHpgTM+BdvSByzF+fTW58ZkuuOxiGTuArb6fmQIHmmN9UIBD9ezgR
         s/1Lq6NkSRI4e1q2tnVYYV82jF32WGVn0q/9LieitKusmzr10gW1xY2wEAanKgburEaL
         kpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7fZnCgeK0yjkuvNZwljEvHQZcrG6PMs2cD80+mu4l+Q=;
        b=Hu4dTp9HbdX5/a8MFBQB0jVLRDvAG0CKFhEX1qvXQ25QuG1I4JlbpXxF9lHhC1Ky5H
         TA7UgY+m/ZnwTJuR0sePAA/9Gu9nKD6HIrIF2O8MuiGI+fR3mdEcTPzYQ5W19XHuNYyH
         ELT8UleekYhJOIqbK84MH/c2Vl7+ZmcRfGQLjeC56cN4eTd32kB6EA2F53IyA1ctpc4H
         P78el8zhrNDHenzciByOVVpe5L0x15/zgcvVHy+fK0HOlHxze66iHRaeoI5s6aWM/Lya
         GePU+rC3y6TtzjuuZwGlTrP3YGMi9lpXIeiKPsth4yt9a0SDix8gj8l6oQGp+ywWoTPP
         zURQ==
X-Gm-Message-State: AOAM533cIsaIqnX6Ft18++f6BSljCsqxUb48Zjbt+FrpgmoQ00j73LGa
        aZBX/+N+YwqnPJEitt/a3KVx4MVQ
X-Google-Smtp-Source: ABdhPJxm2WGxxjK49i1RdINsPZk+7Q44iyuzjb29bOptsOggZP5Lk0fq8zJmOsWYhMOeZ4ZnrQAVJA==
X-Received: by 2002:a17:906:6951:: with SMTP id c17mr16543990ejs.112.1589849874378;
        Mon, 18 May 2020 17:57:54 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:b7f9:7600:98be:2081:4f7:29e4])
        by smtp.gmail.com with ESMTPSA id h25sm702737ejx.7.2020.05.18.17.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 17:57:53 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Subject: [PATCH v1 22/28] bad-goto: jumping inside a statemet expression is an error
Date:   Tue, 19 May 2020 02:57:22 +0200
Message-Id: <20200519005728.84594-23-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

It's invalid to jump inside a statement expression.

So, detect such jumps, issue an error message and mark the
function as useless for linearization since the resulting IR
would be invalid.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 parse.c                                       | 30 ++++++++++++++++---
 parse.h                                       |  1 +
 validation/label-scope2.c                     |  1 -
 validation/label-stmt-expr0.c                 |  1 -
 validation/label-stmt-expr1.c                 |  1 -
 validation/label-stmt-expr2.c                 |  1 -
 .../linear/goto-stmt-expr-conditional.c       |  1 -
 .../linear/goto-stmt-expr-short-circuit.c     |  1 -
 8 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/parse.c b/parse.c
index bf45e3b0ea44..b9d4940e77fb 100644
--- a/parse.c
+++ b/parse.c
@@ -2480,6 +2480,27 @@ static struct token *parse_switch_statement(struct token *token, struct statemen
 	return token;
 }
 
+static void warn_label_usage(struct position def, struct position use, struct ident *ident)
+{
+	const char *id = show_ident(ident);
+	sparse_error(use, "label '%s' used outside statement expression", id);
+	info(def, "   label '%s' defined here", id);
+	current_fn->bogus_linear = 1;
+}
+
+void check_label_usage(struct symbol *label, struct position use_pos)
+{
+	struct statement *def = label->stmt;
+
+	if (def) {
+		if (!is_in_scope(def->label_scope, label_scope))
+			warn_label_usage(def->pos, use_pos, label->ident);
+	} else if (!label->label_scope) {
+		label->label_scope = label_scope;
+		label->label_pos = use_pos;
+	}
+}
+
 static struct token *parse_goto_statement(struct token *token, struct statement *stmt)
 {
 	stmt->type = STMT_GOTO;
@@ -2490,10 +2511,7 @@ static struct token *parse_goto_statement(struct token *token, struct statement
 	} else if (token_type(token) == TOKEN_IDENT) {
 		struct symbol *label = label_symbol(token);
 		stmt->goto_label = label;
-		if (!label->stmt && !label->label_scope) {
-			label->label_scope = label_scope;
-			label->label_pos = stmt->pos;
-		}
+		check_label_usage(label, stmt->pos);
 		token = token->next;
 	} else {
 		sparse_error(token->pos, "Expected identifier or goto expression");
@@ -2555,6 +2573,10 @@ static struct token *statement(struct token *token, struct statement **tree)
 			stmt->type = STMT_LABEL;
 			stmt->label_identifier = s;
 			stmt->label_scope = label_scope;
+			if (s->label_scope) {
+				if (!is_in_scope(label_scope, s->label_scope))
+					warn_label_usage(stmt->pos, s->label_pos, s->ident);
+			}
 			s->stmt = stmt;
 			return statement(token, &stmt->label_statement);
 		}
diff --git a/parse.h b/parse.h
index daef243938b2..2cfdd872e621 100644
--- a/parse.h
+++ b/parse.h
@@ -125,6 +125,7 @@ extern struct statement_list *function_computed_goto_list;
 
 extern struct token *parse_expression(struct token *, struct expression **);
 extern struct symbol *label_symbol(struct token *token);
+extern void check_label_usage(struct symbol *label, struct position use_pos);
 
 extern int show_statement(struct statement *);
 extern void show_statement_list(struct statement_list *, const char *);
diff --git a/validation/label-scope2.c b/validation/label-scope2.c
index 8c04ac6525e5..448647528dc6 100644
--- a/validation/label-scope2.c
+++ b/validation/label-scope2.c
@@ -23,7 +23,6 @@ a:
 
 /*
  * check-name: label-scope2
- * check-known-to-fail
  *
  * check-error-start
 label-scope2.c:20:17: error: label 'a' used outside statement expression
diff --git a/validation/label-stmt-expr0.c b/validation/label-stmt-expr0.c
index 66a6490241bd..5fc452ab0d15 100644
--- a/validation/label-stmt-expr0.c
+++ b/validation/label-stmt-expr0.c
@@ -26,7 +26,6 @@ l:		 1;
 /*
  * check-name: label-stmt-expr0
  * check-command: sparse -Wno-decl $file
- * check-known-to-fail
  *
  * check-error-start
 label-stmt-expr0.c:6:9: error: label 'l' used outside statement expression
diff --git a/validation/label-stmt-expr1.c b/validation/label-stmt-expr1.c
index 339217dcb999..32a89aad4e1f 100644
--- a/validation/label-stmt-expr1.c
+++ b/validation/label-stmt-expr1.c
@@ -18,7 +18,6 @@ l:
 
 /*
  * check-name: label-stmt-expr1
- * check-known-to-fail
  *
  * check-error-start
 label-stmt-expr1.c:3:9: error: label 'l' used outside statement expression
diff --git a/validation/label-stmt-expr2.c b/validation/label-stmt-expr2.c
index 7a38e3799c55..8c54477a4cc3 100644
--- a/validation/label-stmt-expr2.c
+++ b/validation/label-stmt-expr2.c
@@ -30,7 +30,6 @@ l:
 
 /*
  * check-name: label-stmt-expr2
- * check-known-to-fail
  *
  * check-error-start
 label-stmt-expr2.c:3:9: error: label 'l' used outside statement expression
diff --git a/validation/linear/goto-stmt-expr-conditional.c b/validation/linear/goto-stmt-expr-conditional.c
index 6576052b50ac..bbfcb3ebc039 100644
--- a/validation/linear/goto-stmt-expr-conditional.c
+++ b/validation/linear/goto-stmt-expr-conditional.c
@@ -20,7 +20,6 @@ a:
 /*
  * check-name: goto-stmt-expr-conditional
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-error-ignore
  * check-output-ignore
diff --git a/validation/linear/goto-stmt-expr-short-circuit.c b/validation/linear/goto-stmt-expr-short-circuit.c
index 426315e69fbd..a5953e73bc93 100644
--- a/validation/linear/goto-stmt-expr-short-circuit.c
+++ b/validation/linear/goto-stmt-expr-short-circuit.c
@@ -24,7 +24,6 @@ inside:
 /*
  * check-name: goto-stmt-expr-short-circuit
  * check-command: test-linearize -Wno-decl $file
- * check-known-to-fail
  *
  * check-error-ignore
  * check-output-ignore
-- 
2.26.2


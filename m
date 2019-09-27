Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8548BC0EB0
	for <lists+linux-sparse@lfdr.de>; Sat, 28 Sep 2019 01:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfI0Xnh (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 27 Sep 2019 19:43:37 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40929 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728535AbfI0Xnh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 27 Sep 2019 19:43:37 -0400
Received: by mail-ed1-f65.google.com with SMTP id v38so3712826edm.7
        for <linux-sparse@vger.kernel.org>; Fri, 27 Sep 2019 16:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Huq8YTiZwzsszN6KQaZr5IDTyewyWJ83YX7Qsl8FtRw=;
        b=G2YpsWKqrj8xtc1u1Ix9ParCkZ2RSAoKo1dWw05BqNc2uezMta0j9CF5nKGs9R+66z
         SZdI6nC9Yht5W5CMcLws62ppUCho94GoMR4P0zU7pfQK2cunPjSe9QHewltRr24XxY1T
         VbsqiCJQyni6y7mnFv/Co8WbWkJ7ozzb6cB+wXeomEcHubKYlXeVfRGtHmJKkHSeNv8O
         1bQmAG9NGnFQK84AxVTLUNhQ40J4yWro94IBwt0ofeQ1vz3hU3TiT1m2rL7pjxe2adj7
         AKvl1fHqKa3i5peEIwC70pN6B2FZqHR2BjvGubBmUwah8mj4ErTPNb7gg+rQYVVUBAv3
         wh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Huq8YTiZwzsszN6KQaZr5IDTyewyWJ83YX7Qsl8FtRw=;
        b=PXgMAfIywghqjKj5rV5J0peBecyI2MPO5jyZEOpqQre/cYiTjnbimlIzV1KaFw5Zqy
         gj/2LrO/BFE9uiHfKz3s/ZdiMbXyDzuLxLLSkRirNqHqDTu7Cc35etCMTkBrNQC14wR2
         fG4d4xF0/OO0kUakSxDxcZt5WjwXW0DJDK4isdIPPRnpz4vq413gowfhMU9GndH37lpc
         V2pfvjSkSmknthv82EM0jnwUawuDaH1tEQmqfLWCow/i1jBtEbY4xcPzVuyKLI+Bclke
         KQuY35Sz/Gfr3yJ5WxBZXmsfkL0EdyctkhOLFZHAb3Af+CpKMMlyPNpZv3L4IwYkkA/a
         HPEA==
X-Gm-Message-State: APjAAAVBq4SQVDbcWeGpjPVoPLpvJIxcbIVHlVzZ8Qk3CVJN4og7gFTH
        KUpnFgkmO7hb11rfYTg6A9dvY0UP
X-Google-Smtp-Source: APXvYqy12ZOHAAEdb/2rbjUzJtjkv+Z3N4g3nGfUz0eVMzNc+kp8dXPEwqQfL+6sZt6HNlY+vugSMQ==
X-Received: by 2002:a50:a7c4:: with SMTP id i62mr7339360edc.92.1569627813147;
        Fri, 27 Sep 2019 16:43:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a03f:4080:1900:da8:650b:f6cc:5bcf])
        by smtp.gmail.com with ESMTPSA id ng5sm730393ejb.9.2019.09.27.16.43.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 16:43:32 -0700 (PDT)
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 10/18] asm: use a specific struct for asm operands
Date:   Sat, 28 Sep 2019 01:43:14 +0200
Message-Id: <20190927234322.5157-13-luc.vanoostenryck@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
References: <20190927234322.5157-1-luc.vanoostenryck@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Before commit 756731e9 ("use a specific struct for asm operands")
ASM operands where stored as a list of n times 3 expressions.
After this commit, the triplets where stored inside a single
expression of type EXPR_ASM_OPERAND.

However, while this improved the parsing and use of ASM operands
it needlessly reuse 'struct expression' for something that is not
an expression at all.

Fix this by really using a specific struct for ASM operands.

Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
---
 allocate.c   |  1 +
 allocate.h   |  1 +
 dissect.c    |  2 +-
 evaluate.c   |  5 +----
 expand.c     |  3 ---
 expression.h | 13 ++++++-------
 inline.c     | 28 +++++++++++++---------------
 lib.h        |  2 ++
 linearize.c  | 19 ++++++++++---------
 parse.c      |  6 +++---
 parse.h      |  4 ++--
 show-parse.c |  3 ---
 12 files changed, 40 insertions(+), 47 deletions(-)

diff --git a/allocate.c b/allocate.c
index 152fa8964..bef85192e 100644
--- a/allocate.c
+++ b/allocate.c
@@ -141,6 +141,7 @@ ALLOCATOR(ident, "identifiers");
 ALLOCATOR(token, "tokens");
 ALLOCATOR(context, "contexts");
 ALLOCATOR(symbol, "symbols");
+ALLOCATOR(asm_operand, "asmops");
 ALLOCATOR(expression, "expressions");
 ALLOCATOR(statement, "statements");
 ALLOCATOR(string, "strings");
diff --git a/allocate.h b/allocate.h
index 5137ae934..a6d305371 100644
--- a/allocate.h
+++ b/allocate.h
@@ -82,6 +82,7 @@ DECLARE_ALLOCATOR(ident);
 DECLARE_ALLOCATOR(token);
 DECLARE_ALLOCATOR(context);
 DECLARE_ALLOCATOR(symbol);
+DECLARE_ALLOCATOR(asm_operand);
 DECLARE_ALLOCATOR(expression);
 DECLARE_ALLOCATOR(statement);
 DECLARE_ALLOCATOR(string);
diff --git a/dissect.c b/dissect.c
index b50c268b9..14d57bf5b 100644
--- a/dissect.c
+++ b/dissect.c
@@ -450,7 +450,7 @@ again:
 	return ret;
 }
 
-static void do_asm_xputs(usage_t mode, struct expression_list *xputs)
+static void do_asm_xputs(usage_t mode, struct asm_operand_list *xputs)
 {
 	DO_LIST(xputs, op, do_expression(U_W_AOF | mode, op->expr));
 }
diff --git a/evaluate.c b/evaluate.c
index 634da4b93..7cc695c7e 100644
--- a/evaluate.c
+++ b/evaluate.c
@@ -3354,9 +3354,6 @@ struct symbol *evaluate_expression(struct expression *expr)
 	case EXPR_SLICE:
 		expression_error(expr, "internal front-end error: SLICE re-evaluated");
 		return NULL;
-	case EXPR_ASM_OPERAND:
-		expression_error(expr, "internal front-end error: ASM_OPERAND evaluated");
-		return NULL;
 	}
 	return NULL;
 }
@@ -3519,7 +3516,7 @@ static void verify_input_constraint(struct expression *expr, const char *constra
 static void evaluate_asm_statement(struct statement *stmt)
 {
 	struct expression *expr;
-	struct expression *op;
+	struct asm_operand *op;
 	struct symbol *sym;
 
 	expr = stmt->asm_string;
diff --git a/expand.c b/expand.c
index aba20b8cf..487a44943 100644
--- a/expand.c
+++ b/expand.c
@@ -1091,9 +1091,6 @@ static int expand_expression(struct expression *expr)
 	case EXPR_OFFSETOF:
 		expression_error(expr, "internal front-end error: sizeof in expansion?");
 		return UNSAFE;
-	case EXPR_ASM_OPERAND:
-		expression_error(expr, "internal front-end error: ASM_OPERAND in expansion?");
-		return UNSAFE;
 	}
 	return SIDE_EFFECTS;
 }
diff --git a/expression.h b/expression.h
index 13f35e64b..a06bfe130 100644
--- a/expression.h
+++ b/expression.h
@@ -64,7 +64,6 @@ enum expression_type {
 	EXPR_FVALUE,
 	EXPR_SLICE,
 	EXPR_OFFSETOF,
-	EXPR_ASM_OPERAND,
 };
 
 
@@ -136,6 +135,12 @@ enum {
 	Taint_comma = 1,
 }; /* for expr->taint */
 
+struct asm_operand {
+	struct ident *name;
+	struct expression *constraint;
+	struct expression *expr;
+};
+
 struct expression {
 	enum expression_type type:8;
 	unsigned flags:8;
@@ -235,12 +240,6 @@ struct expression {
 				struct expression *index;
 			};
 		};
-		// EXPR_ASM_OPERAND
-		struct {
-			struct ident *name;
-			struct expression *constraint;
-			struct expression *expr;
-		};
 	};
 };
 
diff --git a/inline.c b/inline.c
index fcc43db5c..6f73a3055 100644
--- a/inline.c
+++ b/inline.c
@@ -274,26 +274,24 @@ static struct expression * copy_expression(struct expression *expr)
 		}
 		break;
 	}
-	case EXPR_ASM_OPERAND: {
-		expr = dup_expression(expr);
-		expr->constraint = copy_expression(expr->constraint);
-		expr->expr = copy_expression(expr->expr);
-		break;
-	}
 	default:
 		warning(expr->pos, "trying to copy expression type %d", expr->type);
 	}
 	return expr;
 }
 
-static struct expression_list *copy_asm_constraints(struct expression_list *in)
+static struct asm_operand_list *copy_asm_operands(struct asm_operand_list *in)
 {
-	struct expression_list *out = NULL;
-	struct expression *expr;
-
-	FOR_EACH_PTR(in, expr) {
-		add_expression(&out, copy_expression(expr));
-	} END_FOR_EACH_PTR(expr);
+	struct asm_operand_list *out = NULL;
+	struct asm_operand *old;
+
+	FOR_EACH_PTR(in, old) {
+		struct asm_operand *new = __alloc_asm_operand(0);
+		new->name = old->name;
+		new->constraint = copy_expression(old->constraint);
+		new->expr = copy_expression(old->expr);
+		add_ptr_list(&out, new);
+	} END_FOR_EACH_PTR(old);
 	return out;
 }
 
@@ -445,8 +443,8 @@ static struct statement *copy_one_statement(struct statement *stmt)
 	}
 	case STMT_ASM: {
 		stmt = dup_statement(stmt);
-		stmt->asm_inputs = copy_asm_constraints(stmt->asm_inputs);
-		stmt->asm_outputs = copy_asm_constraints(stmt->asm_outputs);
+		stmt->asm_inputs = copy_asm_operands(stmt->asm_inputs);
+		stmt->asm_outputs = copy_asm_operands(stmt->asm_outputs);
 		/* no need to dup "clobbers", since they are all constant strings */
 		break;
 	}
diff --git a/lib.h b/lib.h
index 322408be3..697c977a1 100644
--- a/lib.h
+++ b/lib.h
@@ -67,6 +67,7 @@ struct ident;
 struct token;
 struct symbol;
 struct statement;
+struct asm_operand;
 struct expression;
 struct basic_block;
 struct entrypoint;
@@ -76,6 +77,7 @@ struct pseudo;
 
 DECLARE_PTR_LIST(symbol_list, struct symbol);
 DECLARE_PTR_LIST(statement_list, struct statement);
+DECLARE_PTR_LIST(asm_operand_list, struct asm_operand);
 DECLARE_PTR_LIST(expression_list, struct expression);
 DECLARE_PTR_LIST(basic_block_list, struct basic_block);
 DECLARE_PTR_LIST(instruction_list, struct instruction);
diff --git a/linearize.c b/linearize.c
index 415bf7e50..69f2dfe6b 100644
--- a/linearize.c
+++ b/linearize.c
@@ -2106,9 +2106,10 @@ static void add_asm_output(struct entrypoint *ep, struct instruction *insn, stru
 
 static pseudo_t linearize_asm_statement(struct entrypoint *ep, struct statement *stmt)
 {
-	struct expression *expr;
 	struct instruction *insn;
+	struct expression *expr;
 	struct asm_rules *rules;
+	struct asm_operand *op;
 	const char *constraint;
 
 	insn = alloc_instruction(OP_ASM, 0);
@@ -2123,18 +2124,18 @@ static pseudo_t linearize_asm_statement(struct entrypoint *ep, struct statement
 	insn->asm_rules = rules;
 
 	/* Gather the inputs.. */
-	FOR_EACH_PTR(stmt->asm_inputs, expr) {
-		constraint = expr->constraint ? expr->constraint->string->data : "";
-		add_asm_input(ep, insn, expr->expr, constraint, expr->name);
-	} END_FOR_EACH_PTR(expr);
+	FOR_EACH_PTR(stmt->asm_inputs, op) {
+		constraint = op->constraint ? op->constraint->string->data : "";
+		add_asm_input(ep, insn, op->expr, constraint, op->name);
+	} END_FOR_EACH_PTR(op);
 
 	add_one_insn(ep, insn);
 
 	/* Assign the outputs */
-	FOR_EACH_PTR(stmt->asm_outputs, expr) {
-		constraint = expr->constraint ? expr->constraint->string->data : "";
-		add_asm_output(ep, insn, expr->expr, constraint, expr->name);
-	} END_FOR_EACH_PTR(expr);
+	FOR_EACH_PTR(stmt->asm_outputs, op) {
+		constraint = op->constraint ? op->constraint->string->data : "";
+		add_asm_output(ep, insn, op->expr, constraint, op->name);
+	} END_FOR_EACH_PTR(op);
 
 	return VOID;
 }
diff --git a/parse.c b/parse.c
index 23c0ee012..d132a15a0 100644
--- a/parse.c
+++ b/parse.c
@@ -2037,13 +2037,13 @@ static struct token *expression_statement(struct token *token, struct expression
 }
 
 static struct token *parse_asm_operands(struct token *token, struct statement *stmt,
-	struct expression_list **inout)
+	struct asm_operand_list **inout)
 {
 	/* Allow empty operands */
 	if (match_op(token->next, ':') || match_op(token->next, ')'))
 		return token->next;
 	do {
-		struct expression *op = alloc_expression(token->pos, EXPR_ASM_OPERAND);
+		struct asm_operand *op = __alloc_asm_operand(0);
 		if (match_op(token->next, '[') &&
 		    token_type(token->next->next) == TOKEN_IDENT &&
 		    match_op(token->next->next->next, ']')) {
@@ -2053,7 +2053,7 @@ static struct token *parse_asm_operands(struct token *token, struct statement *s
 		token = token->next;
 		token = string_expression(token, &op->constraint, "asm constraint");
 		token = parens_expression(token, &op->expr, "in asm parameter");
-		add_expression(inout, op);
+		add_ptr_list(inout, op);
 	} while (match_op(token, ','));
 	return token;
 }
diff --git a/parse.h b/parse.h
index 505c91c2c..0742a2a87 100644
--- a/parse.h
+++ b/parse.h
@@ -106,8 +106,8 @@ struct statement {
 		};
 		struct /* asm */ {
 			struct expression *asm_string;
-			struct expression_list *asm_outputs;
-			struct expression_list *asm_inputs;
+			struct asm_operand_list *asm_outputs;
+			struct asm_operand_list *asm_inputs;
 			struct expression_list *asm_clobbers;
 			struct symbol_list *asm_labels;
 		};
diff --git a/show-parse.c b/show-parse.c
index 3aa06e47c..371041675 100644
--- a/show-parse.c
+++ b/show-parse.c
@@ -1185,9 +1185,6 @@ int show_expression(struct expression *expr)
 	case EXPR_TYPE:
 		warning(expr->pos, "unable to show type expression");
 		return 0;
-	case EXPR_ASM_OPERAND:
-		warning(expr->pos, "unable to show asm operand expression");
-		return 0;
 	}
 	return 0;
 }
-- 
2.23.0


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76BA1DA6CD
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 02:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgETAxz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 20:53:55 -0400
Received: from avasout02.plus.net ([212.159.14.17]:33349 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETAxy (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 20:53:54 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bCzYjxWNYU8CkbCzZjjSCl; Wed, 20 May 2020 01:53:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1589936033; bh=TZtDGXpPwNJXLtXKCfgeoxHnfkIQiiG8f06CMGd7s1c=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=AGwbt3cPyiPZexDIxtxdt1sO4hAjMEfJQU57OcqJGRg/QKa4iPScwQASqMO1te5F2
         wcrPqJ0GSjchWiCVhTJ0A5rWVnbs25hG6DEHjcS7pLYjSTBlOgmD2pWCCcEmW06xbu
         D0yH7O1PE/bMmJSH+AHlPATD33zeNh3N41qUrUhqqkvQ9uCSoprmYneVMF9KjElo0z
         J43FivgkmvM+Kr1niC1v0wTJ5QZq9zgOdrGVFL/QuVi4sj1Ng1Dc8ntW2vhIm0Cmrf
         +ZbKOaU+/4SB9qAs9R9sJSrgpjKppdbdOpLHpDFQvyAm2P7ODf8On/9mnLjrYpCI8K
         FSIwizXAY7FhA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=svZD2uqZ2D4WFmSa56YA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v1 22/28] bad-goto: jumping inside a statemet expression
 is an error
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-23-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <0d16af30-3797-3ba8-24b9-5a5697345537@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 01:53:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519005728.84594-23-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCOIMgjsWNiyRPOAPwrbdCu2cXcT1QjfhQU9BNwz44Z74nGrpSwpyTop4Om7XujSlOeEXUjIi9Ia4zAERagU+P08w/r8uMV3wY95FtzjXyPgcIxFKUHQ
 vIR6l/1Wn9WMX/pW7FY228Kb07A9VYusKIzWh8DwEZZDqDmWGN1qL6aoUYrZ32Vy8JWimjC9VIGqcA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> It's invalid to jump inside a statement expression.
> 
> So, detect such jumps, issue an error message and mark the
> function as useless for linearization since the resulting IR
> would be invalid.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  parse.c                                       | 30 ++++++++++++++++---
>  parse.h                                       |  1 +
>  validation/label-scope2.c                     |  1 -
>  validation/label-stmt-expr0.c                 |  1 -
>  validation/label-stmt-expr1.c                 |  1 -
>  validation/label-stmt-expr2.c                 |  1 -
>  .../linear/goto-stmt-expr-conditional.c       |  1 -
>  .../linear/goto-stmt-expr-short-circuit.c     |  1 -
>  8 files changed, 27 insertions(+), 10 deletions(-)
> 
> diff --git a/parse.c b/parse.c
> index bf45e3b0ea44..b9d4940e77fb 100644
> --- a/parse.c
> +++ b/parse.c
> @@ -2480,6 +2480,27 @@ static struct token *parse_switch_statement(struct token *token, struct statemen
>  	return token;
>  }
>  
> +static void warn_label_usage(struct position def, struct position use, struct ident *ident)

you are issuing an error report from this function, so should it be
called, something like, 'label_usage_error'?

ATB,
Ramsay Jones

> +{
> +	const char *id = show_ident(ident);
> +	sparse_error(use, "label '%s' used outside statement expression", id);
> +	info(def, "   label '%s' defined here", id);
> +	current_fn->bogus_linear = 1;
> +}
> +
> +void check_label_usage(struct symbol *label, struct position use_pos)
> +{
> +	struct statement *def = label->stmt;
> +
> +	if (def) {
> +		if (!is_in_scope(def->label_scope, label_scope))
> +			warn_label_usage(def->pos, use_pos, label->ident);
> +	} else if (!label->label_scope) {
> +		label->label_scope = label_scope;
> +		label->label_pos = use_pos;
> +	}
> +}
> +
>  static struct token *parse_goto_statement(struct token *token, struct statement *stmt)
>  {
>  	stmt->type = STMT_GOTO;
> @@ -2490,10 +2511,7 @@ static struct token *parse_goto_statement(struct token *token, struct statement
>  	} else if (token_type(token) == TOKEN_IDENT) {
>  		struct symbol *label = label_symbol(token);
>  		stmt->goto_label = label;
> -		if (!label->stmt && !label->label_scope) {
> -			label->label_scope = label_scope;
> -			label->label_pos = stmt->pos;
> -		}
> +		check_label_usage(label, stmt->pos);
>  		token = token->next;
>  	} else {
>  		sparse_error(token->pos, "Expected identifier or goto expression");
> @@ -2555,6 +2573,10 @@ static struct token *statement(struct token *token, struct statement **tree)
>  			stmt->type = STMT_LABEL;
>  			stmt->label_identifier = s;
>  			stmt->label_scope = label_scope;
> +			if (s->label_scope) {
> +				if (!is_in_scope(label_scope, s->label_scope))
> +					warn_label_usage(stmt->pos, s->label_pos, s->ident);
> +			}
>  			s->stmt = stmt;
>  			return statement(token, &stmt->label_statement);
>  		}
> diff --git a/parse.h b/parse.h
> index daef243938b2..2cfdd872e621 100644
> --- a/parse.h
> +++ b/parse.h
> @@ -125,6 +125,7 @@ extern struct statement_list *function_computed_goto_list;
>  
>  extern struct token *parse_expression(struct token *, struct expression **);
>  extern struct symbol *label_symbol(struct token *token);
> +extern void check_label_usage(struct symbol *label, struct position use_pos);
>  
>  extern int show_statement(struct statement *);
>  extern void show_statement_list(struct statement_list *, const char *);
> diff --git a/validation/label-scope2.c b/validation/label-scope2.c
> index 8c04ac6525e5..448647528dc6 100644
> --- a/validation/label-scope2.c
> +++ b/validation/label-scope2.c
> @@ -23,7 +23,6 @@ a:
>  
>  /*
>   * check-name: label-scope2
> - * check-known-to-fail
>   *
>   * check-error-start
>  label-scope2.c:20:17: error: label 'a' used outside statement expression
> diff --git a/validation/label-stmt-expr0.c b/validation/label-stmt-expr0.c
> index 66a6490241bd..5fc452ab0d15 100644
> --- a/validation/label-stmt-expr0.c
> +++ b/validation/label-stmt-expr0.c
> @@ -26,7 +26,6 @@ l:		 1;
>  /*
>   * check-name: label-stmt-expr0
>   * check-command: sparse -Wno-decl $file
> - * check-known-to-fail
>   *
>   * check-error-start
>  label-stmt-expr0.c:6:9: error: label 'l' used outside statement expression
> diff --git a/validation/label-stmt-expr1.c b/validation/label-stmt-expr1.c
> index 339217dcb999..32a89aad4e1f 100644
> --- a/validation/label-stmt-expr1.c
> +++ b/validation/label-stmt-expr1.c
> @@ -18,7 +18,6 @@ l:
>  
>  /*
>   * check-name: label-stmt-expr1
> - * check-known-to-fail
>   *
>   * check-error-start
>  label-stmt-expr1.c:3:9: error: label 'l' used outside statement expression
> diff --git a/validation/label-stmt-expr2.c b/validation/label-stmt-expr2.c
> index 7a38e3799c55..8c54477a4cc3 100644
> --- a/validation/label-stmt-expr2.c
> +++ b/validation/label-stmt-expr2.c
> @@ -30,7 +30,6 @@ l:
>  
>  /*
>   * check-name: label-stmt-expr2
> - * check-known-to-fail
>   *
>   * check-error-start
>  label-stmt-expr2.c:3:9: error: label 'l' used outside statement expression
> diff --git a/validation/linear/goto-stmt-expr-conditional.c b/validation/linear/goto-stmt-expr-conditional.c
> index 6576052b50ac..bbfcb3ebc039 100644
> --- a/validation/linear/goto-stmt-expr-conditional.c
> +++ b/validation/linear/goto-stmt-expr-conditional.c
> @@ -20,7 +20,6 @@ a:
>  /*
>   * check-name: goto-stmt-expr-conditional
>   * check-command: test-linearize -Wno-decl $file
> - * check-known-to-fail
>   *
>   * check-error-ignore
>   * check-output-ignore
> diff --git a/validation/linear/goto-stmt-expr-short-circuit.c b/validation/linear/goto-stmt-expr-short-circuit.c
> index 426315e69fbd..a5953e73bc93 100644
> --- a/validation/linear/goto-stmt-expr-short-circuit.c
> +++ b/validation/linear/goto-stmt-expr-short-circuit.c
> @@ -24,7 +24,6 @@ inside:
>  /*
>   * check-name: goto-stmt-expr-short-circuit
>   * check-command: test-linearize -Wno-decl $file
> - * check-known-to-fail
>   *
>   * check-error-ignore
>   * check-output-ignore
> 

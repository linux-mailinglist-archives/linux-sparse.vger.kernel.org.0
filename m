Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 017621130C5
	for <lists+linux-sparse@lfdr.de>; Wed,  4 Dec 2019 18:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727911AbfLDR2I (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 4 Dec 2019 12:28:08 -0500
Received: from avasout01.plus.net ([84.93.230.227]:55012 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbfLDR2I (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 4 Dec 2019 12:28:08 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id cYRZiqDfQSXPqcYRaiLEwO; Wed, 04 Dec 2019 17:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1575480486; bh=80ZjO/eNNjOg1CLrfMpJxfkzGX7+yeJV5xVJ1OQdcIk=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=kFCu6NZOj7WZGd6NiTEWTFYIZCfEf8dNtMVR9YvXxKZHVpGakYX9LydB/cJYNkzN4
         QON1NohYC2QbIFc2zb0SWW/jLPfyTwdjZZ1tJY+Xk7+9gUmKB+Q9KSMBm7HHtqNYXu
         MUAkk83It+3MeT9TLOPM3IYkq5Unh3RYFwbCT0v6MCMkQAj4J8X1EXLAxbn0+N6uBw
         KtFxwcF57N3ng9k/bwwWIQDgI0x/BeVzQoaYFb+jQjiHFPt9chfr6H6rB9kjoAeDs9
         iOhG71AmKxBRAphqUi79VbOYrXWhn0ll+A2VRPQpvRkRT3/UW0Cmx9lnY5YvZVUsMh
         VXMqGOPamtWiA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=U/js8tju c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=-03pAonqx42t_JlB24wA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [DRAFT] add support for GCC's __auto_type
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191204030649.66699-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <baae182b-e824-64b1-f5a8-b691ba637f53@ramsayjones.plus.com>
Date:   Wed, 4 Dec 2019 17:28:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191204030649.66699-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfENrEoj5mwPRdjmM9A8uw9auyvyN3S915oPOdUSzMXYrtGWcO8meWVfCMY+TWZJ/GNlPi3aX3w1r9ut2NeTMTCBIDS4FW5mOlZnlhAdRVdkho2J+cMyE
 pR2BvBPd2UROD36dWxB2WT+XqbziriKXYa2pCKMbg0X/VskcV1VZw9MlrZwMtg5MmLxlhw5iZPsyvA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 04/12/2019 03:06, Luc Van Oostenryck wrote:
> This is still a draft because I've not yet convinced
> myself that this is the right approach: unlike typeof,
> it doesn't use a specific symbol type, instead it uses
> a flag in the decl_state, another one in the declared
> symbol and a new internal type 'autotype_ctype').
> 
> Otherwise, it seems to be working pretty well,
> maybe because it hasn't been tested well enough.

Heh, I had to look this up - it had passed me by! ;-)

> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  parse.c                  | 38 +++++++++++++++++++++++++++++++
>  symbol.c                 | 19 ++++++++++++++++
>  symbol.h                 |  2 ++
>  validation/autotype-ko.c | 43 +++++++++++++++++++++++++++++++++++
>  validation/autotype.c    | 49 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 151 insertions(+)
>  create mode 100644 validation/autotype-ko.c
>  create mode 100644 validation/autotype.c
> 
> diff --git a/parse.c b/parse.c
> index 6db3cba73..950cb7c91 100644
> --- a/parse.c
> +++ b/parse.c
> @@ -60,6 +60,7 @@ static declarator_t
>  	thread_specifier, const_qualifier, volatile_qualifier;
>  static declarator_t restrict_qualifier;
>  static declarator_t atomic_qualifier;
> +static declarator_t autotype_specifier;
>  
>  static struct token *parse_if_statement(struct token *token, struct statement *stmt);
>  static struct token *parse_return_statement(struct token *token, struct statement *stmt);
> @@ -213,6 +214,13 @@ static struct symbol_op typeof_op = {
>  	.set = Set_S|Set_T,
>  };
>  
> +static struct symbol_op autotype_op = {
> +	.type = KW_SPECIFIER,
> +	.declarator = autotype_specifier,
> +	.test = Set_Any,
> +	.set = Set_S|Set_T,
> +};
> +
>  static struct symbol_op attribute_op = {
>  	.type = KW_ATTRIBUTE,
>  	.declarator = attribute_specifier,
> @@ -505,6 +513,7 @@ static struct init_keyword {
>  	{ "typeof", 	NS_TYPEDEF, .op = &typeof_op },
>  	{ "__typeof", 	NS_TYPEDEF, .op = &typeof_op },
>  	{ "__typeof__",	NS_TYPEDEF, .op = &typeof_op },
> +	{ "__auto_type",NS_TYPEDEF, .op = &autotype_op },
>  
>  	{ "__attribute",   NS_TYPEDEF, .op = &attribute_op },
>  	{ "__attribute__", NS_TYPEDEF, .op = &attribute_op },
> @@ -1077,6 +1086,13 @@ static struct token *typeof_specifier(struct token *token, struct decl_state *ct
>  	return expect(token, ')', "after typeof");
>  }
>  
> +static struct token *autotype_specifier(struct token *token, struct decl_state *ctx)
> +{
> +	ctx->ctype.base_type = &autotype_ctype;
> +	ctx->autotype = 1;
> +	return token;
> +}
> +
>  static struct token *ignore_attribute(struct token *token, struct symbol *attr, struct decl_state *ctx)
>  {
>  	struct expression *expr = NULL;
> @@ -2986,6 +3002,11 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
>  			}
>  		}
>  	} else if (base_type && base_type->type == SYM_FN) {
> +		if (base_type->ctype.base_type == &autotype_ctype) {
> +			sparse_error(decl->pos, "'%s()' has __auto_type return type",
> +				show_ident(decl->ident));
> +			base_type->ctype.base_type = &int_ctype;
> +		}
>  		if (base_type->ctype.base_type == &incomplete_ctype) {
>  			warning(decl->pos, "'%s()' has implicit return type",
>  				show_ident(decl->ident));
> @@ -3038,6 +3059,23 @@ struct token *external_declaration(struct token *token, struct symbol_list **lis
>  			}
>  		}
>  
> +		if (ctx.autotype) {
> +			const char *msg = NULL;
> +			if (decl->ctype.base_type != &autotype_ctype)
> +				msg = "on non-identifier";
> +			else if (match_op(token, ','))
> +				msg = "on declaration list";
> +			else if (!decl->initializer)
> +				msg = "without initializer";
> +			else if (decl->initializer->type == EXPR_SYMBOL &&
> +				 decl->initializer->symbol == decl)
> +				msg = "on self-init var";
> +			if (msg) {
> +				sparse_error(decl->pos, "__auto_type %s", msg);
> +				decl->ctype.base_type = &bad_ctype;
> +			}
> +		}
> +
>  		if (!match_op(token, ','))
>  			break;
>  
> diff --git a/symbol.c b/symbol.c
> index fb14b6245..458801348 100644
> --- a/symbol.c
> +++ b/symbol.c
> @@ -192,6 +192,10 @@ static struct symbol * examine_struct_union_type(struct symbol *sym, int advance
>  
>  	fn = advance ? lay_out_struct : lay_out_union;
>  	FOR_EACH_PTR(sym->symbol_list, member) {
> +		if (member->ctype.base_type == &autotype_ctype) {
> +			sparse_error(member->pos, "member '%s' has __auto_type", show_ident(member->ident));
> +			member->ctype.base_type = &incomplete_ctype;
> +		}
>  		fn(member, &info);
>  	} END_FOR_EACH_PTR(member);
>  
> @@ -210,6 +214,19 @@ static struct symbol *examine_base_type(struct symbol *sym)
>  {
>  	struct symbol *base_type;
>  
> +	if (sym->ctype.base_type == &autotype_ctype) {
> +		struct symbol *type = evaluate_expression(sym->initializer);
> +		if (!type)
> +			type = &bad_ctype;
> +		if (is_bitfield_type(type)) {
> +			warning(sym->pos, "__auto_type on bitfield");
> +			if (type->type == SYM_NODE)
> +				type = type->ctype.base_type;
> +			type = type->ctype.base_type;
> +		}
> +		sym->ctype.base_type = type;
> +	}
> +
>  	/* Check the base type */
>  	base_type = examine_symbol_type(sym->ctype.base_type);
>  	if (!base_type || base_type->type == SYM_PTR)
> @@ -731,6 +748,7 @@ struct symbol	bool_ctype, void_ctype, type_ctype,
>  		string_ctype, ptr_ctype, lazy_ptr_ctype,
>  		incomplete_ctype, label_ctype, bad_ctype,
>  		null_ctype;
> +struct symbol	autotype_ctype;
>  struct symbol	int_ptr_ctype, uint_ptr_ctype;
>  struct symbol	long_ptr_ctype, ulong_ptr_ctype;
>  struct symbol	llong_ptr_ctype, ullong_ptr_ctype;
> @@ -789,6 +807,7 @@ static const struct ctype_declare {
>  	{ &void_ctype,         T_BASETYPE },
>  	{ &type_ctype,         T_BASETYPE },
>  	{ &incomplete_ctype,   T_BASETYPE },
> +	{ &autotype_ctype,     T_BASETYPE },
>  	{ &bad_ctype,          T_BASETYPE },
>  
>  	{ &char_ctype,         T__INT(-2, char) },
> diff --git a/symbol.h b/symbol.h
> index e60d91365..dd40a1dc7 100644
> --- a/symbol.h
> +++ b/symbol.h
> @@ -110,6 +110,7 @@ struct decl_state {
>  	unsigned long f_modifiers;		// function attributes
>  	unsigned char prefer_abstract, is_inline, storage_class, is_tls;
>  	unsigned char is_ext_visible;
> +	unsigned char autotype;
>  };
>  
>  struct symbol_op {
> @@ -277,6 +278,7 @@ extern struct symbol	bool_ctype, void_ctype, type_ctype,
>  			string_ctype, ptr_ctype, lazy_ptr_ctype,
>  			incomplete_ctype, label_ctype, bad_ctype,
>  			null_ctype;
> +extern struct symbol	autotype_ctype;
>  extern struct symbol	int_ptr_ctype, uint_ptr_ctype;
>  extern struct symbol	long_ptr_ctype, ulong_ptr_ctype;
>  extern struct symbol	llong_ptr_ctype, ullong_ptr_ctype;
> diff --git a/validation/autotype-ko.c b/validation/autotype-ko.c
> new file mode 100644
> index 000000000..ac4cd8660
> --- /dev/null
> +++ b/validation/autotype-ko.c
> @@ -0,0 +1,43 @@
> +__auto_type u;				// KO: no initializer
> +__auto_type r[2] = { 0, 1 };		// KO: not a plain identifier
> +__auto_type foo(void) { }		// KO: not a plain identifier
> +__auto_type v = 0, w = 1;		// KO: in list
> +struct { __auto_type x; } s;		// KO: not valid for struct/union
> +__auto_type self = self;		// KO: self-declared
> +__auto_type undc = this;		// KO: undeclared
> +
> +int i = 1;
> +double f = 1.0;
> +__auto_type i = 2;			// KO: redecl, same type
> +__auto_type f = 2.0f;			// KO: redecl, diff type
> +
> +
> +static int foo(int a, const int *ptr)
> +{
> +	__auto_type i = a;
> +	__auto_type c = *ptr;
> +
> +	c += 1;
> +	return i;
> +}
> +
> +/*
> + * check-name: autotype-ko
> + * check-command: sparse -Wno-decl $file
> + * checz-known-to-fail

s/checz-/check-/

> + *
> + * check-error-start
> +autotype-ko.c:1:13: error: __auto_type without initializer
> +autotype-ko.c:2:13: error: __auto_type on non-identifier
> +autotype-ko.c:3:13: error: 'foo()' has __auto_type return type
> +autotype-ko.c:4:13: error: __auto_type on declaration list
> +autotype-ko.c:6:13: error: __auto_type on self-init var
> +autotype-ko.c:2:20: error: invalid initializer
> +autotype-ko.c:5:22: error: member 'x' has __auto_type
> +autotype-ko.c:7:20: error: undefined identifier 'this'
> +autotype-ko.c:11:13: error: symbol 'i' has multiple initializers (originally initialized at autotype-ko.c:9)
> +autotype-ko.c:12:13: error: symbol 'f' has multiple initializers (originally initialized at autotype-ko.c:10)
> +autotype-ko.c:12:13: error: symbol 'f' redeclared with different type (originally declared at autotype-ko.c:10) - different type sizes
> +autotype-ko.c:20:9: error: assignment to const expression
> + * check-error-end
> + */
> diff --git a/validation/autotype.c b/validation/autotype.c
> new file mode 100644
> index 000000000..4b1a8b146
> --- /dev/null
> +++ b/validation/autotype.c
> @@ -0,0 +1,49 @@
> +#ifdef __CHECKER__
> +#define	is_type(X, T)	_Static_assert([typeof(X)] == [T], "")
> +#else
> +#define	is_type(X, T)	_Static_assert(1, "")
> +#endif
> +
> +struct s {
> +	int x;
> +	int bf:3;
> +};
> +
> +extern char ch;
> +extern const int ci;
> +
> +__auto_type i = 0;		is_type(i, int);
> +__auto_type m = 1UL;		is_type(m, unsigned long);
> +__auto_type p = &i;		is_type(p, int *);
> +__auto_type f = 0.0;		is_type(f, double);
> +__auto_type s = (struct s){0};	is_type(s, struct s);
> +__auto_type c = ch;		is_type(c, char);
> +__auto_type ct = ci;		is_type(ct, int);

Hmm, this loses the 'const', ...

> +__auto_type pci = &ci;		is_type(pci, const int *);

... but this doesn't?

Unfortunately, the gcc documentation that I have doesn't give a
sufficiently detailed specification for me to tell if this is
expected.

> +
> +// ~~: not valid for bitfield
> +__auto_type b = (struct s){0}.bf; is_type(b, int);
> +
> +static __auto_type si = 0;	is_type(si, int);
> +const  __auto_type ci = 0;	is_type(ci, const int);
> +__auto_type ch = (char) '\n';	is_type(ch, char);
> +
> +static int foo(int a)
> +{
> +	__auto_type i = a;	is_type(i, int);
> +	return i;
> +}
> +
> +
> +#define __as __attribute__((address_space(42)));

__as defined, but not used.

> +__auto_type ai = (int)0L;	is_type(&ai, int *);
> +
> +/*
> + * check-name: autotype
> + * check-command: sparse -Wno-decl $file
> + * checz-known-to-fail

s/checz-/check-/

> + *
> + * check-error-start
> +autotype.c:25:13: warning: __auto_type on bitfield
> + * check-error-end
> + */
> 

ATB,
Ramsay Jones

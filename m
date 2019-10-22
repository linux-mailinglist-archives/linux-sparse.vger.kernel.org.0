Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C949E015C
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 12:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731660AbfJVKAY (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 06:00:24 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:49872 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731439AbfJVKAY (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 06:00:24 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iMqxh-0006SC-5Y; Tue, 22 Oct 2019 11:00:21 +0100
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
 <20191020154253.gggtofzjsronebje@desk.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <608f935e-03be-70cf-abbf-c5b586f4a0b9@codethink.co.uk>
Date:   Tue, 22 Oct 2019 11:00:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020154253.gggtofzjsronebje@desk.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 20/10/2019 16:42, Luc Van Oostenryck wrote:
> On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
>> diff --git a/evaluate.c b/evaluate.c
>> --- a/evaluate.c
>> +++ b/evaluate.c
>> @@ -2319,13 +2319,452 @@ static struct symbol *evaluate_alignof(struct expression *expr)
>>   	return size_t_ctype;
>>   }
>>   
>> +struct format_type {
>> +	const char	*format;
>> +	int		(*test)(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff);
>> +	struct symbol	*data;
>> +};
>> +
>> +struct format_state {
>> +	struct expression	*expr;
>> +	unsigned int		va_start;
> 
> the prefix 'va_' is useless.

I would prefer to keep it as it clearly states this is for a va_list.

>> +static int printf_fmt_print_pointer(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
>> +{
>> +	int ret;
>> +	*target = &ptr_ctype;
>> +	ret =check_assignment_types(*target, expr, typediff);
>> +	if (ret == 0) {
>> +		/* if just printing, ignore address-space mismatches */
>> +		if (strcmp(*typediff, "different address spaces") == 0)
> 
> That's terrible.
> It would be better to copy the ctype and then mask out the address spaces.

I'll try and sort this

>> +			ret = 1;
>> +	}
>> +	return ret;
>> +}
>> +
>> +static struct format_type printf_fmt_ptr_ref = { "p", .test = printf_fmt_pointer, };
> 
> Please use a designator for all members:
> 	.format = "p",
> 	.test = ....

ok, fixed.

> 
>> +static struct expression *get_expression_n(struct expression_list *args, int nr)
> 
> get_nth_expression() ?

ok, changed.

> 
>> +static void parse_format_printf_checkpos(struct format_state *state, const char *which)
>> +{
>> +	if (state->used_position)
>> +		warning(state->expr->pos,
>> +			"format %d: %s: no position specified",
>> +			state->arg_index-1, which);
> 
> Please, use braces when the body doesn't hold on a single line.

ok, done

>> +static int parse_format_printf_argfield(const char **fmtptr, struct format_state *state, struct expression_list *args, int *pos, const char *which)
>> +{
> 
> ...
> 
>> +	/* check the vale we got was int/uint type */
> 
> typo: value

ok, fixed


>> +	ctype = evaluate_expression(expr);
>> +	if (ctype) {
>> +		struct symbol *source, *target = &int_ctype;
>> +
>> +		source = degenerate(expr);
>> +
>> +		if (source != &int_ctype && source != &uint_ctype) {
> 
> Is there a good reason to allow uint (the standard only allow a plain int)?

I think just testing with gcc showed it tended to not care about signed.

>> +/*
>> + * printf format parsing code
>> + *
>> + * this code currently does not:
>> + * - check castable types (such as int vs long vs long long)
>> + * - validate all arguments specified are also used...
>> + */
>> +static int parse_format_printf(const char **fmtstring,
>> +			       struct format_state *state,
>> +			       struct expression_list *args)
>> +{
>> +	struct format_type ftype;
>> +	struct format_type *type;
>> +	struct expression *expr;
>> +	const char *fmt = *fmtstring;
>> +	const char *fmtpost = NULL;
>> +	int pos = state->arg_index;
>> +	int error = 0;
>> +	int ret;
> 
> It would be nice to have some comments about the variables, for example
> what is the purpose of fmtpost.

ok, done

> 
>> +		source = degenerate(expr);
>> +		ret = (type->test)(type, &expr, ctype, &target, &typediff);
> 
> The first set of parentheses are unneeded. Please remove them.

ok, done

>> +	} else {
>> +		/* try and find the end of this */
>> +		fmtpost = *fmtstring;
>> +		while (*fmtpost > ' ')
> 
> This merits a comment. Also, what is 'this'?

changed to:
/* try and find the end of this format string by looking for a space*/


>> +static void evaluate_format_printf(const char *fmt_string, struct symbol *fn, struct expression_list *head)
>> +{
>> +		if (fail > 0)
>> +			/* format string may have '\n' etc embedded in it */
>> +			warning(expr->pos, "cannot evaluate format string");
> 
> If fail > 0, a specific warnings has already been issued, right?
> then this warning should be removed.

I think there are a place or two where there are no warnings.
I'll go check.

> 
>>   static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
>>   {
>>   	struct expression *expr;
>>   	struct symbol_list *argument_types = fn->arguments;
>> +	const char *fmt_string = NULL;
>>   	struct symbol *argtype;
>>   	int i = 1;
>>   
>> +	/*
>> +	 * do this first, otherwise the arugment info may get lost or changed
> 
> typo: argument.
> Maybe change the message to something like:
> 	Do first part of (printf) format checking. This need to be done
> 	here, ...
> 

ok, thanks.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

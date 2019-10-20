Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 616CEDDF3E
	for <lists+linux-sparse@lfdr.de>; Sun, 20 Oct 2019 17:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfJTPnA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 20 Oct 2019 11:43:00 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33324 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfJTPm7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 20 Oct 2019 11:42:59 -0400
Received: by mail-wr1-f67.google.com with SMTP id s1so2309882wro.0
        for <linux-sparse@vger.kernel.org>; Sun, 20 Oct 2019 08:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VRecaaAOXqe8AE7ObYZymDsWGNWks3SqwAfuvfpHHpE=;
        b=VaCpvXowznFmnSLATAg1YxQIk8nkvVMq9Q09jzH7bcYdoz99U92afzkRobpyqu1s3H
         j0AVUqwNbg2jmsyRu8XOSDoOMZlxlaUKy0HqRcE+NngPCzWT7Ja1ni6EmzO5g2y+u5dj
         oOW1dsiA7djel3VFqNuQUjQQlc2MMgk0QvgkEA6pXCJcU/mO3Y3Y1IVyXR/4sxYKbASf
         rTd5yDachZnYyLkkloh/23qSXgt4OaQemki8cr+WmxeMI9qSsBzC018es0BML+n5oYRv
         SBVnARAuqfUmtuIEcZe8xmE/0esADBr3TUiNA5eJkODumXM6FaNdnd/mbjpPrRM4ykbB
         VvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VRecaaAOXqe8AE7ObYZymDsWGNWks3SqwAfuvfpHHpE=;
        b=d3pDlH1wFVFSYbKEFRc8WDabaietqXpWnAuHsx/cYLPxbWCUNYQPu3yeb03zg1tIW1
         A7PDW/YC56xc3fNMSWpu/XZQ5TKO89/F5enW8peJD2x9tdqgQkQuxnH/7L3mKW3q+6SP
         JplF6txuOxfvZex84RFQob/BXiNhyrrvEQOVkayS8SJI5fEOMKuw5SQhVKEmSyeW3N+K
         29nN7srws19p/LzPNdUJRzWy0JfEveGcMruPxSkSXoEOJAiBRIR1Klfvj8TElack+wLE
         RNnk1Mc9AHkjrZQ/agAdK2rqrWDF/YRMRtoliLU2LgjHx0x/qYfHo/OfWypuplaG/6Q8
         Z7cQ==
X-Gm-Message-State: APjAAAXePoEzXr5yH0NYCp+H776EufFKDtUwx+9T5x3I3m4heVuzj0Gx
        mDdgwt8qfg15c0EZIihjpD7LK03n
X-Google-Smtp-Source: APXvYqyvcybt0/pN56k28fro5Dc8I5AnR24iJqicYBFPBszWXUhRi8EfES8bB4u0GV+1inYbUQOL9A==
X-Received: by 2002:a5d:44c8:: with SMTP id z8mr15833326wrr.66.1571586176706;
        Sun, 20 Oct 2019 08:42:56 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:90a6:dd03:1e7:4457])
        by smtp.gmail.com with ESMTPSA id c72sm11808156wme.7.2019.10.20.08.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 08:42:55 -0700 (PDT)
Date:   Sun, 20 Oct 2019 17:42:54 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191020154253.gggtofzjsronebje@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925100015.31510-4-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
> diff --git a/evaluate.c b/evaluate.c
> --- a/evaluate.c
> +++ b/evaluate.c
> @@ -2319,13 +2319,452 @@ static struct symbol *evaluate_alignof(struct expression *expr)
>  	return size_t_ctype;
>  }
>  
> +struct format_type {
> +	const char	*format;
> +	int		(*test)(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff);
> +	struct symbol	*data;
> +};
> +
> +struct format_state {
> +	struct expression	*expr;
> +	unsigned int		va_start;

the prefix 'va_' is useless.

> +static int printf_fmt_print_pointer(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
> +{
> +	int ret;
> +	*target = &ptr_ctype;
> +	ret =check_assignment_types(*target, expr, typediff);
> +	if (ret == 0) {
> +		/* if just printing, ignore address-space mismatches */
> +		if (strcmp(*typediff, "different address spaces") == 0)

That's terrible.
It would be better to copy the ctype and then mask out the address spaces.

> +			ret = 1;
> +	}
> +	return ret;
> +}
> +
> +static struct format_type printf_fmt_ptr_ref = { "p", .test = printf_fmt_pointer, };

Please use a designator for all members:
	.format = "p",
	.test = ....

> +static struct expression *get_expression_n(struct expression_list *args, int nr)

get_nth_expression() ?

> +static void parse_format_printf_checkpos(struct format_state *state, const char *which)
> +{
> +	if (state->used_position)
> +		warning(state->expr->pos,
> +			"format %d: %s: no position specified",
> +			state->arg_index-1, which);

Please, use braces when the body doesn't hold on a single line.

> +static int parse_format_printf_argfield(const char **fmtptr, struct format_state *state, struct expression_list *args, int *pos, const char *which)
> +{

...

> +	/* check the vale we got was int/uint type */

typo: value

> +	ctype = evaluate_expression(expr);
> +	if (ctype) {
> +		struct symbol *source, *target = &int_ctype;
> +
> +		source = degenerate(expr);
> +
> +		if (source != &int_ctype && source != &uint_ctype) {

Is there a good reason to allow uint (the standard only allow a plain int)?

> +/*
> + * printf format parsing code
> + *
> + * this code currently does not:
> + * - check castable types (such as int vs long vs long long)
> + * - validate all arguments specified are also used...
> + */
> +static int parse_format_printf(const char **fmtstring,
> +			       struct format_state *state,
> +			       struct expression_list *args)
> +{
> +	struct format_type ftype;
> +	struct format_type *type;
> +	struct expression *expr;
> +	const char *fmt = *fmtstring;
> +	const char *fmtpost = NULL;
> +	int pos = state->arg_index;
> +	int error = 0;
> +	int ret;

It would be nice to have some comments about the variables, for example
what is the purpose of fmtpost.


> +		source = degenerate(expr);
> +		ret = (type->test)(type, &expr, ctype, &target, &typediff);

The first set of parentheses are unneeded. Please remove them.

> +	} else {
> +		/* try and find the end of this */
> +		fmtpost = *fmtstring;
> +		while (*fmtpost > ' ')

This merits a comment. Also, what is 'this'?

> +static void evaluate_format_printf(const char *fmt_string, struct symbol *fn, struct expression_list *head)
> +{
> +		if (fail > 0)
> +			/* format string may have '\n' etc embedded in it */
> +			warning(expr->pos, "cannot evaluate format string");

If fail > 0, a specific warnings has already been issued, right?
then this warning should be removed.

>  static int evaluate_arguments(struct symbol *fn, struct expression_list *head)
>  {
>  	struct expression *expr;
>  	struct symbol_list *argument_types = fn->arguments;
> +	const char *fmt_string = NULL;
>  	struct symbol *argtype;
>  	int i = 1;
>  
> +	/*
> +	 * do this first, otherwise the arugment info may get lost or changed

typo: argument.
Maybe change the message to something like:
	Do first part of (printf) format checking. This need to be done
	here, ...

-- Luc

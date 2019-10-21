Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65F93DE812
	for <lists+linux-sparse@lfdr.de>; Mon, 21 Oct 2019 11:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfJUJav (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 21 Oct 2019 05:30:51 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54003 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbfJUJav (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 21 Oct 2019 05:30:51 -0400
Received: by mail-wm1-f67.google.com with SMTP id i16so12441135wmd.3
        for <linux-sparse@vger.kernel.org>; Mon, 21 Oct 2019 02:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4NBFtFqbrw4nj7OiYTD80V/K/FYJ0ouyyv9XBCcozps=;
        b=VEPeT0gjP7YHQxO9J+ANnV/gpzF2sL/fSFUn5D00+ZW/2jd2yUV7ZhLLdeJQFRsip3
         Ol/s5cRN8+kut0h+CrSmVY8hCWa1pefrtuWv8EUzAUjPFI5tCn4lC8JOQeQoMlHQHgVz
         TMy5nZjAkKDGvQ5C4fe2SNuY09bMPm8H3jj6Gor1smptpYAn43gTr7Xy9HfiUr/gmaRH
         n6RbkWTCW4XEwrdcOvN0iII3JwLcnGoJv1R/LT1RTqbu1mYUulP4x+6xrV1oiSsyyYK5
         OkeJUohQpELCNLuYP18+2dEY7ROXR77m+a7xhciRL43cjMd3+JJZl9SrOis6AoZsCJ9+
         0Jbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4NBFtFqbrw4nj7OiYTD80V/K/FYJ0ouyyv9XBCcozps=;
        b=i7/fs8VFpwBHHDVsdpsNmRsWwXfr6cR/qUPfSBb0trqL9az5czaKyArYj6nKHXO/mG
         NqKk9G9MWFXfFKDFSv3NQtajo46jiIlHs51AX19GSqaWIiSIFDlMk0Cw/qbyAUUovEUO
         DInw97oY0SBR7JlMSfb75H0R+L9XHjTmO0+I68KQKeXEwbKaEEHOYUlVD+jlGBXsKbWb
         KKePrYAwOKG+BGqcYQt2VoxTh9FMxHvewD6a3oPIs5g8Y6fIc+ZcTr0jJ+Pn25G6U4gB
         t1T6ECGRi9RoJKsI4bgmbCvEbPdwkUn63TqH7Bkn7QoWBo7+ukvrhOD6Uq5UdfokehW5
         sg+g==
X-Gm-Message-State: APjAAAU8qYPoXLMScdeISMbNbNE7WO9/zAYkym6ih4fr7SsgWg77fmYy
        i+ptWDlxloGXRVAzWVB6KJe88wG8
X-Google-Smtp-Source: APXvYqwnadCIRv7omDJ3uBncvfdJWvbrQQ9dMTyeJlmu8mFK2hsgx6DgQ9AJ4tNPnh0TqojlBKgdog==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr1571663wmi.87.1571650249236;
        Mon, 21 Oct 2019 02:30:49 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:94c7:5a14:d999:90f5])
        by smtp.gmail.com with ESMTPSA id p7sm13055883wma.34.2019.10.21.02.30.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 02:30:48 -0700 (PDT)
Date:   Mon, 21 Oct 2019 11:30:47 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191021093045.ub452gxi26oa2sgl@ltop.local>
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
> +static const char *get_printf_fmt(struct symbol *fn, struct expression_list *head)
> +{
> +	struct expression *expr;
> +	const char *fmt_string = NULL;
> +
> +	expr = get_expression_n(head, fn->ctype.printf_msg-1);
> +	if (!expr)
> +		return NULL;
> +	if (expr->string && expr->string->length)

expr->string is only valid if expr->type == EXPR_STRING,
so this must be checked first.
> +		fmt_string = expr->string->data;
> +	if (!fmt_string) {
> +		struct symbol *sym = evaluate_expression(expr);

evaluate_expression() only returns the type of the expression, not
the underlying symbol (if there is one). But yes, confusingly, both
are struct symbol *.
You need to check if expr->type == EXPR_SYMBOL and then simply
use expr->symbol.

> +
> +		/* attempt to find initialiser for this */
> +		if (sym && sym->initializer && sym->initializer->string)

Same here with ->string & EXPR_STRING.

> +			fmt_string = sym->initializer->string->data;
> +	}

I think the code here above should be replaced by something like:
	if (!evaluate_expression(expr))
		return NULL;
	if (expr->type == EXPR_PREOP && expr->op == '*')
		expr = expr->unop;
	if (expr->type == EXPR_SYMBOL) {
		struct symbol *sym = expr->symbol;
		if (sym && sym->initializer)
			expr = sym->initializer;
	}
	if (expr->type == EXPR_STRING)
		return expr->string->data;
	return NULL;

This is not tested but it solves a nasty situation with a test like:
	void __attribute__((format(printf, 1, 2))) prt(char *, ...);
	static int x;
	static inline void fun(void) {
		prt("%08x\n", x);
	}
	static void foo(void) {
		fun;
		fun();
	}

Don't ask the details about this specific test, I don't fully understand
it myself, but it's a reduced case for a failure on the kernel code
where a warning "not a format string?" was wrongly issued.
Please add this one in your tests.

-- Lu 

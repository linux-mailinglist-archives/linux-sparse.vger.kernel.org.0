Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24397DDEFB
	for <lists+linux-sparse@lfdr.de>; Sun, 20 Oct 2019 16:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbfJTO5U (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 20 Oct 2019 10:57:20 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52375 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfJTO5T (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 20 Oct 2019 10:57:19 -0400
Received: by mail-wm1-f66.google.com with SMTP id r19so10575237wmh.2
        for <linux-sparse@vger.kernel.org>; Sun, 20 Oct 2019 07:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lCksBW1Rk10mp9u1W+HvouWmGdQ4WzSSxORVvDOit1Y=;
        b=e/bu7pG56aFY/3mt880CVgKJLrXMU/hWrHbXENgNMGgFOCYsXSFQuUBCuVkCXEqNru
         3cPl8cPuj4IllcSS/dE8J17LrYKsm3Z4uvcdBP3hy3g0gWpMhxt51PA7DnysPyif0+GT
         TdoBECPzJT33+sOGH/9StCwNpTh48U8BpGSsByPe6VpLDVeE4i63o41noFzwXYnXEO8s
         H+UP8FaMjlSxl80TBxz+timQoh3tEcJkAGmGhQ5mTAMeyIS1iwFpUEjHjimRRDWPaWWF
         KwbVHST3LYwXgUf0Hx6JfexpLiY/W3ORgd+aCuFH3avEWG/Sb+SMi4n4+NrZA0WI/mMl
         QUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lCksBW1Rk10mp9u1W+HvouWmGdQ4WzSSxORVvDOit1Y=;
        b=mV7IGE4vh1vWgDTm6A55SDCIYNR7j0whgdfrNuIiFnqMyEEPWmU62eHiuYBfRMtvJk
         vzCqQrYdWzDDHcrYD9g0xyZW+ZMPuujVwGoAWvG25yPQa3+c9tq2T7oMUZE0f//Win6w
         IXYnBbl0djPSKOW91di1uyin5XrYw+IdrfOvoqFASYVDOT373c69qlqVuWWIgmdoZVGf
         VPe6JdImvz2wwYJX7flCrBB3wG4bwHUdn6dqKho8PL8hUHRfscXWEi+S+pJEvLwiA300
         9pJ2kxWhwVHZ+zSNeMk3wGvyt3/UTH7V7lLk3FctKG7A+O7OodvVz3ITSjqIIOMBGzJv
         44qw==
X-Gm-Message-State: APjAAAVE2we9WEmPW4e2F3MxRY4Pxhp3tkVi4tx4H/iInSq+7w66OULQ
        o0IyMhn6m+OpewCWipwPzedyAR3L
X-Google-Smtp-Source: APXvYqx2rGpDP1330gg9XVubHEQF+xh4OVh/euvdqz2PgPWyoLDDK8/qSLssGemWzIKwfmR/SrbK+g==
X-Received: by 2002:a1c:7c16:: with SMTP id x22mr16714182wmc.113.1571583437337;
        Sun, 20 Oct 2019 07:57:17 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:90a6:dd03:1e7:4457])
        by smtp.gmail.com with ESMTPSA id d199sm2483977wmd.35.2019.10.20.07.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 07:57:15 -0700 (PDT)
Date:   Sun, 20 Oct 2019 16:57:15 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 2/5] parse: initial parsing of __attribute__((format))
Message-ID: <20191020145714.uai45bjrrkih2ars@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-3-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925100015.31510-3-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Sep 25, 2019 at 11:00:12AM +0100, Ben Dooks wrote:
> diff --git a/parse.c b/parse.c
> index f291e24..583a82c 100644
> --- a/parse.c
> +++ b/parse.c
> @@ -87,7 +87,7 @@ static attr_t
>  	attribute_address_space, attribute_context,
>  	attribute_designated_init,
>  	attribute_transparent_union, ignore_attribute,
> -	attribute_mode, attribute_force;
> +	attribute_mode, attribute_force, attribute_format;

I prefer that you simply insert for the attribute without touvhing the
others one:
	+ invalid_printf_format_args,

>  typedef struct symbol *to_mode_t(struct symbol *);
>  
> @@ -136,6 +136,11 @@ static void asm_modifier_inline(struct token *token, unsigned long *mods)
>  	asm_modifier(token, mods, MOD_INLINE);
>  }
>  
> +/* the types of printf style formatting from __attribute__((format)) */
> +enum {
> +	FmtPrintf = 0, FmtScanf,
> +};

Please change this to:
	FORMAT_PRINTF,
	FORMAT_SCANF,

> @@ -1172,6 +1195,59 @@ static struct token *attribute_address_space(struct token *token, struct symbol
>  	return token;
>  }
>  
> +static int invalid_printf_format_args(long long start, long long at)
> +{
> +	return start < 0 || at < 0 || (start == at && start > 0) ||
> +		(start == 0 && at == 0);
> +}

The name suggest it is only used for printf format but the code below
uses it for all formats, please rename it.
I would prefer to have the reverse logics, check if the format is valid
and to have a simpler check, something like:
	static bool validate_attribute_format(...)
	{
		return (start > 1) && ((at > start) || at == 0);
	}
but since more validations are done after, I think it's best to simply
not use this helper and directly doing the checks and emitting the
approriate warning messages when needed ("index smaller than 1", ...).

> +static struct token *attribute_format(struct token *token, struct symbol *attr, struct decl_state *ctx)
> +{
...

> +			ctx->ctype.printf_va_start = start;
> +			ctx->ctype.printf_msg = at;

GCC's manpage call them 'string-index' & 'first-to-check'. Best to keep things
coherent and use the same names everywhere, for example 'index' & first' ?

> diff --git a/symbol.h b/symbol.h
> index ac43b31..7bb6f29 100644
> --- a/symbol.h
> +++ b/symbol.h
> @@ -103,6 +104,7 @@ struct ctype {
>  	struct context_list *contexts;
>  	struct ident *as;
>  	struct symbol *base_type;
> +	unsigned short printf_va_start, printf_msg;

What about something like:
+	struct {
+		unsigned short index;
+		unsigned short first;
+	} format;

Also the validation should check that these are not bigger than
USHORT_MAX.

-- Luc

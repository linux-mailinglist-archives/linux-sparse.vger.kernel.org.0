Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDB1DE053
	for <lists+linux-sparse@lfdr.de>; Sun, 20 Oct 2019 22:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbfJTUH5 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 20 Oct 2019 16:07:57 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55615 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfJTUH5 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 20 Oct 2019 16:07:57 -0400
Received: by mail-wm1-f65.google.com with SMTP id g24so1801367wmh.5
        for <linux-sparse@vger.kernel.org>; Sun, 20 Oct 2019 13:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IK/Dq0zXOoUMdcI/XL8admfYvclGulXwcEH4q/HREeY=;
        b=supj79d3jw5ioq3PSG73/RiPdSNhf8VjO3bbO3q+UI7xdlvzpDF+M1igiF6FxQYjVn
         z6cnXPiLqwP6jfH1RW4cwABkUJWUbeZ4CmXGn3Ue+j+61sSDcvybO48kw4S6iKIZ5imZ
         77sLmXVpNWZbQuZUlkG7Grf0HpvSq0rLyTEHT+OR1fV9YjMJ+cWpVpyddA++3IJVrOI/
         LrS+oLV9+RbPLe2H5h3jxZ3NAObsjtdl4qWc9UBO4QpJ1hk947fD/9iRMus7WpaXlx//
         OR4vPsXQ8oz8DtnyJxHWnU3oy/0KrLVdiOEIN2GU8L1hHg2DbqCDVIrpDIgCTZ10j/ul
         xyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IK/Dq0zXOoUMdcI/XL8admfYvclGulXwcEH4q/HREeY=;
        b=L4IA+v9KVD8N2AfRlkPuWhGj10vUjckuqG8Kz7XCHCsnW2CJBAWjIN9cx5WHrAI/qm
         YesqXJNWlwbiXxTzbskup/xclARK7vACTYzXv66fyCEI0PpBu5tpw0f2MbqH0Qs5Ga0a
         ms3OmsTmCIwbvcmOcwTVCwW16wR8olqaZGuw7zV/nkFVZEvCkW5PwOdUKhmhTqUEywgJ
         kyFsvxWlvN19mrCTdtNo8ghTLBF7R++zA0xQNtVOp/UOVVUf3uz/M32eVyRxS4BLS2nq
         yJ7OQT6B2mxw/Ft0q0Qznr5GTFKLduWy2YN9je8GeybLqQz0J98v4LFO58QhQkquSs04
         wvuQ==
X-Gm-Message-State: APjAAAXritcWk7eKdOy2GVS+28ValrZGthB5nOx+WqcmoFnbgQ7dgUUb
        MxLMdYyl+ToyqMSk1o0yGIIbeeSD
X-Google-Smtp-Source: APXvYqxcnW0AavH16hf206JurSlHjbAyZeladptr39OMf59nmI4IeLqTBpbHxPF6Fj1FWS99v1798A==
X-Received: by 2002:a1c:67d7:: with SMTP id b206mr5340209wmc.68.1571602076281;
        Sun, 20 Oct 2019 13:07:56 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:90a6:dd03:1e7:4457])
        by smtp.gmail.com with ESMTPSA id s13sm11477927wmc.28.2019.10.20.13.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 13:07:55 -0700 (PDT)
Date:   Sun, 20 Oct 2019 22:07:54 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191020200753.h7d3ixqdc6nxjpqs@desk.local>
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
> +static struct format_type *parse_printf_get_fmt(struct format_type *type, const char *msg, const char **msgout)
> +{

...

> +	} else if (*ptr == 'p') {
> +		ptr++;
> +		type->test = printf_fmt_print_pointer;
> +		//todo - check if there's anything after these?
> +		if (*ptr == 'x' || *ptr == 'X') {
> +			ptr++;
> +		} else if (isalpha(*ptr)) {
> +			// probably sxomething that /is/ being de-referenced
> +			ptr++;
> +			type->test = printf_fmt_pointer;
> +		}

This needs an explanation for the isalpha() and why x/X is special cased.

> +	} else if (*ptr == 'z') {
> +		ptr++;
> +		if (*ptr == 'd') {
> +			ptr++;
> +			type->test = printf_fmt_numtype;
> +			type->data = &long_ctype;
> +		} else if (*ptr == 'u' || *ptr == 'x') {
> +			ptr++;
> +			type->test = printf_fmt_numtype;
> +			type->data = &ulong_ctype;

These should use size_t_ctype & ssize_t_type.
They also work with 'i', 'o' & 'X'.

> +		} else if (is_float_spec(*ptr)) {
> +			type->test = printf_fmt_numtype;
> +			type->data = &double_ctype;

if (szmod == 1) type->data = &ldouble_ctype;

-- Luc

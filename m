Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB8BDE0CF
	for <lists+linux-sparse@lfdr.de>; Mon, 21 Oct 2019 00:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbfJTWBf (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 20 Oct 2019 18:01:35 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36797 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfJTWBf (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 20 Oct 2019 18:01:35 -0400
Received: by mail-wr1-f66.google.com with SMTP id w18so11079574wrt.3
        for <linux-sparse@vger.kernel.org>; Sun, 20 Oct 2019 15:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5W9n9xTGp/BGvjdxIzVL7M+KiMCNWaY6D4ZJ/MOfqDg=;
        b=iBbXuNFXL9/Ll5KSgfEavtBW9c35aeBQALngI3sbsuyi/vCDVACZLi/90v+vxeUHGb
         4TyFpMjpV4OnVW/vl6b3nOZb+DVmszm0YXpDDwJbDJ1z9Z55s3OjQcdeO/pka83n13HZ
         UL60pBp+NGPHjB+CkaJNr7iUuus7uKRA88epDaLT3nGvk/agLLonj8gANQLT+EJ89Hxa
         ptj+lWDaQJmaeG142wu2BeAF/NkuQnMUrazVNrWtNbIUtjU126ewDu8yZIXFAliyMfOQ
         7bZGgpoHsxPaiKyLRNb2iTW6GoQ1M8kXYXYh/psoQE7uejfETwaHSQlxsposEYWN6WLH
         PBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5W9n9xTGp/BGvjdxIzVL7M+KiMCNWaY6D4ZJ/MOfqDg=;
        b=AWt0TmCjOSaOENxSavfxLtr/JVGuElhrogd+ITBSFmS0BUMDt5KFFieXfHi+r+LtMP
         q8UsOj5o4jYWzxhjqPRC+5JTZ27WZX6t7jSp69UnTHDnUWJZvZDWqekaREk9j5S/L408
         Nmdva8ckYuLFvXLDKR2ij6HXTJzBaqXTWIgq0XZ/t5lMsgW86hAYZPYoVhv0hX1OwD1j
         pMtJ50iHLWFfkbPo6UJf1md+UFw9yIAGlggO9ZMDZs0lBLGfWXU0+W7Pxdoa44k8NiSl
         iGKPSfMIpCm3InzQUwA+Ru+tzzM54pQksUdTuOs16f1ZDfUW4hN76RdUOAvH5OW71BF2
         h91g==
X-Gm-Message-State: APjAAAWvMtqraez3RtK7zSGUAfPZ80QHLGA1gybuTSFsFpAKBhCx19Me
        WfuEepGAoHvstmMU9Ro5tszLXClv
X-Google-Smtp-Source: APXvYqzWJiM44vzxWc/0spl2bTvAViSVsKfNi8CJxVi7ic2rRoI9MhMChV+Lf4z6Zp8f1USgqwjang==
X-Received: by 2002:adf:fb0b:: with SMTP id c11mr17505818wrr.50.1571608892836;
        Sun, 20 Oct 2019 15:01:32 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:5df3:424f:b9d0:a574])
        by smtp.gmail.com with ESMTPSA id l22sm5760549wrb.45.2019.10.20.15.01.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 20 Oct 2019 15:01:31 -0700 (PDT)
Date:   Mon, 21 Oct 2019 00:01:30 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191020220129.pr4edy5t64rizqyw@ltop.local>
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
> +static void evaluate_format_printf(const char *fmt_string, struct symbol *fn, struct expression_list *head)
> +{
> +	struct format_state state = { };
> +	struct expression *expr;
> +
> +	expr = get_expression_n(head, fn->ctype.printf_msg-1);
> +	if (!expr)
> +		return;
> +
> +	state.expr = expr;
> +	state.va_start = fn->ctype.printf_va_start;
> +	state.arg_index = fn->ctype.printf_va_start;
> +
> +	if (!fmt_string) {
> +		warning(expr->pos, "not a format string?");
> +	} else {
> +		const char *string = fmt_string;
> +		int fail = 0;
> +
> +		for (; string[0] != '\0'; string++) {
> +			if (string[0] != '%')
> +				continue;
> +			if (parse_format_printf(&string, &state, head) < 0)
> +				fail++;
> +			string--;

This last statement is wrong, it just needs to be removed.

-- Luc

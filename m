Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC06DDF8A
	for <lists+linux-sparse@lfdr.de>; Sun, 20 Oct 2019 18:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfJTQku (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 20 Oct 2019 12:40:50 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35038 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726485AbfJTQku (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 20 Oct 2019 12:40:50 -0400
Received: by mail-wm1-f65.google.com with SMTP id 14so3755923wmu.0
        for <linux-sparse@vger.kernel.org>; Sun, 20 Oct 2019 09:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=g+ZhpRC9GJpeZTZOGpxeuoCQ++prrwUYwmAw5CQwwQs=;
        b=W8EfQzONpQEOB/ZSzyxnDqBl3i4KNomZZBS7kgFnWL7IRI6XZPtqLgwCgFTno9HXSV
         awdwhAgzbhpfQF/NYRLvpOA4rSILN3ff5PWU5U1l0FjXPa7iKjD7Opc86LTgZYnBiePe
         yAMgm93SkGzZr//l8Hvs6GCNTfygrDFaVUXg1kc2zup8SavArRY1togxHzAtobvM88LB
         xlrsWVh6yKU2N13GjnttinWyLmQ6pwPk2llnJDne5nazNDvztp/EZKUxGl20aSzBiqVC
         43HR7Hzx2gaWyGFY+qYm4XSrbV9rPHrddWOTdDbOvKZKjrxHvIO93PPamXtwAuu//T8g
         YA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=g+ZhpRC9GJpeZTZOGpxeuoCQ++prrwUYwmAw5CQwwQs=;
        b=aiiHt0fUbYCoWN1xVjmetTfent+JW0kzZnJJnw0iqo1l334k1IGbV+xodw0uu5Ie7Q
         j5Xr/+Xwxs3+Ab9yi39fI5CaLTo1JaDS1oEesQ/f3UA3QlNljqh7Mqm80z26tUM6RbtG
         dU+hO/cclpFrb034VXqG0y29YeA8wgZaQZPU/wfffGPnbBqLeqYsFQfphNjP21ofTmvf
         PsJ8c9dKdAIBfrFQ4eUmkodqn2z4+7/saUHfHaOL2Lw6ELoLfxbDFyGjvvPKUY/mTCK2
         uPI2WAt11NdrqoKlV8y05CLj1+Pgne4j6SKFpNEG02vOc2ACwEOYFy53SP59jfymdbmw
         IxVg==
X-Gm-Message-State: APjAAAXDVQXnFGO1KJoSf3eKwJFiSP5ulUtWg5PonXziad5RlK8IxvtZ
        vvV3HpAMlXeueUFxNwmMUom5h4k/
X-Google-Smtp-Source: APXvYqwgW6vOM+LXVsfiq+s5lnsrIpRfxgqRJlxv6nRQDvxR9ppeJnML82WpB/asgaOpl5qKHzLTvA==
X-Received: by 2002:a1c:208e:: with SMTP id g136mr10798867wmg.107.1571589648660;
        Sun, 20 Oct 2019 09:40:48 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:90a6:dd03:1e7:4457])
        by smtp.gmail.com with ESMTPSA id l7sm2654949wro.17.2019.10.20.09.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 09:40:47 -0700 (PDT)
Date:   Sun, 20 Oct 2019 18:40:46 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191020164046.klhcn7uz2sr6syhy@desk.local>
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
> +static int printf_fmt_string(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
> +{
> +	*target = &string_ctype;

This should be const_string_ctype and a test should be added for "%s"
with a non-const char pointer/array.

> +static int printf_fmt_pointer(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
> +{
> +	*target = &ptr_ctype;

Same here with const_ptr_ctype (but I've not tested it).

> +static int printf_fmt_print_pointer(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
> +{
> +	int ret;
> +	*target = &ptr_ctype;

Same here.

-- Luc

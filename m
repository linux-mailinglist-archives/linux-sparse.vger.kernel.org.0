Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC503159E2F
	for <lists+linux-sparse@lfdr.de>; Wed, 12 Feb 2020 01:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgBLAli (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 11 Feb 2020 19:41:38 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43766 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728057AbgBLAlh (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 11 Feb 2020 19:41:37 -0500
Received: by mail-wr1-f66.google.com with SMTP id r11so60646wrq.10
        for <linux-sparse@vger.kernel.org>; Tue, 11 Feb 2020 16:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OfwYrfVNogvS0Sr0A0HDZuUBB66L1y00K2trW1fPHKc=;
        b=duDSIdIjD3ut8/Qr9KO975mPbCwIijEW/CboIhUvStD4j1g3GymMDCctsN8hsPIBMt
         d18xFhiTMKoGfenUO5tXkgbw5Atyr3eZ3mAC5RvlpSk+vwMpxmqpU2X77VPGurqDVCby
         Mdf4Mdm2MTbZRgmtEWPLoOxkiiJCr2fPt1Aa/9fRZldgYOhmTGQzb2RqSzGOqvE+2+kf
         MXueb1g02W8FOF/SckvQs5DZmEUSJHs9l2WL9u4ZtLZyUDHJ+AuH/OBA3zty+lJ2YgeW
         KngBWzHjowV/SBGbXOJUszM+LIwlCqx/w52TuhTIum5mrUoelnBNf/8NEblk3h4wUPAW
         I7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OfwYrfVNogvS0Sr0A0HDZuUBB66L1y00K2trW1fPHKc=;
        b=H/fuZVduXt62QxdZaV2HYRu6rUpZbQ1U9QMcH71U+Iq9B8zy8aY5lHRvlwXOX1PvFD
         syezA3Dvbkc3nbjKmwPyCtMrGg+4GIULNccRaNYTpDunP+SZEg5Ok5k0g6XycZ5P1wzq
         NNDWtdp8dXQBXLLQiMVnHjT/i6LkzfX7fb7Vu/5mKbVMpqg/ws60HAGPa4tSmfYfWS6d
         OER+j2AGWGuraRG+MFoAWbaBNe69kzeeO0QFuFfg+HtoGMs887LGIZ/aV4dxKN5SQT4L
         SaQNSxC4gspgwMh4Mv53zcA7NdnRYGP73Htibt+G/bP6vqgVADmehlIE94OETouXB1up
         gv4w==
X-Gm-Message-State: APjAAAWktfIrd8zIh4bF9mgA+RqVR9YNzR8zQt33IskaIMni170TH5VO
        AgaZdr7E/0V8XE5m7giiI54K4mSt1Ok=
X-Google-Smtp-Source: APXvYqwHETC8ZfrdPS8ZgslMnDHi8rbEy6jxp6zcg7puakmx4MmA8waw9WTkZSWTTUVfbkqOnzng1Q==
X-Received: by 2002:a5d:4a0f:: with SMTP id m15mr11541756wrq.415.1581468096500;
        Tue, 11 Feb 2020 16:41:36 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:5f6:4f42:5a99:8d6c])
        by smtp.gmail.com with ESMTPSA id h13sm8545248wrw.54.2020.02.11.16.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2020 16:41:35 -0800 (PST)
Date:   Wed, 12 Feb 2020 01:41:35 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] dissect: introduce sym_is_local() for reporter
Message-ID: <20200212004135.cyzcqtwwcuewa4gj@ltop.local>
References: <20200211160136.GA14027@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211160136.GA14027@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Feb 11, 2020 at 05:01:36PM +0100, Oleg Nesterov wrote:
> Can be used to filter out the usage of local variables.

...
 
> diff --git a/dissect.h b/dissect.h
> index efe2c0b..178dba5 100644
> --- a/dissect.h
> +++ b/dissect.h
> @@ -27,6 +27,11 @@ struct reporter
>  
>  extern struct symbol *dissect_ctx;
>  
> +static inline bool sym_is_local(struct symbol *sym)
> +{
> +	return sym->kind == 'v' && !(sym->ctype.modifiers & MOD_TOPLEVEL);
> +}
> +

Shouldn't MOD_STATIC be added to the test?
It depends on what exactly you want for 'local'.

-- Luc

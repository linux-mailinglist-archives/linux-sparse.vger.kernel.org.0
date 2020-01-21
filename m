Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF8C41434AF
	for <lists+linux-sparse@lfdr.de>; Tue, 21 Jan 2020 01:13:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgAUAN1 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 20 Jan 2020 19:13:27 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39186 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgAUAN1 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 20 Jan 2020 19:13:27 -0500
Received: by mail-wm1-f68.google.com with SMTP id 20so1165896wmj.4
        for <linux-sparse@vger.kernel.org>; Mon, 20 Jan 2020 16:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/cssa8WprNG5gYuGF0hl9dsTL34AFtiBImQT/TUXxX4=;
        b=If6+KxeTEoKh1GAimSdU/hkZSNq5QhxF3NGmiyyCMuOCpHFryn3XVUUql60iyR9ptq
         HjrFRkbEIMGmJ3mq0+9Evrobd8LEyg0V7+SpbkYL3wCidR5Yct7za7MOh57ajBrNUmCb
         It23QLHbxRvZXl6kLLm5UyB0NX7hOcxK3TW4Sr2YLtp57xnNiE1YR7aLCBTfP9+BHDqM
         SCsjyGzbh9jtn8ECt2aRCZCkAnCnbb39FxVyhT0eKqK508ieelXfi6SOWk6tOLfe9Ssz
         VXmuxew4J/cmt7VLdjHCj2gIaAGCrkIwC8ZpdT8HWkUI4jwVEqoWg6oTNRShiK3YxQFf
         5jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/cssa8WprNG5gYuGF0hl9dsTL34AFtiBImQT/TUXxX4=;
        b=eIg2arDw9/2s1hjFaHm+/aRLjqWjnANHYH35Z3uROnSd6Mt80y6EDLXmKKuSSvZbk5
         LqNR3PG+dO2MuJpE8RuTQfhuGf2irjjdLQ58JQS2VW7HamvqiR140fC2fgfGaGrki3HX
         eO8FLX3W/xWXfQzwjda5MpP49wa6U/IHFlXvlyQSwLpkJr6NqPUnUpJBE+LaAQ4M9gCv
         gkoBYcwmmGz27lyaEw6t5T68kdjQsBUWoun5RrnLNpahs54ug2QZrgDvxt5pyx3QdVFm
         H0uZLNrV9hVnk0EhK3/iOcAmadcejUh5GQ4HlH1PgZYuV1UwoQ1lwtw8rStYy7S5iHTN
         XPfw==
X-Gm-Message-State: APjAAAVdD4gbkAQ449KiS5iuDaFORBBzN9kB37ywgWRl/ya7kjez+XfI
        VZKgFZ2dzC6Ouy3YB8FIL9w=
X-Google-Smtp-Source: APXvYqxZUMEhgJgClOawSm/GRl4x+EVAnEz140YESDgNiFxXgYt7cqZhtMBcWGzJvjSqfMX37OAH0A==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr1324411wmj.117.1579565605212;
        Mon, 20 Jan 2020 16:13:25 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:116f:82b4:24e4:426c])
        by smtp.gmail.com with ESMTPSA id d8sm50905860wre.13.2020.01.20.16.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 16:13:24 -0800 (PST)
Date:   Tue, 21 Jan 2020 01:13:22 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     john.levon@joyent.com
Cc:     linux-sparse@vger.kernel.org, Toomas Soome <tsoome@me.com>
Subject: Re: [PATCH] correct sparcv9 defines
Message-ID: <20200121001322.zikj2xsacqt765fi@ltop.local>
References: <20200120103824.20746-1-john.levon@joyent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200120103824.20746-1-john.levon@joyent.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Jan 20, 2020 at 02:38:24AM -0800, john.levon@joyent.com wrote:
> From: Toomas Soome <tsoome@me.com>
> 
> The SPARCV9 compile check needs to look for __sparcv9 on some systems,
> and should also define "sparc".

Hi.

Thanks for the patch.
Is it possible to have Toomas' Signed-off-by for this patch?
No need to resend the patch, just a reply to this email
saying it's OK is enough.

>  	case MACH_SPARC32:
>  		predefine("__sparc__", 1, "1");
>  		predefine("__sparc", 1, "1");
> +		predefine("sparc", 1, "1");

I'm wondering if there is a real need for this one or if
it's just to reflect what GCC do? I'm a bit reluctant to
add it since it lies in the user's namespace. But I'm fine
to add it if there is a real use case for it (in which case
I'll just slightly change the patch to not predefine it if
one of the ISO dialect is selected (via --std=c99, ...)).

-- Luc

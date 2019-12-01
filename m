Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE0210E36D
	for <lists+linux-sparse@lfdr.de>; Sun,  1 Dec 2019 21:20:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfLAUUL (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 1 Dec 2019 15:20:11 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35663 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfLAUUL (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 1 Dec 2019 15:20:11 -0500
Received: by mail-wm1-f66.google.com with SMTP id u8so5261476wmu.0
        for <linux-sparse@vger.kernel.org>; Sun, 01 Dec 2019 12:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hrKtvqumTVtcgLlV0h6Fj8/f6eNQZYjlfNCtIGoXfkc=;
        b=KSh8AIflZZ3gbaxZHKGMJ4utoegoQYD0jDnV2TB+bcGIAdMPfKAc2WJmdwLMUiT0qE
         Qu/bet+gMH5QD/NiabPed72H/pEteuzuP12F3xE6tOE9JTk5Xf5DZYFJqTxa2SfOPyUN
         3zb734W4NBbIaRovlR6aF2eIRcUffdpM45kdXWclZ1BvlMlPBIbtODrfgoSQAAFe0FV2
         jH42O4n6p3u5vTHgT+8a+vmJp8H8x/zkzCs24sQhF+RSr+Rft0uMBuLBfiAsE0B52mSo
         slL/BIDTIzFFaFxxTigbRfwK43+zmgePj8s6juYTt843aK0AIKgylnJCgoyzp2tgHwMy
         Krsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hrKtvqumTVtcgLlV0h6Fj8/f6eNQZYjlfNCtIGoXfkc=;
        b=VI0KLE0ZcLGYfSc0O8yA+P7OklQ/L5zUVD+MY0lXQ3fZMLTnI+nUB0KHNLUoSQ+sZl
         rHhhbABjmdTVT5EzoGBvY+a9puYUyCr9gTnPdYZOFy8LGSXEXIPywnrZjpYUrEC6ib4E
         wwybNkqPR/SORWfGXt1Je/+ldz+5ZLlgrdR00B99MuqmLfdqLh9V4Qi0Kh3yBZoITCyY
         eVju6N6LhtWYD4Vxz2zbXIdVgEH5wQMNmatwqO36oKtCuUmx8ExGVoqy3gb9c88EEYFs
         /89OMgg9q2VOWqNO86gvLigHxDEeAXIa+BItmHher6pSBzE94xF2ibOVmf4HdYWHTNVI
         9uzw==
X-Gm-Message-State: APjAAAUZN7Op12ueWt5lsphqB7TP+OSjX7BqWyRMDMxSbE1/Q3WpNZqF
        Mjp5Fd/1gajsVQVonHmEUt5MvAD0
X-Google-Smtp-Source: APXvYqzdetU2UzafUFDUa/FMGGZzyrlzQWcZQ2mQbNlH7qtqoh6CH1eW4LHWNA6dDKCtol0D5TdvAg==
X-Received: by 2002:a7b:c449:: with SMTP id l9mr12665250wmi.150.1575231609269;
        Sun, 01 Dec 2019 12:20:09 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:319e:42d8:5e4b:7244])
        by smtp.gmail.com with ESMTPSA id h8sm20562739wrx.63.2019.12.01.12.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 12:20:08 -0800 (PST)
Date:   Sun, 1 Dec 2019 21:20:07 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 7/7] teach sparse about C17
Message-ID: <20191201202007.avbhx6cpt6o4c223@ltop.local>
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
 <20191128204225.7002-8-luc.vanoostenryck@gmail.com>
 <0d75af25-61b7-faee-fd36-eb7b1e3fa5e4@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d75af25-61b7-faee-fd36-eb7b1e3fa5e4@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Dec 01, 2019 at 04:25:30PM +0000, Ramsay Jones wrote:
> On 28/11/2019 20:42, Luc Van Oostenryck wrote:
> > No real support is done here (or is needed) but the __STDC_VERSION__
> > will return the correct value.
> > 
> > Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> > ---
> >  lib.c | 13 +++++++++++++
> >  lib.h |  2 ++
> >  2 files changed, 15 insertions(+)
> > 
> > diff --git a/lib.c b/lib.c
> > index 7f7ca846b..8fddae450 100644
> > --- a/lib.c
> > +++ b/lib.c
> > @@ -1079,6 +1079,15 @@ static char **handle_switch_s(const char *arg, char **next)
> >  		else if (!strcmp(arg, "gnu11"))
> >  			standard = STANDARD_GNU11;
> >  
> > +		else if (!strcmp(arg, "c17") ||
> > +			 !strcmp(arg, "c18") ||
> > +			 !strcmp(arg, "iso9899:2017") ||
> > +			 !strcmp(arg, "iso9899:2018"))
> > +			standard = STANDARD_C17;
> > +		else if (!strcmp(arg, "gnu17") ||
> > +			 !strcmp(arg, "gnu18"))
> > +			standard = STANDARD_GNU17;
> > +
> 
> Yes, I knew about C17, but out of nowhere I started hearing
> about C18! ;-) As far as I can tell, this is just C17, but
> because it crept into 2018 before final approval, come people
> are starting to call it C18. However, the __STDC_VERSION__
> value is still 201710L, right?

Yes, exactly. It's essentially a 'bug-fix' only version, so
nothing new and nothing controversial and so there is very few
reasons to talk about it. I think that the final approval vote
was still in 2017 but it was only published months later, in 2018. 
I think it's better known as C18 but I tend to call it C17 because
of the __STDC_VERSION__.

Best regards,
-- Luc

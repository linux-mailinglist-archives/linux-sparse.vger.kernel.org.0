Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55E66104246
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 18:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbfKTRlF (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 Nov 2019 12:41:05 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40691 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbfKTRlF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 Nov 2019 12:41:05 -0500
Received: by mail-wr1-f68.google.com with SMTP id q15so843701wrw.7
        for <linux-sparse@vger.kernel.org>; Wed, 20 Nov 2019 09:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oUAB609+h+wOZUnvfqTlUYPmPcKloR2Hd8rKtKyypRE=;
        b=NrpVmOLREKjfWXBOg7wCXIJXa4ZFOfmeFQ5HJ1SWrehrBB7DR4UyV0p/0xJ0mwOat7
         JlO+MQfPt9jzpVOvI6eitJIESkht8djMNoWrB1MVspGiXLkxURh7Ug2uS4CGlppRDQ6x
         Nk34j9+oJ04CtNVo7fgLmol7AndiZOCAtrTE2r65Xy6rxK3OT5CIrrVqRFcGzT1DhvjE
         W9K60d3dkoMBO0+uXZnD1rtl727GE9wig74utJlSbKL81r003nUxcdbvSchvlWaJjxr7
         DRxVQw9clTJWR4ne7cVPnKT9adI0dw/YuWZ/vjACrnR7uyz/buUfI9xG/COwPv19pumx
         L13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oUAB609+h+wOZUnvfqTlUYPmPcKloR2Hd8rKtKyypRE=;
        b=lzvLjDv6+NnbjyT6PekYtt1Pybl2d2IwXvFktU1yVKGX77d7lb4sIU/IEaWL5OMqtO
         6Yt52eogDxbyxrTDoqfB5s3thOGkqXto1A7/m9o3qWHHVvblGUPNXMqBhkWoZItkziCy
         vVb1k6UApR/tDaUnZ1eCLvmN2txKtGSKfjIKHQFz3ublQEzNwX9VU32K1Al/tlycb8JB
         ArxcMZ+cNluOstx+grYlBXHQlGnP83PXhq3bvOI4gY3z2MIfTsUjzkwBsYAnmPvu1yPj
         CucxAqrWFhhGS1OMB++B67D0Uvt8eoEM6gegL49AKnS50Dq9j1QyDfJ23K2J0gVMrr4h
         0+JA==
X-Gm-Message-State: APjAAAXdxy6spuCmyAiNk6d9EhGrz2YACevhvLwihpxI/5UniTGAo3l3
        jKjxogiR8d1P5EpKvC9f8ag9opCD
X-Google-Smtp-Source: APXvYqyNvq6KMtoviGEvBKmNhV3UyuPn7/+x9+ql8zY+SgQin0f8Tyk7tLL6imYX6H05dWXZJWTcsw==
X-Received: by 2002:a5d:4a10:: with SMTP id m16mr4671747wrq.294.1574271663786;
        Wed, 20 Nov 2019 09:41:03 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40e1:9900:950c:3e8e:b6df:1425])
        by smtp.gmail.com with ESMTPSA id n17sm30930747wrp.40.2019.11.20.09.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 09:41:03 -0800 (PST)
Date:   Wed, 20 Nov 2019 18:41:02 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 0/5] fix propagation of function attributes
Message-ID: <20191120174102.qdd3lhaouil62257@ltop.local>
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
 <0f224459-7c35-234e-72e3-8baf87742507@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f224459-7c35-234e-72e3-8baf87742507@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 20, 2019 at 02:00:52AM +0000, Ramsay Jones wrote:
> On 20/11/2019 00:02, Luc Van Oostenryck wrote:
> > Function attributes need to be propagated differently
> > than the usual specifiers: For example, in code like:
> > 	#define __noreturn __attribute__((noreturn))
> > 	__noreturn void foo(int a);
> > the __noreturn attribute should be applied to the function
> > type while a specifier like 'const' would be applied to its
> > return type. Also, when declaring the corresponding
> > function pointer or functionpointer pointer:
> > 	__noreturn void (*fptr)(int);
> > 	__noreturn void (**fptr)(int);
> > the attribute should also be applied to the function type,
> > not one of the pointer types.
> >  
> > This series fixes (hopefully) the previous attempt to solve
> > this problem. The main patch is #4, pacthes #2 & #3 are
> > kinda related preparatory patches and patch #5 is clearly
> > related but independent (and a bit discutable, so will
> > probably be omitted when pushed to kernel.org).
> > 
> > Many thanks to Ramsay Jones for noticing the problem!
> 
> Hi Luc,
> 
> It is somewhat late here, but I thought I should take a quick
> look at this before bed ...
> 
> I have applied this series on top of 'master' and run it over
> the git source and, as expected, the additional 8 warnings have
> gone. Thanks!

Thanks for confirming this and thank you for noticing the typos!

> (Also, I haven't tried cygwin, but because this
> fixes 'validation/function-redecl2.c', that long-standing warning
> will be fixed too! :-D ).

Ahhh, that's good to know. Thanks.

-- Luc 

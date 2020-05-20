Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9CFC1DB90D
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 18:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgETQNC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 May 2020 12:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETQNC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 May 2020 12:13:02 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCB7C061A0E
        for <linux-sparse@vger.kernel.org>; Wed, 20 May 2020 09:13:01 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id bs4so3650746edb.6
        for <linux-sparse@vger.kernel.org>; Wed, 20 May 2020 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0hrVDdROrst7TwL4mnbQ8Tc/dEMlP3A8Xb/RoBKku4Q=;
        b=GRCDK2FF4h7E/Hd1vC1p/1OyxmtHZNbC54yvmy7cFIkyu0w0dbt9ulsm3SpivgoVoG
         2k/5Bh7cvfUETyBCSq8qEYrtsyzLqrBh+7oWx8dnoDWvAd+594Wox8KEiQ7M1ZPZgfEG
         +XsKZUmPUXgm7z15FITF443A2u2iMdJGBX3RfhvuPTILzG0vwsve81KL4rYYcrHKmWDS
         sVNzJDhE8bo4b1AC4ZBLvRwvBtQbswrZ6px2Rjhf8rm3dcccr6KtkLv8MJ6GLZH7R6Ms
         L2l+HPLyUfuBPZLqCdQdz/e2tdx2Y3Y7SXAn4z2iZEZfspufHjbjmZlhrkC03Nu+uwCp
         jsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0hrVDdROrst7TwL4mnbQ8Tc/dEMlP3A8Xb/RoBKku4Q=;
        b=SiHku0+jxvTUjmxRpqCB25VjqzAR5dJGpcF/w4Lhhe+iwFqqKapaKWizbGBBH13W4n
         fHQboh1n8HuHAqvjnOfc+t3CTBQF5PNWn6k/sZ9CGUW23twySCQ6TckJnpg/hNOm27jM
         qaDcjcTUZTrVhZNAQvID+rHavljNGAggewYiwTImpnZWmzFFMdgXdIOclHCpqnYmzs5Y
         SneVQdueA1mKjOUfncmbppz4yVllTZ5tkkU0/pamIHl/6BlUG7pPY0htkpC+B/EoQ1zX
         jGYMBuFAMSUPKNBd2rc3cMgq/6gXTwI5wlstYcwL1N9amjqc4yewolnyJSdH73kUYzXB
         Ks3g==
X-Gm-Message-State: AOAM533lw0zT3gnw+SiBf1x/oRdA4wAnb4GjvD7FN46fGF2EMijYrhSz
        RiczsI+uiWCwKKPAChwRvI4ZJkfq
X-Google-Smtp-Source: ABdhPJy8kVZBX+At6JcJp1iRqzDel85bpBkBpDrJZm8yM5oy3mpavzf4saiFvRx6IJ7f2qcVfQFMgA==
X-Received: by 2002:aa7:ca13:: with SMTP id y19mr4019566eds.30.1589991180498;
        Wed, 20 May 2020 09:13:00 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:5522:715b:4ca2:a444])
        by smtp.gmail.com with ESMTPSA id nj6sm2249779ejb.99.2020.05.20.09.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 09:12:59 -0700 (PDT)
Date:   Wed, 20 May 2020 18:12:59 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH v1 01/28] misc: fix testcase typeof-safe
Message-ID: <20200520161259.u4raoc4bujauzu5y@ltop.local>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-2-luc.vanoostenryck@gmail.com>
 <422723ea-00aa-ee89-72aa-f4dddbd8da06@ramsayjones.plus.com>
 <2de08a4e-ce53-8694-da00-c2c90334da65@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2de08a4e-ce53-8694-da00-c2c90334da65@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, May 20, 2020 at 04:34:53PM +0100, Ramsay Jones wrote:
> On 20/05/2020 01:33, Ramsay Jones wrote:
> > On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> >> +	int __safe  var3 = obj;
> >> +	int *ptr4 = &obj;
> >> +	int *ptr4 = ptr;		// KO
> > 
> > ptr4 declared twice - and sparse didn't complain?

Yes, I was surprised by this too.
 
> Heh, I had a slightly different example in the test case
> for my '{0}' initializer patch (but involving different
> types as well).
> 
> I had a quick look at this and tried to use 'git-bisect' to
> isolate the change which broke this. However, I couldn't find
> a version of sparse that worked correctly! :D (I went all the
> way back to v0.4.2 before giving up - several tagged releases
> didn't even compile without some fix-ups, including v0.4.2).

Yes, it's quite annoying when bisecting, but well ...
 
> Just FYI, this was my test-case:
> 
>   $ cat -n test-dup-decl.c
>        1	#ifdef WORKS_OK
>        2	static int sobj;
>        3	static int *sptr4 = &sobj;
>        4	static int *sptr4 = 0;
>        5	#endif
>        6	
>        7	static void func(void)
>        8	{
>        9		int obj, *ptr;
>       10		int *ptr4 = &obj;
>       11		int *ptr4 = ptr;
>       12		int a;
>       13		float a;
>       14	}
>   $ 
> 
>   $ gcc -c test-dup-decl.c
>   test-dup-decl.c: In function ‘func’:
>   test-dup-decl.c:11:7: error: redefinition of ‘ptr4’
>     int *ptr4 = ptr;
>          ^~~~
>   test-dup-decl.c:10:7: note: previous definition of ‘ptr4’ was here
>     int *ptr4 = &obj;
>          ^~~~
>   test-dup-decl.c:13:8: error: conflicting types for ‘a’
>     float a;
>           ^
>   test-dup-decl.c:12:6: note: previous declaration of ‘a’ was here
>     int a;
>         ^
>   $ 
> 
>   $ ./sparse test-dup-decl.c
>   $ 

It seems that sparse detect the redefinition when the symbols are global
but not when they're local.

Thanks for noticing this.
-- Luc

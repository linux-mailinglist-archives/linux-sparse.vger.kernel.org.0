Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2363110DBF9
	for <lists+linux-sparse@lfdr.de>; Sat, 30 Nov 2019 02:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfK3BBw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 29 Nov 2019 20:01:52 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46616 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfK3BBw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 29 Nov 2019 20:01:52 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so33665818wrl.13
        for <linux-sparse@vger.kernel.org>; Fri, 29 Nov 2019 17:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MNWIkCL1tlTyQQr8DKpjrw9QabICPQV1Ntnif6XAq5E=;
        b=qi9CyTWxVQ3v0MAzlj80UX/gezfhpyEB+5H2WCgrdvEf+YdpnJzSYZR5hw7gm4UfNx
         y3mVIe/+vo808fmL5M4ahDKUGwLivAc5UTXaCDE10oQ8pmFvFMUM2lY+/fcL24M7mWYF
         7ML85tfS9yQMlu+S0CgV/b7EmGQSBRq7SDwA27x52Jp3RoEoErkHBpzewGARCMe8OFTF
         jn8r/a7Bm0fREIZowXaYtLDGIVwhUhRvMrCh9Vf9fLuZDCxVE0rdfDj4Y0Dv1ywQvzXm
         J4ODfFPh3fqkr/BYRphy6nSZq77aHmMGcviO5SrP+eBfISoCNoMMLP5CjzfmwvjSlFHC
         xXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MNWIkCL1tlTyQQr8DKpjrw9QabICPQV1Ntnif6XAq5E=;
        b=VtEUlYxkjgdc+u4yKox7+3socFpPQCDSuJXsd3cv47wGyR1IpZ/mnEbk1L71jTVdkF
         xe3DEOi4S+JEUFqNXiQYYrp4PohIYsDjguI/4nTqCTW+FyD57M/NBwDN+pwEY3j7IPo3
         H8w57xBmVqzJeqsOsXfSupV5uXeJTWQMMGNXSGXgbVmfsNjqnoOXmBXFKl/6Csear9vL
         Cnob3fvYeK4SZVoRDzgD5dTxAcDTS8MR0IS87WDpxItFktuC7j8tMRF95v3Yaowp+Mtv
         xTf2qSbgx5Lk9ELLS9NvQfsag08iMyVxVKkhvSir7plQrhxLbmOpOMoU3oge93p61Deq
         XjXA==
X-Gm-Message-State: APjAAAXK7m6Xg2tL46lE1R8+gwvVWiD1HxKgMwFRv/KNeG503KJqPsA6
        CVwRNG9qRTN1ZVx/uF+lEzY=
X-Google-Smtp-Source: APXvYqxIjOSDipX0SVtguABdeIhF0wNhIBtO+g+Re0YINILSUnAAsHMt4fjgahfNKrA2ulNvGAkppA==
X-Received: by 2002:adf:c611:: with SMTP id n17mr58910709wrg.317.1575075709941;
        Fri, 29 Nov 2019 17:01:49 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:cdc6:e155:f3db:f2f3])
        by smtp.gmail.com with ESMTPSA id v19sm31054645wrg.38.2019.11.29.17.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2019 17:01:49 -0800 (PST)
Date:   Sat, 30 Nov 2019 02:01:47 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 0/4] More arch specific fixes
Message-ID: <20191130010147.ru5q3nkvicz5l6n3@ltop.local>
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
 <2c56999a-3ee8-999a-be41-962ec8c8d70e@ramsayjones.plus.com>
 <20191127174845.uol5jdfdqpso6o3h@ltop.local>
 <37371468-5ffd-7021-ea50-35d23eef943c@ramsayjones.plus.com>
 <20191127210248.hcp3rvchzwxjpcx6@ltop.local>
 <547bd7d9-2844-1276-fce5-c406e9bcd529@ramsayjones.plus.com>
 <20191127233601.oplm2rnu2vewa2f5@ltop.local>
 <505fc93c-c1bf-5f78-3822-b993616a2f7d@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <505fc93c-c1bf-5f78-3822-b993616a2f7d@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Nov 29, 2019 at 01:50:23AM +0000, Ramsay Jones wrote:
> 
> The following <TYPE-WIDTH> macros were output by sparse, but
> not by gcc:
> 
> __INTMAX_WIDTH__
> __INTPTR_WIDTH__
> __INT_WIDTH__
> __LONG_WIDTH__
> __PTRDIFF_WIDTH__
> __SCHAR_WIDTH__
> __SHRT_WIDTH__
> __SIZE_WIDTH__
> __WCHAR_WIDTH__
> __WINT_WIDTH__
> 
> ... but I think this has more to do with the version of gcc on
> that system (Linux Mint 18.3, based on Ubuntu 16.04), which was
> version 5.4.0.

Yes, indeed. IIRC, these were introduce between GCC 7.2 & 7.3.
 
> Some of the missing macros included:
> i386
> __i686
> __i686__
> __pentiumpro
> __pentiumpro__
> 
> Again Just FYI.

Yes. I tend to think it's best to avoid 'i386' completely.
For the others, they depend on GCC's default and on '-mcpu=<CPU>'.
I feel it's more correct for sparse to not define them at all,
meaning 'only the generic i386 is supported'.

Thank you very much to checking all this.
-- Luc

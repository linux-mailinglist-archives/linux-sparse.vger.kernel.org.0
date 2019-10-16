Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95CA5D8F1C
	for <lists+linux-sparse@lfdr.de>; Wed, 16 Oct 2019 13:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392663AbfJPLQ0 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 16 Oct 2019 07:16:26 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46682 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390947AbfJPLQ0 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 16 Oct 2019 07:16:26 -0400
Received: by mail-wr1-f67.google.com with SMTP id o18so27518685wrv.13
        for <linux-sparse@vger.kernel.org>; Wed, 16 Oct 2019 04:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ifTvLtEfxcJac+Y8TLi23LJ1QJ5w8qUKL6xHuSUJO0g=;
        b=QRdAo6PU05W5iK8L+ae3lqse9+4tGW4EVRCjoplyxk0eitIrKquRvLDwYUiGLeRbfQ
         /cscLCD3+F0+fxxB7X9NuMYYcW1t0WVtc4DXl2BqzcfS/HB1sTlXFOHwNZVmTV1m7MvO
         exgI1+yqKylqn7gKW6bcITW3Iy7VPV2ALuOPiZGJUlpuUxtw1wUOb5bR1DLzTNjrK+LI
         tIA8BUpVtSElsfGSoyltQFExkJGNVsenqghte4x/7PdtMjkqS20igsffJkrFKRF0UYhM
         hmLOnsDF9shHGmzo2IqbAoO4fnDwiDu5RCoTzttRm2WkJB3PJXATuqBdTvW0IOcR9Ys7
         UZOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ifTvLtEfxcJac+Y8TLi23LJ1QJ5w8qUKL6xHuSUJO0g=;
        b=RvcxQjZ3KlMgTWUguov5tXLzMNbBrDXtN5T6nLZv0vcffz6heT+v9owpjclqdceS56
         C+2LHd/Tv9Tx1v2zDsIBmTntmkUdTXqCVQ7lqiGQkT9tZJskWbdXw2vof3eCwHLxF9sn
         7Kt18x5eFFN99WDzF4nNXUBWbdjS3GSkVdL5P+G7/iicX86vFRvzBskrWmM3+k1EgQkH
         2u7IQFn1jm7BNNBaN7Yeh7FDc4g/F832KulTfaJU07IG3rbxVvT3AZroTMyJTEhc+AHv
         J9+SLFQQulFqUm6tWfzSOxPW9bmOxIW5KZeCY7Qz+SGgVlkFViKi78/QSPhtyHEPERsK
         xLVw==
X-Gm-Message-State: APjAAAVJ6wwby9nEvfnqUew6Zb2t1Q63SYOimCTBblqk+M3KyR1XcmO2
        RKrGQKdkR+L6IAgeXD/4mxqagfE3
X-Google-Smtp-Source: APXvYqy1A/CBQKjZyMjgxXmHFqQkTPqMgV7Hqax5Ht9aQMIEqGXZs/NQAB422vIuhE96qTY02uDG1A==
X-Received: by 2002:a5d:6189:: with SMTP id j9mr2177804wru.21.1571224583909;
        Wed, 16 Oct 2019 04:16:23 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4080:1900:c562:e906:1949:a7b7])
        by smtp.gmail.com with ESMTPSA id o1sm1924983wmc.38.2019.10.16.04.16.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 04:16:23 -0700 (PDT)
Date:   Wed, 16 Oct 2019 13:16:22 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: Sparse v0.6.1
Message-ID: <20191016111621.xk4meiue4csflvkd@ltop.local>
References: <20191013234630.7uuszc5auri46h4y@desk.local>
 <88c22f42-37d6-ce5b-a8e8-cff597c91061@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88c22f42-37d6-ce5b-a8e8-cff597c91061@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Oct 14, 2019 at 01:45:06AM +0100, Ramsay Jones wrote:
> On 14/10/2019 00:46, Luc Van Oostenryck wrote:
> > Sparse v0.6.1 is now out.
> 
> Thanks!
> 
> > 
> > It's a small, 74 patches, release containing mainly small
> > fixes and improvements:
> > * improve build & test support for distros, mainly Debian
> > * stop warning on externally_visible functions without a prototype
> > * accept casts of __user/__iomem/... pointers to/from uintptr_t
> > * fix the underlying type of some enumeration values
> > * fix a build problem for sparse-llvm by using 'llvm-config --cppflags'
> > * conditionals (?:) may now be considered as constants if the condition is
> > * some error messages are now clearer or more coherent
> > * add missing expansion of compound literals
> > * improve parsing & checking of asm operands
> > * add missing expansion of asm operands
> > * expand some more builtins with constant operands (ffs, clz, ...)
> > * fix sparsec with recent version of cygwin
> 
> Just to confirm, cygwin passes the entire test-suite (also
> including selftest).

Ahhh, good to hear. Thank you.
 
> I have only had time to just do a shakedown test on 64-bit
> Linux and cygwin - but I don't expect any problems.

Me neither :) Thanks again.
-- Luc

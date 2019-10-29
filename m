Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F07EE911E
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 21:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbfJ2U40 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 29 Oct 2019 16:56:26 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40115 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbfJ2U40 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 29 Oct 2019 16:56:26 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so15176372wro.7
        for <linux-sparse@vger.kernel.org>; Tue, 29 Oct 2019 13:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JM5SA1VkcKL/0d2Pzwo3Jmh7qWPhcbElO5kxr+nVRco=;
        b=HPiaLOAaOvFon7KBL/X2VNgt9Mn4raqOaeNGIcJlONDE/WA/QNb/lvyO9sjDzACZ2E
         nfWuhTJmq3FeB2DmqaiwSQwA6mFLT+dtxhmZ+pPTwdSJynMqVNFU8bMsg8L7OzkeTimE
         ZjoAdhS4y/7kfZmGtbYZbYcIrkh3ROx26NCwGFLpb5BJDZorzxidpiRh3VFrAwqOM/PB
         XveKskzpgOqGu2SOBhKMkhwLCa2pV0oLM4C82YERRpgvEWhdF6WpIMSCnK+rhrWd/OYI
         RNCfHdmglrBFHOCzAVjTn5f2gzfxvCOQzqy81C2ylsB1QPN/bzKg2htgBqAk8ZYqrvAQ
         564g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JM5SA1VkcKL/0d2Pzwo3Jmh7qWPhcbElO5kxr+nVRco=;
        b=e8LJibqU6mRc+gwjuga5arb59eouSgzB4ySYeBVzSdxsBTPfxoMmobrCs0rrBG1WRA
         z4FkUdezyLejk38kAphvHMZjupWGRrYUU6oB4EMDbC6X8sO2ZTRlp7DTPinAFC8g5Fu8
         x89y7t8HXu9pe+uPi3AbXUQRvhWmX8SDWWT+5uO5BtD5RrKal+4ooMpXiZeNrY4PTTub
         bezwuHKpV9OTPh/MpqvsVHtPU4WBuEpRZFL7KNbMNd5hSmrZ/DxBcK1x0wA2g3ofs9eL
         lpD+SetqU84NQNBB9NXuS57s3LiDoozz6MWE+a+r96eRZMLm+LTSRS4jTYllFWtvoj4R
         mhrg==
X-Gm-Message-State: APjAAAXfMF8+k5FQ9kkOg0Aegkt5jTxPCGxBD8wfq+SseHR9rVZWwu5Q
        +S7XsbtCSpTKZRFDvJM8wUqfKiTM
X-Google-Smtp-Source: APXvYqwarkG9Oo/QBoR4LM6rYzkJHLfN0qh+QkyIPDmqI8uzLq+iRvV2O51YUIssUxZL0WrtJ9DN4A==
X-Received: by 2002:adf:e882:: with SMTP id d2mr22362195wrm.132.1572382584312;
        Tue, 29 Oct 2019 13:56:24 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:81ee:880:54a7:d771])
        by smtp.gmail.com with ESMTPSA id d11sm105079wrf.80.2019.10.29.13.56.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 13:56:23 -0700 (PDT)
Date:   Tue, 29 Oct 2019 21:56:22 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] options: allow to specify the desired arch with
 --arch=<arch>
Message-ID: <20191029205620.yu5k6ffrdzfcnost@ltop.local>
References: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
 <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
 <20191029092807.cvb7ipfexxfyr5nc@ltop.local>
 <6e698a41-040a-bc31-9eb6-c6b4fc09d954@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e698a41-040a-bc31-9eb6-c6b4fc09d954@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 29, 2019 at 07:05:13PM +0000, Ramsay Jones wrote:
> >>> +			if (bits == 0) {
> >>> +				// guess the size of the architecture
> >>> +				if (!strcmp(suf, "")) {
> >>> +					if (arch_m64 == ARCH_LP32)
> >>> +						bits = 32;
> >>> +					else
> >>> +						bits = 64;
> >>
> >> So, this is a 50-50 bet. ;-)
> > 
> > No, not really.
> > The -m32/-m64 flags are still taken in account, before the
> > --arch and after it too. If no -m32/-m64 is given at all
> > then the used size is the one of the native arch (because
> > arch_m64 is initialized so).
> 
> heh, yes, I just meant that (if -m32/-m64 has _not_ been given)
> then you have a 50/50 chance that you are cross-compiling to a
> system that has the same 'bit-ness' as your current platform.
> 
> (well, actually, I suppose both are likely to be 64-bit these
> days - so, maybe not 50/50! ;-) ).

Yes, I somehow agree. It would probably be better to make 'mips',
'ppc' & 'sparc' default to 32-bit since it's what uname seems to
do (for RISC-V uname returns 'riscv32' or 'riscv64'). For the
kernel, the plain name is always used but -m32/-m64 is awalys given,
so it's never a problem.

Thank you for your input.
-- Luc

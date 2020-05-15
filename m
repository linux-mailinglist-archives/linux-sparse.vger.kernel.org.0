Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D305E1D55B3
	for <lists+linux-sparse@lfdr.de>; Fri, 15 May 2020 18:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgEOQSI (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 15 May 2020 12:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726144AbgEOQSI (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 15 May 2020 12:18:08 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C538EC061A0C
        for <linux-sparse@vger.kernel.org>; Fri, 15 May 2020 09:18:07 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id l11so4272183wru.0
        for <linux-sparse@vger.kernel.org>; Fri, 15 May 2020 09:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HaNVRM1O+Rwdmc4EId2x5HIRYuuHBmlgTX6TI7Dwf+k=;
        b=IWbQ/NOsbtLV1S6iqQ9TYgoJAWu3zvrFnsggSiFwXmm6G6uWxv3WVQx3uma3IjXvbm
         LZbjszWaAO+HQ2YklkbAnggWUBHWMBElXBfLuYGgVmV+7LFsftIuIBAEfLDi/+z42Xqu
         rB8C16ENVURz3QJt0eWT0mm/JTHIkH6bvG+VVaEpaVwB11Hs2EDNyWGSWxoIA03VAFXz
         MTsBKI0fViAkPe2E1FBuOpJ7AtJoXiBHN9YOPux0eotqd6JXsqGui8mug81BwZwPLVzY
         GZpC+60TIHOhhzH7fcZR7L5WKyQQGWFHu4DF6drSspgTt+kOj/ZqZW/5Wn89gfn7cP2I
         qcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HaNVRM1O+Rwdmc4EId2x5HIRYuuHBmlgTX6TI7Dwf+k=;
        b=sabBwFJTGJiGnd8gA1L4G6hMErQD5Iuub5guiAdWjU2AuZ22X2s0RhjpOWVlsl4Dg0
         6TWhuLWuQCT7EWXUAPj9BVHZ4gLtgV7R5PS/BtCcpIxEAYPFuapp2FPH1KiXlXKIz3Z9
         Ts6ZYKD6plCd0nwEJujj8OIHg9b6FUtNz5a87b/MRMK49FsmyCqC+CJ3CQAuE4lBe3jS
         aRW6nza9X9qS0VQ481UVDy6PVgbhQNarTZV66rShbfH3rnn+gheQn7pea6KrahdwCRz1
         xzgHHmzDSETPBO7g9ZZIpCxd4lN3jCUd1mArS7n/V3ixxgYsLFlF+WobaYKMvVMzSjm9
         3JRg==
X-Gm-Message-State: AOAM531OzTxpWLLPGagWKV2i7qCagDT2R4sBBnqVz0NMOLG09A3l8l93
        9oGtd80bs0+tR68mQPCr9FenE1jv
X-Google-Smtp-Source: ABdhPJygZhl4cPkZVLC0mhnj1EikZ3RsJmhOhYq/P8sdNNeSUyIVKS0r+IXmb/sC+VDwxoV7IE7jMA==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr5016686wrx.36.1589559486635;
        Fri, 15 May 2020 09:18:06 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:2165:33bb:5acc:e0bf])
        by smtp.gmail.com with ESMTPSA id j16sm4202296wru.13.2020.05.15.09.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 09:18:05 -0700 (PDT)
Date:   Fri, 15 May 2020 18:18:05 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: complain about re-declared functions with different modifiers
Message-ID: <20200515161805.3xcxg3woquhbpspc@ltop.local>
References: <20200514140451.GD2078@kadam>
 <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
 <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
 <CAHk-=wh_1ycEjZGN+qFBP8==XPF-+wsiyJ0=-J5JSMDMxmo32g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wh_1ycEjZGN+qFBP8==XPF-+wsiyJ0=-J5JSMDMxmo32g@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, May 14, 2020 at 03:32:38PM -0700, Linus Torvalds wrote:
> 
> And gcc refuses to compile it with
> 
>    error: redefinition of ‘a’
> 
> which is admittedly very sane.
> 
> So I think sparse is in the wrong here, and we should consider both
> external and static symbols to be in the same scope and conflict with
> each other unless their declarations match.

Yes, I agree. I'll see what can be done for this.

-- Luc

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8653FC7BB
	for <lists+linux-sparse@lfdr.de>; Tue, 31 Aug 2021 14:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhHaM7q (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 31 Aug 2021 08:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbhHaM7q (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 31 Aug 2021 08:59:46 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA189C061575
        for <linux-sparse@vger.kernel.org>; Tue, 31 Aug 2021 05:58:50 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id t19so38450920ejr.8
        for <linux-sparse@vger.kernel.org>; Tue, 31 Aug 2021 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rCiH7AS3Hebqqf1WZoo0AzxvUGxkB0BqkIXnJewvhJs=;
        b=bLSJPIBTsWAWaNuMPYK6CBBgerXTs/EyCKyHzBwmkIf315m1vxNq37/utbp+u+inmP
         GuSdu4OoQm17gv9BQOG5x5a9UO8dJg7NKNdHVrNOO81gfoS0FOOuuHutiMd+O8TyF5xN
         7xuLbntyh6FI56QepRktrlTSb3EODfK/vn54iGJXC81TuelH19k7QtiFTTLESeqTAOZv
         BpNYBQcK27mTIzxYpE0d2myPm/wvXdd3WM/Rlidvt+VH3zoZfIwA/0MOrR7sxw3A1Qlt
         QmNyjre1SlmlNCARfBc+3n7dklNP9GuTyTXNH17onIZ1OBcgAgoB48e01F8ub3LBGWWR
         Z6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rCiH7AS3Hebqqf1WZoo0AzxvUGxkB0BqkIXnJewvhJs=;
        b=XWm330No0qKGv29cBKhEGJC/vrwSHiFZbTDK5OZVCRex0KJCU1ezUMPUePspGFoPGy
         3zp2Bn38UYBPrdCCfD9jkPbo4VR1SeNP4zW3LonAX6uTu1Vfol17pHrVjHesi7ipA57I
         LF1gksG6lyLX4et9kiNgrTtHRFadyzKXMEx3LVQztipLfNql+KVxG8oAZYRoOzOw0Mbr
         AFdD26A2mdBSj1kEowUFtzdQp7cV9L/HOCj3MPrksmderpHbMsLrdspGr0051eBvscKf
         tb5TJRz8bxyflKbjjGIKBF5g2LWN2vsYBoncrwiYeD2E5n/D4Z5BmSMkmUNqf+1OEUjQ
         n6tw==
X-Gm-Message-State: AOAM5337upHY54udcE0242Cs7t/UKXvg06yuv+f+M7cI0Fr6v/EUeWDS
        IkJRk4xXGfOe5a0RClUYXdg=
X-Google-Smtp-Source: ABdhPJwXGNfRuR6S8TyWlmxd5sozgRmcJxhxJRf+RJ/I407QJ9Ba5gJvYxr9+wvFhwyQJaY/i01s9w==
X-Received: by 2002:a17:906:444:: with SMTP id e4mr30713756eja.255.1630414729546;
        Tue, 31 Aug 2021 05:58:49 -0700 (PDT)
Received: from mail ([2a02:a03f:b7fe:f700:45f1:10b2:4f4:9c50])
        by smtp.gmail.com with ESMTPSA id d3sm8159960ejw.18.2021.08.31.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 05:58:49 -0700 (PDT)
Date:   Tue, 31 Aug 2021 14:58:48 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Jeff Layton <jlayton@kernel.org>
Cc:     linux-sparse@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck.ml@gmail.com>
Subject: Re: new sparse release?
Message-ID: <20210831125848.mqkudmaz4innkst4@mail>
References: <c7963e9e4c7d5b91fc8bee9c9ae9a9c893664e0b.camel@kernel.org>
 <20210726155045.fo6nh4lryln5sgxl@mail>
 <330ba271fdc21d5453702d4403be6f35b5e9dd76.camel@kernel.org>
 <72eec6322944bc2fc91e053565fb27ee4aaa203f.camel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72eec6322944bc2fc91e053565fb27ee4aaa203f.camel@kernel.org>
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

> Hi Luc,
> 
> Just checking back in. Were you still planning to do an -rc for 0.6.4?
> 
> Thanks,

Hi,

Sorry, I've had a few unplanned things to handle here.
I'll do a -rc1 this evening, when I'm back home and,
if everything is fine, as I hope it will, the release somewhere
between Friday & Saturday.

-- Luc

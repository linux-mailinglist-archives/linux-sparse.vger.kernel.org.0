Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE261DB9CF
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 18:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgETQjd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 May 2020 12:39:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbgETQjd (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 May 2020 12:39:33 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD5EC061A0E
        for <linux-sparse@vger.kernel.org>; Wed, 20 May 2020 09:39:33 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id yc10so4662363ejb.12
        for <linux-sparse@vger.kernel.org>; Wed, 20 May 2020 09:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ozzMO2GjVmlhkXiwbN5mPZb/OM5G3TVAsTRQKVnqNgY=;
        b=Wvmf8NhywPzyUjK1wmm6RFbc9Hryj793w21+EOhjugPwJ187ekG1eTr1zBqRsG2VeY
         EiAbJ4/D6uZYSH5fr5+oRsXmqO07iDiSU0tXuIhKwKYSTDR+0pJ1rUYVctlKn+0fdmLS
         xoprRgSg2T+quMMC4+tD2g6wYhRBQulgEpQkBUnCo07Xzqxo/U2RzXW3B1TLgkPgKKFp
         7XDuidkxZwgfZRwezL1ftch4/nRJD18a+aP/0fEBStBEaRyyqrWWKDlu7fqtt1uxJDMd
         vDG1NGStOZmWk4OE/5H5kVMkajkVBZbPbeYWdaj6DgCJC4OVkUyXiHdEDHsfIDD05CdD
         A31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ozzMO2GjVmlhkXiwbN5mPZb/OM5G3TVAsTRQKVnqNgY=;
        b=EoDkmuOWvNiMwt6RgDvSHZr/G9bgGrwO67fYe5lv0Oiw62w0B7tkf/TIprRsBjQWr0
         np8IpjEGB6pbk/b9/sDyfxTq7L7DPYig462Kx3ziCigDjQgfBS63QCYVhePiNUeIMQv6
         5W0jpDH71iQdC/YfMJG70HvTauxj/YrkOoHztsAB7CJ0ePbqaT0VPj9zjJoLGRUSipZr
         N+DdvFXgFoqTFXlLFyqg0tunoStLe+k0vv6RIu+4pYTC67X0zYlJJj8SPeK+cZET5G1t
         S59fMROA8b32hrbO7jGmHLSaBwW7gXRjNa7e8kC9+TvY01wYfeCpz51DKkQethVgw/xM
         7HRw==
X-Gm-Message-State: AOAM531dSR11SAG26aky9ELXlqmTwdpD7mn1UEcuCGsRXbaGYQeXnuS7
        GadNcIxxwvQ9vAdF1opQiE6nOotq
X-Google-Smtp-Source: ABdhPJzHoVMSAfO5ch5wRhb6NEYYLIjmpUvukAPjp2hi4W6oWXT2cyMVD04crCxb+68hONuTbEFVYA==
X-Received: by 2002:a17:906:bc55:: with SMTP id s21mr4331715ejv.21.1589992771980;
        Wed, 20 May 2020 09:39:31 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:5522:715b:4ca2:a444])
        by smtp.gmail.com with ESMTPSA id se2sm2332383ejb.42.2020.05.20.09.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 09:39:31 -0700 (PDT)
Date:   Wed, 20 May 2020 18:39:30 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 02/28] misc: s/fntype/rettype/
Message-ID: <20200520163930.3jfjgqhahupj5ill@ltop.local>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-3-luc.vanoostenryck@gmail.com>
 <0556fd1c-566d-3b3a-d760-418fecf115c0@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0556fd1c-566d-3b3a-d760-418fecf115c0@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, May 20, 2020 at 01:35:13AM +0100, Ramsay Jones wrote:
> On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> > So, rename the variable holding the return type to 'rettype'
> > and only use 'fntype' for the one hoding the full function type.
> 
> s/hoding/holding/

Thanks for this and the ones in the other patches.
-- Luc 

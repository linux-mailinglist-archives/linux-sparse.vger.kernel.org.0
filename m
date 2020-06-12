Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD061F7C12
	for <lists+linux-sparse@lfdr.de>; Fri, 12 Jun 2020 19:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgFLREv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 12 Jun 2020 13:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgFLREv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 12 Jun 2020 13:04:51 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F7CC03E96F
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 10:04:51 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id p18so6923626eds.7
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 10:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZeJUYDTL2Aii5RlZn4k6Vt/StHtO0//uznkLeONmIr4=;
        b=H19FftgNkdNP8zZzjM8vaqPdVXdxsNKA47wUmv3duV3/BzLT1SUoTKe1sdHRqf3j90
         fwMimxAmU5c782y4YJFQH6qjUEe16BT9Nu0Dn6ePruoW4TLS5h4Y7ELS2GCwKEYMv+VT
         APODXR7L9tvmyCIGT+GqvoYIdZAS/ysBspaKAew1B5JmVQKgJZ2P72p2iRLblGvgWbEK
         d/xM78Kj4qtK++0AixCeYmTN3YI+BWlrdGofaJo4huHSED+2SGRo7YzEGVxmZidDPJZm
         WcrTm1WrGyse3/eqIsPt4QcU4sXGrmOgzpze8C5FzwZsGnF311WGyXBSHqT0CXCs7HjF
         EwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZeJUYDTL2Aii5RlZn4k6Vt/StHtO0//uznkLeONmIr4=;
        b=ZnxNPytmajShubz2tqmgldqLgHbcoO4hs0HpP5bZDWEtrRTIkH5tvhNeFIw92YYorj
         mq7jNf1gMEbPS/G1UK6Ok8Ba2rAVUQYirGfhpXMRpuWBMIusDtBu6Dhd+Tq04tOx9n5J
         MgA+hwQRMEylOUZ+sG+BKgcKQjA6lpXORyolK37NZg3z5XlHc2s7P2q4Cp5ZdTX3duCB
         fVL06DPpCRQ4/jDbHxN7ssbgtrtcpYqYR2drMTJ2IZWCKdlpxaG4rWEaf3QbfTo7JqO9
         NSBcMfhmfji/O2Ez/poUnO4JZ+tjLS1qH490YReNCYA9OkyRritdIkLT54pZjJ5dkfaW
         KoIg==
X-Gm-Message-State: AOAM531mL3ZU7VMFdXtDBQItjXTbkiXVdH4JkbijQcJAobZFu0E1Inn3
        FyeBwEWUzv7THGwO2Su3Kdkm3wOq
X-Google-Smtp-Source: ABdhPJwRVy6etwhTKZbX6WjQXP+pxkC4RbLjmtroCzC4hoeIMAQ/7AC36RQhY0utGcZ0NQuphd3eZA==
X-Received: by 2002:a05:6402:17f9:: with SMTP id t25mr12739188edy.134.1591981489906;
        Fri, 12 Jun 2020 10:04:49 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:1143:792f:f1d8:ffcf])
        by smtp.gmail.com with ESMTPSA id b16sm3411860edu.89.2020.06.12.10.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:04:49 -0700 (PDT)
Date:   Fri, 12 Jun 2020 19:04:48 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 5/7] arch: add specificities for Nios2
Message-ID: <20200612170448.73ucdbgyuqkso5ta@ltop.local>
References: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
 <20200610202735.84968-6-luc.vanoostenryck@gmail.com>
 <3452bdc1-cc47-4f55-98ea-a84075e56c7e@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3452bdc1-cc47-4f55-98ea-a84075e56c7e@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Jun 12, 2020 at 02:04:50AM +0100, Ramsay Jones wrote:
> On 10/06/2020 21:27, Luc Van Oostenryck wrote:
> > The real goal here is in fact to move the nios2-specfic
> > builtins out of the main builtins table.
> 
> I had to do a search for Nois II - do people actually run Linux
> on these? :-P

Yes, quite exotic! I also had to look about it.

> This and all remaining patches look good.

Thanks,
-- Luc

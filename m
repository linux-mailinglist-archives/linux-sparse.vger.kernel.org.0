Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024451FC078
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 22:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727085AbgFPU5c (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 16 Jun 2020 16:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbgFPU5c (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 16 Jun 2020 16:57:32 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 049E0C061573
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 13:57:32 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id x25so231717edr.8
        for <linux-sparse@vger.kernel.org>; Tue, 16 Jun 2020 13:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/NHjiju9UwYWr/4U9mbHJNayg9eK4hoh8Gjb4JgesOg=;
        b=YJzBynoFSZseQvW4RrPchVaCOfSTTCQUGCK+VLB3wtV5rlVDGct6jbUno2iYwwNdpN
         4Yq5qog2d7xYzUdZuuB4j6hSAzYGLUi8P341hvdqt/PauA54z8aHUUGTEzlXFeCKkYah
         yYZ9JSn6tTzfIITXdWdagpoEUukm2roWCwseil+ng+Kb8en/NJwmfYfuGssl9wENQuWF
         H2y2jio4/LAE3DmNfK1OORAulX2y1UMCXAMrsfGeumO5i6qAAMMK59rwFcw3rwnfmrpa
         FM8xmDpUIg4uUzkwINwmWFcvSu8Nu9ACwwdwI4oA+k0tiQOaclhNm75S6FhcDgyjLZgY
         Eiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/NHjiju9UwYWr/4U9mbHJNayg9eK4hoh8Gjb4JgesOg=;
        b=LdXz4/cxampCsKO62IEuKFbiOWLd57Jz98K0ryFSdZVJhZsN0RFciUWB2EghMpfUb0
         uHWHOV4fIU/Zms+4kZ3MNjGTpYuyRLbrfubgQU01cug/HE1Pc5tNEwuO552CCiFRSrVE
         yZYZKTjqQ5RUiZ3n515agAF82tgjYVnJhNbsiKrogJeaYMR2Ut11ZCaWtmA08pbMYV/+
         XrcS+JQGfQxRJXfgjH/VqP39lFKLMmvGFHCsDeU3uFe5C5ut8dr5Lt4k3yitaCWezUmc
         99MHeOXi7jQnmwtLH67CWu3mc2lT8/vi6EKfjBxmK32NmMHnE/kqqqJ+d3Qgw6h3gPyG
         DS1A==
X-Gm-Message-State: AOAM530ah7b9e79wtohENDXHlQB4G6xUX+/z9InNJ59AY232gb6gnrPt
        D6LucBxzi9A9K9Ac1reKoxK8qC2H
X-Google-Smtp-Source: ABdhPJwApFJoaBBxf6N/3AbgEYQj3Z9kQWj0Kqnlo9qlM7ImEkU/pUYvseMS/N2fnLpYnGEMSp+0xg==
X-Received: by 2002:aa7:da42:: with SMTP id w2mr4209629eds.176.1592341050811;
        Tue, 16 Jun 2020 13:57:30 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:5034:6797:70f1:e20a])
        by smtp.gmail.com with ESMTPSA id p13sm10781079edx.69.2020.06.16.13.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:57:29 -0700 (PDT)
Date:   Tue, 16 Jun 2020 22:57:29 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] doc: add intro stolen from the wiki
Message-ID: <20200616205729.gaz5vz47tawohkq5@ltop.local>
References: <20200616001122.65350-1-luc.vanoostenryck@gmail.com>
 <1d164023-8e9d-8950-7fec-b1bd7b673c31@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d164023-8e9d-8950-7fec-b1bd7b673c31@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Jun 16, 2020 at 02:38:26AM +0100, Ramsay Jones wrote:
> On 16/06/2020 01:11, Luc Van Oostenryck wrote:
> > The wiki has a small into, perfectable but nice
> 
> s/into/intro/ or s/into/introduction/
> s/perfectable but/which could be improved, but is/
> 
> > enough while the doc here has no such thing.
> 
> s/enough/enough,/
> 
> > 
> > So, copy the intro from the wiki into the entrypoint
> 
> s/intro/introduction/ maybe.

Fixed now. Thank you.
-- Luc 

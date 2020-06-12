Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EAD1F7BD0
	for <lists+linux-sparse@lfdr.de>; Fri, 12 Jun 2020 18:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgFLQsg (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 12 Jun 2020 12:48:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLQsf (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 12 Jun 2020 12:48:35 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BBB5C03E96F
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 09:48:35 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id gl26so10711119ejb.11
        for <linux-sparse@vger.kernel.org>; Fri, 12 Jun 2020 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NYEiXrL8e6rUsvawCHIWBEx3abUoxvKsTwuqAz8SaA4=;
        b=vbXgXvkQ++Ma48sCCjzMoCBgdRyR/qzcHp6IhB71dHAnVK4+w9u+nxGGVLH1tHIjvE
         8G3uKNQ+1ok8Q3kKs6NNaZ1fD+7fkBPqB5/pQh+S277LoTZlGkCR/Ps0Nn8If+9gl79t
         RVj9XHxR+Fh6VFz3DiLPrgrGh9qnfkmIdtc4Wx21kDpMJhXp++SOmru9y70R8/u7XmJt
         LKrvDLwNvh4z+BJlede2rMTVrihLO4WL/A2AZ6RMf7qm6E+wfc7WVFznx9A5PPQRm21H
         AfFipig139JffQJ8Zg5s1n3vbM580dp+sODmtLUttx4JD4o/RmTOJhLROBVRcHhs/gOs
         JMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NYEiXrL8e6rUsvawCHIWBEx3abUoxvKsTwuqAz8SaA4=;
        b=qBMTOzFwLYe4dorlUGw9qteDezq41HqktviHwHkwny0i8vpNZkRvIo+00hUyK8ZEIu
         fs3LmaQHHDUmp4TcIegDQK55iGhd2pqlYiQTFD/N9dvkAjQwjofm1DWcaOzngcTLxeNC
         vU8ZRI3amTzRFnkYwYjd6PR/b0AavU55n5TAAMDDyJeaDSJqVt5jq8lV6r00JD8zSgdv
         +Y0ddhH1tMsfw1ve/I8W+lrjvxzgecs/pW5DI3C/6FvHpyE0C9WfgclBOEYmwYA2Tb4E
         7ehMIVsDi8xSP5bc7HMCuUkKsXoXXV4KvBNkywA6o0sQLRCul//5Ocv7fU+8lLaGbcBx
         RuJA==
X-Gm-Message-State: AOAM5316mtp6FexgrEw+0jw2ET10ajer4FUlPdnroxdL0Fcp6H42Knyt
        L+ygo7FoKVc03gFXX8AVmRWrCmDA
X-Google-Smtp-Source: ABdhPJw1bmTIxsgHRuPkfO56WifUZJFgOQ8xOupL4Wng/KsdD1hLUKUJSy8Ex0zd2pF58h3kEDgzmg==
X-Received: by 2002:a17:906:81cc:: with SMTP id e12mr14660556ejx.67.1591980514105;
        Fri, 12 Jun 2020 09:48:34 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:1143:792f:f1d8:ffcf])
        by smtp.gmail.com with ESMTPSA id cx13sm3385892edb.20.2020.06.12.09.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 09:48:33 -0700 (PDT)
Date:   Fri, 12 Jun 2020 18:48:32 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 2/7] builtin: use a table for the builtins
Message-ID: <20200612164832.fkkfvqcbjh7ivea7@ltop.local>
References: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
 <20200610202735.84968-3-luc.vanoostenryck@gmail.com>
 <62b18141-89be-d0e0-a848-8cf096d0f160@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62b18141-89be-d0e0-a848-8cf096d0f160@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Jun 12, 2020 at 01:56:20AM +0100, Ramsay Jones wrote:
> On 10/06/2020 21:27, Luc Van Oostenryck wrote:
> > 
> > A table is table is preferable but a complication for doing this
> 
> s/table is table is/table is/

Thanks for noticing this typo (and the ones in the other patches).
 
> > +static void declare_one_builtin(const struct builtin_fn *entry)
> > +{
> > +	struct symbol *sym = create_symbol(0, entry->name, SYM_NODE, NS_SYMBOL);
> 
> So, assuming stream 0 here as well ...
> 
> > -static void declare_builtin(const char *name, struct symbol *rtype, int variadic, ...)
> > -{
> > -	int stream = 0;			// FIXME
> 
> ... and, yes, here is the FIXME (so my memory is not as bad
> as I thought!).
> 
> This all looks good.

Well yes ... I don't really like the situation, though.
I probably should do something like adding a #define builtin_stream 0
and use this.
 
Thnaks to bring my attention to this.
-- Luc

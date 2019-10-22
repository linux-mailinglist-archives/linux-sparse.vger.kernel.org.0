Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAF16E0D83
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 22:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731448AbfJVUtv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 16:49:51 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41729 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729146AbfJVUtv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 16:49:51 -0400
Received: by mail-wr1-f65.google.com with SMTP id p4so19585039wrm.8
        for <linux-sparse@vger.kernel.org>; Tue, 22 Oct 2019 13:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=js/J1CyVWMWruYXENKuszDY3oVN/D8xKppOsTQr1mK0=;
        b=FksvBjqFH1BNsm2L3Mo3K01sZHaz6oe5Er5jx9XBtq7WsoQxiL5kQWuHiHpKcYIWNJ
         mKPnEhMz9fDEwjT+eTs82FTiFg/JWcR6QpYbuz6hboR+sTJGgUxX+z/UNM+zSbu2q9YB
         d/dBbS2D8OwEN55nj76cpriXXJK4omgbEBxXdMh6FaOSsonsYB39GZQwoyCpToKmB9t6
         wYc8Mu5icP5BCZ13iXhOGCdi1C53Ytu9VVVTg2C45pwrjL9pDJ41qrWLiiHoQE7CcyKq
         42/N2FRNg8ltu7/GRu8INVZMeePuhyckfjqbc3nc9Qr6xAyNRKGQoBZJeeKLg1UcD+TO
         vdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=js/J1CyVWMWruYXENKuszDY3oVN/D8xKppOsTQr1mK0=;
        b=S7nj4ajf7R0Zi41NSoGek8Q0q4mDrR5oqO/Elez7f4HtVI4XebUm3b5Jdn19XbV/cq
         WrBcQMo6wLbnn7WJCUSu5d66N5oNSwfmfTxpW6L/9MH1OMzJRkZCicVJpiwB3X38puc5
         DfdK2UFomG9FtB/f5L/YUd6SYJyTNKCy/JuqHexWYLBptqDDWYsrOaa63n8kF4yN/qmN
         XCoYnlkplAltD45MdQ/xzCWXNCPTS1TaNSiI4yKtzsgZCIfRP4Ivhvr6/rm0yoxsNWHo
         AMQXfdOWoJCaR3OqiIkObADEpnG/szaGFk5WAn2qvSRdmziFuYFZHmOuFB34UnjrvmxM
         cX9Q==
X-Gm-Message-State: APjAAAX1jznlySGy7v6Alkhcx3GwnLz2QKG0drBicKToaSnm98uw3KO7
        jC0VprqM2JFfSIZF30bpLDp9TYL6
X-Google-Smtp-Source: APXvYqzsfpaO63EWPC+0k8uQvqNEY27WenXiMG2kD1cVOf+zzPgphgdIEC4o6RLGBKkZpAQo7fqGsg==
X-Received: by 2002:adf:c448:: with SMTP id a8mr5275794wrg.233.1571777389046;
        Tue, 22 Oct 2019 13:49:49 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:9ddf:7b8d:bfc3:e4be])
        by smtp.gmail.com with ESMTPSA id q124sm33984731wma.5.2019.10.22.13.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 13:49:48 -0700 (PDT)
Date:   Tue, 22 Oct 2019 22:49:47 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191022204946.vwajjalz362xgev6@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
 <20191020164046.klhcn7uz2sr6syhy@desk.local>
 <5d61dc83-656a-af15-acce-0a108c2d932a@codethink.co.uk>
 <040a22a3-9277-8f95-5eed-b959fa3109dc@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <040a22a3-9277-8f95-5eed-b959fa3109dc@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 22, 2019 at 12:16:57PM +0100, Ben Dooks wrote:
> On 22/10/2019 11:26, Ben Dooks wrote:
> > On 20/10/2019 17:40, Luc Van Oostenryck wrote:
> > > On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
> > > > +static int printf_fmt_string(struct format_type *fmt,
> > > > struct expression **expr, struct symbol *ctype, struct
> > > > symbol **target, const char **typediff)
> > > > +{
> > > > +    *target = &string_ctype;
> > > 
> > > This should be const_string_ctype and a test should be added for "%s"
> > > with a non-const char pointer/array.
> > 
> > ok.
> 
> I'm now getting weird issue with the tests failing. Example:
> 
> -varargs-format-addrspace1.c:12:32:    expected const char *
> +varargs-format-addrspace1.c:12:32:    expected char const *

Well, they're the same types and Sparse print them like this.
I would also prefer to have them with the qualifier in front
and that can be 'fixed' but it is orthogonal with this format checking.
Please use 'char const *' for the moment.

-- Luc

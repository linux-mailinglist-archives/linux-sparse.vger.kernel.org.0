Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13EA6D8F60
	for <lists+linux-sparse@lfdr.de>; Wed, 16 Oct 2019 13:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389378AbfJPL0a (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 16 Oct 2019 07:26:30 -0400
Received: from mail-wm1-f44.google.com ([209.85.128.44]:39283 "EHLO
        mail-wm1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731902AbfJPL0a (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 16 Oct 2019 07:26:30 -0400
Received: by mail-wm1-f44.google.com with SMTP id v17so2342519wml.4
        for <linux-sparse@vger.kernel.org>; Wed, 16 Oct 2019 04:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hphxnjA2x2ovSGcf613s3Bh+AFN1D6VHGkLbnqygjro=;
        b=mzhx7u0SoCNuN9+f/E50BNBzbGS2irKrLri6/3bk0VH3I9CCd/ZfnMRfj9hNGQqSY1
         uEc1xpM/TpfmAhlBdYArn0xLuJ9Mt1PsydgyZwMDLPf/cm7tBoGtYK9toSsHvpTX8YL/
         TcBVBOJSofwwQMIDEu8yg4pI5Pc9gTM6idJYdDFZcY/AW3xiYrOW3G6XlVPIlq/3oeQw
         N7U/iPCAPC7ulWFqT6hNNqXuWPkFuls9SbrfY3TZCRH6rB9UVqVVmQIQ2xhn/GBsDvvA
         FV5FyuMMrLzo9QYLnHt0WGgJZt0yGQl1A6vewXG2jOdBzY655KR7pczXCQwnBrE9X1nj
         yf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hphxnjA2x2ovSGcf613s3Bh+AFN1D6VHGkLbnqygjro=;
        b=XFkIHdjn1hsF2T8BSY8i/lw+LFnbo2tIUO1JIpkYn/VGQXLfdTKLEj6U+QntOFOKjm
         1B4k/orQII2RgDz/DnmSIYTUpFWKa2QYIzzf1ZDzL8y5EgscoGo+btwuYS2bRjNljnTU
         H/SdDxrvTWvChXXyq5pLJFKP8CYN03XNlMfNgWiQnkJwK7BbfJ2Ck2AHqvNbQJyve2lJ
         l2HwnY46ZXroDeveypbHEEBAUGI0Pyqz6G3+la6Ezh/8dU66NHEsgz72m0Xi7oIjW5kq
         KO+ejDxzvRyQoSXc9wxBhRUSwFKNdKqNxZOFdq6XgvENuQuWmehvpVr85NbwZRj3Wrtg
         BQbg==
X-Gm-Message-State: APjAAAUungT0tFD+2vQLyIVr0294Q6Kyij/Tz7SohC7UuL+Fr/i2HGY9
        9IPqb3lTNPtVxVgb/X8g9zZl3LNz
X-Google-Smtp-Source: APXvYqx6if4nCY4EF68OYxoWRJq1Ap8Q02jpK4/nruFz6OF/zs4s2XtUAvMmo4KlJQa5KfYtouBvSQ==
X-Received: by 2002:a1c:2407:: with SMTP id k7mr2814307wmk.99.1571225188137;
        Wed, 16 Oct 2019 04:26:28 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4080:1900:c562:e906:1949:a7b7])
        by smtp.gmail.com with ESMTPSA id q192sm2590383wme.23.2019.10.16.04.26.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 04:26:27 -0700 (PDT)
Date:   Wed, 16 Oct 2019 13:26:26 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: sparse issue buulding kernel/signal.c
Message-ID: <20191016112625.66kkmksm6xviu4hv@ltop.local>
References: <c8a65f9c-4b5e-b2b5-324d-e0381701e481@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8a65f9c-4b5e-b2b5-324d-e0381701e481@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 15, 2019 at 09:50:40AM +0100, Ben Dooks wrote:
> The following errors are coming when checking a kernel built for
> ARM.

... 

> The code is as follows
> 
> #if defined(__i386__) && !defined(__arch_um__)
...
 
> so shouldn't really being built?

Absolutely.
It's a 'side-effect' of trying to autodetect the target architecture
based on the machine used to build the sparse executable.

There are a few solutions to this. I'll need to see.

Best regards,
-- Luc

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31C79EEB61
	for <lists+linux-sparse@lfdr.de>; Mon,  4 Nov 2019 22:46:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbfKDVqs (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 4 Nov 2019 16:46:48 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:40937 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbfKDVqs (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 4 Nov 2019 16:46:48 -0500
Received: by mail-wm1-f43.google.com with SMTP id f3so6602023wmc.5
        for <linux-sparse@vger.kernel.org>; Mon, 04 Nov 2019 13:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=edFtqfr+V9NOiAw/ukkUpnelHS39slWJgPz0mWJkgp8=;
        b=rG6Y0vuiSO9v5Uv6ivt1r3M01tArE8U+Is2nxgyajBq3AGzbaTYrY4An61aSJmpJdB
         rU4Wpmg/eX6PnHtlS9ljOANeK1ScjdAZhd0n+vpxvATaKHA7IT3NSpRfn6h5zrqKh8g/
         KHqbHwFRghzYvogcDlT48cdzCTZ/U9PU7JEE7szCYfMl2nM+rDy5Q6JwkgFIrXWYIoM6
         cnB0kaMUxA4C37aHpvOW81AO+aC9MmIu3gzl631+dF2AGDMOLpv4YpifxqrsS+oSy+V/
         OOyaj+LpyPZbx3ebP3SRjysxrMDw/RH22QF2s6QIrL+2dMxqi+nC1ihMbI0Ykj6bo8gf
         Q7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=edFtqfr+V9NOiAw/ukkUpnelHS39slWJgPz0mWJkgp8=;
        b=KAciOMNQHfmIFPhUazTuH6wVbtkUTlMUspSECIpN5tfm4vRA8NhTN4ta+IxPcQejfK
         dcvIleUpx0WiIRT8WBZRsh3Ft31heU3P5f3rGEkylfKn/HCW8720ykfax9rflXwfSDIJ
         fpZEQrAqb1QxfEsGUBao/6s5udEZMeAOjF6p6mtQoNGvEudG1Z99WAQTZhquD3jd5g0m
         77/Haim/ob2svvyMi72GInl1I62N+Bt1eTQWoO2QohbPuQUG2jyqTCSWwZIa9/Qk1/7g
         63xwC3eGIN1oZDYPbO7uYVxiGvEPOkxWboznyx3Y1V/F9kBCp6SWeKFRv5Dj0khASEZ/
         hICQ==
X-Gm-Message-State: APjAAAVzcaMwPGTe6HzcSM8g6XLHC45Fim18sZrE9mKwTXpTS0t/fA5N
        UVTlg3iARU1fmMISQCNGK+7SqpTR
X-Google-Smtp-Source: APXvYqwTodIDTXYlWrK1tblEj4UXMDcxUlUiFQ/qfVkp8xu+UiPChQIkAuf6p3fhsKuc5kiJ0/tPAg==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr1017904wmi.21.1572904006038;
        Mon, 04 Nov 2019 13:46:46 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:cd02:6aa1:b334:cea8])
        by smtp.gmail.com with ESMTPSA id s13sm17208870wmc.28.2019.11.04.13.46.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 13:46:45 -0800 (PST)
Date:   Mon, 4 Nov 2019 22:46:44 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: latest printf code
Message-ID: <20191104214643.d6ta3xok4jypkrjo@ltop.local>
References: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78105f3a4a949a746d3ba6e562eb0e00@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Nov 01, 2019 at 04:36:51PM +0000, Ben Dooks wrote:
> I've put the latest code up at:
> 
>  https://github.com/bjdooks-ct/sparse bjdooks/printf20
> 
> I think it has all the issues dealt with.
> 
> I can't currently post or do a final test as away from work laptop.

Thank you.

I've a few more remarks about formatting or naming and
also some simplifications I would like you make.

I'll add them in separated replies but I've pushed the raw
changes at:
	git://github.com/lucvoo/sparse-dev.git printf20a

-- Luc

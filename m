Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7277110BCDA
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 22:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731956AbfK0VCy (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 16:02:54 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39735 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731598AbfK0VCw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 16:02:52 -0500
Received: by mail-wm1-f68.google.com with SMTP id s14so2478713wmh.4
        for <linux-sparse@vger.kernel.org>; Wed, 27 Nov 2019 13:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gO93rk0wPuCPYQOKsLKsr4/vSytu1TJ5BD6AunahQ5w=;
        b=aZvLMmq+/QTrzJLZe0I99eKrA+r/KZ5xdS9w2WYsnb/T7Ndpb25NLlgpgtBYQuN1hU
         kKap+kK+tknALjbOt/3jrdCHZc9bsdumRloIqS7VOkNk0dZ//sSX4gH+TgE/ib4la5Jr
         qdFOjKxlrXgf8AyNUCWaKW8r1fUp3zOwKJQ3XkPPtGadCJM8VoJwlhdWLK6yNWK48PUj
         rgaS5QJn9YXnypViSKALx+sGRqaTwecc0CACEqUyha363pKC5stY5ed4YfdmWngC+kuO
         Yto7hJHyxR87DCF/b5ZulD9YFD3pqqxexlgKoFOKBtUcggpZFmU8dbt8nU6c3DOjvzRD
         WqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gO93rk0wPuCPYQOKsLKsr4/vSytu1TJ5BD6AunahQ5w=;
        b=TRuI1u90WAzyDzce66i1bVous9EPLqphTzu/gi1n2+GiHK8iCVXj+4hhyao2Mbkmpj
         EXTEzkcj40EEJgHCh+3uMtTtV9FTZKFqpIoF+mTE1963PaghVEDiSOMs2APV+MeOniwV
         +UsKBH5AV7bX4elivtb0GLZ9yVjrtKvweEHum3fgwB+OzGPiZN6ASXp/2LqVm9Kn5owS
         bU2XiY3AsvfUI9jk0aMM2VtOwP+3xRbSCPvlEe88/VMcZwY6yGjWxu002ymD710/k8OM
         NodfLJdy4v04mevIgheChHg2nsjmRI6tDprf/dXv7+7LKQCJSx7qqZnTGGF8ak+amMeA
         OVMQ==
X-Gm-Message-State: APjAAAUYck0FQki9N/y4zc8L3eAfBk5KqOPg+EMZEySMwhV/CZ5e2mPu
        1XrEsjz6QHANemupz5lNHQGu7Qy+
X-Google-Smtp-Source: APXvYqwK/j/oj75mFk8pe5xkQb4tmjCQS1ZD6mHvE6dVFThkag8zspcUIzo0l6gQaKG+4pc0kqyCFA==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr5012712wmi.152.1574888570762;
        Wed, 27 Nov 2019 13:02:50 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:2dc4:827a:b71a:1d2b])
        by smtp.gmail.com with ESMTPSA id d7sm20855142wrx.11.2019.11.27.13.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 13:02:49 -0800 (PST)
Date:   Wed, 27 Nov 2019 22:02:48 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 0/4] More arch specific fixes
Message-ID: <20191127210248.hcp3rvchzwxjpcx6@ltop.local>
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
 <2c56999a-3ee8-999a-be41-962ec8c8d70e@ramsayjones.plus.com>
 <20191127174845.uol5jdfdqpso6o3h@ltop.local>
 <37371468-5ffd-7021-ea50-35d23eef943c@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37371468-5ffd-7021-ea50-35d23eef943c@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 27, 2019 at 06:05:37PM +0000, Ramsay Jones wrote:
> On 27/11/2019 17:48, Luc Van Oostenryck wrote:
> > On Wed, Nov 27, 2019 at 05:15:20PM +0000, Ramsay Jones wrote:
> >>
> >> I was going to just test 'luc/int128_ctype', but looking at the output
> >> of 'git log --oneline --graph master..luc/int128_ctype' I can see that
> >> several other branches are merged into the result. So, I will apply
> >> the patches from the mailing list directly to test them (hmm, _hopefully_
> >> tonight).
> > 
> > Hi Ramsay,
> > 
> > Sorry, I should have added in the cover letter that the series
> > with all related patches is available at:
> > 	git://github.com/lucvoo/sparse-dev.git next
> 
> Hmm, but that _also_ contains several other branches not contained
> in 'master', thus:
> 
> $ git --no-pager log --oneline --graph master..luc/next
> * 4a8aa8d1 (luc/tip, luc/next) cgcc: add support for riscv64
> * df14d253 arch: fix wchar_t & wint_t for openbsd
> * 662ed740 arch: add missing predefines for PPC
> * 1ff97d3a arch: add missing predfines: __amd64 & __amd64__
> * d8754f2c cgcc: filter-out -msize-long & -msize-llp64
> * 7efa090f (luc/int128_ctype) spec: replace lllong_ctype by int128_ctype

Yes, indeed. It's how these patches have been written and tested, though.
They're supposed to be the cherries on top of the cake.
But I think that only 'df14d253 arch: fix wchar_t & wint_t for openbsd'
may have some dependencies on one of these branches. For the 3 others
it shouldn't matter.

Best regards,
-- Luc

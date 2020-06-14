Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5AA1F8B02
	for <lists+linux-sparse@lfdr.de>; Sun, 14 Jun 2020 23:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgFNVyu (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 17:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727918AbgFNVyt (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 17:54:49 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B7EC05BD43
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 14:54:49 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id x1so15337400ejd.8
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3ovCTvdBmD+KnglYNReH8vviHMgyeCC1W22NQpU1D3A=;
        b=oiwaHCnTcpdGUEOBauGFqXbQiFbA0NV252SzJyAR/e5vGU1lIhuSLbIqD1NMj5DrfE
         QOYxhU2melm/z2AuRcm90+o6nRvPXv7fM7kP/pczz+PSKBlFwMTgny5kriJA0xIxTWm1
         ZOPz+L46AnXQXCNnZKSN1pasfUQrz6hQYIJng9IYlxgSYylaRjQQV92zZFkoZIuyFYhw
         knVb6vtnHfH++1fLNSqQotkF24pPzoYcGYORPEvd0yp/KTu6SbmX+/VAf8l7EgdRUDNV
         JGTyw2QRQMXrxbTGdua887rdonWaEklMyMBfRYQCUoVpvRQE23DPWiiiPcCizk9/1TgB
         KZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3ovCTvdBmD+KnglYNReH8vviHMgyeCC1W22NQpU1D3A=;
        b=TQ93tF5J1JQDRnLF6GW9htRd7DXoZ1diROhAORP+pThVggHHsiBD4DDpzCfQXm+4e2
         nS6uApuvrQkbAAUv/LA+l3FYtqBL1Ui1LPKzfMe9U/xTegnGIDSAv82EmbaG2HsQwdfo
         TwoSM3NRTwICEtZfl/cvmgtC3vC6SWKqbHUFka1Sb/eF7xJPiIH+XAo+ucgTsJbNSNZU
         BImU6XGxKLzb8NTHkDg2Hog9me6anwy4CvaDRVQc/TEGxkivrf1fliTMEp3DKN78gYgb
         3aUyfwFs8qsKYvhWmpJ4jL89v6qLpfpXDprDWHWE6PQnUbwZkeA9aj5r+U89sj/QHz8M
         QQgA==
X-Gm-Message-State: AOAM530M0hcVEQBx+iDmxr+FhODDeLvBupqcjUsB8HQZk00fldVjarTe
        BD54xPYu6/wd8WpIzIJskz9Vuqrd
X-Google-Smtp-Source: ABdhPJyQX22md1IBtlkIrIX8anU50s2D7CPTV4cKM6et138CitG+CpYOyBEujcD+yspO5ic4dBVHxA==
X-Received: by 2002:a17:906:cb97:: with SMTP id mf23mr11287060ejb.468.1592171688036;
        Sun, 14 Jun 2020 14:54:48 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:d91c:9a32:92ae:d7bf])
        by smtp.gmail.com with ESMTPSA id k2sm7888710ejc.20.2020.06.14.14.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 14:54:47 -0700 (PDT)
Date:   Sun, 14 Jun 2020 23:54:45 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [ANNOUNCE] Sparse v0.6.2-rc1
Message-ID: <20200614215445.rtfbx23ve57fhlbr@ltop.local>
References: <20200613020735.iqb2vd23jpomisbq@ltop.local>
 <c80024d2-6d91-4fe7-a919-3edcf4a9b80a@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c80024d2-6d91-4fe7-a919-3edcf4a9b80a@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Jun 14, 2020 at 08:35:51PM +0100, Ramsay Jones wrote:
> 
> 
> On 13/06/2020 03:07, Luc Van Oostenryck wrote:
> > Sparse v0.6.2-rc1 is now out.
> 
> Tested in the usual places (Linux Mint 19.3, 64-bit and 32-bit and
> 64-bit cygwin) and in the usual way; no issues found!

Thanks a lot. Here I tested it on 64-bit Debian (latest + unstable)
and Ubuntu, and also on ARM64, ARM(32), ppc64, sparc64, mips64.
I'll give a try later to some BSD.

> Well, I say no issues - I did notice some spelling errors and
> the formatting of the release notes does not look correct to
> me (https://sparse.docs.kernel.org/en/latest/release-notes/v0.6.2.html).
> Unfortunately, I don't know anything about the documentation tools
> you are using, so I can't try to fix this. (It seems to be the only
> attempt at nested 'bulleted lists', ...)

Yes, I saw that too now. I thought I had fixed it but visibly it
wasn't. It should be really fixed now.

[(Just FYI) The format of the doc is either reStructuredText
(.rst) or MarkDown (.md). Both are much less simple than they
appear to be but they have the huge advantage to almost look
as if there is no markup at all/as if written 'naturally' in
ASCII. Much much more readable than man-pages or html markup.

The system used to generate the resulting HTML is Sphinx.
It has the huge advantage to be very easy to install/to have
near-zero dependencies: it's just a single python package.
To use it, it's enough to just 'cd Documentation; make html'
and the result can be found in 'build/html'. But I confess,
most of the time, I'm too lazy to do that, I just push it
on github which trigger a build on readthedocs.io (which
then nicely send me an email if there is an error).]

-- Luc

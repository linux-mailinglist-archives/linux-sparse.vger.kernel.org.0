Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA3A21505F
	for <lists+linux-sparse@lfdr.de>; Mon,  6 Jul 2020 01:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgGEX2y (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 19:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728019AbgGEX2y (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 19:28:54 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5EEC061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 16:28:54 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id g13so27716975qtv.8
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 16:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:to:cc:subject:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=a/0j6PqjYobmiH2/zNUJNpmbCiKYKR3DvZOn6FSSX7A=;
        b=Utz/X21jseGEUN4m70wzVy8hOCZm5BrTieAhc/P2gzKwWqSJcNOf8d/TeF8vMbTbAD
         KAaRsHVv9SC2RP9weAgGdeiPZle0Tzgx04nez2X6Fk7E9lXKRUoijIOJUMsyFK1/dQ5z
         Nke4IwBfErAC78rVaEFj5LnLb2ev7ej/I8/LF/S+8S+ajdCzZwxVvIt5tkJ/rmN7KcZA
         tBu7DoiVPBLdVRU0v8/Wg/QsSVIp9rcXd96ZTckCsg4ca0t4lGyy/o7ZZWYAyDcIZ7VE
         XXR+ueP0gQObYksXyvZx5I7viJyKELnWfOC6HgTpx6IqRf4WWPiolARXQlSL1YKb1O1r
         eLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=a/0j6PqjYobmiH2/zNUJNpmbCiKYKR3DvZOn6FSSX7A=;
        b=DC542jWvkvwhVcnRqJWI8iScdSXsclpXaQ1He/SBLNXhhkXe8fRsAwkzau5JX2mmfk
         EF6WKnsLGjZ8/SYu72LdGx56+oSg0YDeeUftM0eBkeNuJWXvFeromChnYd9u75cg8eq/
         GZcKNX/Vn+kXHMKa71ZrrdNMBRzoUyqyed9bpDEHS37m7zdgaSeWaUu1tzEqhioH6uE/
         2MVyLZmiz40UDXwotoo0FFznu4JUdzDVSyRdqQiiIh61XFXjN8q9+7u+p8Ji5Ny7qyZ3
         759e4MuJlp2h8kkwk8GZCz73QBr5tSQlle8CgNaK1+Ov95af2ds5Nj8ra1PGptkhz9sG
         jjgw==
X-Gm-Message-State: AOAM532xiriOci2hAe2hyp/FriwNhaFF9B/xca0P2Ah8gy56FA10KRpi
        /KhKNtoK+fN1rt9bowr0Xi8=
X-Google-Smtp-Source: ABdhPJyktPht+NEbbogDON2L21haT1GMUjR9ZBc7Sgzg0h1RBoNeLEJui8RYdxRyHGG8QTYhumvIRA==
X-Received: by 2002:ac8:7593:: with SMTP id s19mr15190874qtq.199.1593991731889;
        Sun, 05 Jul 2020 16:28:51 -0700 (PDT)
Received: from darkstar.. ([2804:d45:9905:9600:f66d:4ff:fe73:55f5])
        by smtp.gmail.com with ESMTPSA id y40sm20124610qtc.29.2020.07.05.16.28.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jul 2020 16:28:51 -0700 (PDT)
Message-ID: <5f026233.1c69fb81.43be0.0187@mx.google.com>
X-Google-Original-Message-ID: <20200705232848.GA13064@darkstar..>
Date:   Sun, 5 Jul 2020 20:28:48 -0300
From:   Davidson Francis <davidsondfgl@gmail.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] test-inspect: reset locale after gtk_init()
Reply-To: 20200705203502.dwctpjxtqfwaz7bd@ltop.local
References: <20200705185013.8578-1-davidsondfgl@gmail.com>
 <CAHk-=wjqh1KOVWaP=xPZH_9grwDVtCMitWOb4vtKj+cB0jghBw@mail.gmail.com>
 <20200705203502.dwctpjxtqfwaz7bd@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705203502.dwctpjxtqfwaz7bd@ltop.local>
User-Agent: Mutt/1.6.1 (2016-04-27)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Jul 05, 2020 at 10:35:02PM +0200, Luc Van Oostenryck wrote:
> On Sun, Jul 05, 2020 at 12:12:55PM -0700, Linus Torvalds wrote:
> > It _might_ be a good idea to limit it to LC_NUMERIC instead of
> > LC_ALL,
> > but who knows.. I'm not sure what else might be affected (and I'm
> > not
> > sure how good LC_NUMERIC support is on all platforms)
>
> Well, checking the standard, I see that strtold() first strips
> whitespaces as defined by isspace() and isspace() itself depends
> on LC_CTYPE. So, for the moment, I prefer to take Davidson's
> patch as is this (OTOH, we already depend on isspace() anyway).
>
> -- Luc

I was also in doubt as to what would be the most appropriate
option. Anyway, thanks for accepting the patch.

Regards,
Davidson Francis.


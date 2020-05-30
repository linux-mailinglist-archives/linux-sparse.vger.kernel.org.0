Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5281E92F8
	for <lists+linux-sparse@lfdr.de>; Sat, 30 May 2020 19:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729268AbgE3R6u (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 30 May 2020 13:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729026AbgE3R6t (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 30 May 2020 13:58:49 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63492C03E969
        for <linux-sparse@vger.kernel.org>; Sat, 30 May 2020 10:58:49 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id f7so5262090ejq.6
        for <linux-sparse@vger.kernel.org>; Sat, 30 May 2020 10:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Pf09FdMlx65ioxeosotbo12NCzm1JwQ5F3D/IVIe3+4=;
        b=HWYuaFRqCANnu6Y58WIH2rg5bZjU4B1xB/EM1D4VjouMqSiok0k5N5VdE2UpMJdV04
         wkM6BWD+Dz6Wcq9MpevsR8G6fLXrBmX1q1fdV2Xy0rxz3pZo+G70iwbyW2tNfAVuKIy0
         lF2TX8y+M3WN+m3lFs9AQtsR8G3EVNMRV0YBvZoN8JcvgQDEGLjnSkBIzDvYPQXmIdPz
         YBsoasMK7ttufb3oCy+xqS8lQdrKqFMz/aTNIyIs1vL4nf5+1HjwQqKjm8hm+BH4PVub
         hp8ZbLMXVtM6uxcQLzFNBJ3o9vcUiAtDZoFDFvKKShg8+MwPzwbyPStqIEVesC74Q+QK
         w0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Pf09FdMlx65ioxeosotbo12NCzm1JwQ5F3D/IVIe3+4=;
        b=pC7qt8iOrlBEjf5vFMs82bTr9DzN9zPFp1UTfbG6fkoOEN4RSf8L/s7mboHJQIhEyC
         X40SPDNqUhrBpFQhy+WRrB5b1EF7Fin7SR3zy/VMbYLC2MBH3+e10y84EF9Lh5UWdhwD
         CctXttVmC2Ky7h/NQmNbRcKBfDwfVR2CspC9SF5Lc6NcAYM1wUiRElULJr0AOGisJdyU
         O2QlMvnNJlqflfJ9niURFGogiER6C972h17rUbSX4Gz3sVabsszjkGIVoQExcaVHsMhX
         J9dzJ/qvkKEMouGRq1g7UMaRK51f0mjMaPs/EkgQmZndHeJwgWJ9/WQsZJJW4hQMbIej
         wsVA==
X-Gm-Message-State: AOAM532hv6edGK6gBisLLsjmUPZDfIBd5SlryShXGQ4Tf6pczQBLRUEz
        GwYF+Ip251XbYdKImfJ7/vaVZCHC
X-Google-Smtp-Source: ABdhPJxEeNdwNTxyv9iydk+vcSL77rz3W5jYAkVTRD5Dtly39LFm39creNk3EKGB+fWPT/NRluHqsA==
X-Received: by 2002:a17:906:580e:: with SMTP id m14mr12378610ejq.447.1590861528186;
        Sat, 30 May 2020 10:58:48 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:359b:9d62:7edd:f43e])
        by smtp.gmail.com with ESMTPSA id cx13sm1850698edb.20.2020.05.30.10.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2020 10:58:47 -0700 (PDT)
Date:   Sat, 30 May 2020 19:58:46 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] evaluate: mark evaluate_generic_selection() as static
Message-ID: <20200530175846.65it7dkpk4shjhrk@ltop.local>
References: <37ef319f-ed1e-071d-ff4b-cb3a997fbf65@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37ef319f-ed1e-071d-ff4b-cb3a997fbf65@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, May 30, 2020 at 06:51:38PM +0100, Ramsay Jones wrote:
> 
> Commit c100a7ab (add support for _Generic, 2020-05-28) added the
> function evaluate_generic_selection() as an external symbol, without
> providing an external declaration in a header file. This causes
> sparse to issue a warning as part of the 'selfcheck' target.
> 
> Since this function does not (currently) need to be an external symbol,
> mark it as static.

Hmm, yes. I should taste my own dogfood and use 'make selfcheck' ...
Thanks.

-- Luc 

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E47B0E8755
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 12:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730394AbfJ2Ln3 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 29 Oct 2019 07:43:29 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:34457 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfJ2Ln3 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 29 Oct 2019 07:43:29 -0400
Received: by mail-lj1-f179.google.com with SMTP id 139so14728147ljf.1
        for <linux-sparse@vger.kernel.org>; Tue, 29 Oct 2019 04:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=M83Iy4PUSKtgLbhNDvSjjiCu9pY50pItVp7oVDhWeQg=;
        b=VsTB+FtJJL6fTlT2oLENyReJFw1K/M/Z3nMaE20bpM79KdW4rlM/PRdZv3dK4rbfFr
         0xgf5gIE/l2eJjOMF9hcIL1Mw2xWmC1RbMXZxdUKHCPJa3QPgNI6srbHoIc2nMvBfWNg
         fZluwfI2ueosXeisHRvFAmJ0Q9jLOU7/tpgmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=M83Iy4PUSKtgLbhNDvSjjiCu9pY50pItVp7oVDhWeQg=;
        b=dJa/tO5Y+OX5nrmlXP5jgHDqkO/M8qHGbBxKZgONJPLWPInlFSvYkHtKnjywT4Y2Tm
         1bCCuHC3iXDfi+TWN8/hriUkMWEa/vIRQqaf8URZQVRbBNS1pq7a2tacxbJtiz86hO2Q
         YiTUdmEOMY/pYPdsXzZ9eTWaHgd4Dj8LlwtknCjTrymCwewpC71HwyF5EOIvM/DyPp61
         v3q8AW0oPCyf3/MiBYn/R8v+UQpIV4Nj5hr6YVVerQrOcplMGnC6q8zWq4BLSPcMIMsu
         /1ARfJReyzRymkJg44hltmUvHpEQqrZHYcVVl4Kmt2hiU4rqJhI2V8tEXLI6enBiDVHt
         x/jA==
X-Gm-Message-State: APjAAAWNFVBN/EsZh+LPKDcmT6eRx4HyXSkV73N8daqa0vL2m/B92rd4
        bSTraOZM1hPBlwf7EIzRMvRJ9A==
X-Google-Smtp-Source: APXvYqw/feTkhqnQPFwlp5/Kij2FfUPZKSK7MCZqil4/t2hQoFpgZOgiWTjrKOSDG04g2B2B9EIGfQ==
X-Received: by 2002:a2e:9e4c:: with SMTP id g12mr2362730ljk.62.1572349406342;
        Tue, 29 Oct 2019 04:43:26 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id u11sm3315927ljo.17.2019.10.29.04.43.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 04:43:25 -0700 (PDT)
Subject: Re: detecting misuse of of_get_property
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.co>,
        linux-sparse@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <ec277c12-c608-6326-7723-be8cab4f524a@rasmusvillemoes.dk>
 <20191029104917.GI1944@kadam>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <e255d01b-ecd7-8386-e99e-b3226dac27c4@rasmusvillemoes.dk>
Date:   Tue, 29 Oct 2019 12:43:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191029104917.GI1944@kadam>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 29/10/2019 11.50, Dan Carpenter wrote:
> This should probably work?

I haven't tested it, but yes, something like that. Can you also do the
case of struct property::value, i.e. handling

  struct property *p = ...;
  u32 *v = p->value;

Thanks,
Rasmus

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEBBBDDF96
	for <lists+linux-sparse@lfdr.de>; Sun, 20 Oct 2019 18:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfJTQzR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 20 Oct 2019 12:55:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39291 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbfJTQzQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 20 Oct 2019 12:55:16 -0400
Received: by mail-wm1-f67.google.com with SMTP id r141so838601wme.4
        for <linux-sparse@vger.kernel.org>; Sun, 20 Oct 2019 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HBIid/gVpJuBstLGziOZmaR4SGo7uAmwewhF6RfqgCM=;
        b=JBnam3I5p1X4g6VpGL7rRLPS9d3TkkGQig6ikL3yzk+DqrjAohtrhjOM8SE7R031kS
         bDa5VO/hDuWpJpofVXe9xyWarGKnD0/oGwTi2zu/dkyM1Vf1gl2tyShgeCs2PSfera6t
         i9LXGABg5usEov49RAVyxqgfW1/cCuTyK3X1DqHOEUiIbdi4nH1m8f8YdH7FylP2cF81
         2UbLRKnlDNmk8buE7U3FbOmH3LCqv5+D4U9ayFU8RCiyM47/Rsxy7sejj/uPU9KmX6Qz
         7crsybnGDgY6W62+i2xUVhlVuPKAoH/GnUGlQl72GixHFYw9UzIh69yqQG48GkKFExS+
         Q24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HBIid/gVpJuBstLGziOZmaR4SGo7uAmwewhF6RfqgCM=;
        b=KLnzGpOcd3Qs69r2hKlrdJNJmn7pDcIuMdHOh9F7Dat9FG5zVywQONfmgqCEbYGFp/
         fySwkQRdsi+qv5zjfLuhnKkYlkB57FsdeILX8jul++Dw4ImHpG3hj3cTxeNRXLcwsxzO
         tyMz9Fs3Vy8pPixaFtMIsr9sa+6B5eTP81zydKZHBYfKS8R6Um2PiFFQlSzFV31jaxA3
         kPsvCqbAvx4n/MhURXC4lbd3aM/5KXAnd40f5NdsgGvhTxKtMqUF1OcMPjCtcFN5dKl7
         GvEiFEkctAM2tY3UwG8T5V+mZoTFbfwAc6Ju5SpnEHkAtbWrhTizv1bQnNsYf0KQWr4u
         xAsQ==
X-Gm-Message-State: APjAAAWkl2LfuOImiZfek2BHmkwgI27+/Yt6e+/efg/aGr16hhIutejB
        zdtbxMctGAwjyN5UbEeedF0SZXH3
X-Google-Smtp-Source: APXvYqz5Hpk8Cyj5L+Zbt9aQRrA+UMDjIkeXmMtlZ/tbhLDgxFbhGb9V8J2foVYNfaTgo9QQHmaWig==
X-Received: by 2002:a1c:6386:: with SMTP id x128mr10862242wmb.41.1571590514668;
        Sun, 20 Oct 2019 09:55:14 -0700 (PDT)
Received: from desk.local ([2a02:a03f:40ac:ce00:90a6:dd03:1e7:4457])
        by smtp.gmail.com with ESMTPSA id w17sm11175369wmi.30.2019.10.20.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 09:55:14 -0700 (PDT)
Date:   Sun, 20 Oct 2019 18:55:13 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
Message-ID: <20191020165512.glldp4pyxbjnk5ne@desk.local>
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925100015.31510-4-ben.dooks@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
> +		if (*ptr == 'x' || *ptr == 'X' || *ptr == 'u' || *ptr == 'o') {
> +			ptr++;
> +			type->test = printf_fmt_numtype;
> +			switch (szmod) {
> +			case -1:
> +				type->data = &ushort_ctype;
> +				break;
> +			case 0:
> +				type->data = &uint_ctype;
> +				break;
> +			case 1:
> +				type->data = &ulong_ctype;
> +				break;
> +			case 2:
> +				type->data = &ullong_ctype;
> +				break;
> +			default:
> +				type->test = NULL;
> +			}
> +		} else if (*ptr == 'i' || *ptr == 'd') {
> +			ptr++;
> +			type->test = printf_fmt_numtype;
> +			switch (szmod) {
> +			case -1:
> +				type->data = &short_ctype;
> +				break;
> +			case 0:
> +				type->data = &int_ctype;
> +				break;
> +			case 1:
> +				type->data = &long_ctype;
> +				break;
> +			case 2:
> +				type->data = &llong_ctype;
> +				break;
> +			default:
> +				type->test = NULL;
> +			}

When testing this on the kernel, I've a bunch of
	warning: incorrect type in argument . (different types)
	   expected unsigned int
	   got int
This will quickly be quite annoying.

I've also a bunch of:
	warning: incorrect type in argument . (different types)
	   expected int
	   got int
but I can't investigate more for now.

Putting this aside, the series seesm to already been pretty good.
Congrats!

-- Luc

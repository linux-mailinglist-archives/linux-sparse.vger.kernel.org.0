Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CF26182443
	for <lists+linux-sparse@lfdr.de>; Wed, 11 Mar 2020 22:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729333AbgCKV42 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 11 Mar 2020 17:56:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38547 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729328AbgCKV42 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 11 Mar 2020 17:56:28 -0400
Received: by mail-wm1-f65.google.com with SMTP id h83so397504wmf.3
        for <linux-sparse@vger.kernel.org>; Wed, 11 Mar 2020 14:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9E1AWZcf52iuxT5qnTfl1J7rmljb3iFy/6bMoaHemLQ=;
        b=hxUUIx+5ljm0+FDsIUQZisjB+HRlVP+rIAurFRd86200Mulm2AIw/1+53KVftNIlZO
         X62Qu+yfGLKrJ4nrBGBUmEL725WDofSeiwU88CsLpr+U39gmMOPVFCOu+oI6LJWOfqFc
         YqIgTJVvaxhRxRUxsdJqVvSKf9asYbp76c/wG+s/pEU8X8gg79x+XjDeH+gNPHQGtC/r
         Om5tFpaxnsgIGtdVk2xsYQzdvs3t6XrzHL/lK6nBFxvzSgLCUgRiBdH7pzvalRZ2wOHf
         TRUuhOG0a50JBXInoAxAS1l2lbObUpwnh+bjs0xSn5tJPpGUWYlTtr9TAq0ySqqSHmCF
         mLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9E1AWZcf52iuxT5qnTfl1J7rmljb3iFy/6bMoaHemLQ=;
        b=OTutIeIdrf7Cf/RKRRPproUIbtg5+l5iRYG9E5OxYBuORB6eOcozVPVLextYuYzsOF
         9cl98adqCEvhk7EfunrZdGsHdI9h9BA7i2b88vsPOIsWPCv/OBv4gSI6ATNwjU+KnvSr
         0JQ4z7oM230rmWSLjBpWysPoRyu/bP0B1GCWlhVA2oViVaJsrI7mABm9/DD4rM01edjC
         +Kx356buCHEhzdQpyq/2jK0FNgOPCJfl1+CVxrFgUX5IGnXfymbOuo2Vs//f3OYVELLS
         NKU6wYPXPubPCO+XZYdBslP9jtxsgdAGQnpYqVcpVXtDOR5CpV2DWew5cQGknoAnsuhK
         8Avw==
X-Gm-Message-State: ANhLgQ3IHmVi3ooxQfdFYPyyQkjfjjl4ZDEDS0sKK9SdzxeGGL+toMkm
        WdGUB5Go7xvBY78uGImSOkY=
X-Google-Smtp-Source: ADFU+vtKuHUkdV4fASYLExMWDu0a0Dw9WjsUdwawRNNhTkcudy8MJjBqquOKqHOMxgVgMOmNSsCwJA==
X-Received: by 2002:a1c:2048:: with SMTP id g69mr748333wmg.187.1583963785193;
        Wed, 11 Mar 2020 14:56:25 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4075:2100:a871:e27:e2e5:33bb])
        by smtp.gmail.com with ESMTPSA id l8sm10156084wmj.2.2020.03.11.14.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 14:56:24 -0700 (PDT)
Date:   Wed, 11 Mar 2020 22:56:23 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Alexey Gladkov <gladkov.alexey@gmail.com>
Cc:     linux-sparse@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH v2] Add semantic index utility
Message-ID: <20200311215623.dafdzmub25dlb7za@ltop.local>
References: <20200311172246.59838-1-gladkov.alexey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311172246.59838-1-gladkov.alexey@gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Mar 11, 2020 at 06:22:46PM +0100, Alexey Gladkov wrote:
> sindex is the simple to use cscope-like tool based on sparse/dissect.
> Unlike cscope it runs after pre-processor and thus it can't index the
> code filtered out by ifdef's, but otoh it understands how the symbol
> is used and it can track the usage of struct members.

Great! Thank you.

I've pushed this with 2 small changes:
1) a bunch of s/0/NULL/ to quiet make selfcheck
2) s/st.st_mtim.tv_sec/st.st_mtime/ or comptability.

-- Luc

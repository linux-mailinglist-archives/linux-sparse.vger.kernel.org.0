Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFFB1557EC
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 13:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbgBGMnJ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 07:43:09 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35241 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbgBGMnJ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 07:43:09 -0500
Received: by mail-wm1-f68.google.com with SMTP id b17so2654990wmb.0
        for <linux-sparse@vger.kernel.org>; Fri, 07 Feb 2020 04:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gWN2Ec3AKQ2BMXd1fI+ssPc3LVDJGAb7fD4invdt270=;
        b=Ud0ivBOGvNE6rGXV4wrZpPqM5D7oqtGs49bwuROSzf71f7dqFoQJyA8UZXbFJq0ewU
         +rDeZDxR6Z45cyxTS9dt9VNHTQomKkmoduToER4S33WxVEQIVStH21CjDelkkng+060Y
         QOlI1msm73VfENiQQUmSlSmzLytQsfXRxNHYtbcY1CGwdn+3iuGwgYLHbcDPCM1B7v3f
         gn0NPFcswbOPuJo7L/3YFXhz+yZppair3tS7Cl5Bmnf6DIeHHICDHbtHEi4/ufBaHsZ2
         AvXNGaspkF0w/tW6aZyik8N3xqsVNorpzQ1Dp0FKZ+rJvDGbzm2Bwdw4WNHkWBoC5twD
         HlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gWN2Ec3AKQ2BMXd1fI+ssPc3LVDJGAb7fD4invdt270=;
        b=PBwjC6rBSgbOA3LhQk8zQBxdjWnNuSFF0CbpCajS7zXuHdAa3EAF44COx/V0Vlduv7
         PuT+OGiFma0PviQ+mldGEmiWI96b8OuHYhNr9doieSJ2Xn20lweWDPijdVgh5pDaqL5u
         xg3fPURAaxoYyZNe8t9k9CisY9XeVHT3NnHepHcwWTlpn+Pfd+6KFGLk3opsbYz1eq/l
         YfYiY2BNie3SnDdEOyQ7GNAz5fpHlJTWJ/q5DdB2ire14Ji9cPUm5EAuG3t/MHRQXSdf
         6uPA4YyxOzxv/Rte3YvLWPF+YNMe6Y7rZTMyJUqgB96IchhIw3/kR6UvfdpUWG8UGCsO
         ER5g==
X-Gm-Message-State: APjAAAV2ICuhwcTrKUUwUsNnSozqH/+yUFRORJS4pesG1M9BX5VtmqRp
        76EljpOITPGoUubTMShPGms=
X-Google-Smtp-Source: APXvYqy/7EAPJ/8S/8fcFdJ2pEvOA5FDh2OegCxFr3qfHNUOKDalLWaJ4ouGZY88Q6l7oibQ3Dr7dA==
X-Received: by 2002:a05:600c:2150:: with SMTP id v16mr4193385wml.156.1581079387784;
        Fri, 07 Feb 2020 04:43:07 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:527:d70f:e855:bf1])
        by smtp.gmail.com with ESMTPSA id c13sm3393196wrx.9.2020.02.07.04.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 04:43:06 -0800 (PST)
Date:   Fri, 7 Feb 2020 13:43:05 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Martin KaFai Lau <kafai@fb.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>,
        Arthur Fabre <afabre@cloudflare.com>
Subject: Re: sparse problem with Linux kernel v5.5
Message-ID: <20200207124305.islfnt5kissyv6b6@ltop.local>
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
 <20200206114619.bfszxgs6jmdgroo6@ltop.local>
 <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
 <20200206200610.7ktqp2yzriw7zurx@ltop.local>
 <CAHk-=whEFcgPW8oD=rGGyDiML_7AaCP0DGdW=WXjvF9zAv6Vrg@mail.gmail.com>
 <b6d24fd2-e5b8-7010-86b5-c46f65536eef@kleine-koenig.org>
 <20200207082954.majgsx5trepwb46n@kafai-mbp>
 <f41aa7cb-399d-277b-eda8-4173f45d7123@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f41aa7cb-399d-277b-eda8-4173f45d7123@kleine-koenig.org>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Fri, Feb 07, 2020 at 12:34:02PM +0100, Uwe Kleine-König wrote:
> On 2/7/20 9:29 AM, Martin KaFai Lau wrote:
> > I believe x == 1 needs an extra case since ilog2(0) won't work.
> > 
> > Since this function (map creation) is not on the fast path,
> > I currently opt for Linus's suggestion which its code is more
> > self-explanatory.
> 
> If you put my suggestion in a macro that is called for example
> 
> 	ilog2_roundup()
> 
> you might have both: easier code and self-explanation.

This is, essentially, the same as the existing order_base_2().

Best regards,
-- Luc

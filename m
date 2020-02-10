Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15DF415862A
	for <lists+linux-sparse@lfdr.de>; Tue, 11 Feb 2020 00:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727435AbgBJXcT (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 10 Feb 2020 18:32:19 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54635 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbgBJXcT (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 10 Feb 2020 18:32:19 -0500
Received: by mail-wm1-f68.google.com with SMTP id g1so1187674wmh.4
        for <linux-sparse@vger.kernel.org>; Mon, 10 Feb 2020 15:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CJ36DjuSRNrEkxWjkUpo3ZDuiGObrxU2sBvXXNnPXBM=;
        b=EQ+nPZ/UbbA8hdZCu1zEC24OOzdP+SdHsszcLQ8Wjf3hH+zs6vPFL+CcTM3sYY+M1U
         uPNtwdEl8Ftw2mMYTHOQhSFnHhtLvsaVyViK++PAY3YT4Ex1v2ae0OipA2kAvpSDbmi5
         uD/X/HyNys0gT5GKCZTGfs6IzPArUFLbfxEbSWfKYfmcbKeZLNrYjqh+bh7UYiIJyXA/
         SRX4wZ3mS6SdnVpGfmSIS4O1n06xW8owuU5nBp9IiDWLD1rRkR4zVNp9yd8O4muW4aB8
         54k6Po0Xspef7Y5upXBe6SRrsM7bptXVn93o5c1F9A2TD48W6f4KfTKF6pP3TtuFM6lc
         6V5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CJ36DjuSRNrEkxWjkUpo3ZDuiGObrxU2sBvXXNnPXBM=;
        b=mOSyMFR42Kjw2UJ11Gp3gsE0+QtpqwC5iMPQWn3ISaFhB7YfgSOf2tH9vyALnBpan1
         DqZxGwi50MRJUV9Oj9U/6grZD4i8XZmFrnEB05ttkOCEARe9zQ0ORkIIR/HuErD1Ohb5
         O5saPuIPFznhFRTkccKE3AZsUw0/EeCp3w/DCUoDs+5+pdtGpTitynuyxTmhvpIgjBKu
         vVKIybfpFa5HV3o+fvVScnsQi5KC6kaizwucdSkvV/V7UXIEbmtagnD2AIGCtaURxGM3
         /3DFQ3P6VMgBZqdk0Hes4MXPW2Y20S5I4PIlhTkw38C4tvoU8NNrz5CxaqBZwRsGYP+o
         rTPA==
X-Gm-Message-State: APjAAAWWtryUwgE2yRtx/zIhkBY4EnZIpa9//te8XJYHLCUpbiWZsZ6o
        eqx46YMO9eeGokE0jwYyxkY=
X-Google-Smtp-Source: APXvYqyVGtleL2lqHj/Qm5WDEA2QUWngTly08B1f6w21yBBU3ayA0XozNVHQZRAqtGKWWZMhYkFaiw==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr1488833wmi.112.1581377536253;
        Mon, 10 Feb 2020 15:32:16 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:88eb:de9b:ef09:3843])
        by smtp.gmail.com with ESMTPSA id c15sm2613054wrt.1.2020.02.10.15.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 15:32:15 -0800 (PST)
Date:   Tue, 11 Feb 2020 00:32:12 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH 1/2] dissect: set sym->kind for reporter
Message-ID: <20200210233212.xfsktwxhewxgtvr3@ltop.local>
References: <20200210162018.GA29634@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210162018.GA29634@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Feb 10, 2020 at 05:20:18PM +0100, Oleg Nesterov wrote:
> Change dissect to report ctags-like kind passed in sym->kind.
> Currently only v,f,s and m kinds are possible.
> 
> SYM_UNION doesn't differ from SYM_STRUCT and has ->kind = 's'.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Thanks.
Both patches applied and pushed.

-- Luc

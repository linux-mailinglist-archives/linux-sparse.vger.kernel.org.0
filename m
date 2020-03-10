Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ADD4180476
	for <lists+linux-sparse@lfdr.de>; Tue, 10 Mar 2020 18:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCJRMG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 10 Mar 2020 13:12:06 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36316 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgCJRMG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 10 Mar 2020 13:12:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id s5so12980611wrg.3
        for <linux-sparse@vger.kernel.org>; Tue, 10 Mar 2020 10:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FJJzZwNva0WK2z3sG9gx7/VGarBgA20s/2xShrKG49Y=;
        b=fKPTdd1Aq1APi6WBuAwZV3YDQLuHaahUODOhlWlwFTx6+tQmPjdLAq1vC74cgP1v99
         ATVGpFU2DobY5rH+fdA/cwxhUjk6jS00BhijEN2K5zQc8rNwq/u1eBx/aetgDKp66j/0
         W6BmPnCbr0QoLRPyEPSWW9xglVm3EmwDLi82DrT7UEwg7yLAWcxo0fzQHNiqBjNZfwfn
         +2Ky8uDQjKTslGxScPumYrKhzHy1EQCrvX+bJNBmXfMFG7aXcIps/cCjYfOEMk9SRk4s
         9AZey1pkur53WG0gLCge8vdG8FqUfu4GyQ80Ds8aCgdtmXYVxkTS4WrmTVaV8ZAc6BtT
         1oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FJJzZwNva0WK2z3sG9gx7/VGarBgA20s/2xShrKG49Y=;
        b=nBcGlUhTEsXIfNepZzt1DPBmcnjV53+kF+PbKZkKYhr61L0WsMzXYfPYJhi5x80RI8
         a/p+izGxVquAdWRRoCkNBlnMhYfgqy0nQz5SmEaZpVOaQ/0/v8QkbP8sC6T4XK4OqjhX
         ZHo2xhWU29eZ9fx0y51RhQLKvX0tfevd7kLqjMqO7s7pJ/ugvQ1tayTd9w2Ishygkgic
         jpYkYwdpOGEopuROXSEkM+oQNIcfrJPEsl3V6twodXIfPirqFF5R9y6pmC01A/7G3dxE
         ts9CcTFFWVmRkrwTsjDfQOazuhJNOi1lt60klYs3th98xRHdPXvlzMNlHUkf2TW5GIQN
         ogLQ==
X-Gm-Message-State: ANhLgQ2ESL9njn5V3Dxt/aDJh98jy7skwq6OVdMUHLzqeBuBrVKs8Y2T
        li2VhE6twJvPPoCsWPKcuryCvMOC
X-Google-Smtp-Source: ADFU+vuhL/JsfWLMwxps3lHAT6PlIh5yENFXkYcELiO6s3F7IDVUK/Lt19Ps2JVljRsmhiO4wyXM5g==
X-Received: by 2002:adf:a489:: with SMTP id g9mr22928382wrb.44.1583860324518;
        Tue, 10 Mar 2020 10:12:04 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40bd:500:5d6f:de4:defb:8029])
        by smtp.gmail.com with ESMTPSA id b24sm4856526wmj.13.2020.03.10.10.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 10:12:03 -0700 (PDT)
Date:   Tue, 10 Mar 2020 18:12:02 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Add symantic index utility
Message-ID: <20200310171202.y5rhsydmmbewoarm@ltop.local>
References: <20200309152509.6707-1-gladkov.alexey@gmail.com>
 <20200309223701.dbnej7esb4qp56bm@ltop.local>
 <20200310150713.GB19012@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310150713.GB19012@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Mar 10, 2020 at 04:07:14PM +0100, Oleg Nesterov wrote:
> 
> Annoyingly, this triggers a lot of sparse_error's in pre-process.c:collect_arg().
> And just in case, of course this is not specific to dissect/sindex, ./sparse or
> anything else will equally complain.
> 
> For example,
> 
>   1011  static inline bool page_expected_state(struct page *page,
>   1012                                          unsigned long check_flags)
>   1013  {
>   1014          if (unlikely(atomic_read(&page->_mapcount) != -1))
>   1015                  return false;
>   1016
>   1017          if (unlikely((unsigned long)page->mapping |
>   1018                          page_ref_count(page) |
>   1019  #ifdef CONFIG_MEMCG
>   1020                          (unsigned long)page->mem_cgroup |
>   1021  #endif
>   1022                          (page->flags & check_flags)))
>   1023                  return false;
>   1024
>   1025          return true;
>   1026  }
> 
> leads to
> 
> 	mm/page_alloc.c:1019:1: error: directive in macro's argument list
> 	mm/page_alloc.c:1021:1: error: directive in macro's argument list
> 
> and it is not immediately clear why. Yes, because "unlikely" is a macro.
> 
> Can't we simply remove this sparse_error() ? "#if" inside the macro's args
> is widely used in kernel, gcc doesn't complain, afaics pre-process.c handles
> this case correctly.

I'm quite reluctant to simply suppress it.
My (contradictory) point of view is that it is because it's not
immediately clear there is a problem that the warning is needed
but, OTOH, people and the Standard, want to use macros transparently
so a macro wrapping a function call should behave just like directly
calling the function. And yes both Sparse and GCC seem to be able
to handle this, so it's maybe only a restriction for more primtive
preprocessors. I dunno.

Some arguments/justifications for the arning can be found at:
	https://www.spinics.net/lists/kernel/msg1636994.html

Anyway, only a warning should be issued (I'll send a patch for this).
I also wouldn't mind to add a new warning flag to suppress it,
something like -Wno-directive-within-macro.

-- Luc

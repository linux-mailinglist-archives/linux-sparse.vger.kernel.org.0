Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BACE5CFC37
	for <lists+linux-sparse@lfdr.de>; Tue,  8 Oct 2019 16:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfJHOUC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 8 Oct 2019 10:20:02 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45074 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfJHOUB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 8 Oct 2019 10:20:01 -0400
Received: by mail-ed1-f68.google.com with SMTP id h33so15747159edh.12
        for <linux-sparse@vger.kernel.org>; Tue, 08 Oct 2019 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fGfOXUNpyfJdtEyzV48yKuvOr9RkGSOgb267hkrni6Y=;
        b=dSJMSjOWLtp/Odwtv7jI73QcszSo9JGKezOYaxbSKIHJMvhw4bVSo/u187eMfMjAlN
         AZR0JPNt2CTD56/FnQEq7T+9HCwhvmR/KCf748WHOCfrt9gDQOG+l/5MZlV6iyGfnMv2
         7+VR0RfXHYayoKD64rjRBvDttK349FDiYl7ZpK3FMsHpLrAOad+PeE8c5N1Km4ShH9uh
         swpesrrX8a3oAdVflFGZ59t4aHGLh9BXBwIRQwwp3n55pBzt7x8wEfzJaEc8fNefGNy0
         rh2qXujiFwzwlV0/fc+JJThUVqPuu8OAgAUS7E2umcyPByNYUtBl/5DI1gih5kw2b4bh
         a6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fGfOXUNpyfJdtEyzV48yKuvOr9RkGSOgb267hkrni6Y=;
        b=CfwJy4D0PxZU2Rxy3k00LpTTCwZcIvmH77dceX0WTS19zRkom25IpI4FDl1xqIXBHo
         lqVPQSdB6CiJBrRNAzieBBSMhMipjDlIBTw8U2xl8nzPniDoZYWpcfLyNFeKBruwT06A
         sYveEsOMt7HkXon6Mjco6r3RIm5f1etsxsdXtOrs8hnhXsgkcOVsEj/l6Q/qqUxp1N1n
         2XSyNA+cuBAfJaiqRc2UQgHgfMwcy2uVN40w1jVRbSUWK+qXh2RQrV/bNKFRDCFGmZ9Z
         iTU8iilfGqAirTawc44rp1QBysATdYQg0xXBOL+hrdJSpjmkMmGV2OXUUJNLGnUIFxpm
         L2ow==
X-Gm-Message-State: APjAAAU8cYPM8P7uxatkSZqp0IRqguvyN0i0SghxWYEMCsV53X2Kw6Mj
        0xTHFt9+W9fQilZoMribIv+le9UE
X-Google-Smtp-Source: APXvYqz8wdACm5+6vr4s7GjKzpDZpVH5/7poh1etjobCYmpI1U+x1PTfCbKoj2DrtIf4SG28pzlKbA==
X-Received: by 2002:a17:906:3746:: with SMTP id e6mr28005299ejc.238.1570544400102;
        Tue, 08 Oct 2019 07:20:00 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4080:1900:cd28:668a:a4f2:c772])
        by smtp.gmail.com with ESMTPSA id y11sm2310464ejq.33.2019.10.08.07.19.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 07:19:59 -0700 (PDT)
Date:   Tue, 8 Oct 2019 16:19:58 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: possible incorrect warning in arch/arm/mm/dma-mapping.c
Message-ID: <20191008141957.zwttg3m53zf6yzx6@ltop.local>
References: <2f387b99-3f23-47ec-75ea-00d6739e8f98@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f387b99-3f23-47ec-75ea-00d6739e8f98@codethink.co.uk>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 08, 2019 at 09:04:59AM +0100, Ben Dooks wrote:
> We see the following when building arm kernel:
> 
> arch/arm/mm/dma-mapping.c:738:52: warning: Using plain integer as NULL
> pointer
> 
> The function starts with:
> 
> static void *__dma_alloc(struct device *dev, size_t size, dma_addr_t
> *handle,
> 			 gfp_t gfp, pgprot_t prot, bool is_coherent,
> 			 unsigned long attrs, const void *caller)
> {
> 	u64 mask = get_coherent_dma_mask(dev);
> 	struct page *page = NULL;
> 	void *addr;
> 	bool allowblock, cma;
> 
> 
> The line at 738 is:
> 
> 	cma = allowblock ? dev_get_cma_area(dev) : false;
> 
> 
> Which looks fine, dev_get_cma_area() takes a "struct device *" so not
> sure where sparse can be finding an integer, as cma and allowblock are
> both "bool" types.

Since the first side of the conditional (dev_get_cma_area()) returns
a pointer, the second side is also expected to be a pointer.
But here it's 'false' that is given, an integer of value 0, hence
the warning.

I agree, the message is very unclear and it would be better, to have
a message like: "mixing pointer & integer in conditional expression".

Best regards,
-- Luc

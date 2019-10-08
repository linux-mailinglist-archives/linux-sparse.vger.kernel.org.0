Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A78FCF480
	for <lists+linux-sparse@lfdr.de>; Tue,  8 Oct 2019 10:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbfJHIFB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 8 Oct 2019 04:05:01 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:44228 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730414AbfJHIFB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 8 Oct 2019 04:05:01 -0400
Received: from [167.98.27.226] (helo=[10.35.6.110])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iHkUO-0000wF-08
        for <linux-sparse@vger.kernel.org>; Tue, 08 Oct 2019 09:05:00 +0100
To:     linux-sparse@vger.kernel.org
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Subject: possible incorrect warning in arch/arm/mm/dma-mapping.c
Organization: Codethink Limited.
Message-ID: <2f387b99-3f23-47ec-75ea-00d6739e8f98@codethink.co.uk>
Date:   Tue, 8 Oct 2019 09:04:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

We see the following when building arm kernel:

arch/arm/mm/dma-mapping.c:738:52: warning: Using plain integer as NULL 
pointer

The function starts with:

static void *__dma_alloc(struct device *dev, size_t size, dma_addr_t 
*handle,
			 gfp_t gfp, pgprot_t prot, bool is_coherent,
			 unsigned long attrs, const void *caller)
{
	u64 mask = get_coherent_dma_mask(dev);
	struct page *page = NULL;
	void *addr;
	bool allowblock, cma;


The line at 738 is:

	cma = allowblock ? dev_get_cma_area(dev) : false;


Which looks fine, dev_get_cma_area() takes a "struct device *" so not
sure where sparse can be finding an integer, as cma and allowblock are
both "bool" types.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

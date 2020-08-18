Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6F96248F79
	for <lists+linux-sparse@lfdr.de>; Tue, 18 Aug 2020 22:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgHRULq (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 18 Aug 2020 16:11:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgHRULp (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 18 Aug 2020 16:11:45 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C85C061389
        for <linux-sparse@vger.kernel.org>; Tue, 18 Aug 2020 13:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=4QOqJmtwzB4YA0aya7FbxNJbfecuZXtoVauDIRL7TMQ=; b=IfoE56KP1TCsRWvqqF/77OqcH0
        dcQVCGydZs6xPkEUb1PJ1Bcve14FoKsaRYghKACf/Y+y3IYGqF0QAvrfJWFDuYenbRKQ1DNuyfvP0
        0kWSSaoHHVmUPnsvsOJGtWqmzMYeNh3TCzemH9U1XlUDURyqHh/fYJI7VwgaFMWQ2f11n5RuCCdb/
        /C+hUEoH+VDzqplEKvmniUDjJhpGjJF8T04k7UldEdGhc/ygCMGCFHZn1rMXV1+nb+XBqFgFZhaxA
        AMktFJx4UBVTp/JF910+kzP1Bn8cd35S9thKla9h6ti9JzkODivHjP8c9rHZC7F7Gh5rE0kONoRj0
        A4WoDlrQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k87xO-0005Sx-Tw; Tue, 18 Aug 2020 20:11:43 +0000
Subject: Re: sparse problem with duplicate __iomem?
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
References: <bdbcbf14-07b1-76e1-faee-4d27225778e5@infradead.org>
 <20200818192333.jal3gsdgz2mnhssr@ltop.local>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7fcb4469-2f5e-e4f3-087a-a115c1f27292@infradead.org>
Date:   Tue, 18 Aug 2020 13:11:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200818192333.jal3gsdgz2mnhssr@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 8/18/20 12:23 PM, Luc Van Oostenryck wrote:
> On Tue, Aug 18, 2020 at 11:09:52AM -0700, Randy Dunlap wrote:
>> Hi,
>>
>> On kernel 5.9-rc1, either i386 or x86_64 builds, I am seeing these
>> sparse warnings:
>>
>> ../drivers/gpu/drm/ast/ast_cursor.c:256:26: CK: warning: duplicate [noderef]
>> ../drivers/gpu/drm/ast/ast_cursor.c:256:26: CK: error: multiple address space given: __iomem & __iomem
>>
>> for this source line:
>>
>> 	u8 __iomem *dst, __iomem *sig;
>>
>>
>> Should one of those __iomem-s be removed?
> 
> I think so. It's a bit like writing
> 	int const *a, const *b;
> or
> 	int unsigned *a, unsigned *b;
> 
>> I.e., does "__iomem" apply to everything after it, up to the ending ';',
>> or just up to the next comma ','? 
> 
> The (simplified) syntax for declarations is:
> 	declaration:
> 		declaration-specifiers [init-declarator-list] ;
> 	init-declarator-list:
> 		init-declarator
> 		init-declarator-list , init-declarator
> 	init-declarator
> 		declarator
> 		declarator = initializer
> 	declarator:
> 		[pointer] direct-declarator
> 	pointer:
> 		* [type-qualifier-list]
> 		* [type-qualifier-list] pointer
> 	direct-declarator:
> 		identifier
> 		...
> 
> Essentially, attributes are type modifiers, some acting like
> qualifiers and others are more like specifiers. But qualifiers
> and specifiers are never allowed directly after the comma because
> they appertain to the declaration-specifier part of the declaration.
> So, yes, the first __iomem applies to the whole declaration and
> the second one should be removed.
> 
> But maybe it's not 100% clear and the best should be to use a
> separate declaration for each variable?

Yes, that was my patch plan. :)

Thanks for the explanation.

-- 
~Randy


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0532111FAAF
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 20:13:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfLOTNN (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 14:13:13 -0500
Received: from avasout04.plus.net ([212.159.14.19]:50591 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfLOTNN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 14:13:13 -0500
Received: from [10.0.2.15] ([87.115.253.35])
        by smtp with ESMTPA
        id gZKIiUcJO4Al0gZKJiECM2; Sun, 15 Dec 2019 19:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1576437191; bh=rfleCZJAlXVsL3+Uz0SW/qYO3P1T/QPP6Zb+ESFGKJI=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=HSM+cZxlaj9lsMKhe55ozHk1WwC16OJ1SfhFM4+RJwVnF8xSfb0Q02XkJGPn8uXVg
         l6grYILV1x3gsxLqKyXva90M/0Pq1DTszGg/qZHakr89s7JhHZWI69g27C8ctAJCHQ
         bvw6ZhGtiUL4QCQyaSyFOiyU5lxfqPWamaMPN3te/EFqCdOLMoyBTwBZUB3dMXLYyu
         uTXdUbEZkU12A+cLZuWonuMMnusEdlT/VDRh0z+xgHiP3AZIHi83vnTRs+BL6TB7Qg
         smfpMrISivDwmaFaZ833yxlMKDRt68kVENebUh/ICdZCzdsJ4UpU+zXMAAQbZn6c+r
         L5sRVa/x6Sw8g==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=VLDPgNmCULccAgTy/RRLiQ==:117 a=VLDPgNmCULccAgTy/RRLiQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=RfCuGsjinwPaJL1M28UA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 2/4] typeof: do not let classify_type() do its own
 SYM_TYPEOF expansion
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
 <20191215110425.76533-3-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <0cc99807-a1d4-fa0e-0780-0b0feda53c29@ramsayjones.plus.com>
Date:   Sun, 15 Dec 2019 19:13:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191215110425.76533-3-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLFsEuJOe2kZmiyEzcIOjxtiGIT/IO7sgNBSBQ7xY0Nnj1OPlsGS+vW26YNScpdsTNhip01LY+9Mh1vQL/0ULi8L6ffm6fSCI+B+W8++M/XTJJ7+md6E
 4uBoSoupZ9ViWT8xbufQ+K8OTeTD2OUBz/XR7Hp4WBRh0D/D855eAAhi98FzxrfZVZpVr3pHxHe9Yw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 15/12/2019 11:04, Luc Van Oostenryck wrote:
> SYM_TYPEOFs are expanded at examination type.

s/type/time/ ?

ATB,
Ramsay Jones

> However, classify_type() does its own expansion of SYM_TYPEOFs.
> Worse, it does this differently (address space & noderef are
> not removed)..
> 
> So, to enforce the same expansion, also use examine_symbol_type()
> to do the expansion in classify_type().
> 
> Note: it's not sure that it's currently possible to have
>       SYM_TYPEOFs to expand in classify_type().
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  evaluate.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/evaluate.c b/evaluate.c
> index 539ef8038587..038fd64ace9e 100644
> --- a/evaluate.c
> +++ b/evaluate.c
> @@ -383,10 +383,8 @@ static inline int classify_type(struct symbol *type, struct symbol **base)
>  	if (type->type == SYM_NODE)
>  		type = type->ctype.base_type;
>  	if (type->type == SYM_TYPEOF) {
> -		type = evaluate_expression(type->initializer);
> -		if (!type)
> -			type = &bad_ctype;
> -		else if (type->type == SYM_NODE)
> +		type = examine_symbol_type(type);
> +		if (type->type == SYM_NODE)
>  			type = type->ctype.base_type;
>  	}
>  	if (type->type == SYM_ENUM)
> 

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E67581F7179
	for <lists+linux-sparse@lfdr.de>; Fri, 12 Jun 2020 02:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgFLAuX (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 11 Jun 2020 20:50:23 -0400
Received: from avasout06.plus.net ([212.159.14.18]:60824 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgFLAuX (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 11 Jun 2020 20:50:23 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id jXtkjFLcGkvt5jXtljVmCj; Fri, 12 Jun 2020 01:50:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1591923021; bh=kOI3zmeRf1nsPymLjKuI/tHRmygXW3mfDIgwJIkNYoE=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=pm8hFnn3BiofrJLFCyClmcqZGbU97416q0/W818CqFDDQcIsyssuy5Q6l1cqg1vWg
         XU6/T4PFG5QTOguBN9QMXpnBrw3C3EONRjaeHaHvtblj/wizI7tJDvsjguUQ95B0JZ
         pJlX7RIoOAfQCoLw6xEx5kWuoAGSqe7hdiOdC1ITI2G86OYJ8e18797zIQovggcpRs
         dxDrjB0Q3TTKX3t8GBef1INzi5+WLJHEx1BwX/ApxbQSrYWTIGytBXIkjMdaEDLFSE
         8vlr8vijt4/oHh7Sqq3rxJXAlYOZWVRDoenJ9Sjam/r/HfVCfXE6DsU5lCdeXQl/Pq
         PKEOr3w3R4FCQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ENCdL2RC c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=XBiEw14uJ8l0-JM9qNsA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 1/7] builtin: can be initialized later
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20200610202735.84968-1-luc.vanoostenryck@gmail.com>
 <20200610202735.84968-2-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <93a18dfc-2cd1-2b90-7bda-ad7ce7a5197d@ramsayjones.plus.com>
Date:   Fri, 12 Jun 2020 01:50:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200610202735.84968-2-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMGqMdQm9VjOgIfSHoio/Xe22HM2Olg4OxHVYOQxz9fvTGHyy8jf8uOyTZ8tWoJDZso5ritYe8HRLx9T9MbvK3seOLX6ziuIKBwpdwZC2Q2zo05H0pgt
 HF7mO16AQvJLRLyx0FNMDyX1HC7YLrH2o/dnYIKZbI4+Lb8ozQ+I51Fqx7iUAyin/iJkPDIUwtANCA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 10/06/2020 21:27, Luc Van Oostenryck wrote:
> The itialization of the buitins can be done later,

s/itialization/initialization/

> after that the types have been initialized.

s/that the/the/

> 
> So move the call to init_builtins() to just before declare_builtins().
> This will allow some other small improvements.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  lib.c    | 1 +
>  symbol.c | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib.c b/lib.c
> index 8f071bfe96ef..aa1c1d656b9d 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -1595,6 +1595,7 @@ struct symbol_list *sparse_initialize(int argc, char **argv, struct string_list
>  
>  		predefined_macros();
>  		create_builtin_stream();> +		init_builtins(0);

Hmm, if memory serves (and it may not) doesn't declare_builtins()
also assume stream zero - but it had a FIXME comment against it.
So, should this new call also have a FIXME? ;-)

I think the last time I looked in the debugger, the first call to
init_stream() was for the 'builtins' - so it seems that it would
always be stream 0, but has this changed the relative location of the
init_stream() calls that would invalidate this?

Hmm, I guess not - the builtin init_stream() call was in the
sparse_initialize() call, if memory serves. Also, I guess it would
only affect the stream field of the builtin symbol token, so ...

So, ignore my rambling ... :-D

ATB,
Ramsay Jones

>  		declare_builtins();
>  
>  		list = sparse_initial();
> diff --git a/symbol.c b/symbol.c
> index 7044ab3f78ce..6ee521ba48d8 100644
> --- a/symbol.c
> +++ b/symbol.c
> @@ -783,7 +783,6 @@ void init_symbols(void)
>  #include "ident-list.h"
>  
>  	init_parser(stream);
> -	init_builtins(stream);
>  }
>  
>  // For fix-sized types
> 

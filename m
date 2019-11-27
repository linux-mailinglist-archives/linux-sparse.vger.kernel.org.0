Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5598C10B303
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 17:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfK0QOB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 11:14:01 -0500
Received: from avasout01.plus.net ([84.93.230.227]:44154 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbfK0QOA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 11:14:00 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id Zzx0igV4TSXPqZzx1iGmHW; Wed, 27 Nov 2019 16:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574871239; bh=mMTf5JHvFusiyGtrUy5jHW9if76X6o707FObasHxXKc=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=qJJFwcAjceaUwRSTSSOSib81iTbSFErM977sswjbuwx/CLkt68gbZw7fqRYcg+plT
         oC/E2IB7+V4VMiGOpVb6EjlPkMXrfmW5wXzaM3vz4D7El3piKVGCedO76/vwkJdrYG
         KPbGGembim7aP+0sCxwaQDio+3sKOuN3ne8D8Yx9zsjcabs0qc9Wj778tkME5dwAFT
         j8qq87tPXAEpw5bYmkZ1paj2xJEjxuXabLNUPskpwsp6WWTpPtf1gwQzWX8Z+IeKih
         eNem0ZYd0+GWksWD8SuiPQDLyA5BE6cLFkk3MmxoCmFoF35qOaN6ik951O3DEpzVpv
         rwi+LE/wmslPw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=U/js8tju c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=gpEs0YPyKwebGhsdersA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v2 06/12] arch: char32_t should be the same as uint32_t,
 not uint
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
 <20191127020643.68629-7-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <7eb6f039-c5d0-605b-b05d-16465fff07ad@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 16:13:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127020643.68629-7-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAgyodhbRU5fARfZSicRGFGEHMbIhbdgEH/55qgWNOa/zEpAMhoyYdjrT10u6UQZA0cXOUkcscJP2sEWpv2EmItTj5oacFupmnNCxf+i9rMbjMBFwMPy
 mnx/wYvsVdarbym8AqPbifqkkXWl8ObvujXtDJAVeQeYUxDY2vtu8f8Lj9PCnbjmIPl30zUm3V+jfg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 02:06, Luc Van Oostenryck wrote:
> When the predefine for char32_t was added, it was made to
> correspond 'unsigned int' with the commit message saying
> some archs use 'unsigned long'. In fact, it appears that
> there char32_t is always uint32_t (on the archs & OSes

s/there char32_t/the char32_t type/ ?

ATB,
Ramsay Jones

> I'm using to look at this).
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  lib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib.c b/lib.c
> index 57d2738bf..f9e7caf4a 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -1418,7 +1418,7 @@ static void predefined_macros(void)
>  	predefined_ctype("WCHAR",      wchar_ctype, PTYPE_ALL_T|PTYPE_MIN|PTYPE_TYPE);
>  	predefined_ctype("WINT",        wint_ctype, PTYPE_ALL_T|PTYPE_MIN|PTYPE_TYPE);
>  	predefined_ctype("CHAR16",   &ushort_ctype, PTYPE_TYPE);
> -	predefined_ctype("CHAR32",     &uint_ctype, PTYPE_TYPE);
> +	predefined_ctype("CHAR32",    uint32_ctype, PTYPE_TYPE);
>  
>  	predefined_ctype("INT",         &int_ctype, PTYPE_ALL);
>  	predefined_ctype("LONG",       &long_ctype, PTYPE_ALL);
> 

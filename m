Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3709E10E27E
	for <lists+linux-sparse@lfdr.de>; Sun,  1 Dec 2019 17:17:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbfLAQRw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 1 Dec 2019 11:17:52 -0500
Received: from avasout04.plus.net ([212.159.14.19]:46115 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfLAQRw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 1 Dec 2019 11:17:52 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id bRuui7WUk4Al0bRuwi5Sre; Sun, 01 Dec 2019 16:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1575217070; bh=8nNEGhkddKKYxsP+LjK/gDI+OdLNmVi9SlxCwzm3n60=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=sRn5fa3VxHe1urd3mJgVnFnwjrUKJxqkvMIyqSGO/PYr0DlMiomzvNi9XsKLO9QHj
         q9FqtGSsMEY3/5pbaAppgPii/Viwn2arwE+pq3qmpYnGFU1oBjoYfD8CvSs5/xUtf8
         kDpIxrIHRLitaIY5AaDdlc2POl47oG2aiy9aYiFISV7bLq1a39vYt4IhLk7dPqeUHM
         xKr171XphL4bqWWL70RigpkoM7ZPMlIQ2lfNhaOjm16jpS4GlamS94jjLRNqToHdqz
         K528+xJvB0/4YNuzPuy3cMnU3QIpeIJ9DMGLD5sTYdSR3UdihFoWMyeRrWznI2gZod
         AQvvKjSMPD4Xw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=0B6lBDI9X-RoQM9EfOAA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 4/7] reorganize the __STDC_VERSION__/__STRICT_ANSI__
 switch statement
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
 <20191128204225.7002-5-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <d0872bbe-394c-6cbc-023d-e443ce60017c@ramsayjones.plus.com>
Date:   Sun, 1 Dec 2019 16:17:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128204225.7002-5-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOf5QwhusQA3Nb97dJqUhjensFq0B951PeW+FZxwDUyyCcJPVGwARIQlCIflnFKimHGPEEv9+4IwXnvjNrMawI4FBGJV0uT1FoZgb4C0igzyZVdLWvcq
 6IqaSeVdHQ4rzqwEMv5qfFN2qa/a2/LpxXuUK0SzD6WlYMlRdhpseXpH4WmpXIEAvIFo4iDblMwR1w==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 28/11/2019 20:42, Luc Van Oostenryck wrote:
> Move some of the cases so that each STANDARD_GNU* is just
> under the its corresponding STANDRAD_C*.

s/STANDRAD_C/STANDARD_C/

ATB,
Ramsay Jones

> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  lib.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/lib.c b/lib.c
> index 97d8af390..02f6231e2 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -1405,24 +1405,21 @@ static void predefined_macros(void)
>  
>  	predefine("__STDC__", 1, "1");
>  	switch (standard) {
> +	default:
> +		break;
> +
>  	case STANDARD_C89:
>  		predefine("__STRICT_ANSI__", 1, "1");
> +	case STANDARD_GNU89:
>  		break;
>  
>  	case STANDARD_C94:
> -		predefine("__STDC_VERSION__", 1, "199409L");
>  		predefine("__STRICT_ANSI__", 1, "1");
> +		predefine("__STDC_VERSION__", 1, "199409L");
>  		break;
>  
>  	case STANDARD_C99:
> -		predefine("__STDC_VERSION__", 1, "199901L");
>  		predefine("__STRICT_ANSI__", 1, "1");
> -		break;
> -
> -	case STANDARD_GNU89:
> -	default:
> -		break;
> -
>  	case STANDARD_GNU99:
>  		predefine("__STDC_VERSION__", 1, "199901L");
>  		break;
> 

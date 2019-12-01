Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAE510E296
	for <lists+linux-sparse@lfdr.de>; Sun,  1 Dec 2019 17:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727231AbfLAQZc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 1 Dec 2019 11:25:32 -0500
Received: from avasout04.plus.net ([212.159.14.19]:46532 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726789AbfLAQZc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 1 Dec 2019 11:25:32 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id bS2Mi7WwL4Al0bS2Ni5T1C; Sun, 01 Dec 2019 16:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1575217531; bh=0q8vDD32G0k4YBnDfuDz8qWY3fl3owldKszMWTIRwIs=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=svIA3LrXV76+awiR65wbepAJRYHDkQAn/8wL6mC9QnqvgR5VsMqFjCM/UbsHNtCyo
         E+iaMJAwnCNq08+RXPIU2B/aUh0bNWLhSpj6kX4nvDmckk8tMKqD8SH5xvYmVJwtVB
         ddMN5NIFprAG8Qz8lmg7qrQ5X/mpK2kXD7PTbDg/FHwa/keFb6OfzXjOe7Tczg2JJ6
         Jh0Ap94+q2HEsgzeqCOxCboJrYTpSIdl/TOCjuARKfc5q3sobvoiFnpda7sLrpZExG
         UECP0WQU8Vas90G8i3Yb2vmmv+ll0benr+/K3srSUwHMpq8Nw55/BPuHIOBYzdrbzQ
         CccbvAFjZ1vUg==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=AtHW6sTSTuk3QGEHC9EA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 7/7] teach sparse about C17
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
 <20191128204225.7002-8-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <0d75af25-61b7-faee-fd36-eb7b1e3fa5e4@ramsayjones.plus.com>
Date:   Sun, 1 Dec 2019 16:25:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128204225.7002-8-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPHeKxxJ5O5U9qS8ZmFOzYRvH6piHxaGhIAPgke9bjeXO+ndkbiKdaRhXvMy+/wRLMW5raK2a8HAw4qqz+cJHldKMquEME4GRsCvEkitUSZI88E8hw0D
 R2UQeWLOhvsMa/7Iyx3Vjyq0E6Htes1saBvgSiN/9Jm8PWQSRGsoasGYCyoFvFbO+y8t7MlDOjQSSA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 28/11/2019 20:42, Luc Van Oostenryck wrote:
> No real support is done here (or is needed) but the __STDC_VERSION__
> will return the correct value.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  lib.c | 13 +++++++++++++
>  lib.h |  2 ++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/lib.c b/lib.c
> index 7f7ca846b..8fddae450 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -1079,6 +1079,15 @@ static char **handle_switch_s(const char *arg, char **next)
>  		else if (!strcmp(arg, "gnu11"))
>  			standard = STANDARD_GNU11;
>  
> +		else if (!strcmp(arg, "c17") ||
> +			 !strcmp(arg, "c18") ||
> +			 !strcmp(arg, "iso9899:2017") ||
> +			 !strcmp(arg, "iso9899:2018"))
> +			standard = STANDARD_C17;
> +		else if (!strcmp(arg, "gnu17") ||
> +			 !strcmp(arg, "gnu18"))
> +			standard = STANDARD_GNU17;
> +

Yes, I knew about C17, but out of nowhere I started hearing
about C18! ;-) As far as I can tell, this is just C17, but
because it crept into 2018 before final approval, come people
are starting to call it C18. However, the __STDC_VERSION__
value is still 201710L, right?

ATB,
Ramsay Jones

>  		else
>  			die ("Unsupported C dialect");
>  	}
> @@ -1421,6 +1430,10 @@ static void predefined_macros(void)
>  	case STANDARD_GNU11:
>  		predefine("__STDC_VERSION__", 1, "201112L");
>  		break;
> +	case STANDARD_C17:
> +	case STANDARD_GNU17:
> +		predefine("__STDC_VERSION__", 1, "201710L");
> +		break;
>  	}
>  	if (!(standard & STANDARD_GNU) & (standard != STANDARD_NONE))
>  		predefine("__STRICT_ANSI__", 1, "1");
> diff --git a/lib.h b/lib.h
> index 7958359c1..3e565c6fd 100644
> --- a/lib.h
> +++ b/lib.h
> @@ -235,6 +235,8 @@ enum standard {
>  	STANDARD_GNU99 = STANDARD_C99 | STANDARD_GNU,
>  	STANDARD_C11,
>  	STANDARD_GNU11 = STANDARD_C11 | STANDARD_GNU,
> +	STANDARD_C17,
> +	STANDARD_GNU17 = STANDARD_C17 | STANDARD_GNU,
>  };
>  extern enum standard standard;
>  
> 

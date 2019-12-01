Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A1610E27F
	for <lists+linux-sparse@lfdr.de>; Sun,  1 Dec 2019 17:19:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfLAQT4 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 1 Dec 2019 11:19:56 -0500
Received: from avasout04.plus.net ([212.159.14.19]:46230 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfLAQT4 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 1 Dec 2019 11:19:56 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id bRwwi7Wbz4Al0bRwxi5SuS; Sun, 01 Dec 2019 16:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1575217195; bh=VQcLqhjcHPLV7M9uSAFOP9yKX1U+G5dgzIEghPPMp6Y=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=mTudry1ePlQ8COY4LJW6XHSX2FN5+qrb0uh8BmFriZP6ePR3nQhe3thOAUEaJEWmQ
         X74SarhI2yvWxFHHdmGPu20y8nQFrDyyPhkyaJWBB4+7SbaCdv7fQRJbj7+XYhqByk
         iw+nvUGA7DMBtJnQwqD3hixrY8DjylMGetJ/i1bE+0lx1fN0iaMvFtsMX0W0PEIBfs
         IewDLowqKG2lXNsTiGhmwWtLk6WENfYiu/onAn/oYcQWtdUJ/b8nuenJV8gY0Z2VGc
         8gWNwiIXDzwXogS4uTqbV43iSV5jmJJZfmLaXEA7DuABUQhd6j6OxKSWXsKk8u5zKK
         wbmb1eCLLyRaw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=Ig8sWwT68_uWWTYS4U0A:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 5/7] simplify definition of __STRICT_ANSI__
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191128204225.7002-1-luc.vanoostenryck@gmail.com>
 <20191128204225.7002-6-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <79778e18-f7f4-1070-c57f-9e19fdc17927@ramsayjones.plus.com>
Date:   Sun, 1 Dec 2019 16:19:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128204225.7002-6-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK0BVLvL7pHwCJGeWYqaTZ60vpSt9wXWtaZeS1OZLJ0tK4om8VA+ITBtzEGG5ENW0gw01FgNp+qLX4xsbY2MAYRoSDJZrSN6MiXR7LJi+83Ykk7JoyDQ
 cWwPSCpkkhznTd1GZ7ypds/IW9hryKERqT5JD8NVHXPyntWH0Nd1qyt4Pwy3PS7Qpy+u8bEpct2pIw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 28/11/2019 20:42, Luc Van Oostenryck wrote:
> Currently, the definition of __STRICT_ANSI__ is done in the same
> switch statement used for __STDC_VERSION__. However, this lead to
> some repetions that can be avoided if moved outside of the switch.
> 
> Move the definition of __STRICT_ANSI__ out of the switch statement
> and guard it by testing the absence of STANDARD_GNU.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  lib.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/lib.c b/lib.c
> index 02f6231e2..d232b8cee 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -1408,24 +1408,16 @@ static void predefined_macros(void)
>  	default:
>  		break;
>  
> -	case STANDARD_C89:
> -		predefine("__STRICT_ANSI__", 1, "1");
> -	case STANDARD_GNU89:
> -		break;
> -
>  	case STANDARD_C94:
> -		predefine("__STRICT_ANSI__", 1, "1");
>  		predefine("__STDC_VERSION__", 1, "199409L");
>  		break;
>  
>  	case STANDARD_C99:
> -		predefine("__STRICT_ANSI__", 1, "1");
>  	case STANDARD_GNU99:
>  		predefine("__STDC_VERSION__", 1, "199901L");
>  		break;
>  
>  	case STANDARD_C11:
> -		predefine("__STRICT_ANSI__", 1, "1");
>  	case STANDARD_GNU11:
>  		predefine("__STDC_NO_ATOMICS__", 1, "1");
>  		predefine("__STDC_NO_COMPLEX__", 1, "1");
> @@ -1433,6 +1425,8 @@ static void predefined_macros(void)
>  		predefine("__STDC_VERSION__", 1, "201112L");
>  		break;
>  	}
> +	if (!(standard & STANDARD_GNU) & (standard != STANDARD_NONE))

s/) & (/) && (/

ATB,
Ramsay Jones

> +		predefine("__STRICT_ANSI__", 1, "1");
>  
>  	predefine("__CHAR_BIT__", 1, "%d", bits_in_char);
>  	if (funsigned_char)
> 

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 983CC10B3F5
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 17:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfK0Q55 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 11:57:57 -0500
Received: from avasout03.plus.net ([84.93.230.244]:40072 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfK0Q55 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 11:57:57 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id a0dXiKM6IKleZa0dYim7YA; Wed, 27 Nov 2019 16:57:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574873876; bh=2MsY5HPTrFDeDwBj0zQs/FqBPo6VPdPJE3HtCP6hbyY=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Kb2g1I56ClHHKD4LpJBA0nR523H++L0Ep1fPj8MuNCHa8XSA8iOep+/l1driizy9V
         VF0eqtJdCvQVCnKaaodHA5dWli3WEkwur+Li5wmyEqas3KLZ0xFWBUOchHPGIfxwjw
         g+rpmuuuQa6k3mHDr5dDs1TQNxlD/JWfdCWgoxOa9I0jtsX/RcAUy1UeRYJcad6VZI
         VfFyMsWzMC4MOOAklV00q1Ya6IMJOpN9XIOU795thJ/OyhqtX+pW9pYCrRFpHLIRpm
         kTNf5ePmLbDIQylAahuLZ92f+bdHaHb7b5bxWbodKQ4QOqmsjEv9Z4P+VKujONfAYY
         GDAhYcQN9KJtQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=v-g_USLOrZrd0eY6KwQA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 2/4] arch: add missing predefines for PPC
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
 <20191127022351.68902-3-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <f414abb9-af3f-2509-bac1-1dbfc4453862@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 16:57:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127022351.68902-3-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfO3eZjNtzLWvlYgHo2HzAv8nn3ubOG7iuCuXZlFrp4mrnXrmNJyooMnnzDgWSFASS1NdrNhLsmEnIWr5cNRZzPnOR1oDevKw2m/KjFtIwvEgStmCwvq5
 YxRbqO9qDOTliym1HEJ8dLEYq8pWXclXlQ2oFH8xpjQ4Nq4Bg5LoyM2S6qz9wl49DxrZCDjAnwBb3w==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 02:23, Luc Van Oostenryck wrote:
> The macros __PPC, _ARCH_PPC & _ARCH_PPC64 are predefined by
> GCC for powperpc (well, it seems __PPC isn't anymore but
> it was, at least on my old tolchain for ppc32).

s/tolchain/toolchain/

ATB,
Ramsay Jones

> 
> So, do the same here too.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  lib.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib.c b/lib.c
> index 28ca49c7c..f0b546889 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -1574,12 +1574,15 @@ static void predefined_macros(void)
>  		predefine("__powerpc64__", 1, "1");
>  		predefine("__ppc64__", 1, "1");
>  		predefine("__PPC64__", 1, "1");
> +		predefine("_ARCH_PPC64", 1, "1");
>  		/* fall-through */
>  	case MACH_PPC32:
>  		predefine("__powerpc__", 1, "1");
>  		predefine("__powerpc", 1, "1");
>  		predefine("__ppc__", 1, "1");
>  		predefine("__PPC__", 1, "1");
> +		predefine("__PPC", 1, "1");
> +		predefine("_ARCH_PPC", 1, "1");
>  		if (arch_big_endian)
>  			predefine("_BIG_ENDIAN", 1, "1");
>  		break;
> 

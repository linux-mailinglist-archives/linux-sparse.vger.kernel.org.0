Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE9E1DA6A9
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 02:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726898AbgETAdL (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 20:33:11 -0400
Received: from avasout02.plus.net ([212.159.14.17]:60558 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbgETAdL (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 20:33:11 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bCfUjxVbTU8CkbCfVjjRxk; Wed, 20 May 2020 01:33:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1589934789; bh=QMZFUYh8iqoScWpoEoaz6L/RrAWlXA1svF5MqDP8yiw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=gu60zhbhd366tAZYKANFYGxC8CMuKJF2w1HFpebi/YqKO8ZX/qk1ayyKJhw2bZVNy
         BhXRMJoHtmTpxOKVSgEH6pUWcLFvUhlwf7jsM/bP8DiTmhr5sIgeDnlQZukLKmvuX5
         e0YGxEQTgFxjW6KatyjnCCq84ZDXEu6zXL6QJEkWWAnyTVKyaDwQC+6HuBx4XR96y8
         OtHxn027nDaAGF5JxWoqeN2rtMdRzQUyfTkTbof5GMeEkXS1pcLImBObY07QrNU/Io
         Nvt9lJ3Rxqy/aeCgtvP7qadcSU0zRulG35t/2RjtiPvwtvxDc4rMeYNeNAP1ihlNM7
         i3x4XzGUNUgVA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=UUcl49-FmSmkLXLzYOUA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v1 01/28] misc: fix testcase typeof-safe
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-2-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <422723ea-00aa-ee89-72aa-f4dddbd8da06@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 01:33:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519005728.84594-2-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBiwRRhmCKGBVFbbJgFE591pXktw1FqWdNgdUnNM678TYj9XlLGtLc1OAP5YU6UfHgHMUYp6KKpNJYbzGS8STV3wFGvFuc4eMtKY8aY1JMIGvHmtIazg
 eN6Dgp7Fs3MpvK98DZ/TX7TL9kgJf08oBbMlQDM+A6+r3Xspg47tjHfHOn2M+rCj8stIp7ZEx92stA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> This testcase was marked as known-to-fail but it was
> simply the expected error messages that were missing.
> 
> So, slightly reorganize the test a little bit, add the
> expected messages and remove the 'known-to-fail' tag.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  validation/typeof-safe.c | 26 ++++++++++++++++++++------
>  1 file changed, 20 insertions(+), 6 deletions(-)
> 
> diff --git a/validation/typeof-safe.c b/validation/typeof-safe.c
> index 614863fba381..508bd39204c5 100644
> --- a/validation/typeof-safe.c
> +++ b/validation/typeof-safe.c
> @@ -2,16 +2,24 @@
>  
>  static void test_safe(void)
>  {
> -	int __safe obj, *ptr;
> -	typeof(obj) var = obj;
> -	typeof(ptr) ptr2 = ptr;
> +	int obj;
> +	int __safe *ptr;
> +
> +	int __safe *ptr2 = ptr;
> +	typeof(ptr) ptr3 = ptr;
>  	typeof(*ptr) var2 = obj;
> -	typeof(*ptr) *ptr3 = ptr;
> -	typeof(obj) *ptr4 = ptr;
> +	int __safe  var3 = obj;
> +	int *ptr4 = &obj;
> +	int *ptr4 = ptr;		// KO

ptr4 declared twice - and sparse didn't complain?

ATB,
Ramsay Jones

> +
> +	typeof(*ptr) sobj;
> +	typeof(&sobj) ptr5 = &obj;
> +	typeof(&sobj) ptr6 = ptr;	// KO
> +
>  	obj = obj;
>  	ptr = ptr;
> -	ptr = &obj;
>  	obj = *ptr;
> +	ptr = (int __safe *) &obj;
>  }
>  
>  /*
> @@ -19,5 +27,11 @@ static void test_safe(void)
>   * check-known-to-fail
>   *
>   * check-error-start
> +typeof-safe.c:13:21: warning: incorrect type in initializer (different modifiers)
> +typeof-safe.c:13:21:    expected int *ptr4
> +typeof-safe.c:13:21:    got int [safe] *ptr
> +typeof-safe.c:17:30: warning: incorrect type in initializer (different modifiers)
> +typeof-safe.c:17:30:    expected int *ptr6
> +typeof-safe.c:17:30:    got int [safe] *ptr
>   * check-error-end
>   */
> 

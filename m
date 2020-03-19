Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF0D818C2FF
	for <lists+linux-sparse@lfdr.de>; Thu, 19 Mar 2020 23:32:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbgCSWcC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 19 Mar 2020 18:32:02 -0400
Received: from avasout01.plus.net ([84.93.230.227]:36186 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbgCSWcC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 19 Mar 2020 18:32:02 -0400
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 18:32:01 EDT
Received: from [10.0.2.15] ([146.199.53.14])
        by smtp with ESMTPA
        id F3aWjO89baKBKF3aXje5i6; Thu, 19 Mar 2020 22:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1584656670; bh=uTQMmxPcrGmMu+Wmc+x0H3+3/bt6DbCmSUYNUah4IPE=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=lIZx8R1MrMnj4l3t+vrk4a5D36EDfiFCLmwYvedZ/MRKEVkDPknfT71b47W5Ak7rk
         MyLi4jzja3kChGvB1q3SpRE16uik89rtu82m2q6F3/uJfEHqIhe2tPIxBGDOibIvKx
         OHwDNwJCtNIabY8wxx92BuOOBdP2VK7nphtE1dk+7x1HqJh0C9qRwYr3+ZnMnqXqFE
         K3MU4X7serAASGylY35JosQDnis+5YcSZOJnb9aQTz6iNKEIht7L0IdRQaRTUJvWJz
         HtMCSrRQAe+Tju1zuFgPRjPZjpOmDAXvF1BtQ3D+Bn1udr8TLBxjcSDg72PHZuP9by
         sJ5ygLHnQ5CmA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=TeANSSYh c=1 sm=1 tr=0
 a=aVHpbgoF1kXlnm53YTHIEg==:117 a=aVHpbgoF1kXlnm53YTHIEg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=ObE0sUgeaNnLO-D7DYUA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 1/5] add testcases for OP_UNREACH
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20200318173120.63939-1-luc.vanoostenryck@gmail.com>
 <20200318173120.63939-2-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <48b264ee-c07f-9545-ba92-04934aca9752@ramsayjones.plus.com>
Date:   Thu, 19 Mar 2020 22:24:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318173120.63939-2-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJEop7KMl5lnFwkRGNq+84P9YW8sUoLoSHaMNuqTNc57/rzdlpLjKKvLSpG/d3Xngyq/0Z5EOlMGRfB8nOhVxFlto8SOAGGm83Hnk+/S1PgGKFdZDnP+
 b7qePGUYx9SI6EazPO3b1PMAmmiXy1Bw81FB+yadjC4pt6/dlBqpXBp8DuIQ8kSIjjel6n2EFHAkuA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 18/03/2020 17:31, Luc Van Oostenryck wrote:
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  validation/context-unreachable.c              | 16 ++++++++++
>  validation/linear/builtin_unreachable0.c      | 30 +++++++++++++++++++
>  ...n_unreachable.c => builtin_unreachable1.c} | 14 ++++-----
>  validation/linear/noreturn-unreachable0.c     | 23 ++++++++++++++
>  4 files changed, 76 insertions(+), 7 deletions(-)
>  create mode 100644 validation/context-unreachable.c
>  create mode 100644 validation/linear/builtin_unreachable0.c
>  rename validation/linear/{builtin_unreachable.c => builtin_unreachable1.c} (65%)
>  create mode 100644 validation/linear/noreturn-unreachable0.c
> 
> diff --git a/validation/context-unreachable.c b/validation/context-unreachable.c
> new file mode 100644
> index 000000000000..3e330403ce01
> --- /dev/null
> +++ b/validation/context-unreachable.c
> @@ -0,0 +1,16 @@
> +int fun(void);
> +
> +static void foo(void)
> +{
> +	__context__(1);
> +	if (!fun()) {
> +		__builtin_unreachable();
> +		return;
> +	}
> +	__context__(-1);
> +}
> +
> +/*
> + * check-name: context-unreachable
> + * check-known-to-fail
> + */
> diff --git a/validation/linear/builtin_unreachable0.c b/validation/linear/builtin_unreachable0.c
> new file mode 100644
> index 000000000000..5da9d074ae5f
> --- /dev/null
> +++ b/validation/linear/builtin_unreachable0.c
> @@ -0,0 +1,30 @@
> +extern void die(void) __attribute__((noreturn));

Hmm, is this declaration intended?

ATB,
Ramsay Jones

> +
> +int foo(int p)
> +{
> +	if (p == 3)
> +		__builtin_unreachable();
> +	return p;
> +}
> +
> +/*
> + * check-name: builtin_unreachable0
> + * check-command: test-linearize -Wno-decl $file
> + * check-known-to-fail
> + *
> + * check-output-start
> +foo:
> +.L0:
> +	<entry-point>
> +	seteq.32    %r2 <- %arg1, $3
> +	cbr         %r2, .L1, .L3
> +
> +.L1:
> +	unreach
> +
> +.L3:
> +	ret.32      %arg1
> +
> +
> + * check-output-end
> + */
> diff --git a/validation/linear/builtin_unreachable.c b/validation/linear/builtin_unreachable1.c
> similarity index 65%
> rename from validation/linear/builtin_unreachable.c
> rename to validation/linear/builtin_unreachable1.c
> index 4f13b892af54..280f853d8a07 100644
> --- a/validation/linear/builtin_unreachable.c
> +++ b/validation/linear/builtin_unreachable1.c
> @@ -1,15 +1,15 @@
> -void function_that_never_returns(void);
> +extern void die(void);
>  
>  int foo(int c)
>  {
>  	if (c)
>  		return 1;
> -	function_that_never_returns();
> +	die();
>  	__builtin_unreachable();
>  }
>  
>  /*
> - * check-name: __builtin_unreachable()
> + * check-name: builtin_unreachable1
>   * check-command: test-linearize -Wno-decl $file
>   *
>   * check-known-to-fail
> @@ -19,13 +19,13 @@ foo:
>  	<entry-point>
>  	cbr         %arg1, .L3, .L2
>  
> -.L2:
> -	call        function_that_never_returns
> -	unreach
> -
>  .L3:
>  	ret.32      $1
>  
> +.L2:
> +	call        die
> +	unreach
> +
>  
>   * check-output-end
>   */
> diff --git a/validation/linear/noreturn-unreachable0.c b/validation/linear/noreturn-unreachable0.c
> new file mode 100644
> index 000000000000..b76319458e96
> --- /dev/null
> +++ b/validation/linear/noreturn-unreachable0.c
> @@ -0,0 +1,23 @@
> +extern void die(void) __attribute__((noreturn));
> +
> +int foo(void)
> +{
> +	die();
> +	return 0;
> +}
> +
> +/*
> + * check-name: noreturn-unreachable0
> + * check-command: test-linearize -Wno-decl $file
> + * check-known-to-fail
> + *
> + * check-output-start
> +foo:
> +.L0:
> +	<entry-point>
> +	call        die
> +	unreach
> +
> +
> + * check-output-end
> + */
> 

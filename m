Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFB7103159
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 03:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfKTCAz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 21:00:55 -0500
Received: from avasout04.plus.net ([212.159.14.19]:42953 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfKTCAz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 21:00:55 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id XFIbir3S74Al0XFIciyI71; Wed, 20 Nov 2019 02:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574215254; bh=PWH5GUnXVHJQDRcfPpLnyJml8vXVaJKZdjL1CJO+ED8=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Um6PV68oevLOP4aZPGwQiLH4MlY3sPFgR1nG6TE7BWvpbFEfj3QHtmMgA/0M4MlFg
         knHjgfojC/0DZxE744n0HSxrbmbjvUnWvo0jQVI1hlx8DElNknqGqpplgqwtaAfCZ3
         y7Sp+h1C05WUZxiej5tEvbU0jwcFSo2JgOPWmhiUjj2nIh+4lBoylIpTcrq/XBtiHi
         teXYT3UjqrjdRJKlNHA/mmc8C0P6SkwWEsJlsncMY2SlRNjO+4b2fOOjVvbP7xv9tP
         xD79dGv9bPakx0i1aYrl/NkgQ27i1l+PXYQuXgRY7CI9smzme3VQsiBdd7ABXiltwd
         YqB4wlOUamgDQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8
 a=uEdKzkqz7ZsUaUq_6NwA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 0/5] fix propagation of function attributes
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <0f224459-7c35-234e-72e3-8baf87742507@ramsayjones.plus.com>
Date:   Wed, 20 Nov 2019 02:00:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCJdYb/qahOefu2R+R0yXfgNWTSQLivrNcYlxG8wZ+D0jp5ucQv3OYtyavrVkpP7YX24FE5MpjoO3elGpzELxxU16489/3UQMKmT3bjYfFy3m1GbTqaA
 /IRbY5fNlOlO216YrI+9f6336j6aOV3EtDh1FZBPQ7T5UyklP8oRwRmIm7v+mnRtGQEluaSqyQF/rg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 20/11/2019 00:02, Luc Van Oostenryck wrote:
> Function attributes need to be propagated differently
> than the usual specifiers: For example, in code like:
> 	#define __noreturn __attribute__((noreturn))
> 	__noreturn void foo(int a);
> the __noreturn attribute should be applied to the function
> type while a specifier like 'const' would be applied to its
> return type. Also, when declaring the corresponding
> function pointer or functionpointer pointer:
> 	__noreturn void (*fptr)(int);
> 	__noreturn void (**fptr)(int);
> the attribute should also be applied to the function type,
> not one of the pointer types.
>  
> This series fixes (hopefully) the previous attempt to solve
> this problem. The main patch is #4, pacthes #2 & #3 are
> kinda related preparatory patches and patch #5 is clearly
> related but independent (and a bit discutable, so will
> probably be omitted when pushed to kernel.org).
> 
> Many thanks to Ramsay Jones for noticing the problem!

Hi Luc,

It is somewhat late here, but I thought I should take a quick
look at this before bed ...

I have applied this series on top of 'master' and run it over
the git source and, as expected, the additional 8 warnings have
gone. Thanks! (Also, I haven't tried cygwin, but because this
fixes 'validation/function-redecl2.c', that long-standing warning
will be fixed too! :-D ).

Thanks!

ATB,
Ramsay Jones

> 
> 
> Luc Van Oostenryck (5):
>   add tests for function attributes
>   fix assignment: pointer to __pure/__noreturn function to void *
>   fix assignment check with function attribute
>   propagate function modifiers only to functions
>   allow omitted function attribute in definition
> 
>  evaluate.c                               | 14 +++++--
>  parse.c                                  | 49 +++++++++++++-----------
>  symbol.h                                 |  5 ++-
>  validation/attr-visible.c                | 13 +++++++
>  validation/attr-visible2.c               | 10 +++++
>  validation/bitwise-function-pointer.c    | 17 ++++++++
>  validation/function-attribute-inner.c    |  9 +++++
>  validation/function-attribute-omitted.c  | 13 +++++++
>  validation/function-attribute-pointer.c  | 33 ++++++++++++++++
>  validation/function-attribute-void-ptr.c | 14 +++++++
>  validation/function-attribute.c          | 15 +++++---
>  validation/function-redecl2.c            |  3 --
>  validation/pure-function.c               | 17 ++++++--
>  13 files changed, 171 insertions(+), 41 deletions(-)
>  create mode 100644 validation/attr-visible.c
>  create mode 100644 validation/attr-visible2.c
>  create mode 100644 validation/bitwise-function-pointer.c
>  create mode 100644 validation/function-attribute-inner.c
>  create mode 100644 validation/function-attribute-omitted.c
>  create mode 100644 validation/function-attribute-pointer.c
>  create mode 100644 validation/function-attribute-void-ptr.c
> 

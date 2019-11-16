Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5D69FE90C
	for <lists+linux-sparse@lfdr.de>; Sat, 16 Nov 2019 01:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfKPA0U (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 15 Nov 2019 19:26:20 -0500
Received: from avasout02.plus.net ([212.159.14.17]:51473 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727032AbfKPA0U (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 15 Nov 2019 19:26:20 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id VluqirxoLkhovVlusiJk6t; Sat, 16 Nov 2019 00:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1573863978; bh=v+tCgwkABb+RUPr4ZDX4KWh065YIFLy73x5wfbePaV4=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=L3GUHONGi5n38pXUU2nYFUn0ecjAcUgODN7mpPSflGWhfTi523AFZq7FwbBQEP4sg
         sB76nxPygvfTnuhoGK2rQgL0w+Tg5BSl+BlyjLOYzfUhjNrnlTf2DuS9DNv7iNi8FW
         2XNUL2j/je1iQRtDOcOcLc7DJWiB7/mqMLb94RXNWtbKHOqygC4Jf7N60T1sTruA19
         LCwheW7Rev5z/+qsNWN4WfsE9KNFyyPFckDdrL/iQUO2FNdhXNJE/QzmuD8PX/o6IT
         FFFpvv4Tz5eixpEvujr0kp8gUdVZsYF4jaGNPBUSJjpQuJV7/VLSZ0Oxp9FUnVCMiY
         4BzjuvxQA9NaQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=AbPP4EfG c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=r77TgQKjGQsHNAKrUKIA:9 a=yvH0ORhLAAAA:8
 a=yPCof4ZbAAAA:8 a=pGLkceISAAAA:8 a=PKzvZo6CAAAA:8 a=rvzWe_nJ2Kr5L3IY7FgA:9
 a=QEXdDO2ut3YA:10 a=7_5mTh-UuOgEASP2MhIA:9 a=JMNH9X61SiQA:10
 a=g16NiAzxEZCYhzHwdYj3:22 a=q92HNjYiIAC_jH7JDaYf:22 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] function attributes apply to the function declaration
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     smatch@vger.kernel.org, John Levon <john.levon@joyent.com>,
        Alex Kogan <alex.kogan@oracle.com>
References: <20191115004913.53104-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <7ff5e01d-817b-d367-dc61-2b5ceec957f5@ramsayjones.plus.com>
Date:   Sat, 16 Nov 2019 00:26:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191115004913.53104-1-luc.vanoostenryck@gmail.com>
Content-Type: multipart/mixed;
 boundary="------------A1E29F2451EAC4C711C01CA7"
Content-Language: en-GB
X-CMAE-Envelope: MS4wfFqZshMBlndgX9Gh7msQsjix2AGsGUxNZxjjlXwJTfpAkrmwhRN55ietpVvfikz0VJb1RI+4+7bSgc3wOjQo3Kp1lnOnJuJkf7Yr1leghFAgvTNJj47e
 ViWlJh0mOTJGT8OCVxHWkdjcoeTYtCw+KdrCoEXRm+4UKqbzDU9qTX+NZWpJVZSrKWsLhpRxZKGyMA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is a multi-part message in MIME format.
--------------A1E29F2451EAC4C711C01CA7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 15/11/2019 00:49, Luc Van Oostenryck wrote:
> Function attributes relate to the function declaration they
> appear in. Sparse ignore most these attributes but a few ones
> have a semantic value: 'pure', 'noreturn' & 'externally_visible'.
> 
> Due to how Sparse parse attributes and how these attributes
> are stored for functions, the attributes 'pure' & 'noreturn'
> are applied not to the function itself but its return type
> if the function returns a pointer.
> 
> Fix this by extracting these attributes from the declaration
> context and ensure they're applied to the declarator.
> 
> Reported-by: John Levon <john.levon@joyent.com>
> Reported-by: Alex Kogan <alex.kogan@oracle.com>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  parse.c                         | 17 ++++++++++++++++-
>  symbol.h                        |  2 ++
>  validation/function-attribute.c | 19 +++++++++++++++++++
>  3 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 validation/function-attribute.c
> 

Hi Luc,

Just a quick heads up (since I can't look at this much for
a few days now ...) that the current 'master' branch, when
applied to git, causes 8 additional warnings.

I have created a cut-down version of the code, thus:

  $ cat -n git-noreturn.c
     1	#include <stdarg.h>
     2	#include <unistd.h>
     3	#include <stdlib.h>
     4	
     5	#define NORETURN __attribute__((__noreturn__))
     6	#define NORETURN_PTR __attribute__((__noreturn__))
     7	
     8	void set_die_routine(NORETURN_PTR void (*routine)(const char *err, va_list params));
     9	
    10	static void NORETURN child_die_fn(const char *err, va_list params)
    11	{
    12	        _exit(2);
    13	}
    14	
    15	static void somefunc(void)
    16	{
    17		set_die_routine(child_die_fn);
    18	}
    19	
    20	static NORETURN void die_builtin(const char *err, va_list params)
    21	{
    22	        exit(128);
    23	}
    24	
    25	static NORETURN_PTR void (*die_routine)(const char *err, va_list params) = die_builtin;
  $ 

... which causes the following warnings:

  $ ./sparse git-noreturn.c
  git-noreturn.c:17:25: warning: incorrect type in argument 1 (different modifiers)
  git-noreturn.c:17:25:    expected void ( [noreturn] *routine )( ... )
  git-noreturn.c:17:25:    got void ( [noreturn] * )( ... )
  git-noreturn.c:25:76: warning: incorrect type in initializer (different modifiers)
  git-noreturn.c:25:76:    expected void ( *static [toplevel] [noreturn] die_routine )( ... )
  git-noreturn.c:25:76:    got void ( [noreturn] * )( ... )
  $ 

The explanation of the two NORETUN macros is given in commit 18660bc96ec
(add NORETURN_PTR for function pointers, 2009-09-30), which reads:

  commit 18660bc96ec0419cc096a53998d3197f2b905e8a
  Author: Erik Faye-Lund <kusmabite@gmail.com>
  Date:   Wed Sep 30 18:05:50 2009 +0000

      add NORETURN_PTR for function pointers
    
      Some compilers (including at least MSVC and ARM RVDS) supports
      NORETURN on function declarations, but not on function pointers.
    
      This patch makes it possible to define NORETURN for these compilers,
      by splitting the NORETURN macro into two - one for function
      declarations and one for function pointers.
    
      Signed-off-by: Erik Faye-Lund <kusmabite@gmail.com>
      Signed-off-by: Jeff King <peff@peff.net>
...

Sorry to just dump and run ... (hopefully, the above is useful
information - I will add the test file as an attachment).

ATB,
Ramsay Jones





--------------A1E29F2451EAC4C711C01CA7
Content-Type: text/x-csrc;
 name="git-noreturn.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="git-noreturn.c"

#include <stdarg.h>
#include <unistd.h>
#include <stdlib.h>

#define NORETURN __attribute__((__noreturn__))
#define NORETURN_PTR __attribute__((__noreturn__))

void set_die_routine(NORETURN_PTR void (*routine)(const char *err, va_list params));

static void NORETURN child_die_fn(const char *err, va_list params)
{
        _exit(2);
}

static void somefunc(void)
{
	set_die_routine(child_die_fn);
}

static NORETURN void die_builtin(const char *err, va_list params)
{
        exit(128);
}

static NORETURN_PTR void (*die_routine)(const char *err, va_list params) = die_builtin;

--------------A1E29F2451EAC4C711C01CA7--

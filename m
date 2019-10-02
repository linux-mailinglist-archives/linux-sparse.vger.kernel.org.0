Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 852E3C94A1
	for <lists+linux-sparse@lfdr.de>; Thu,  3 Oct 2019 01:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbfJBXLa (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 19:11:30 -0400
Received: from avasout07.plus.net ([84.93.230.235]:33728 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBXLa (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 19:11:30 -0400
Received: from [10.0.2.15] ([146.198.132.191])
        by smtp with ESMTPA
        id Fnm5i1yciyvjUFnm6iRVXg; Thu, 03 Oct 2019 00:11:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1570057889; bh=m9MI0MCBfydoy7tl7fNVAKy8j2ShrPdJWzSXNMDuuNs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=FMDYauglwnuX/LBdUCafR3rz3IwvuYcgkMFp0SgfDRXl3n2436mCbDoPcwXvJxhhv
         AxR+6l6PmYrm70WPNCE2+FNLReUCoAHJhmXS8edsc7/EML8J11axUHTqMwBaIq3QzJ
         X+0jChIJaWf1Uhv23e2Cpgw69GW0fdIuiirfikFOqGSGfJgAm+TWCrrl7iOm8M8uGP
         SPtQSGLhVChatGUHw9nnB+/ToAmEVCk2kWqthDAEnOCn4LBjjBuxIODHb1zl1wlSfY
         YHMYvGk6sCBhRCvyuPzG01IN5zwAP/NluDkP+vtgRp6LaXlVl4Tb3Qt1Q0+cHVQVYm
         eIghdvn1BTr6A==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=UrEdyN4B c=1 sm=1 tr=0
 a=Fsx7Iv7+m2wQNRAD/kuoBg==:117 a=Fsx7Iv7+m2wQNRAD/kuoBg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=JfrnYn6hAAAA:8
 a=Z4Rwk6OoAAAA:8 a=pGLkceISAAAA:8 a=DqtpFFWIbNAlVyRvC74A:9 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=HkZW87K1Qel5hWWM3VKY:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] void-cond: allow void in conditional expression
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
 <20191002212333.51017-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <99173481-dbb9-ee7d-2b03-31aac80980e5@ramsayjones.plus.com>
Date:   Thu, 3 Oct 2019 00:11:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002212333.51017-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDL5OTSqJw1F7wyJMIvum+HP2izTSgElNqXRExj2o1CeViSYccBZSyL3LhlIZzc7xkRnc706qxCwXogYGdW+AW5ocfFm/cw1EikSPqrdlLkwwBNd8PaZ
 KuirL3bvkAhUaGb/pb4LCuZnunqzdj7ZlxF2m0JP7vk7Iem9AEf7PlL4LbBfqok6QiFe7Jo+kV8VYg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 02/10/2019 22:23, Luc Van Oostenryck wrote:
> As an extension, allow conditional expressions (?:) with one
> side of type 'void' and consider the result to also be void.
> 
> The warning can be reinstated with the flag '-Wcond-void'.

Hmm, I think this is a backward step ...

> 
> Note: I only see a single occurrence of this in the kernel.

... and the fact that such code exists in the kernel is, er,
somewhat disappointing ... :(

But, hey, what do I know.

For a typo in the documentation, (see below)

> 
> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  evaluate.c                   | 7 +++++++
>  lib.c                        | 2 ++
>  lib.h                        | 1 +
>  sparse.1                     | 7 +++++++
>  validation/cond-err-expand.c | 2 +-
>  5 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/evaluate.c b/evaluate.c
> index 919c944cf..fb1a0548d 100644
> --- a/evaluate.c
> +++ b/evaluate.c
> @@ -1205,6 +1205,13 @@ static struct symbol *evaluate_conditional_expression(struct expression *expr)
>  		goto out;
>  	}
>  
> +	// extension: allow the result be void is one side is void
> +	if (ltype == &void_ctype || rtype == &void_ctype) {
> +		ctype = &void_ctype;
> +		if (!Wcond_void)
> +			goto out;
> +	}
> +
>  	if ((lclass | rclass) & TYPE_PTR) {
>  		int is_null1 = is_null_pointer_constant(*cond);
>  		int is_null2 = is_null_pointer_constant(expr->cond_false);
> diff --git a/lib.c b/lib.c
> index 83e6a1e1b..c16d87778 100644
> --- a/lib.c
> +++ b/lib.c
> @@ -257,6 +257,7 @@ int Wbitwise_pointer = 0;
>  int Wcast_from_as = 0;
>  int Wcast_to_as = 0;
>  int Wcast_truncate = 1;
> +int Wcond_void = 0;
>  int Wconstant_suffix = 0;
>  int Wconstexpr_not_const = 0;
>  int Wcontext = 1;
> @@ -639,6 +640,7 @@ static const struct flag warnings[] = {
>  	{ "cast-from-as", &Wcast_from_as },
>  	{ "cast-to-as", &Wcast_to_as },
>  	{ "cast-truncate", &Wcast_truncate },
> +	{ "cond-void", &Wcond_void },
>  	{ "constant-suffix", &Wconstant_suffix },
>  	{ "constexpr-not-const", &Wconstexpr_not_const},
>  	{ "context", &Wcontext },
> diff --git a/lib.h b/lib.h
> index 697c977a1..2549c8872 100644
> --- a/lib.h
> +++ b/lib.h
> @@ -145,6 +145,7 @@ extern int Wbitwise_pointer;
>  extern int Wcast_from_as;
>  extern int Wcast_to_as;
>  extern int Wcast_truncate;
> +extern int Wcond_void;
>  extern int Wconstant_suffix;
>  extern int Wconstexpr_not_const;
>  extern int Wcontext;
> diff --git a/sparse.1 b/sparse.1
> index beb484423..71ac0c646 100644
> --- a/sparse.1
> +++ b/sparse.1
> @@ -117,6 +117,13 @@ Sparse issues these warnings by default.  To turn them off, use
>  \fB\-Wno\-cast\-truncate\fR.
>  .
>  .TP
> +.B \-Wconditional\-void

The warning, as implemented, is -Wcond-void.

ATB,
Ramsay Jones

> +Warn if one side of a conditional expression (\fB? :\fR) is of type
> +void and the other one not.
> +As an extension, Sparse consider the result of such expressions as also
> +having the type void.
> +.
> +.TP
>  .B \-Wconstant\-suffix
>  Warn if an integer constant is larger than the maximum representable value
>  of the type indicated by its type suffix (if any). For example, on a
> diff --git a/validation/cond-err-expand.c b/validation/cond-err-expand.c
> index b52624bc9..714cb23eb 100644
> --- a/validation/cond-err-expand.c
> +++ b/validation/cond-err-expand.c
> @@ -15,7 +15,7 @@ void bar(void)
>  
>  /*
>   * check-name: cond-err-expand.c
> - * check-command: test-linearize -Wno-decl $file
> + * check-command: test-linearize -Wcond-void -Wno-decl $file
>   *
>   * check-error-start
>  cond-err-expand.c:8:11: error: incompatible types in conditional expression (different base types):
> 

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE6E11FAC1
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 20:29:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfLOT3e (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 14:29:34 -0500
Received: from avasout04.plus.net ([212.159.14.19]:51370 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfLOT3e (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 14:29:34 -0500
Received: from [10.0.2.15] ([87.115.253.35])
        by smtp with ESMTPA
        id gZa8iUd3A4Al0gZa9iECbS; Sun, 15 Dec 2019 19:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1576438173; bh=xfVd7i0mh0LlNeBcrXUpCm8c+HfkUL9MqyRLvq3L4wY=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=DDfrY0UZe8bMYNW1ZGPVjzexlCxbbpiSnyk4Z8qMThb5z0Onf3P5Ia+No1LMEs7qd
         5BbJlxyRufN0sG3LuKWgiJsT0vqPyQPM/HttkfQPggOAGKU6sKbTIdH42JEpV9k508
         g7MN4nWwuRJPu1d++s1N5+jK3TMybTekMloD78LpbzvTlKmW8AKsAmpL0WMwfvNV0P
         36k8EWKYJm9uUlgjwWfIckqVTIsJWf5pcm7NbA+EcQNylR/srE2nhUjn8S0dhZzt/h
         WVkxyW/Z89/cOwv7Rwj5J7b5e2IHURpyHgKzntQWDhZiEqr1SMz+YDow3GGQTN1dkS
         lAy2eNeLhh7fg==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=VLDPgNmCULccAgTy/RRLiQ==:117 a=VLDPgNmCULccAgTy/RRLiQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=S0M5J17CAAAA:20 a=aL_w40Hd2yCdE3gvAAkA:9 a=vOzbtgD-pJnNyJsW:21
 a=8IAoGMBcjgVLj6Ev:21 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] improve diagnostic message about wrong redeclaration
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191215162856.98943-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <3037fb4a-aabd-6386-e14a-906a948510bf@ramsayjones.plus.com>
Date:   Sun, 15 Dec 2019 19:29:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191215162856.98943-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIxkJuWpUEtcLskdqKpBTrlXioKDyM8cBJ/okOMWwaV6JVibKKBSVM8+x9acdn7AmeWaKned5go5hsC9NMAtRBAYTbg3jVs+4R8+a5y6j8v6bmhmCCk+
 KXOJX5gcRhgbuOsxOa4csgwXOeQ8Rs2mtPqO+3Go7shemJHCMGfvOtwwKFwFTctKcmljfPXUJcuiTw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 15/12/2019 16:28, Luc Van Oostenryck wrote:
> The current message is very long (in most cases the position
> of the previous declaration is past the 80th column) and,
> while saying that the types differ, doesn't show these types.
> 
> Change this by splitting the message in 2 parts:
> - first, on the current position, the main message
>   and the type of the current declaration.
> - then the type of the previous declaration on its
>   own position.

Hmm, this loses information and, thus, is not necessarily an
improvement. The first test, below, illustrates this ...

> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
> 
> This patch is also available at:
>  git://github.com/lucvoo/sparse-dev.git msg-wrong-redecl
> 
>  evaluate.c                   |  8 +++---
>  validation/c11-atomic.c      | 10 ++++++--
>  validation/function-redecl.c | 50 ++++++++++++++++++++++++++++--------
>  validation/restrict.c        | 10 ++++++--
>  validation/typedef-redef.c   |  5 +++-
>  5 files changed, 65 insertions(+), 18 deletions(-)
> 
> diff --git a/evaluate.c b/evaluate.c
> index 4d08956e984c..9ad7d234c789 100644
> --- a/evaluate.c
> +++ b/evaluate.c
> @@ -3380,9 +3380,11 @@ void check_duplicates(struct symbol *sym)
>  		declared++;
>  		typediff = type_difference(&sym->ctype, &next->ctype, 0, 0);
>  		if (typediff) {
> -			sparse_error(sym->pos, "symbol '%s' redeclared with different type (originally declared at %s:%d) - %s",
> -				show_ident(sym->ident),
> -				stream_name(next->pos.stream), next->pos.line, typediff);

... since 'typediff' is no longer displayed ...

> +			sparse_error(sym->pos, "symbol '%s' redeclared with different type:",
> +				show_ident(sym->ident));
> +			info(sym->pos, "   %s", show_typename(sym));
> +			info(next->pos, "note: previously declared as:");
> +			info(next->pos, "   %s", show_typename(next));
>  			return;
>  		}
>  	}
> diff --git a/validation/c11-atomic.c b/validation/c11-atomic.c
> index fc2c27ae9a65..0bf0317c8182 100644
> --- a/validation/c11-atomic.c
> +++ b/validation/c11-atomic.c
> @@ -69,8 +69,14 @@ void baz(void)
>   * check-command: sparse -Wno-decl $file
>   *
>   * check-error-start
> -c11-atomic.c:11:6: error: symbol 'f02' redeclared with different type (originally declared at c11-atomic.c:3) - incompatible argument 1 (different modifiers)
> -c11-atomic.c:12:6: error: symbol 'f03' redeclared with different type (originally declared at c11-atomic.c:4) - incompatible argument 1 (different modifiers)
> +c11-atomic.c:11:6: error: symbol 'f02' redeclared with different type:
> +c11-atomic.c:11:6:    void extern [addressable] [toplevel] f02( ... )
> +c11-atomic.c:3:6: note: previously declared as:
> +c11-atomic.c:3:6:    void extern [addressable] [toplevel] f02( ... )

... we lose the 'incompatible argument 1 (different modifiers)' text.
(which in this case helps the user understand what would otherwise be a
bit of a puzzle!) "redeclared with different type: A instead of A" :-D

ATB,
Ramsay Jones

> +c11-atomic.c:12:6: error: symbol 'f03' redeclared with different type:
> +c11-atomic.c:12:6:    void extern [addressable] [toplevel] f03( ... )
> +c11-atomic.c:4:6: note: previously declared as:
> +c11-atomic.c:4:6:    void extern [addressable] [toplevel] f03( ... )
>  c11-atomic.c:33:13: warning: incorrect type in assignment (different modifiers)
>  c11-atomic.c:33:13:    expected int *extern [assigned] puo
>  c11-atomic.c:33:13:    got int const *
> diff --git a/validation/function-redecl.c b/validation/function-redecl.c
> index 475f18e798f5..bb4d865fb465 100644
> --- a/validation/function-redecl.c
> +++ b/validation/function-redecl.c
> @@ -48,15 +48,45 @@ void arg_vararg(int a, ...) { }			/* check-should-fail */
>   * check-name: function-redecl
>   *
>   * check-error-start
> -function-redecl.c:5:6: error: symbol 'ret_type' redeclared with different type (originally declared at function-redecl.c:4) - different base types
> -function-redecl.c:9:11: error: symbol 'ret_const' redeclared with different type (originally declared at function-redecl.c:8) - different modifiers
> -function-redecl.c:13:13: error: symbol 'ret_as' redeclared with different type (originally declared at function-redecl.c:12) - different address spaces
> -function-redecl.c:17:12: error: symbol 'ret_mod' redeclared with different type (originally declared at function-redecl.c:16) - different modifiers
> -function-redecl.c:21:6: error: symbol 'arg_type' redeclared with different type (originally declared at function-redecl.c:20) - incompatible argument 1 (different base types)
> -function-redecl.c:29:6: error: symbol 'arg_as' redeclared with different type (originally declared at function-redecl.c:28) - incompatible argument 1 (different address spaces)
> -function-redecl.c:33:6: error: symbol 'arg_mod' redeclared with different type (originally declared at function-redecl.c:32) - incompatible argument 1 (different modifiers)
> -function-redecl.c:37:6: error: symbol 'arg_more_arg' redeclared with different type (originally declared at function-redecl.c:36) - different argument counts
> -function-redecl.c:41:6: error: symbol 'arg_less_arg' redeclared with different type (originally declared at function-redecl.c:40) - different argument counts
> -function-redecl.c:45:6: error: symbol 'arg_vararg' redeclared with different type (originally declared at function-redecl.c:44) - incompatible variadic arguments
> +function-redecl.c:5:6: error: symbol 'ret_type' redeclared with different type:
> +function-redecl.c:5:6:    void extern [addressable] [toplevel] ret_type( ... )
> +function-redecl.c:4:5: note: previously declared as:
> +function-redecl.c:4:5:    int extern [signed] [addressable] [toplevel] ret_type( ... )
> +function-redecl.c:9:11: error: symbol 'ret_const' redeclared with different type:
> +function-redecl.c:9:11:    int extern const [signed] [addressable] [toplevel] ret_const( ... )
> +function-redecl.c:8:5: note: previously declared as:
> +function-redecl.c:8:5:    int extern [signed] [addressable] [toplevel] ret_const( ... )
> +function-redecl.c:13:13: error: symbol 'ret_as' redeclared with different type:
> +function-redecl.c:13:13:    void <asn:1> *extern [addressable] [toplevel] ret_as( ... )
> +function-redecl.c:12:6: note: previously declared as:
> +function-redecl.c:12:6:    void *extern [addressable] [toplevel] ret_as( ... )
> +function-redecl.c:17:12: error: symbol 'ret_mod' redeclared with different type:
> +function-redecl.c:17:12:    void const *extern [addressable] [toplevel] ret_mod( ... )
> +function-redecl.c:16:6: note: previously declared as:
> +function-redecl.c:16:6:    void *extern [addressable] [toplevel] ret_mod( ... )
> +function-redecl.c:21:6: error: symbol 'arg_type' redeclared with different type:
> +function-redecl.c:21:6:    void extern [addressable] [toplevel] arg_type( ... )
> +function-redecl.c:20:6: note: previously declared as:
> +function-redecl.c:20:6:    void extern [addressable] [toplevel] arg_type( ... )
> +function-redecl.c:29:6: error: symbol 'arg_as' redeclared with different type:
> +function-redecl.c:29:6:    void extern [addressable] [toplevel] arg_as( ... )
> +function-redecl.c:28:6: note: previously declared as:
> +function-redecl.c:28:6:    void extern [addressable] [toplevel] arg_as( ... )
> +function-redecl.c:33:6: error: symbol 'arg_mod' redeclared with different type:
> +function-redecl.c:33:6:    void extern [addressable] [toplevel] arg_mod( ... )
> +function-redecl.c:32:6: note: previously declared as:
> +function-redecl.c:32:6:    void extern [addressable] [toplevel] arg_mod( ... )
> +function-redecl.c:37:6: error: symbol 'arg_more_arg' redeclared with different type:
> +function-redecl.c:37:6:    void extern [addressable] [toplevel] arg_more_arg( ... )
> +function-redecl.c:36:6: note: previously declared as:
> +function-redecl.c:36:6:    void extern [addressable] [toplevel] arg_more_arg( ... )
> +function-redecl.c:41:6: error: symbol 'arg_less_arg' redeclared with different type:
> +function-redecl.c:41:6:    void extern [addressable] [toplevel] arg_less_arg( ... )
> +function-redecl.c:40:6: note: previously declared as:
> +function-redecl.c:40:6:    void extern [addressable] [toplevel] arg_less_arg( ... )
> +function-redecl.c:45:6: error: symbol 'arg_vararg' redeclared with different type:
> +function-redecl.c:45:6:    void extern [addressable] [toplevel] arg_vararg( ... )
> +function-redecl.c:44:6: note: previously declared as:
> +function-redecl.c:44:6:    void extern [addressable] [toplevel] arg_vararg( ... )
>   * check-error-end
>   */
> diff --git a/validation/restrict.c b/validation/restrict.c
> index 80c437b01b24..698445d3cf62 100644
> --- a/validation/restrict.c
> +++ b/validation/restrict.c
> @@ -69,8 +69,14 @@ void baz(void)
>   * check-command: sparse -Wno-decl $file
>   *
>   * check-error-start
> -restrict.c:11:6: error: symbol 'f02' redeclared with different type (originally declared at restrict.c:3) - incompatible argument 1 (different modifiers)
> -restrict.c:12:6: error: symbol 'f03' redeclared with different type (originally declared at restrict.c:4) - incompatible argument 1 (different modifiers)
> +restrict.c:11:6: error: symbol 'f02' redeclared with different type:
> +restrict.c:11:6:    void extern [addressable] [toplevel] f02( ... )
> +restrict.c:3:6: note: previously declared as:
> +restrict.c:3:6:    void extern [addressable] [toplevel] f02( ... )
> +restrict.c:12:6: error: symbol 'f03' redeclared with different type:
> +restrict.c:12:6:    void extern [addressable] [toplevel] f03( ... )
> +restrict.c:4:6: note: previously declared as:
> +restrict.c:4:6:    void extern [addressable] [toplevel] f03( ... )
>  restrict.c:33:13: warning: incorrect type in assignment (different modifiers)
>  restrict.c:33:13:    expected void **extern [assigned] pup
>  restrict.c:33:13:    got void *const *
> diff --git a/validation/typedef-redef.c b/validation/typedef-redef.c
> index 3a60a773168a..d1535de9fa0b 100644
> --- a/validation/typedef-redef.c
> +++ b/validation/typedef-redef.c
> @@ -8,6 +8,9 @@ typedef long ko_t;
>   * check-name: typedef-redef
>   *
>   * check-error-start
> -typedef-redef.c:5:14: error: symbol 'ko_t' redeclared with different type (originally declared at typedef-redef.c:4) - different type sizes
> +typedef-redef.c:5:14: error: symbol 'ko_t' redeclared with different type:
> +typedef-redef.c:5:14:    long [usertype] ko_t
> +typedef-redef.c:4:14: note: previously declared as:
> +typedef-redef.c:4:14:    int [usertype] ko_t
>   * check-error-end
>   */
> 
> base-commit: f934193608415cff796694b5500f95e7b2e0fd17
> 

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A75B7120838
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 15:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbfLPOMC (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 09:12:02 -0500
Received: from avasout02.plus.net ([212.159.14.17]:51863 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727807AbfLPOMC (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 09:12:02 -0500
Received: from [10.0.2.15] ([87.115.253.35])
        by smtp with ESMTPA
        id gr6NieP2zkhovgr6OifKzd; Mon, 16 Dec 2019 14:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1576505520; bh=CP2hyC4aQEGBCaxbfP6sTPx4O5B9J9lzHSDb+6n2yng=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=SXjIo1eFQZYMMnvUhnqNR8Znts5JbMOgzuSLRenisbPvYLmQlzjHOJirrBgkJb6/7
         bFKx/8wqMc4XyGTeMXPd1v/bS37vKYb5kbSIf6Ac//HTz6F5a+YdtoIl+CIbx7wJ7x
         z/UKHio4U7Bk4nYe89DtNBbDOJ+GUl5jQ7jpTi7TisrPG4Lil0rhxwMAVHgckeWatK
         4EJ1xkAA3FOqp0jQ0Iz0iyQOzrRD/GqBSkqQMsbauKls0QWE4sr8ipXTk5QmGfvnkU
         H0SWK9OnrUHZIkUMF/8r4TV7tU1uiDeMTb5okbcvzei6vH2faCi9u0gYj9Los1Sh3j
         fLkbWfsQFS20Q==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=AbPP4EfG c=1 sm=1 tr=0
 a=VLDPgNmCULccAgTy/RRLiQ==:117 a=VLDPgNmCULccAgTy/RRLiQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=rBGtuCAbaNBUaK5jVc0A:9 a=T8ODM4vQKyyC4IDd:21 a=f06fgcOSn65dkYXX:21
 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v2] improve diagnostic message about wrong redeclaration
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <3037fb4a-aabd-6386-e14a-906a948510bf@ramsayjones.plus.com>
 <20191215201327.12270-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <5f9ec786-3cdd-b584-ba57-cdec105d4fb3@ramsayjones.plus.com>
Date:   Mon, 16 Dec 2019 14:11:59 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191215201327.12270-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfHRYVliKFMELduzjLOhT52G04z4ylxPO+8u2InDTev5DSXc9k5zbpG1aTEVHd3VtKu0+qgX689Bx+AYITqybYhqT5gOXM4rSc+7M0caK0//V25mPi7rX
 ufhm6mojWRE61kRQcf6QTlQS/gZ0o2SXxNHj8IswM8KL7lY5sK+ZWxczNpYRdz0q9HsfhJeftNUnFw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 15/12/2019 20:13, Luc Van Oostenryck wrote:
> The current message is very long (in most cases the position
> of the previous declaration is past the 80th column) and,
> while saying that the types differ, doesn't show these types.
> 
> Change this by splitting the message in 2 parts:
> - first, on the current position, the main message
>   and the type of the current declaration.
> - then the type of the previous declaration on its
>   own position.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
> 
> Change since v1:
> * add back to the message the 'typediff' which was inadvertently removed.
> 
>  evaluate.c                   |  8 +++---
>  validation/c11-atomic.c      | 10 ++++++--
>  validation/function-redecl.c | 50 ++++++++++++++++++++++++++++--------
>  validation/restrict.c        | 10 ++++++--
>  validation/typedef-redef.c   |  5 +++-
>  5 files changed, 65 insertions(+), 18 deletions(-)
> 
> diff --git a/evaluate.c b/evaluate.c
> index 4d08956e984c..8b1ae863b004 100644
> --- a/evaluate.c
> +++ b/evaluate.c
> @@ -3380,9 +3380,11 @@ void check_duplicates(struct symbol *sym)
>  		declared++;
>  		typediff = type_difference(&sym->ctype, &next->ctype, 0, 0);
>  		if (typediff) {
> -			sparse_error(sym->pos, "symbol '%s' redeclared with different type (originally declared at %s:%d) - %s",
> -				show_ident(sym->ident),
> -				stream_name(next->pos.stream), next->pos.line, typediff);
> +			sparse_error(sym->pos, "symbol '%s' redeclared with different type (%s):",
> +				show_ident(sym->ident), typediff);
> +			info(sym->pos, "   %s", show_typename(sym));
> +			info(next->pos, "note: previously declared as:");
> +			info(next->pos, "   %s", show_typename(next));
>  			return;
>  		}
>  	}
> diff --git a/validation/c11-atomic.c b/validation/c11-atomic.c
> index fc2c27ae9a65..17720861ffb7 100644
> --- a/validation/c11-atomic.c
> +++ b/validation/c11-atomic.c
> @@ -69,8 +69,14 @@ void baz(void)
>   * check-command: sparse -Wno-decl $file
>   *
>   * check-error-start
> -c11-atomic.c:11:6: error: symbol 'f02' redeclared with different type (originally declared at c11-atomic.c:3) - incompatible argument 1 (different modifiers)
> -c11-atomic.c:12:6: error: symbol 'f03' redeclared with different type (originally declared at c11-atomic.c:4) - incompatible argument 1 (different modifiers)
> +c11-atomic.c:11:6: error: symbol 'f02' redeclared with different type (incompatible argument 1 (different modifiers)):
> +c11-atomic.c:11:6:    void extern [addressable] [toplevel] f02( ... )
> +c11-atomic.c:3:6: note: previously declared as:
> +c11-atomic.c:3:6:    void extern [addressable] [toplevel] f02( ... )
> +c11-atomic.c:12:6: error: symbol 'f03' redeclared with different type (incompatible argument 1 (different modifiers)):
> +c11-atomic.c:12:6:    void extern [addressable] [toplevel] f03( ... )
> +c11-atomic.c:4:6: note: previously declared as:
> +c11-atomic.c:4:6:    void extern [addressable] [toplevel] f03( ... )
>  c11-atomic.c:33:13: warning: incorrect type in assignment (different modifiers)
>  c11-atomic.c:33:13:    expected int *extern [assigned] puo
>  c11-atomic.c:33:13:    got int const *

Yep, this looks better. Thanks.

However, ...

It is interesting that both gcc and clang sometimes do/don't include
the equivalent of the 'typediff' information. In the case of redeclared
functions with different parameter types, etc., it seems they are
content to display both function prototypes (including parameters) and
let you deduce the information yourself! ;-)

Note also, that sparse, gcc and clang all give different warnings and
errors on 'validation/c11-atomic.c'! (sparse is not passed a --std=
for either c11 or gnu11 - does that matter?) thus:

  $ gcc --std=gnu11 validation/c11-atomic.c
  validation/c11-atomic.c:9:6: error: conflicting types for ‘f00’
   void f00(int dst)   { } /* check-should-pass */
        ^~~
  validation/c11-atomic.c:1:6: note: previous declaration of ‘f00’ was here
   void f00(int _Atomic  dst);
        ^~~
  validation/c11-atomic.c:11:6: error: conflicting types for ‘f02’
   void f02(int *dst)   { } /* check-should-fail */
        ^~~
  validation/c11-atomic.c:3:6: note: previous declaration of ‘f02’ was here
   void f02(int _Atomic *dst);
        ^~~
  validation/c11-atomic.c:12:6: error: conflicting types for ‘f03’
   void f03(typeof(&uo) dst) { } /* check-should-fail */
        ^~~
  validation/c11-atomic.c:4:6: note: previous declaration of ‘f03’ was here
   void f03(int _Atomic *dst);
        ^~~
  validation/c11-atomic.c: In function ‘ref’:
  validation/c11-atomic.c:33:6: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
    puo = &qo;  /* check-should-fail */
        ^
  validation/c11-atomic.c:34:6: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
    puo = pqo;  /* check-should-fail */
        ^
  validation/c11-atomic.c: In function ‘bar’:
  validation/c11-atomic.c:39:22: error: conflicting types for ‘pqo’
    extern int _Atomic *pqo;
                        ^~~
  validation/c11-atomic.c:24:20: note: previous declaration of ‘pqo’ was here
    extern const int *pqo;
                      ^~~
  validation/c11-atomic.c:43:6: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
    pqo = &uo;  /* check-should-pass */
        ^
  validation/c11-atomic.c:44:6: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
    pqo = puo;
        ^
  validation/c11-atomic.c:48:6: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
    puo = &qo;  /* check-should-fail */
        ^
  validation/c11-atomic.c:49:6: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
    puo = pqo;  /* check-should-fail */
        ^
  validation/c11-atomic.c: In function ‘baz’:
  validation/c11-atomic.c:58:6: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
    pqo = &uo;  /* check-should-pass */
        ^
  validation/c11-atomic.c:59:6: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
    pqo = puo;
        ^
  validation/c11-atomic.c:63:6: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
    puo = &qo;  /* check-should-fail */
        ^
  validation/c11-atomic.c:64:6: warning: assignment from incompatible pointer type [-Wincompatible-pointer-types]
    puo = pqo;  /* check-should-fail */
        ^
  $ 

... and for clang (does it understand --std=gnu11?):
  
  $ clang --std=gnu11 validation/c11-atomic.c
  validation/c11-atomic.c:9:6: error: conflicting types for 'f00'
  void f00(int dst)         { }   /* check-should-pass */
       ^
  validation/c11-atomic.c:1:6: note: previous declaration is here
  void f00(int _Atomic  dst);
       ^
  validation/c11-atomic.c:11:6: error: conflicting types for 'f02'
  void f02(int *dst)        { }   /* check-should-fail */
       ^
  validation/c11-atomic.c:3:6: note: previous declaration is here
  void f02(int _Atomic *dst);
       ^
  validation/c11-atomic.c:12:6: error: conflicting types for 'f03'
  void f03(typeof(&uo) dst) { }   /* check-should-fail */
       ^
  validation/c11-atomic.c:4:6: note: previous declaration is here
  void f03(int _Atomic *dst);
       ^
  validation/c11-atomic.c:33:6: warning: assigning to 'int *' from 'const int *'
        discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
          puo = &qo;              /* check-should-fail */
              ^ ~~~
  validation/c11-atomic.c:34:6: warning: assigning to 'int *' from 'const int *'
        discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
          puo = pqo;              /* check-should-fail */
              ^ ~~~
  validation/c11-atomic.c:39:22: error: redeclaration of 'pqo' with a different
        type: '_Atomic(int) *' vs 'const int *'
          extern int _Atomic *pqo;
                              ^
  validation/c11-atomic.c:24:20: note: previous declaration is here
          extern const int *pqo;
                            ^
  validation/c11-atomic.c:48:6: warning: incompatible pointer types assigning to
        'int *' from '_Atomic(int) *' [-Wincompatible-pointer-types]
          puo = &qo;              /* check-should-fail */
              ^ ~~~
  validation/c11-atomic.c:54:21: error: redeclaration of 'pqo' with a different
        type: 'typeof (&qo)' (aka '_Atomic(int) *') vs 'const int *'
          extern typeof(&qo) pqo;
                             ^
  validation/c11-atomic.c:24:20: note: previous declaration is here
          extern const int *pqo;
                            ^
  validation/c11-atomic.c:63:6: warning: incompatible pointer types assigning to
        'typeof (&uo)' (aka 'int *') from '_Atomic(int) *'
        [-Wincompatible-pointer-types]
          puo = &qo;              /* check-should-fail */
              ^ ~~~
  4 warnings and 5 errors generated.
  $ 

[note that both gcc and clang complain about 'f00']

ATB,
Ramsay Jones


> diff --git a/validation/function-redecl.c b/validation/function-redecl.c
> index 475f18e798f5..0315135932ab 100644
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
> +function-redecl.c:5:6: error: symbol 'ret_type' redeclared with different type (different base types):
> +function-redecl.c:5:6:    void extern [addressable] [toplevel] ret_type( ... )
> +function-redecl.c:4:5: note: previously declared as:
> +function-redecl.c:4:5:    int extern [signed] [addressable] [toplevel] ret_type( ... )
> +function-redecl.c:9:11: error: symbol 'ret_const' redeclared with different type (different modifiers):
> +function-redecl.c:9:11:    int extern const [signed] [addressable] [toplevel] ret_const( ... )
> +function-redecl.c:8:5: note: previously declared as:
> +function-redecl.c:8:5:    int extern [signed] [addressable] [toplevel] ret_const( ... )
> +function-redecl.c:13:13: error: symbol 'ret_as' redeclared with different type (different address spaces):
> +function-redecl.c:13:13:    void <asn:1> *extern [addressable] [toplevel] ret_as( ... )
> +function-redecl.c:12:6: note: previously declared as:
> +function-redecl.c:12:6:    void *extern [addressable] [toplevel] ret_as( ... )
> +function-redecl.c:17:12: error: symbol 'ret_mod' redeclared with different type (different modifiers):
> +function-redecl.c:17:12:    void const *extern [addressable] [toplevel] ret_mod( ... )
> +function-redecl.c:16:6: note: previously declared as:
> +function-redecl.c:16:6:    void *extern [addressable] [toplevel] ret_mod( ... )
> +function-redecl.c:21:6: error: symbol 'arg_type' redeclared with different type (incompatible argument 1 (different base types)):
> +function-redecl.c:21:6:    void extern [addressable] [toplevel] arg_type( ... )
> +function-redecl.c:20:6: note: previously declared as:
> +function-redecl.c:20:6:    void extern [addressable] [toplevel] arg_type( ... )
> +function-redecl.c:29:6: error: symbol 'arg_as' redeclared with different type (incompatible argument 1 (different address spaces)):
> +function-redecl.c:29:6:    void extern [addressable] [toplevel] arg_as( ... )
> +function-redecl.c:28:6: note: previously declared as:
> +function-redecl.c:28:6:    void extern [addressable] [toplevel] arg_as( ... )
> +function-redecl.c:33:6: error: symbol 'arg_mod' redeclared with different type (incompatible argument 1 (different modifiers)):
> +function-redecl.c:33:6:    void extern [addressable] [toplevel] arg_mod( ... )
> +function-redecl.c:32:6: note: previously declared as:
> +function-redecl.c:32:6:    void extern [addressable] [toplevel] arg_mod( ... )
> +function-redecl.c:37:6: error: symbol 'arg_more_arg' redeclared with different type (different argument counts):
> +function-redecl.c:37:6:    void extern [addressable] [toplevel] arg_more_arg( ... )
> +function-redecl.c:36:6: note: previously declared as:
> +function-redecl.c:36:6:    void extern [addressable] [toplevel] arg_more_arg( ... )
> +function-redecl.c:41:6: error: symbol 'arg_less_arg' redeclared with different type (different argument counts):
> +function-redecl.c:41:6:    void extern [addressable] [toplevel] arg_less_arg( ... )
> +function-redecl.c:40:6: note: previously declared as:
> +function-redecl.c:40:6:    void extern [addressable] [toplevel] arg_less_arg( ... )
> +function-redecl.c:45:6: error: symbol 'arg_vararg' redeclared with different type (incompatible variadic arguments):
> +function-redecl.c:45:6:    void extern [addressable] [toplevel] arg_vararg( ... )
> +function-redecl.c:44:6: note: previously declared as:
> +function-redecl.c:44:6:    void extern [addressable] [toplevel] arg_vararg( ... )
>   * check-error-end
>   */
> diff --git a/validation/restrict.c b/validation/restrict.c
> index 80c437b01b24..d7cd8ad98f75 100644
> --- a/validation/restrict.c
> +++ b/validation/restrict.c
> @@ -69,8 +69,14 @@ void baz(void)
>   * check-command: sparse -Wno-decl $file
>   *
>   * check-error-start
> -restrict.c:11:6: error: symbol 'f02' redeclared with different type (originally declared at restrict.c:3) - incompatible argument 1 (different modifiers)
> -restrict.c:12:6: error: symbol 'f03' redeclared with different type (originally declared at restrict.c:4) - incompatible argument 1 (different modifiers)
> +restrict.c:11:6: error: symbol 'f02' redeclared with different type (incompatible argument 1 (different modifiers)):
> +restrict.c:11:6:    void extern [addressable] [toplevel] f02( ... )
> +restrict.c:3:6: note: previously declared as:
> +restrict.c:3:6:    void extern [addressable] [toplevel] f02( ... )
> +restrict.c:12:6: error: symbol 'f03' redeclared with different type (incompatible argument 1 (different modifiers)):
> +restrict.c:12:6:    void extern [addressable] [toplevel] f03( ... )
> +restrict.c:4:6: note: previously declared as:
> +restrict.c:4:6:    void extern [addressable] [toplevel] f03( ... )
>  restrict.c:33:13: warning: incorrect type in assignment (different modifiers)
>  restrict.c:33:13:    expected void **extern [assigned] pup
>  restrict.c:33:13:    got void *const *
> diff --git a/validation/typedef-redef.c b/validation/typedef-redef.c
> index 3a60a773168a..f90f266af193 100644
> --- a/validation/typedef-redef.c
> +++ b/validation/typedef-redef.c
> @@ -8,6 +8,9 @@ typedef long ko_t;
>   * check-name: typedef-redef
>   *
>   * check-error-start
> -typedef-redef.c:5:14: error: symbol 'ko_t' redeclared with different type (originally declared at typedef-redef.c:4) - different type sizes
> +typedef-redef.c:5:14: error: symbol 'ko_t' redeclared with different type (different type sizes):
> +typedef-redef.c:5:14:    long [usertype] ko_t
> +typedef-redef.c:4:14: note: previously declared as:
> +typedef-redef.c:4:14:    int [usertype] ko_t
>   * check-error-end
>   */
> 
> base-commit: f934193608415cff796694b5500f95e7b2e0fd17
> 

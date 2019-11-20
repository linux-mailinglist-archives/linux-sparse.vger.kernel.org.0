Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA3D103160
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 03:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727383AbfKTCGB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 Nov 2019 21:06:01 -0500
Received: from avasout04.plus.net ([212.159.14.19]:43246 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727222AbfKTCGB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 Nov 2019 21:06:01 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id XFNXir3wO4Al0XFNYiyIPy; Wed, 20 Nov 2019 02:06:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574215560; bh=xVbGlrKbgUmhKKbZxQZyy5KoQfz5dd6Ah2C1oxN6o34=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Xd+qmW2v57zriEtvEl3pXNoUa/CtV6qhCu+Sk0ilUvJMqgcuXzK/wz3knXvRaUzxe
         HZ46R+Ibz/0xNM1PGglm7h3xq3LGhK2cdsgC/X++LZk0f3f99Kb75HN3r95n4DlU6I
         a3KTi6TY7MwDl6m1LdlBNCTcqD7pI2R3B+u1OiH39aJiOUbYHRcCVJwbk0S3re1q3m
         bfZ8xAz4G7j1w7vrTcZvmHeqNqQP65Ar11cwNSPzbaqdUqa4kDUqdo69z/BLaYqbLp
         tHJsSx4Egxglzst4N0pWzsX4B3qZ7z/bnlqCoYqYnjSybBzDsdskTcIer36g8a5vts
         aeNyw30I+1AxQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=4zdO-yl4_2cbasJKGEkA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 1/5] add tests for function attributes
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
 <20191120000224.30441-2-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <0969a62b-4fab-eacb-b2aa-26c04b2f4a0b@ramsayjones.plus.com>
Date:   Wed, 20 Nov 2019 02:05:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191120000224.30441-2-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJBmZnWRh2w6UQVivqd0VwDlsZt+q6uvvUWt3Td8gOINposa0XWttu2aM70hAh+yPHVkGHfX1DG2aT/BaTXqs96X4k3FlYFZ7gbO+Uw5bzcvllL3IcB1
 mYPFLzSZr7bUFAqwBWF+duhRdNeQ+9DPekLkd/IPMBsUL56jyQ3mDu19f6iqt5BwDIwu9hDeadwfdQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 20/11/2019 00:02, Luc Van Oostenryck wrote:
> Function attributes need to be parsed differently than
> the usual specifiers. For example, in code like:
> 	#define __noreturn __attribute__((noreturn))
> 	__noreturn void foo(int a);
> the __noreturn attribute should apply to the function type,
> while a specifier like 'const' would apply to its return type.
> It's even more clear when function pointers are involved:
> 	__noreturn void (*fptr)(void);
> here too, the attribute should be applied to the function type,
> not the its return type, nor to the declared pointer type.

Hmm, it _is_ applied to the 'pointed to' type; ie the pointer
base type. I don't quite know how to say that succinctly (so
just ignore my rambling! ;-)

ATB,
Ramsay Jones

> 
> Add some testcases to cover some of the situations concerning
> the parsing of these function pointers.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  validation/attr-visible.c                | 13 +++++++++
>  validation/attr-visible2.c               | 10 +++++++
>  validation/bitwise-function-pointer.c    | 17 ++++++++++++
>  validation/function-attribute-inner.c    | 10 +++++++
>  validation/function-attribute-omitted.c  | 14 ++++++++++
>  validation/function-attribute-pointer.c  | 34 ++++++++++++++++++++++++
>  validation/function-attribute-void-ptr.c | 14 ++++++++++
>  validation/function-attribute.c          | 15 ++++++-----
>  validation/pure-function.c               | 17 +++++++++---
>  9 files changed, 134 insertions(+), 10 deletions(-)
>  create mode 100644 validation/attr-visible.c
>  create mode 100644 validation/attr-visible2.c
>  create mode 100644 validation/bitwise-function-pointer.c
>  create mode 100644 validation/function-attribute-inner.c
>  create mode 100644 validation/function-attribute-omitted.c
>  create mode 100644 validation/function-attribute-pointer.c
>  create mode 100644 validation/function-attribute-void-ptr.c
> 
> diff --git a/validation/attr-visible.c b/validation/attr-visible.c
> new file mode 100644
> index 000000000..38ee85752
> --- /dev/null
> +++ b/validation/attr-visible.c
> @@ -0,0 +1,13 @@
> +#define __visible __attribute__((externally_visible))
> +
> +__visible void foo(void)
> +{
> +}
> +
> +int flag __visible;
> +
> +/*
> + * check-name: attr-visible
> + * check-command: sparse -Wdecl $file
> + * check-known-to-fail
> + */
> diff --git a/validation/attr-visible2.c b/validation/attr-visible2.c
> new file mode 100644
> index 000000000..62949b479
> --- /dev/null
> +++ b/validation/attr-visible2.c
> @@ -0,0 +1,10 @@
> +#define __visible __attribute__((externally_visible))
> +
> +int flag __visible;
> +int arr[2] __visible;
> +
> +/*
> + * check-name: attr-visible-after
> + * check-command: sparse -Wdecl $file
> + * check-known-to-fail
> + */
> diff --git a/validation/bitwise-function-pointer.c b/validation/bitwise-function-pointer.c
> new file mode 100644
> index 000000000..544f2fc00
> --- /dev/null
> +++ b/validation/bitwise-function-pointer.c
> @@ -0,0 +1,17 @@
> +#define __bitwise __attribute__((bitwise))
> +
> +typedef unsigned int __bitwise t;
> +
> +unsigned int fun(void);
> +
> +static t (*ptr)(void) = fun;
> +
> +/*
> + * check-name: bitwise-function-pointer
> + *
> + * check-error-start
> +bitwise-function-pointer.c:7:25: warning: incorrect type in initializer (different base types)
> +bitwise-function-pointer.c:7:25:    expected restricted t ( *static [toplevel] ptr )( ... )
> +bitwise-function-pointer.c:7:25:    got unsigned int ( * )( ... )
> + * check-error-end
> + */
> diff --git a/validation/function-attribute-inner.c b/validation/function-attribute-inner.c
> new file mode 100644
> index 000000000..178c7c019
> --- /dev/null
> +++ b/validation/function-attribute-inner.c
> @@ -0,0 +1,10 @@
> +#define __noreturn __attribute__((__noreturn__))
> +
> +void __noreturn fun(void);
> +
> +_Static_assert([void (__noreturn *)(void)] == [typeof(&fun)], "");
> +
> +/*
> + * check-name: function-attribute-inner
> + * check-known-to-fail
> + */
> diff --git a/validation/function-attribute-omitted.c b/validation/function-attribute-omitted.c
> new file mode 100644
> index 000000000..43b301d8f
> --- /dev/null
> +++ b/validation/function-attribute-omitted.c
> @@ -0,0 +1,14 @@
> +#define __pure		__attribute__((pure))
> +#define __noreturn	__attribute__((noreturn))
> +
> +
> +int __pure	p(int i);
> +int		p(int i) { return i; }
> +
> +void __noreturn	n(void);
> +void		n(void) { while (1) ; }
> +
> +/*
> + * check-name: function-attribute-omitted
> + * check-known-to-fail
> + */
> diff --git a/validation/function-attribute-pointer.c b/validation/function-attribute-pointer.c
> new file mode 100644
> index 000000000..27f43bfb6
> --- /dev/null
> +++ b/validation/function-attribute-pointer.c
> @@ -0,0 +1,34 @@
> +#define __noreturn __attribute__((__noreturn__))
> +
> +void set_die(void (*)(void));
> +void set_die_nr(__noreturn void (*)(void));
> +
> +void die(void);
> +void __noreturn die_nr(void);
> +
> +static void foo(void)
> +{
> +	set_die(die);
> +	set_die(die_nr);
> +	set_die_nr(die_nr);
> +	set_die_nr(die);
> +
> +	           void (*fptr0)(void) = die;
> +	           void (*fptr1)(void) = die_nr;
> +	__noreturn void (*fptr3)(void) = die_nr;
> +	__noreturn void (*fptr2)(void) = die;
> +}
> +
> +/*
> + * check-name: function-attribute-pointer
> + * check-known-to-fail
> + *
> + * check-error-start
> +function-attribute-pointer.c:14:20: warning: incorrect type in argument 1 (different modifiers)
> +function-attribute-pointer.c:14:20:    expected void ( [noreturn] * )( ... )
> +function-attribute-pointer.c:14:20:    got void ( * )( ... )
> +function-attribute-pointer.c:19:42: warning: incorrect type in initializer (different modifiers)
> +function-attribute-pointer.c:19:42:    expected void ( [noreturn] *fptr2 )( ... )
> +function-attribute-pointer.c:19:42:    got void ( * )( ... )
> + * check-error-end
> + */
> diff --git a/validation/function-attribute-void-ptr.c b/validation/function-attribute-void-ptr.c
> new file mode 100644
> index 000000000..0092b63c3
> --- /dev/null
> +++ b/validation/function-attribute-void-ptr.c
> @@ -0,0 +1,14 @@
> +#define __noreturn __attribute__((__noreturn__))
> +
> +void fun(void *);
> +void __noreturn die(void);
> +
> +static void foo(void)
> +{
> +	void *ptr = die;
> +	fun(die);
> +}
> +
> +/*
> + * check-name: function-attribute-void-ptr
> + */
> diff --git a/validation/function-attribute.c b/validation/function-attribute.c
> index 0f2c75922..2be180c42 100644
> --- a/validation/function-attribute.c
> +++ b/validation/function-attribute.c
> @@ -1,17 +1,20 @@
>  #define __pure __attribute__((pure))
>  
> -struct s {
> -	int x;
> -};
>  
> -static __pure struct s *grab(struct s *ptr)
> +static __pure int funi(int val)
> +{
> +	return val;
> +}
> +
> +static __pure int *funp(int *ptr)
>  {
>  	return ptr;
>  }
>  
> -static void foo(struct s *ptr)
> +static void foo(int val, int *ptr)
>  {
> -	struct s *ptr = grab(ptr);
> +	int  nbr = funi(val);
> +	int *res = funp(ptr);
>  }
>  
>  /*
> diff --git a/validation/pure-function.c b/validation/pure-function.c
> index 04bb85e4d..9692cc842 100644
> --- a/validation/pure-function.c
> +++ b/validation/pure-function.c
> @@ -1,16 +1,25 @@
>  
> -static __attribute__((__pure__)) int pure1(void)
> +static __attribute__((__pure__)) int pure_int(int v)
>  {
> -	int i = 0;
> +	int i = v;
>  	return i;
>  }
>  
> -static __attribute__((__pure__)) void *pure2(void)
> +static __attribute__((__pure__)) void *pure_ptr(void *p)
>  {
> -    void *i = (void *)0;
> +    void *i = p;
>      return i;
>  }
>  
> +static void foo(int v, void *p)
> +{
> +	int   val = pure_int(v);
> +	void *ptr = pure_ptr(p);
> +
> +	(void)val;
> +	(void)ptr;
> +}
> +
>  /*
>   * check-name: Pure function attribute
>   */
> 

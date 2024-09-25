Return-Path: <linux-sparse+bounces-153-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9D986432
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2024 17:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 962001F26D28
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2024 15:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213D61BC59;
	Wed, 25 Sep 2024 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uBo8zCYc"
X-Original-To: linux-sparse@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0490218EA8
	for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2024 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727279645; cv=none; b=CSKtvHHI/ZLzMsxvBw7qJXHIluQ+hI+IsIIyVArJCl6Qdc6xXHKTfwvVWK8CYq4qWtbn/G617go7jLZkYpTrxkA5udtXGWN2/XuU90U4NgT5fz0VO3Tgwqk0/VZMlplm6SqNBcJI8tCz56ptn3Xf3C9GAjtShh58hnw7sGu/asc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727279645; c=relaxed/simple;
	bh=viYabtJz1TITnQz4Qa7lIMio94cIQKuN9RXprlUUn20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5cRiRt2jRHCVO0Q06+E0wv6wIczAV73t72p/5WQv53waTSZnzvK1SR8QLX5Elh0PUBTYylFGkSEByrgPKCfOCIyHyW5ZH6rSWgYh7HwI0guLhFLBHmNE+YZi19okkOQZ984OVuArIyxI4lPbdBI1/LxknMOOw41vqt0IpxHnCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uBo8zCYc; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a1a662a633so313565ab.1
        for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2024 08:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727279642; x=1727884442; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtlWMtq+JiEyWaKdO0nlwORQa61CRpWkCRYLpleOmWc=;
        b=uBo8zCYcIUJhS/PETf/69bupBGH621jT9YSETyyoKqXOKliYYHE14wU2XYwl3A0Sxs
         avFXLpOlKG1iDnsgjPremaiZ/sL8gi+DhtPwdzSnvI9BAx2FWDnXRCsGB00rhwxzIPSC
         y3Bmqq/uDBl+VjgBgr8MJd6URamV2xVVzRYBUjPI5rZAOeS5jZGZQZrKMFy1fM9TP5ji
         K1iPoZA+53P9UDeQG5OUIKnrRY6lKNRw6n6gWP3NWCb6oLnR5jncL6e/W8GqmOJwZx/2
         6CfvKnZYnueW+VBXDB4Z2aXesW6PBGjI7CM1zz957Cg0zLfk2PmXluePf7E1SPKoB+cz
         tdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727279642; x=1727884442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mtlWMtq+JiEyWaKdO0nlwORQa61CRpWkCRYLpleOmWc=;
        b=P6Q+1W17Cc9c33f3vUl3KMG3NWiWPbv08xqKFvbwYTAqM4wb19LaNvM7PT/RBjoc12
         5cJqP/RAJX9HEjeJ/LtO+uHynPGMdCuKz/UqUsC2z1w7lPF+nSn4NhwL4Y89x5H/pC07
         CqFiyd9TSQIrm3Vhzeh7UHue3ITbvpsD/KJF8s1h4vzF85uEslyBVjSBFMRTiDGqp4Pt
         7Or4JwZDrzNBxhiM7ZEcetHfDqCuKHDQQCeeAKQevwBFB0lNKO+/mgdPEFBMEkPtQjdI
         523gvJnWwXWGRmVTOCu2gUxUhh7LN8v6OHqRPeIR6giqxZg9e1G7J356qW97opSHwvih
         Pg2g==
X-Forwarded-Encrypted: i=1; AJvYcCVq+usiVdBTD8tonFv1+TxNzTZfO5JNqoepkqRCFZ/AemE2zVRSQSMUVr6cPx0y2XEgOznvJFJKASbRNs0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ZriiRpA+SGg966cxpQuY9oFFNDNHF5gr7UEpzQrepN7O5PJ+
	YNEsj6B/ZhFSvbaVN1Fq8DHggfLKnxxzLnr1L2AJDL/hHtsgnZ+zmAfePIZecQuiM1pAqj+Bjbu
	wbTbAbvtvV4rLMRGtjG51RrFVlzPmYsJqZKLV
X-Google-Smtp-Source: AGHT+IECKVgNpXJyra6xJfQTQh6aQ7i0vY0ZTk0QtA5OBdxknRIVX3nOfLE4llLAa859tdiG19FbtS4i20eJ0xsZ7pg=
X-Received: by 2002:a05:6e02:b2e:b0:3a0:926a:8d35 with SMTP id
 e9e14a558f8ab-3a27443ee75mr1540455ab.17.1727279641904; Wed, 25 Sep 2024
 08:54:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com> <20240925150059.3955569-35-ardb+git@google.com>
In-Reply-To: <20240925150059.3955569-35-ardb+git@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Sep 2024 08:53:50 -0700
Message-ID: <CAP-5=fXw1rcgWgMeDSVqiDYh2XYApyaJpNvukvJ7vMs7ZPMr6g@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 8:02=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Specify the guard symbol for the stack cookie explicitly, rather than
> positioning it exactly 40 bytes into the per-CPU area. Doing so removes
> the need for the per-CPU region to be absolute rather than relative to
> the placement of the per-CPU template region in the kernel image, and
> this allows the special handling for absolute per-CPU symbols to be
> removed entirely.
>
> This is a worthwhile cleanup in itself, but it is also a prerequisite
> for PIE codegen and PIE linking, which can replace our bespoke and
> rather clunky runtime relocation handling.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/Makefile                     |  4 ++++
>  arch/x86/include/asm/init.h           |  2 +-
>  arch/x86/include/asm/processor.h      | 11 +++--------
>  arch/x86/include/asm/stackprotector.h |  4 ----
>  tools/perf/util/annotate.c            |  4 ++--
>  5 files changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 6b3fe6e2aadd..b78b7623a4a9 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -193,6 +193,10 @@ else
>          KBUILD_RUSTFLAGS +=3D -Cno-redzone=3Dy
>          KBUILD_RUSTFLAGS +=3D -Ccode-model=3Dkernel
>
> +        ifeq ($(CONFIG_STACKPROTECTOR),y)
> +                KBUILD_CFLAGS +=3D -mstack-protector-guard-symbol=3Dfixe=
d_percpu_data
> +        endif
> +
>          # Don't emit relaxable GOTPCREL relocations
>          KBUILD_AFLAGS_KERNEL +=3D -Wa,-mrelax-relocations=3Dno
>          KBUILD_CFLAGS_KERNEL +=3D -Wa,-mrelax-relocations=3Dno
> diff --git a/arch/x86/include/asm/init.h b/arch/x86/include/asm/init.h
> index 14d72727d7ee..3ed0e8ec973f 100644
> --- a/arch/x86/include/asm/init.h
> +++ b/arch/x86/include/asm/init.h
> @@ -2,7 +2,7 @@
>  #ifndef _ASM_X86_INIT_H
>  #define _ASM_X86_INIT_H
>
> -#define __head __section(".head.text")
> +#define __head __section(".head.text") __no_stack_protector
>
>  struct x86_mapping_info {
>         void *(*alloc_pgt_page)(void *); /* allocate buf for page table *=
/
> diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/proc=
essor.h
> index 4a686f0e5dbf..56bc36116814 100644
> --- a/arch/x86/include/asm/processor.h
> +++ b/arch/x86/include/asm/processor.h
> @@ -402,14 +402,9 @@ struct irq_stack {
>  #ifdef CONFIG_X86_64
>  struct fixed_percpu_data {
>         /*
> -        * GCC hardcodes the stack canary as %gs:40.  Since the
> -        * irq_stack is the object at %gs:0, we reserve the bottom
> -        * 48 bytes of the irq stack for the canary.
> -        *
> -        * Once we are willing to require -mstack-protector-guard-symbol=
=3D
> -        * support for x86_64 stackprotector, we can get rid of this.
> +        * Since the irq_stack is the object at %gs:0, the bottom 8 bytes=
 of
> +        * the irq stack are reserved for the canary.
>          */
> -       char            gs_base[40];
>         unsigned long   stack_canary;
>  };
>
> @@ -418,7 +413,7 @@ DECLARE_INIT_PER_CPU(fixed_percpu_data);
>
>  static inline unsigned long cpu_kernelmode_gs_base(int cpu)
>  {
> -       return (unsigned long)per_cpu(fixed_percpu_data.gs_base, cpu);
> +       return (unsigned long)&per_cpu(fixed_percpu_data, cpu);
>  }
>
>  extern asmlinkage void entry_SYSCALL32_ignore(void);
> diff --git a/arch/x86/include/asm/stackprotector.h b/arch/x86/include/asm=
/stackprotector.h
> index 00473a650f51..d1dcd22a0a4c 100644
> --- a/arch/x86/include/asm/stackprotector.h
> +++ b/arch/x86/include/asm/stackprotector.h
> @@ -51,10 +51,6 @@ static __always_inline void boot_init_stack_canary(voi=
d)
>  {
>         unsigned long canary =3D get_random_canary();
>
> -#ifdef CONFIG_X86_64
> -       BUILD_BUG_ON(offsetof(struct fixed_percpu_data, stack_canary) !=
=3D 40);
> -#endif
> -
>         current->stack_canary =3D canary;
>  #ifdef CONFIG_X86_64
>         this_cpu_write(fixed_percpu_data.stack_canary, canary);
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index 37ce43c4eb8f..7ecfedf5edb9 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -2485,10 +2485,10 @@ static bool is_stack_operation(struct arch *arch,=
 struct disasm_line *dl)
>
>  static bool is_stack_canary(struct arch *arch, struct annotated_op_loc *=
loc)
>  {
> -       /* On x86_64, %gs:40 is used for stack canary */
> +       /* On x86_64, %gs:0 is used for stack canary */
>         if (arch__is(arch, "x86")) {
>                 if (loc->segment =3D=3D INSN_SEG_X86_GS && loc->imm &&
> -                   loc->offset =3D=3D 40)
> +                   loc->offset =3D=3D 0)

As a new perf tool  can run on old kernels we may need to have this be
something like:
(loc->offset =3D=3D 40 /* pre v6.xx kernels */ || loc->offset =3D=3D 0 /*
v6.xx and later */ )

We could make this dependent on the kernel by processing the os_release str=
ing:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/env.h#n55
but that could well be more trouble than it is worth.

Thanks,
Ian

>                         return true;
>         }

>
> --
> 2.46.0.792.g87dc391469-goog
>


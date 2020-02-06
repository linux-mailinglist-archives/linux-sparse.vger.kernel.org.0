Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3D7515435E
	for <lists+linux-sparse@lfdr.de>; Thu,  6 Feb 2020 12:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727609AbgBFLqZ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 6 Feb 2020 06:46:25 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43312 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727111AbgBFLqY (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 6 Feb 2020 06:46:24 -0500
Received: by mail-wr1-f66.google.com with SMTP id z9so6750126wrs.10
        for <linux-sparse@vger.kernel.org>; Thu, 06 Feb 2020 03:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BecDWrWqLTj46wRStzWfbRH00samyFoCiOUQRNfW3z0=;
        b=UJvv4b4Qa4xWerA30y/yqer9HUNZGZTRHVN4Esrn1qKgP/jY19BzFr+8U1cnh3Jdz5
         YXlhBTceQ5RdaVi+6ZAW/buqU4C9suEiVmvztvzbfX7eKhQW9twElyMj/zYBUawUL8ut
         tYv7JHFsvVDsbU0lRplSIHwY5Ixd8ydqfCRWXyHk0nANpbWrb9aSrKsBf2EcNkfeeWf2
         JnIB5VPujMruq49AZqRc3yVlf2tlhneTt7hC3zEyQVwW6Om8ZOXGllyV/e28dbNx1uL5
         XZr2jTUcWAbESyP2iAQYkL0rO6IUUnRn8TUtW/uwdFgKqK/I6MHZA6i+kbvd2K1ykxPN
         bzpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BecDWrWqLTj46wRStzWfbRH00samyFoCiOUQRNfW3z0=;
        b=go7zVP0F5F6J4+dR45/bxm9W8ob7K48/IRUTh3SXMQq9XOSXANa52dZpfsKig30yZ4
         hvugA/zPGEhY9rujuAhkAnC3wTxO/uPCnlh962pjPwNjSJAVxoMzBKPkpUyvn/lqhCiQ
         sv3iVTDjtOUZ0tWBvpMPy+ZGkKTCMq8BnInoXtay0f2l0CYrWfaHLAwtnRD14pwCiXIa
         5E+R/nMcybyUsYEe8SvkBRb18gus/87F8Z9hpjuoepewHYhuGazEK0yDbJ7YM2Lug2AU
         5HWfoZ9dcUv0bU95WD+0z7Khjtmbk5hk1C8D8oRnalSsZrHHd21SHbirEX10Bg+LCC6z
         +Pgg==
X-Gm-Message-State: APjAAAWX9S0uoYbSeY36mipXzdDNzu5SLYgdJornfTJrgJw0Li4N68iw
        /53zTNnwud0pQy/HkJx6AcU=
X-Google-Smtp-Source: APXvYqxF3rt89yy1XO7+tvrM8Kn0STc3Vnbq6G2pxkHx0hJLHrSyL/KZ9T5VXFztAbZVaFVH6341HQ==
X-Received: by 2002:adf:fd43:: with SMTP id h3mr3396601wrs.169.1580989581790;
        Thu, 06 Feb 2020 03:46:21 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:7c4c:6743:ca73:a9e5])
        by smtp.gmail.com with ESMTPSA id m3sm3750910wrs.53.2020.02.06.03.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 03:46:20 -0800 (PST)
Date:   Thu, 6 Feb 2020 12:46:19 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>
Subject: Re: sparse problem with Linux kernel v5.5
Message-ID: <20200206114619.bfszxgs6jmdgroo6@ltop.local>
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Feb 06, 2020 at 07:18:45AM +0000, Linus Torvalds wrote:
> On Thu, Feb 6, 2020 at 4:49 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Also, what is errno 137? (0x89)
>=20
> I think that's just "killed by signal 9" (the high bit is "killed by
> signal", the low bits are the signal number).
>=20
> SIGKILL - oom? What does 'dmesg' say? Maybe there's some exponential
> memory use triggered by something in that bpf_sk_storage file..
>=20

Hi Randy,
What config are you using?

Here, on next-20200205 (commit 14b549456391a8b8f812529896b2690c16349734)
the file bpf_sk_storage.c is not compiled with the default config
(I suppose because of CONFIG_BPF_SYSCALL).
With allyesconfig, I see nothing particular ('-fmem-report' added):
  $ time sparse -fmem-report -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix=
__ -Wbitwise -Wno-return-void -Wno-unknown-attribute  -D__x86_64__ --arch=
=3Dx86 -mlittle-endian -m64 -Wp,-MD,net/core/.bpf_sk_storage.o.d  -nostdinc=
 -isystem /usr/lib/gcc/x86_64-linux-gnu/8/include -I./arch/x86/include -I./=
arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/=
x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -inc=
lude ./include/linux/kconfig.h -include ./include/linux/compiler_types.h -D=
__KERNEL__ -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fno-st=
rict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-functio=
n-declaration -Werror=3Dimplicit-int -Wno-format-security -std=3Dgnu89 -mno=
-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=3D1 -falign-=
loops=3D1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3D3 -msk=
ip-rax-setup -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -DCONFIG_X86_=
X32_ABI -DCONFIG_AS_CFI=3D1 -DCONFIG_AS_CFI_SIGNAL_FRAME=3D1 -DCONFIG_AS_CF=
I_SECTIONS=3D1 -DCONFIG_AS_SSSE3=3D1 -DCONFIG_AS_AVX=3D1 -DCONFIG_AS_AVX2=
=3D1 -DCONFIG_AS_AVX512=3D1 -DCONFIG_AS_SHA1_NI=3D1 -DCONFIG_AS_SHA256_NI=
=3D1 -Wno-sign-compare -fno-asynchronous-unwind-tables -mindirect-branch=3D=
thunk-extern -mindirect-branch-register -fno-jump-tables -fno-delete-null-p=
ointer-checks -Wno-frame-address -Wno-format-truncation -Wno-format-overflo=
w -O2 --param=3Dallow-store-data-races=3D0 -fno-reorder-blocks -fno-ipa-cp-=
clone -fno-partial-inlining -Wframe-larger-than=3D2048 -fstack-protector-st=
rong -Wno-unused-but-set-variable -Wimplicit-fallthrough -Wno-unused-const-=
variable -fno-var-tracking-assignments -pg -mrecord-mcount -mfentry -DCC_US=
ING_FENTRY -fno-inline-functions-called-once -Wdeclaration-after-statement =
-Wvla -Wno-pointer-sign -Wno-stringop-truncation -fno-strict-overflow -fno-=
merge-all-constants -fmerge-constants -fno-stack-check -fconserve-stack -We=
rror=3Ddate-time -Werror=3Dincompatible-pointer-types -Werror=3Ddesignated-=
init -fmacro-prefix-map=3D./=3D -fcf-protection=3Dnone -Wno-packed-not-alig=
ned    -fsanitize=3Dkernel-address -fasan-shadow-offset=3D0xdffffc000000000=
0   --param asan-globals=3D1   --param asan-instrumentation-with-call-thres=
hold=3D0   --param asan-stack=3D1   --param asan-instrument-allocas=3D1   -=
fsanitize-coverage=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp    -DKBUILD_M=
ODFILE=3D'"net/core/bpf_sk_storage"' -DKBUILD_BASENAME=3D'"bpf_sk_storage"'=
 -DKBUILD_MODNAME=3D'"bpf_sk_storage"' net/core/bpf_sk_storage.c; echo $?
       allocator:   allocs,      bytes,      total,  %usage,  average
          tokens:        0,          0,          0,   0.00%,     0.00
     identifiers:    56223,    2262233,    2490368,  90.84%,    40.24
         symbols:   799200,  172627200,  173441024,  99.53%,   216.00
     expressions: 39852179, 2550539456, 2555543552,  99.80%,    64.00
      statements:   663762,   53100960,   53182464,  99.85%,    80.00
          scopes:    18206,     291296,     294912,  98.77%,    16.00
     basic_block:     1736,     180544,     196608,  91.83%,   104.00
     instruction:     7289,     583120,     589824,  98.86%,    80.00
          pseudo:     5181,     207240,     229376,  90.35%,    40.00
     pseudo_user:     6967,     111472,     131072,  85.05%,    16.00
        ptr list:   961807,  123111296,  123600896,  99.60%,   128.00
        multijmp:      275,       6600,      32768,  20.14%,    24.00
       asm rules:      241,       5784,      32768,  17.65%,    24.00
 asm constraints:      218,       6976,      32768,  21.29%,    32.00
        contexts:       42,        672,      32768,   2.05%,    16.00
         strings:    11288,     329766,     360448,  91.49%,    29.21
           bytes:    31957,     125216,     131072,  95.53%,     3.92
           total: 42416571, 2903489831, 2910322688,  99.77%,    68.45

real	0m5.391s
user	0m3.594s
sys	0m1.797s
0

In short, using 3G of RAM in 5secs without errors.


-- Luc


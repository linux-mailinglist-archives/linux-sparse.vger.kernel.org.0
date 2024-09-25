Return-Path: <linux-sparse+bounces-158-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA79865EF
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2024 19:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D27CE2880CF
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2024 17:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772D613BAC6;
	Wed, 25 Sep 2024 17:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EhfvPwe5"
X-Original-To: linux-sparse@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88510129E93
	for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2024 17:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727286524; cv=none; b=UsipoStrEvihMjRoaHa5kRpST1W6hUkSVHO7lDfLlFT0e9h322oh4kITVA9906F+OyWV88paTz11f0wh/Mo+fjBSDNHOME9COZ33k1ujyD5jgRATLBU8NdrA9GlXZ3glod05yepcMkY9unajRWpY/am8fPgFrnqgllrxZLucCtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727286524; c=relaxed/simple;
	bh=A8pJXK5Zztv371Oe9drq6CplFViPG0d7lDriodHWbVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=diWpaEZkejxdMitVWanwj0N2Mzw2W/EzCvKseA8HvgzniGADBz7HastDisx8HKyPkDMPTBUfSkIASivL3DRx4AVLmy8sCkhu21Lov7GTSFnyrnUbzXMvPZUzrtMHn2wD5Dhr7A4ImSp2E+f3VPuXEqOVdVGFDXuwRiq1VxRPCyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EhfvPwe5; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20b061b7299so14175ad.1
        for <linux-sparse@vger.kernel.org>; Wed, 25 Sep 2024 10:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727286522; x=1727891322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrK3h7FdOSPKkdvPmV4/inQbE4aDL8B9EB3Kr7AaA5w=;
        b=EhfvPwe52EJcoK5OTD/Baq29N3KooUMm7CDlp7y5ZrJVaZvCNr8JqLYQh7dWcKboLs
         IBUfLMcCYJjIGvVShgr7/f/OXpTV2jPv3O+fSX6gm4tLDkMS+FFr8C0AhxIeSOML9jwc
         VYQXw/PVz/BV3p2E5K7SnFnASduW83uLL+qP2+FngFQA2L0rJ7s/2Yck3jVMsGBv45I1
         I2+s58Oy5yXD5PBZHKfuNgZQJLcLXiHW+gHT78cDPv3V5NhxBxxKxulUoy+TCpfFiika
         xxUaNwK1vVGaB9gWfmfPzY6EhlIVKP0pV3pSWTFStoU7isVzNW8Qwc18VTrQaGvU4gim
         uSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727286522; x=1727891322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrK3h7FdOSPKkdvPmV4/inQbE4aDL8B9EB3Kr7AaA5w=;
        b=lCvUBO52J9bs6wweG8M8xWyZhZlspEPqjW16tK0OYvxSaFrM2bULvUoNO1/XjiFApU
         oY9egWHG1h3/DUX3K1UFBCtuNF98DVAwRHmdy9Zn31VRxzJivhfQbIpCmohEvA9VsYfb
         Stan32/8FKUOKlihMiRlita1kv2Ddl2Vv6Le7SRObKHWGNcpXJISFCaQ935EoAorh1y7
         6Jcj2G2RcXWHYBZZMu8LMQKtazgS0NcVQzXg+AXCx3Z9nEh2NgmduxD4oJw76prDUfaF
         Uf+Sxy6mwHNcPzpIf8ZyOd9chE8R8pRTxPpZmwsfxHB76fQE3t2gSIfMUWNcD9kLWH6L
         IT7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXa4a6BlZKjC4VO1IGCHdRbnRnSYkKZCy9IPCD/uerEPG9kmE+6+vpLKW3SZ6F5eh9V4nrlx/JTgDVAOFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx36wrMnbl7qKjAjMKFqDgLzTMVP5p/CPgXjPRTrYLksTNC01SL
	9H5FaAXdMBqyLZ30xdak/rF8g+Cp7jCtHT9s0cMdZ/WqHpGH/9/F9Zs696K1bUKHdZghdEyi8Fd
	RZrZeEJV6EbVHREzOS/3Lbb4gkGY02+3XFSpN
X-Google-Smtp-Source: AGHT+IFiXYlI29ocsY9jVI8vGIQKmEL8X6grxbcgFKgyWyz2ix/vsNm7/Zsem2ox1yGF0FtMygKog55oBTNJR6Dh6yI=
X-Received: by 2002:a17:903:1210:b0:206:a913:96b9 with SMTP id
 d9443c01a7336-20b1b302843mr105105ad.10.1727286521405; Wed, 25 Sep 2024
 10:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
 <20240925150059.3955569-35-ardb+git@google.com> <CAP-5=fXw1rcgWgMeDSVqiDYh2XYApyaJpNvukvJ7vMs7ZPMr6g@mail.gmail.com>
 <CAMj1kXEmssrOhu20aLW4v88YVdkCfbeRg6arkgUoDNHm-4vbMA@mail.gmail.com>
In-Reply-To: <CAMj1kXEmssrOhu20aLW4v88YVdkCfbeRg6arkgUoDNHm-4vbMA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Sep 2024 10:48:27 -0700
Message-ID: <CAP-5=fXstnbX7rY1_RcOP_TmuXqY3HTt__4VgEkgNEJQPHxezg@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] x86: Define the stack protector guard symbol explicitly
To: Ard Biesheuvel <ardb@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-doc@vger.kernel.org, linux-pm@vger.kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-efi@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:43=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Wed, 25 Sept 2024 at 17:54, Ian Rogers <irogers@google.com> wrote:
> >
> > On Wed, Sep 25, 2024 at 8:02=E2=80=AFAM Ard Biesheuvel <ardb+git@google=
.com> wrote:
> > >
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Specify the guard symbol for the stack cookie explicitly, rather than
> > > positioning it exactly 40 bytes into the per-CPU area. Doing so remov=
es
> > > the need for the per-CPU region to be absolute rather than relative t=
o
> > > the placement of the per-CPU template region in the kernel image, and
> > > this allows the special handling for absolute per-CPU symbols to be
> > > removed entirely.
> > >
> > > This is a worthwhile cleanup in itself, but it is also a prerequisite
> > > for PIE codegen and PIE linking, which can replace our bespoke and
> > > rather clunky runtime relocation handling.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > > ---
> > >  arch/x86/Makefile                     |  4 ++++
> > >  arch/x86/include/asm/init.h           |  2 +-
> > >  arch/x86/include/asm/processor.h      | 11 +++--------
> > >  arch/x86/include/asm/stackprotector.h |  4 ----
> > >  tools/perf/util/annotate.c            |  4 ++--
> > >  5 files changed, 10 insertions(+), 15 deletions(-)
> > >
> ...
> > > diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> > > index 37ce43c4eb8f..7ecfedf5edb9 100644
> > > --- a/tools/perf/util/annotate.c
> > > +++ b/tools/perf/util/annotate.c
> > > @@ -2485,10 +2485,10 @@ static bool is_stack_operation(struct arch *a=
rch, struct disasm_line *dl)
> > >
> > >  static bool is_stack_canary(struct arch *arch, struct annotated_op_l=
oc *loc)
> > >  {
> > > -       /* On x86_64, %gs:40 is used for stack canary */
> > > +       /* On x86_64, %gs:0 is used for stack canary */
> > >         if (arch__is(arch, "x86")) {
> > >                 if (loc->segment =3D=3D INSN_SEG_X86_GS && loc->imm &=
&
> > > -                   loc->offset =3D=3D 40)
> > > +                   loc->offset =3D=3D 0)
> >
> > As a new perf tool  can run on old kernels we may need to have this be
> > something like:
> > (loc->offset =3D=3D 40 /* pre v6.xx kernels */ || loc->offset =3D=3D 0 =
/*
> > v6.xx and later */ )
> >
> > We could make this dependent on the kernel by processing the os_release=
 string:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/env.h#n55
> > but that could well be more trouble than it is worth.
> >
>
> Yeah. I also wonder what the purpose of this feature is. At the end of
> this series, the stack cookie will no longer be at a fixed offset of
> %GS anyway, and so perf will not be able to identify it in the same
> manner. So it is probably better to just leave this in place, as the
> %gs:0 case will not exist in the field (assuming that the series lands
> all at once).
>
> Any idea why this deviates from other architectures? Is x86_64 the
> only arch that needs to identify stack canary accesses in perf? We
> could rename the symbol to something identifiable, and do it across
> all architectures, if this really serves a need (and assuming that
> perf has insight into the symbol table).

This is relatively new work coming from Namhyung for data type
profiling and I believe is pretty much just x86 at the moment -
although the ever awesome IBM made contributions for PowerPC. The data
type profiling is trying to classify memory accesses which is why it
cares about the stack canary instruction, the particular encoding
shouldn't matter.

Thanks,
Ian


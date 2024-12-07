Return-Path: <linux-sparse+bounces-322-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31B49E81DB
	for <lists+linux-sparse@lfdr.de>; Sat,  7 Dec 2024 20:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D2A92816F0
	for <lists+linux-sparse@lfdr.de>; Sat,  7 Dec 2024 19:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6310E15350B;
	Sat,  7 Dec 2024 19:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gwdg.de header.i=@gwdg.de header.b="OBmID/jx"
X-Original-To: linux-sparse@vger.kernel.org
Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BABB29422;
	Sat,  7 Dec 2024 19:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733601118; cv=none; b=ngeLRG5PMpGhd/BKhIEOBEpI5CEmC1OUc7wENt3oxzMu3cXB85/r1NVF31Nt17hBFsNt4GFCRi+uuRQwXbNQlTHx+JqQ4mBCOnUw6WNEtMnT5lXL78EG1KjZ4ebui4qG1MjRs2w61q9Obi3ZLdOWNiyostwTjaTrvx1lRgpHzR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733601118; c=relaxed/simple;
	bh=pJ3lkL6KRFTlQ0lGreF5+t54DgtOfeecQp8t4W0DNJk=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aacGF7Ae8tbe0kN/N97jZyxNQCNQ2UYQKb2Rc4pmWqlDxrhBmBRcYI42xq7Mq8WVHWTBsJ/kY5ovks4+JxhZFHjkGKZza8GPynCi78jbXoEOFYQdmVgzH6uCfUhJwex6f4LP1AmijT8DPGqTmnhtc/wUF5jovX3bIEyWNzSHfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gwdg.de; spf=pass smtp.mailfrom=gwdg.de; dkim=pass (2048-bit key) header.d=gwdg.de header.i=@gwdg.de header.b=OBmID/jx; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gwdg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gwdg.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=pJ3lkL6KRFTlQ0lGreF5+t54DgtOfeecQp8t4W0DNJk=; b=OBmID/jxwEbbrHoC8NiXYOcyat
	xR5qAPxMQLCqGAh6qHlL8Z0Wg6/FvdgYO1aVGFWzKUFhSmsJE4hUCpa55oHcG/YBPFk0ZzJh9pC0c
	o+cX3u7HZmLX3mvc9AzLKjIy4w3a7TDpzZJJphPbPDtMLB6T+ta1MBZV383UBzFaYCrCpvXijVXmS
	02Gs72zXD6OJq/chxcquRQTREZRs9fomg9cWxIkfJx1kL7sMX9QEFKTElF27Sm3TY7plA8BtylsOm
	e5QBHRWQk7PJRI9ipEcmVjCl8IN1bocpdXgnHu84I80m0bCH2nkhCsnw/tMHUl11ObHZas9gMkOMf
	ZL/Xvkyw==;
Received: from xmailer.gwdg.de ([134.76.10.29]:38540)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tK0qG-004PaM-08;
	Sat, 07 Dec 2024 20:51:52 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tK0qF-00069Y-2w;
	Sat, 07 Dec 2024 20:51:51 +0100
Received: from [192.168.0.221] (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Sat, 7 Dec
 2024 20:51:50 +0100
Message-ID: <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
From: Martin Uecker <muecker@gwdg.de>
To: Linus Torvalds <torvalds@linux-foundation.org>, Vincent Mailhol
	<vincent.mailhol@gmail.com>
CC: David Laight <David.Laight@aculab.com>, "w@1wt.eu" <w@1wt.eu>, "Luc Van
 Oostenryck" <luc.vanoostenryck@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, "Bill
 Wendling" <morbo@google.com>, Justin Stitt <justinstitt@google.com>, "Yury
 Norov" <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
	<joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Rikard Falkeborn
	<rikard.falkeborn@gmail.com>, "linux-sparse@vger.kernel.org"
	<linux-sparse@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, "linux-hardening@vger.kernel.org"
	<linux-hardening@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Date: Sat, 7 Dec 2024 20:51:49 +0100
In-Reply-To: <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
	 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
	 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
	 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
	 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
	 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
	 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
	 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
	 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
	 <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
	 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com>
	 <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
	 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
	 <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
	 <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
	 <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: MBX19-FMZ-05.um.gwdg.de (10.108.142.64) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:6, sv:1733572982, ts:1733601111
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -

Am Samstag, dem 07.12.2024 um 10:19 -0800 schrieb Linus Torvalds:
> On Sat, 7 Dec 2024 at 04:24, Vincent Mailhol <vincent.mailhol@gmail.com> =
wrote:
> >=20
> > > No good - expands everything twice.
> >=20
> > And? __is_const_zero() does not evaluate its arguments, so no side effe=
ct:
>=20
> No, the problem is literally the expansion.
>=20
> Double expansion of these fundamental helpers gets exponential,
> because they are used in various nested ways in other fundamental
> helpers.
>=20
> That's why we then spent so much effort on trying to clean up the
> min/max macros, because a single line of code would expand to
> literally tens of megabytes of horrific expansions.
>=20
> And the problem with these things is that you can't make them inline
> functions, so they have to be macros, and then you build up other
> macros using them (like that "clamp()" macro), and it really gets
> horrendous and affects the build time.
>=20
> And yes, it is very sad. Particularly since a compiler would have a
> really easy time with some nice helper builtins.
>=20
> Of course, often the compiler *does* have helper builtins, but we
> can't use them, because they aren't *quite* the right thing. Like that
> "__builtin_constant_p()" not actually working for some situations
> where we absolutely need not just a constant value, but a constant
> _expression_ due to C parsing rules.
>=20
> Quite a lot of the pain we tend to have with these things is directly
> related to the fact that we often want to do these tests in contexts
> like global array initializers etc.
>=20
> If there is one feature of C I would have liked it is "allow inline
> functions and statement expressions with constant arguments as
> constant expressions". Other languages have done that, and it really
> does help. And yes, it means that you have to basically have a
> language interpreter in the compiler (you do want to allow loop
> constructions etc), but it really is very useful.
>=20
> Oh well. Even if compilers added that today, it would be years until
> we could take advantage of it.
>=20
> At one point I literally was thinking I'd do 'sparse' as a
> pre-processor for kernel code, in order to have extended language
> facilities like that.

There exist proposals along those lines for C2Y.

From a more near-term solution, I wonder if making it possible (or
easier) to return integer constant expressions from statement
expressions and allowing a restricted form of statement expressions=C2=A0
at file scope would help?


Martin





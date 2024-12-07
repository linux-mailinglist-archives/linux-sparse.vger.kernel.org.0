Return-Path: <linux-sparse+bounces-315-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C96BE9E8055
	for <lists+linux-sparse@lfdr.de>; Sat,  7 Dec 2024 15:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77B2318840FC
	for <lists+linux-sparse@lfdr.de>; Sat,  7 Dec 2024 14:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B129C1487FE;
	Sat,  7 Dec 2024 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gwdg.de header.i=@gwdg.de header.b="CbEoEgJJ"
X-Original-To: linux-sparse@vger.kernel.org
Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773501494A5;
	Sat,  7 Dec 2024 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733583569; cv=none; b=sgkokj2NVADumCffc3KNCWhCz5sveFCI/lnvtS9b2ZBkZ0FRxk3iTcRvKRWqXF3HEXpdbsnmjUkt8YySmhE0YNTiQTuo+IAEX11subgIhQy1OzqKK3kqUGkGqbCcsPPqJaoxjueVOMjZIOCQYsr60JXDtj4jzUUVO1xCg67v1pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733583569; c=relaxed/simple;
	bh=JlN5A2GF55JwW2Z14a0Q5ZPrrx7LaAscP9etFRTo1IQ=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B3+4Dvis9A/Jot10eQJT0rHFb0KpoJQUL3VayXUYUZZNBvgaRPL7rIdip80Vrps2BGIRZmgG3YfKSBQtdeBFbPBOB3vPrmFG8UKaI62udNs1DVdTSDi+fcd4iLNdfz7vmQmXKdc6tOfMnbQPjawdENwGCKhW0FWYvvUkEDSRDD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gwdg.de; spf=pass smtp.mailfrom=gwdg.de; dkim=pass (2048-bit key) header.d=gwdg.de header.i=@gwdg.de header.b=CbEoEgJJ; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gwdg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gwdg.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gwdg.de;
	s=2023-rsa; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1ZQZ2P4X11XUh3/AmfJ9LodEYUGwzm9ljaljfQMxpC8=; b=CbEoEgJJWkfk7etBghxPUIW3ao
	jG9EXzXwhGOguUYccsOMcvF/dchUxm9KnfHzR0/ReGu/dSAUXjfNZHDirRMCj2Qkur15yeR4HMXZK
	N3d5J8WClYuymxxW1Rc1oqjST4vSX35BORz1G6VQm5fjwc2ieDt8hVdLRDnEvhnD/RwkTrMo/yJLB
	xZfTOtASEvh3e1Xd4RiprbqJeV3Ki8Q+uQy/1RkxdI7KodAv7UlV7fw7tHfPjt6EFJaoqcPD7pea3
	9L72aSh4ZzpkLlAMZVXRJ3KPRAVcPAxnw0S/vRb6V41B+ESFwv0puOkZEJsajK9li/HGkAdbVg5R+
	FkP++QEg==;
Received: from xmailer.gwdg.de ([134.76.10.29]:39687)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tJwH9-004NAS-1N;
	Sat, 07 Dec 2024 15:59:19 +0100
Received: from mbx19-fmz-06.um.gwdg.de ([10.108.142.65] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <muecker@gwdg.de>)
	id 1tJwH9-000ADM-0y;
	Sat, 07 Dec 2024 15:59:19 +0100
Received: from [192.168.0.221] (10.250.9.200) by MBX19-FMZ-06.um.gwdg.de
 (10.108.142.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1544.14; Sat, 7 Dec
 2024 15:59:17 +0100
Message-ID: <470b5f46d45063fdc21e4e19eac68c18cb42db48.camel@gwdg.de>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
From: Martin Uecker <muecker@gwdg.de>
To: Vincent Mailhol <vincent.mailhol@gmail.com>
CC: David Laight <David.Laight@aculab.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, Luc Van Oostenryck
	<luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula
	<jani.nikula@linux.intel.com>, Joonas Lahtinen
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
Date: Sat, 7 Dec 2024 15:59:09 +0100
In-Reply-To: <CAMZ6RqL+iS6GVsY20=O6GdQakRpp7XdewZJsUbmE5OCsKaHR6Q@mail.gmail.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
	 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
	 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
	 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
	 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
	 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
	 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
	 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
	 <CAMZ6RqJGqBqvgxzp5yPFY1pk0WkkwEMM34qU-dZ3kXfsnKaqEg@mail.gmail.com>
	 <429e7c6713ecc94494d9107e5f5a1f0c8e854f23.camel@gwdg.de>
	 <CAMZ6RqL+iS6GVsY20=O6GdQakRpp7XdewZJsUbmE5OCsKaHR6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: MBX19-FMZ-04.um.gwdg.de (10.108.142.63) To
 MBX19-FMZ-06.um.gwdg.de (10.108.142.65)
X-EndpointSecurity-0xde81-EV: v:7.9.17.458, d:out, a:y, w:t, t:5, sv:1733541190, ts:1733583559
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -

Am Samstag, dem 07.12.2024 um 22:50 +0900 schrieb Vincent Mailhol:
> On Sat. 7 Dec. 2024 =C3=A0 22:19, Martin Uecker <muecker@gwdg.de> wrote:
> > Am Samstag, dem 07.12.2024 um 21:45 +0900 schrieb Vincent Mailhol:
> > > On Sat. 7 Dec. 2024 at 17:39, Martin Uecker <muecker@gwdg.de> wrote:
> > > > Am Freitag, dem 06.12.2024 um 16:26 +0900 schrieb Vincent Mailhol:

...


> > > But the core issue is that before getting this support in Linux, we
> > > have to wait for this to be added to the C2Y draft, then implemented
> > > in the compilers (probably just reusing the C++ constexpr functions)
> > > and finally wait maybe one more decade for the C2Y support to reach
> > > the kernel. For reference the kernel supports C11 only from 2022=E2=
=80=A6 So
> > > maybe we will see those in the kernel around 2037? Meanwhile, we have
> > > to deal with those hacks.
> >=20
> > If we do not collaborate on proper solutions, then you might have
> > to wait much longer.
>=20
> I was invited to WG14 this September.=C2=A0For now, I am only lurking. Th=
e
> thing I have in mind right now is to write a paper to allow the use of
> static_assert() in expressions (i.e. make it return 0 on success).
> That should be a relatively small change, but would bring a nice
> quality of life improvement.

Excellent, then I was complaining to the wrong person.=20


Martin

>=20
> For context, look at this:
>=20
>   https://lore.kernel.org/all/CAHk-=3DwjLSEcZ5LdW+3C+9rtjvNPHZT6zdk0POj67=
T5k2ZpDbgA@mail.gmail.com/T/#m1ba33a804b4041154b72a1d0333f90ec7204c461
>=20
> And I will definitely follow the progress of constexpr functions in C2Y.
>=20
>=20
> Yours sincerely,
> Vincent Mailhol



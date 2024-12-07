Return-Path: <linux-sparse+bounces-325-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC109E8222
	for <lists+linux-sparse@lfdr.de>; Sat,  7 Dec 2024 21:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C3FE1627B2
	for <lists+linux-sparse@lfdr.de>; Sat,  7 Dec 2024 20:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6937F156641;
	Sat,  7 Dec 2024 20:55:38 +0000 (UTC)
X-Original-To: linux-sparse@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6CE154C17
	for <linux-sparse@vger.kernel.org>; Sat,  7 Dec 2024 20:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.86.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733604938; cv=none; b=Al13kN8iHzTJKDm0eEmLn8QatfOadMaChbjLiGwDdEqCfXXce37MwoXpbqrQYaa1iaeseUumF/LirW0Zl5wvyanFiH+YkiQWpn+c67OY07kCQ3efAItop7l0BMrssLrKh+sq7xlLVGU2aKYFeGAIppNEyxW7uECv7bDRsICITcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733604938; c=relaxed/simple;
	bh=e/uQG0RrQKiCa4soxG4iPB9nEUqMrZOwm6qD+LoByhQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=VCtxj9ffC6T90/X6zyo1y7ZXP1X2uFOr9UyFMQqaaJ/UFWrI5+yj8qP6nDwWaC0gO8oXRkr1V7quLqYkNa+Ry6fDPFbrn2afS7PLt8yylYSXYndPPmfaDtWA7W+7daaCrsWE/C+Hpnr4nlLj1Wv3Af2BKOMZZFI4WoTj+yregpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.86.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-29-1K7yAWunPEWHerYqwBNUTg-1; Sat, 07 Dec 2024 20:55:27 +0000
X-MC-Unique: 1K7yAWunPEWHerYqwBNUTg-1
X-Mimecast-MFC-AGG-ID: 1K7yAWunPEWHerYqwBNUTg
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 7 Dec
 2024 20:54:36 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 7 Dec 2024 20:54:36 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, Martin Uecker
	<muecker@gwdg.de>
CC: Vincent Mailhol <vincent.mailhol@gmail.com>, "w@1wt.eu" <w@1wt.eu>, "Luc
 Van Oostenryck" <luc.vanoostenryck@gmail.com>, Nathan Chancellor
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
Subject: RE: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Topic: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Index: AQHbROFPJXcuwP9wN0+yRzIQ2cx/pbLWa+gggAFf14CAACMqUIABpzoGgAAClHCAAAPoAIAAAwjggAANnsCAAMAogIAAM0ZwgACjWkOAAAJUsA==
Date: Sat, 7 Dec 2024 20:54:35 +0000
Message-ID: <6b05ec695abc465e9b221fb1180a0fa1@AcuMS.aculab.com>
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
 <6b8c9b942ba6e85a3f1e4eef65a9916333502881.camel@gwdg.de>
 <CAHk-=whzFAaksqMdYeYC=T82tny1HnGGcYu_xJTXZF1OZwVziQ@mail.gmail.com>
In-Reply-To: <CAHk-=whzFAaksqMdYeYC=T82tny1HnGGcYu_xJTXZF1OZwVziQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-sparse@vger.kernel.org
List-Id: <linux-sparse.vger.kernel.org>
List-Subscribe: <mailto:linux-sparse+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sparse+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Mdrp2Wm_ukNl_gt6yGrMDYgMr3r8ktio6MY-kaHiIhQ_1733604926
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMDcgRGVjZW1iZXIgMjAyNCAyMDozMQ0KLi4u
DQo+IFdlJ3JlIGN1cnJlbnRseSBzdGlsbCBhY2NlcHRpbmcgZ2NjLTUuMSBhcyBhIGNvbXBpbGVy
LCBhbHRob3VnaCBpdCdzDQo+IHRpbWUgdG8gbG9vayBhdCB0aGF0IGFuZCBwcm9iYWJseSAoanVk
Z2luZyBieSB3aGF0IHN0YWJsZSBkaXN0cm9zIHVzZSkNCj4gdXBncmFkZSB0byBzb21ldGhpbmcg
bGlrZSBnY2MtOC4xIGFzIHRoZSBtaW5pbXVtIHN1cHBvcnRlZCBjb21waWxlcg0KPiB2ZXJzaW9u
Lg0KDQpUaGF0J3MgZ29pbmcgdG8gYW5ub3kgbWUuDQpUaGUgc3lzdGVtIGRpc2sgaW4gdGhlIHN5
c3RlbSBJIHRlc3QgYnVpbGQga2VybmVsIG9uIGlzIGFjdHVhbGx5IG9sZGVyDQp0aGFuIHRoZSBt
YWNoaW5lISAobm90IGJ5IG11Y2gpLg0KQW5kIFVidW50dSAxOC4wNCAoc3RpbGwgZ2V0dGluZyBz
b21lIGZpeGVzKSBoYXMgZ2NjIDcuNS4wLg0KDQpJdCBpc24ndCBhcyB0aG91Z2ggdGhlIDguMSB1
cGRhdGUgaXMgYW55dGhpbmcgcmVhbGx5IG1ham9yLg0KRGlzYWJsaW5nIHN0YWNrIGNhbmFyaWVz
IHdvdWxkIGxldCBhbiBvbGRlciBjb21waWxlciBiZSB1c2VkLg0KKGFuZCBJIG1pZ2h0IGNoYW5n
ZSB0aGUgdGVzdHMuLi4pDQoNCk11Y2ggbW9yZSB1c2VmdWwgd291bGQgYmUgbWFuZGF0aW5nICdh
c20gZ28gd2l0aCBvdXRwdXRzJyB3aGljaA0Kd291bGQgY3V0IG91dCBhIHdob2xlIGxvYWQgaG9y
cmlkIGFsdGVybmF0aXZlcy4NCg0KQnV0IHRoYXQgd291bGQgbWFrZSBpdCBwcmV0dHkgY29tbW9u
IHRoYXQgYSBrZXJuZWwgYnVpbGQgd291bGQNCm5lZWQgYSBsYXRlciBjb21waWxlciB0aGFuIHRo
ZSBvbmUgdGhlIGRpc3RyaWJ1dGlvbiBpbnN0YWxsZWQuDQoNCkl0IG1heWJlIHRpbWUgdG8gY29u
c2lkZXIgZGlyZWN0bHkgc3VwcG9ydGluZyBkb3dubG9hZGluZyBhbmQNCmJ1aWxkaW5nIHRoZSBy
ZXF1aXJlZCBjb21waWxlciBhcyBwYXJ0IG9mIGEgbm9ybWFsIGtlcm5lbCBidWlsZC4NClRoYXQg
d291bGQgYWxsb3cgdGhlIG1pbmltdW0gdmVyc2lvbiB0byBiZSBzZXQgdG8gYSB2ZXJ5IHJlY2Vu
dA0KYnVpbGQgYW5kIGFsc28gbWFrZSBjcm9zcyBhcmNoaXRlY3R1cmUgYnVpbGQgZWFzaWVyLg0K
KEluIGVmZmVjdCBhbGwgYnVpbGRzIGJlY29tZSBjcm9zcyBidWlsZHMuKQ0KDQpOZXRCU0QgdXNl
ZCB0byAobWF5IHN0aWxsIGRvKSBpbXBvcnQgZ2NjIGludG8gaXRzIENWUyByZXBvc2l0b3J5Lg0K
U28gdGhhdCBldmVyeXRoaW5nIHdhcyBidWlsdCB3aXRoIGEgJ2tub3duJyBjb21waWxlci4NCg0K
SXQgaXMgKHByb2JhYmx5KSBsZXNzIG9mIGEgcHJvYmxlbSB3aXRoIGNsYW5nLg0KUGVvcGxlIHVz
aW5nIGNsYW5nIGFyZSBsaWtlbHkgdG8gaGF2ZSBleHBsaWNpdGx5IGRvd25sb2FkZWQgaXQuDQoN
CglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwg
TW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzog
MTM5NzM4NiAoV2FsZXMpDQo=



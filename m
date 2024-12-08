Return-Path: <linux-sparse+bounces-332-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB3B9E84A9
	for <lists+linux-sparse@lfdr.de>; Sun,  8 Dec 2024 12:27:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD9B718849F6
	for <lists+linux-sparse@lfdr.de>; Sun,  8 Dec 2024 11:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1103613AD22;
	Sun,  8 Dec 2024 11:27:43 +0000 (UTC)
X-Original-To: linux-sparse@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA9F145B00
	for <linux-sparse@vger.kernel.org>; Sun,  8 Dec 2024 11:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.86.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733657263; cv=none; b=N07ngqogDWC3CoQPmX3T7lF9MGt3jtL4bm2Y78P2aqMh097WnP31BzKQWJKyKQEGVLDXgh3avGbzN/ZwdAljWU7lzhF+ANlmaY2orHlC2wwvqHw3LFDhGVHCUK/en6jKpYLKSA6fwdSfjtE7mbW8//oT5HKPKDJKHoS/2238LV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733657263; c=relaxed/simple;
	bh=IC1BSP6s4QUw64NREgnsJ9Jd1oTUjpn8Z4FelgQCuuc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=hVqFkhP6pn12/3DCF+88B0wXlqjtc/peFEV4o6Kjn/cLcQAXFZTxcJqq8MA9f9qvmpzrRQGZZlku0Bgf7hU9xeJ3R+RMHqpuJYmtZOlX+LNnCyVhdtd4JiX6TGgyEHT6aRBQAACNTTGqMDI1SG2yl702hUd3/jsqBGo6Ne4af3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.86.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-403-bJ36nNrvNzSLRwjrBnXqBQ-1; Sun, 08 Dec 2024 11:27:38 +0000
X-MC-Unique: bJ36nNrvNzSLRwjrBnXqBQ-1
X-Mimecast-MFC-AGG-ID: bJ36nNrvNzSLRwjrBnXqBQ
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 8 Dec
 2024 11:26:44 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 8 Dec 2024 11:26:44 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Martin Uecker' <muecker@gwdg.de>, Linus Torvalds
	<torvalds@linux-foundation.org>
CC: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Luc Van Oostenryck
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
Subject: RE: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Topic: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
Thread-Index: AQHbSQMFJXcuwP9wN0+yRzIQ2cx/pbLcMkGA
Date: Sun, 8 Dec 2024 11:26:44 +0000
Message-ID: <b71056c1b9e04aa383f2e5608c27290f@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
	 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
	 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
	 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
	 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
	 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
	 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
	 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
	 <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
	 <9a0c041b6143ba07c2b3e524572fccd841f5374b.camel@gwdg.de>
	 <CAHk-=wjpVXEjX16PP=-hi4CgLqEGJ_U-WvKWq+J3C+FW-hSSfg@mail.gmail.com>
	 <0a2996a7c63930b9d9a8d3792358dd9e494e27c1.camel@gwdg.de>
	 <CAHk-=wjsfYYKBYuW8_6yKjdwHih0MMa2GwUJh_LHcuUNFR7-QA@mail.gmail.com>
 <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
In-Reply-To: <9d9567dbdaf39688bbd0d240e29dec826a5931ee.camel@gwdg.de>
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
X-Mimecast-MFC-PROC-ID: 5efeiauNkPGEN_VZSTSraxRjT-vU8V4rpkhsQLuLQbs_1733657257
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogTWFydGluIFVlY2tlcg0KPiBTZW50OiAwNyBEZWNlbWJlciAyMDI0IDIzOjUyDQouLi4N
Cj4gV2hpbGUgdGhlIGNvbXBpbGVyIGNhbiBub3QgYXV0b21hdGljYWxseSBwcm92ZSBldmVyeSB1
c2UNCj4gb2YgVkxBIGJvdW5kZWQsIGl0IGNhbiByZWxpYWJseSBkaWFnbm9zZSB0aGUgY2FzZXMg
d2hlcmUgaXQNCj4gY2FuwqAqbm90KiBzZWUgdGhhdCBpdCBpcyBib3VuZGVkLiBDb25zaWRlciB0
aGlzIGV4YW1wbGU6DQo+IA0KPiB2b2lkIG9vYihpbnQgbiwgY2hhciBwW25dKTsNCj4gdm9pZCBm
KHVuc2lnbmVkIGludCBuKQ0KPiB7DQo+ICAgICBjaGFyIGJ1ZltNSU4obiwgMTAwKV07IC8vIGJv
dW5kZWQNCj4gICAgIG9vYihuICsgMTAsIGJ1Zik7IC8vIHdhcm5pbmcNCj4gfQ0KLi4uDQoNClRo
ZSBrZXJuZWwgc3RhY2sgaGFzIHRvIGhhdmUgZW5vdWdoIHNwYWNlIGZvciB0aGUgWzEwMF0NCnNv
IHRoZSBmdWxsIGFtb3VudCBtaWdodCBhcyB3ZWxsIGFsd2F5cyBiZSBhbGxvY2F0ZWQuDQpUaGUg
Y2hhbmNlIG9mICd0cmFkaW5nIG9mZicgc3RhY2sgdXNhZ2Ugd2l0aCBhbm90aGVyIGZ1bmN0aW9u
DQppbiB0aGUgc2FtZSBjYWxsIHN0YWNrIHRoYXQgaXMgZ3VhcmFudGVlZCB0byB1c2UgbGVzcyB0
aGFuDQppdHMgbWF4aW11bSBpcyBhYm91dCB6ZXJvLg0KDQpUaGUgVkxBIGNvZGUgYWxzbyBhZGRz
IGFuIGV4dHJhIHN0YWNrIGZyYW1lLCB0aGlzIHByZXR0eSBtdWNoDQpwZXNzaW1pc2VzIGV2ZXJ5
dGhpbmcuDQpUaGlzIGhhcHBlbmVkIGZvciAnY29uc3RhbnQnIHNpemVzIGZyb20gbWluKDE2LCBz
aXplb2YgKHN0cnVjdCkpDQpiZWNhdXNlIG1pbigpIG5lZWRzIHRvIGJlIGEgc3RhdGVtZW50IGZ1
bmN0aW9uIHRvIGF2b2lkIHJlLWV2YWx1YXRpbmcNCml0cyBhcmd1bWVudHMuDQooVGhlIHZlcnNp
b24gb2YgbWluKCkgdGhhdCBtYW5hZ2VkIHRvIHJldHVybiBjb25zdGFudCBmcm9tIGNvbnN0YW50
DQppbnB1dCBqdXN0IGV4cGxvZGVkIGluIGNwcCwgcGFydGlhbGx5IHJlc3BvbnNpYmxlIGZvciAx
OE1CIGxpbmVzDQpiZWluZyBmZWQgaW50byB0aGUgY29tcGlsZXIgcGFydC4pDQoNCglEYXZpZA0K
DQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFy
bSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAo
V2FsZXMpDQo=



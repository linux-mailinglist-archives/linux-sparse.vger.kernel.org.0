Return-Path: <linux-sparse+bounces-307-lists+linux-sparse=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4EE9E7F8B
	for <lists+linux-sparse@lfdr.de>; Sat,  7 Dec 2024 11:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35C34282445
	for <lists+linux-sparse@lfdr.de>; Sat,  7 Dec 2024 10:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FCAF13AD26;
	Sat,  7 Dec 2024 10:34:56 +0000 (UTC)
X-Original-To: linux-sparse@vger.kernel.org
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4CE22C6EC
	for <linux-sparse@vger.kernel.org>; Sat,  7 Dec 2024 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.58.85.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733567696; cv=none; b=FHpllXbMxit9DDzldSbe/fafhocTV623Bo3iDNg9N7kAQ6EdlWf5WGzvO9v3bd3bR5KLLkRDr9qLNbKtvnDhaQcL3VhyOCz6ds9AiXBWxt83f1mMlZcc9OjKAXOeNWHNe4sHiz2LnMyq0pHiQIKP1pJZkKbgQ60x3W3JnRwQ5R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733567696; c=relaxed/simple;
	bh=q1OT/uCD3NGww5Udzp19Qdxv1rfROPZGmkNUXJLBy+I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=PCObr9sy5/wc/s5ck76c95gpaBJ7+P+j4OEJDMl41nSqdYMUfSJruMIFmOicmy+MeI1La4q3xPZTLldlJwwKp/1sLWZ40nsDPP8tRQA5Rgtad/e/OaaDYzAWeufoqBQqwfLRKcOe6mjnGHMo46sGKClpf7XVtY7pMvNL7lr+/t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass smtp.mailfrom=aculab.com; arc=none smtp.client-ip=185.58.85.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aculab.com
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-30-fUbbpPZGNBC6w6iC4uvLBw-1; Sat, 07 Dec 2024 10:34:46 +0000
X-MC-Unique: fUbbpPZGNBC6w6iC4uvLBw-1
X-Mimecast-MFC-AGG-ID: fUbbpPZGNBC6w6iC4uvLBw
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 7 Dec
 2024 10:33:56 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 7 Dec 2024 10:33:56 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Martin Uecker' <muecker@gwdg.de>, Vincent Mailhol
	<mailhol.vincent@wanadoo.fr>
CC: Linus Torvalds <torvalds@linux-foundation.org>, Luc Van Oostenryck
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
Thread-Index: AQHbSIOUJXcuwP9wN0+yRzIQ2cx/pbLajaFg
Date: Sat, 7 Dec 2024 10:33:56 +0000
Message-ID: <344b4cf41a474377b3d2cbf6302de703@AcuMS.aculab.com>
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
	 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
	 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
	 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
	 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
	 <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
	 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
In-Reply-To: <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
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
X-Mimecast-MFC-PROC-ID: WRtvlkLRzFQOhXYyMiHFH2ZLejMEvf7WiyzNmgcIc7g_1733567684
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogTWFydGluIFVlY2tlcg0KPiBTZW50OiAwNyBEZWNlbWJlciAyMDI0IDA4OjQwDQouLi4N
Cj4gSSBmaW5kIGl0IGFtYXppbmcgaG93IG11Y2ggdGltZSB0aGUgTGludXgga2VybmVsIGNvbW11
bml0eSBzcGVuZHMNCj4gcmV2aXNpbmcgY29kZSB0byBtYWtlIGl0IHdvcmsgcGVyZmVjdGx5Lg0K
PiANCj4gU3RpbGwsIEkgYW0gd29uZGVyaW5nIHdoZXRoZXIgc29tZSBvZiB0aGlzIHRpbWUgYW5k
IGVmZm9ydCBzaG91bGQgbm90DQo+IGJlIHRhcmdldGVkIGF0IEMgY29tcGlsZXJzIGFuZCBsYW5n
dWFnZSB3b3JrIHRvIG1ha2UgdGhlc2UgbWFjcm8NCj4gaGFja3MgdW5uZWNlc3Nhcnk/DQoNCkkn
bSBwcm9iYWJseSBub3QgYWxvbmUgaW4gdGhpbmtpbmcgdGhhdCBzb21ldGltZXMgdGhlIGNvbXBp
bGVyIHdyaXRlcnMNCmFyZSBkb2luZyB0aGVpciBoYXJkZXN0IHRvIG1ha2UgbGlmZSBoYXJkIGZv
ciBwZW9wbGUgd3JpdGluZyBsb3cgbGV2ZWwgY29kZS4NCg0KPiBJIGFscmVhZHkgZm91bmQgdGhl
IG9yaWdpbmFsIG1vdGl2YXRpb24gZm9yIHRoZXNlIG1hY3JvcyB2ZXJ5IHF1ZXN0aW9uYWJsZS4N
Cj4gUmVtb3ZpbmcgVkxBcyBhdCB0aGUgY29zdCBoYXZpbmcgaW1wcmVjaXNlIHdvcnN0LWNhc2Ug
Ym91bmRzIHN0cmlrZXMNCj4gbWUgYXMgZnVuZGFtZW50YWxseSBtaXNndWlkZWQgLSBhdCBsZWFz
dCBpZiBzZWN1cml0eSBpcyB0aGUgbW90aXZhdGlvbi4NCg0KVkxBIGJhc2ljYWxseSBjYW5ub3Qg
YmUgYWxsb3dlZCBiZWNhdXNlIG9mIHRoZSB2ZXJ5IGxpbWl0ZWQgc3RhY2sgc3BhY2UuDQpFdmVu
IHRoZSBwZXItZnJhbWUgbGltaXRzIGFyZW4ndCBhIHJlYWwgc29sdXRpb24gLSB0aGV5IGp1c3Qg
Y2F0Y2ggdGhlDQpwbGFjZXMgdGhhdCBtb3N0IGxpa2VseSB0byBjYXVzZSBpc3N1ZXMuIFZlcnkg
ZGVlcCBjYWxsIGNoYWlucyBhbmQgYW55DQpyZWN1cnNpb24gKHRoYXQgaXNuJ3QgdGlnaHRseSBi
b3VuZGVkKSBjYW4gY2F1c2UgZ3JpZWYuDQoNCj4gU28gbWF5YmUgdGhlcmUgYXJlIG90aGVyIGdv
b2QgcmVhc29ucyBmb3IgdGhpcywgZS5nLiBiYWQgY29kZQ0KPiBmb3IgVkxBcyBvciByaXNrIG9m
IGp1bXBpbmcgdGhlIGd1YXJkIHBhZ2UgaWYgdGhlIGF0dGFja2VyIGNhbiBzb21laG93DQo+IGlu
Zmx1ZW5jZSBpdHMgc2l6ZSAoYnV0IGZvciB0aGlzIHRoZXJlIGlzIC1XdmxhLWxhcmdlci10aGFu
KS4gQnV0IGV2ZW4gdGhlbiwNCj4gd291bGRuJ3QgaXQgYmUgYSBtb3JlIHdvcnRod2hpbGUgYW5k
IGludGVyZXN0aW5nIGludmVzdG1lbnQgb2YgZW5naW5lZXJpbmcNCj4gcmVzb3VyY2VzIHRvIGlt
cHJvdmluZyBjb2RlIGdlbmVyYXRpb24gLyB3YXJuaW5ncyBhdCB0aGUgY29tcGlsZXIgbGV2ZWw/
DQoNClRoaXMgaXMga2VybmVsIGNvZGUsIGFueSBhY2Nlc3MgaW50byBhIHN0YWNrIGd1YXJkIHBh
Z2UgaXMgYmFzaWNhbGx5DQp1bnJlY292ZXJhYmxlIGZvciB0aGUgZW50aXJlIHN5c3RlbSAtIGEg
a2VybmVsIGxvY2svbXV0ZXggY291bGQgYmUgaGVsZC4NCg0KV2l0aCBhIGxpc3Qgb2YgKGNhbGxp
bmdfZm4sIGNhbGxlZF9mbiwgc3RhY2tfb2Zmc2V0KSBpdCBpcyBwb3NzaWJsZQ0KY2FsY3VsYXRl
IGFuIGFjY3VyYXRlIG1heGltdW0gc3RhY2sgdXNhZ2UuDQpJbmRpcmVjdCBjYWxscyB3b3VsZCBu
ZWVkIHRvIHVzZSB0aGUgKElJUkMpIEZJTkVfSUJUIGhhc2hlcyB0byBpZGVudGlmeQ0KdGhlIHBv
c3NpYmxlIGZ1bmN0aW9ucyAoYW5kIEknbSBub3Qgc3VyZSB0aGFuIGhhcyBhbiBhdHRyaWJ1dGUg
Zm9yIGEgJ3NlZWQnDQpzbyB0aGF0ICdpbnQgKCopKHZvaWQgKiknIGZ1bmN0aW9ucyBjYW4gYmUg
c2VwYXJhdGVkIGludG8gZ3JvdXBzLg0KSSd2ZSBub3QgbG9va2VkIGF0IHdoZXRoZXIgb2JqdG9v
bCBjb3VsZCBnZW5lcmF0ZSB0aGUgb3V0cHV0IC0gYnV0IGlzIGhhcw0KdG8gYmUgZWFzaWVyIGZv
ciB0aGUgY29tcGlsZXIgdG8gZG8gaXQuDQoNCkkgaGF2ZSBkb25lIHRoYXQgY2FsY3VsYXRpb24g
aW4gdGhlIHBhc3QgKHBhcnNpbmcgYSBjb21waWxlciBsaXN0aW5nIGZpbGUpDQphbmQgYmFzaWNh
bGx5IGRpc2NvdmVyZWQgdGhlIHN5c3RlbSBkaWRuJ3QgYWN0dWFsbHkgaGF2ZSBlbm91Z2ggbWVt
b3J5DQp0byBhbGxvY2F0ZSAnc2FmZScgc3RhY2tzISBUaGUgbWF4IHN0YWNrIHdhcyBwcmV0dHkg
bXVjaCBhbHdheXMgKHRoZQ0KZXF1aXZhbGVudCBvZikgcHJpbnRmKCkgaW5zaWRlIGFuIGVycm9y
IHBhdGggdGhhdCBuZXZlciBoYXBwZW5zLg0KSXQgbWlnaHQgYmUgaW50ZXJlc3RpbmcgdG8gc2Vl
IGhvdyBiYWQgbGludXggaXMgKGFmdGVyIHNvcnRpbmcgb3V0DQpob3cgdG8gaGFuZGxlIHJlY3Vy
c2l2ZSBjYWxscyAtIGhvcGVmdWxseSB0aGVyZSB3b24ndCBiZSB0b28gbWFueQ0KdW5leHBlY3Rl
ZCBvbmVzLg0KDQo+IEFsc28gdGhlIGZvcnRpZmljYXRpb24gb2Ygc3RybGVuIGFuZCBjbyBzZWVt
cyBzb21ldGhpbmcgd2hpY2ggY291bGQgYmUNCj4gbXVjaCBiZXR0ZXIgc29sdmVkIHdpdGggYW5u
b3RhdGlvbnMgYW5kIHByb3BlciBjb21waWxlciBzdXBwb3J0Lg0KDQpUaGF0IG1pZ2h0IGJlIG5p
Y2UsIGJ1dCBrZXJuZWwgaGF2ZSB0byBiZSBidWlsZGFibGUgd2l0aCByZWxhdGl2ZWx5DQpvbGQg
Y29tcGlsZXJzLg0KDQpTb21lIHRoaW5ncyBtaWdodCBuZWVkIGxhbmd1YWdlL0FCSSBjaGFuZ2Vz
IHRvIGJldHRlciBoYW5kbGUgcHRyK3NpemUuDQpUaGUgYWJpbGl0eSB0byByZXR1cm4gc3VjaCBh
IHBhaXIgaW4gcmVnaXN0ZXJzIHdvdWxkIHByb2JhYmx5IGJlIHVzZWZ1bA0KKHdpdGhvdXQgZG9p
bmcgaG9ycmlkIGdhbWVzIHdpdGggYSB1bmlvbiBhbmQgX19pbnQxMjgpLg0KDQoJRGF2aWQNCg0K
LQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0s
IE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdh
bGVzKQ0K



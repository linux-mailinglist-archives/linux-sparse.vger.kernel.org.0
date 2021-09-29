Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7621F41BF5B
	for <lists+linux-sparse@lfdr.de>; Wed, 29 Sep 2021 08:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244283AbhI2G4f (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 29 Sep 2021 02:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhI2G4e (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 29 Sep 2021 02:56:34 -0400
Received: from algol.kleine-koenig.org (algol.kleine-koenig.org [IPv6:2a01:4f8:c010:8611::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F77C06161C
        for <linux-sparse@vger.kernel.org>; Tue, 28 Sep 2021 23:54:51 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by algol.kleine-koenig.org (Postfix) with ESMTP id 0544CDC719;
        Wed, 29 Sep 2021 08:54:50 +0200 (CEST)
Received: from algol.kleine-koenig.org ([IPv6:::1])
        by localhost (algol.kleine-koenig.org [IPv6:::1]) (amavisd-new, port 10024)
        with ESMTP id wiCKFTOGAoS2; Wed, 29 Sep 2021 08:54:49 +0200 (CEST)
Received: from taurus.defre.kleine-koenig.org (unknown [IPv6:2a02:8071:b5c8:7bfc:16da:7166:be7a:1254])
        by algol.kleine-koenig.org (Postfix) with ESMTPSA;
        Wed, 29 Sep 2021 08:54:49 +0200 (CEST)
Subject: Re: [ANNOUNCE] Sparse v0.6.4
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Jeff Layton <jlayton@redhat.com>
References: <20210906042111.lhoq7egtpmw3jcv6@mail>
 <5bfca92e-1eb0-ab7d-80b5-5ea2134ae928@kleine-koenig.org>
 <73f07821-4abe-2194-96a2-296c54c47074@ramsayjones.plus.com>
From:   =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Message-ID: <d1eadca6-2c2c-b4af-7c0a-e49698a17b12@kleine-koenig.org>
Date:   Wed, 29 Sep 2021 08:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <73f07821-4abe-2194-96a2-296c54c47074@ramsayjones.plus.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZjxhtspHNarvsoGRUMln8DqThj1gJxwD6"
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZjxhtspHNarvsoGRUMln8DqThj1gJxwD6
Content-Type: multipart/mixed; boundary="vV3xkhECIWidLIOpur9UI3bYI23DojnBz";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Ramsay Jones <ramsay@ramsayjones.plus.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 linux-sparse@vger.kernel.org
Cc: Jeff Layton <jlayton@redhat.com>
Message-ID: <d1eadca6-2c2c-b4af-7c0a-e49698a17b12@kleine-koenig.org>
Subject: Re: [ANNOUNCE] Sparse v0.6.4
References: <20210906042111.lhoq7egtpmw3jcv6@mail>
 <5bfca92e-1eb0-ab7d-80b5-5ea2134ae928@kleine-koenig.org>
 <73f07821-4abe-2194-96a2-296c54c47074@ramsayjones.plus.com>
In-Reply-To: <73f07821-4abe-2194-96a2-296c54c47074@ramsayjones.plus.com>

--vV3xkhECIWidLIOpur9UI3bYI23DojnBz
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

On 9/29/21 12:43 AM, Ramsay Jones wrote:
> On 28/09/2021 20:56, Uwe Kleine-K=C3=B6nig wrote:
>> On 9/6/21 6:21 AM, Luc Van Oostenryck wrote:
>>> Sparse v0.6.4 is now out.
>>
>> I finally came around to update the Debian packaging. There is just a =
(non-critical) problem on x32 where some tests fail. I didn't look deeply=
, but if you care, now you know :-)
>>
>> https://buildd.debian.org/status/fetch.php?pkg=3Dsparse&arch=3Dx32&ver=
=3D0.6.4-1&stamp=3D1632795062&raw=3D0
>=20
> Hmm, interesting. I tested on Linux Mint 19 32-bit and didn't see any
> failures. As far as I can tell, only the 'validation/builtin-objsize0.c=
'
> test is failing (squinting hard at the above!).

Note that the "normal" 32-bit build was just fine[1]. It's "only" x32[2] =

that is affected.

Best regards
Uwe

[1] See https://buildd.debian.org/status/package.php?p=3Dsparse for the=20
overview.
[2] https://wiki.debian.org/X32Port


--vV3xkhECIWidLIOpur9UI3bYI23DojnBz--

--ZjxhtspHNarvsoGRUMln8DqThj1gJxwD6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFUDbUACgkQwfwUeK3K
7AnMNAf/Ti+qLQQngS4IEqJI0DN/nUQ+gjFdN/SNDd+uZ6xKfZ1mtnMlDzdwyMIe
A3IKpaiV+1n0sNvQdRlXBQMHCuEEIbbenaVDhwyZ1W+dIwSvzwxfsZWCksOEGIhU
/INP27iOAkBh3flkkHs8OPdnXB0ty3bCbsKhWOjzhAlW5+3WQZTtBh60XrOivtYY
GD/j/hF0Qpx+spEcqUzChTEwWEK2D67GzBAGbqAtgoUyYgeGcM9JsYJ8x0z7pKhz
THH+HtQgYEON2MpllxnUdywidiqmj+OmntXrnKSTEmfYEPdroEqLH3/bBUGaYGgm
wYMqsYuVTKKyF/8y7quFDqdx896pDA==
=0DqP
-----END PGP SIGNATURE-----

--ZjxhtspHNarvsoGRUMln8DqThj1gJxwD6--

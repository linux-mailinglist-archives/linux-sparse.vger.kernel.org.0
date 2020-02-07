Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E22781556BF
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 12:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgBGLeR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 06:34:17 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:48150 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgBGLeQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 06:34:16 -0500
Received: from localhost (localhost [127.0.0.1])
        by antares.kleine-koenig.org (Postfix) with ESMTP id 6378E8FD0CF;
        Fri,  7 Feb 2020 12:34:14 +0100 (CET)
Received: from antares.kleine-koenig.org ([127.0.0.1])
        by localhost (antares.kleine-koenig.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id J02kRAvab9XU; Fri,  7 Feb 2020 12:34:12 +0100 (CET)
Received: from taurus.defre.kleine-koenig.org (unknown [IPv6:2a02:8071:b5ad:20fc:fcc6:76ac:5975:8d7b])
        by antares.kleine-koenig.org (Postfix) with ESMTPSA;
        Fri,  7 Feb 2020 12:34:12 +0100 (CET)
Subject: Re: sparse problem with Linux kernel v5.5
To:     Martin KaFai Lau <kafai@fb.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>,
        Arthur Fabre <afabre@cloudflare.com>
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
 <20200206114619.bfszxgs6jmdgroo6@ltop.local>
 <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
 <20200206200610.7ktqp2yzriw7zurx@ltop.local>
 <CAHk-=whEFcgPW8oD=rGGyDiML_7AaCP0DGdW=WXjvF9zAv6Vrg@mail.gmail.com>
 <b6d24fd2-e5b8-7010-86b5-c46f65536eef@kleine-koenig.org>
 <20200207082954.majgsx5trepwb46n@kafai-mbp>
From:   =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Autocrypt: addr=uwe@kleine-koenig.org; prefer-encrypt=mutual; keydata=
 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
 6uMoO1VgFtcQHWHTtbSYLQ8YHVFZMQ==
Message-ID: <f41aa7cb-399d-277b-eda8-4173f45d7123@kleine-koenig.org>
Date:   Fri, 7 Feb 2020 12:34:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200207082954.majgsx5trepwb46n@kafai-mbp>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="LlxRfBtahlRkvYG2CUF6c6z5PJDiKYYN9"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LlxRfBtahlRkvYG2CUF6c6z5PJDiKYYN9
Content-Type: multipart/mixed; boundary="GHZ1oiJy43tcZR4VdWFa65UUn8FYa0NlI";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Martin KaFai Lau <kafai@fb.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
 Linux-Sparse <linux-sparse@vger.kernel.org>,
 Arthur Fabre <afabre@cloudflare.com>
Message-ID: <f41aa7cb-399d-277b-eda8-4173f45d7123@kleine-koenig.org>
Subject: Re: sparse problem with Linux kernel v5.5
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
 <20200206114619.bfszxgs6jmdgroo6@ltop.local>
 <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
 <20200206200610.7ktqp2yzriw7zurx@ltop.local>
 <CAHk-=whEFcgPW8oD=rGGyDiML_7AaCP0DGdW=WXjvF9zAv6Vrg@mail.gmail.com>
 <b6d24fd2-e5b8-7010-86b5-c46f65536eef@kleine-koenig.org>
 <20200207082954.majgsx5trepwb46n@kafai-mbp>
In-Reply-To: <20200207082954.majgsx5trepwb46n@kafai-mbp>

--GHZ1oiJy43tcZR4VdWFa65UUn8FYa0NlI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

On 2/7/20 9:29 AM, Martin KaFai Lau wrote:
> On Fri, Feb 07, 2020 at 07:34:57AM +0100, Uwe Kleine-K=C3=B6nig wrote:
>> Hello,
>>
>> On 2/7/20 12:47 AM, Linus Torvalds wrote:
>>> Instead, it could just calculate the nbuckets first, and then do the
>>> "log2()" on that:
>>>
>>>         /* Use at least 2 buckets, select_bucket() is undefined
>>> behavior with 1 bucket */
>>>         nbuckets =3D max_t(u32, 2, roundup_pow_of_two(num_possible_cp=
us()));
>>>         smap->bucket_log =3D ilog2(buckets);
>>
>>
>> Isn't it kind of ineffective to first round to a power of two and then=

>> take the ilog2 of it?
>>
>> At a first glance I'd say that
>>
>> 	ilog2(roundup_pow_of_two(x)) =3D=3D ilog(x - 1) + 1
>>
>> for x > 1. (Maybe even for x =3D=3D 1? Didn't care to check, I think i=
t
>> doesn't matter for the case at hand.)
>>
>> This RHS might be easier to optimize for the compiler?!
> I believe x =3D=3D 1 needs an extra case since ilog2(0) won't work.
>=20
> Since this function (map creation) is not on the fast path,
> I currently opt for Linus's suggestion which its code is more
> self-explanatory.

If you put my suggestion in a macro that is called for example

	ilog2_roundup()

you might have both: easier code and self-explanation.

Best regards
Uwe


--GHZ1oiJy43tcZR4VdWFa65UUn8FYa0NlI--

--LlxRfBtahlRkvYG2CUF6c6z5PJDiKYYN9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl49SyoACgkQwfwUeK3K
7AmDlwf6Ar397E1N47GSbIJSiECWJYHxmkpu/s7Qr3K9/Bu3zlkgS7tssaD9bl+T
6jfZ2n+6Qfuyre1orOeMT1DzeZ4IwPpAxzIijElhA+mUFU96KHpOBYTVjuD0FjDx
9aLpy5YfKea1v6KbYO/+MGRjX8oz6mWq7FBPwTIFXjsJ+ZQF4ogsuJpqDL66iqRZ
tNusnIqwjenzJwT2FVIUpCfbND2xfu/V5a5qm2Js1i1TQ3+5HTEbrx84/rEemP7u
NeuXGRyxV5sDCM5lrdbVALto2jz08pZfpLIqQ+qSyn6VefraHsMDvPHSMpr6fw5m
6vrNSRDYA2hgrsCib9tPy2nlOdz4yQ==
=Ic8m
-----END PGP SIGNATURE-----

--LlxRfBtahlRkvYG2CUF6c6z5PJDiKYYN9--

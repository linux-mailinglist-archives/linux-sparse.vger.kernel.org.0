Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0F1EF27D6
	for <lists+linux-sparse@lfdr.de>; Thu,  7 Nov 2019 07:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfKGG4r (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 7 Nov 2019 01:56:47 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:33076 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbfKGG4r (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 7 Nov 2019 01:56:47 -0500
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 6A96C8260A8; Thu,  7 Nov 2019 07:56:45 +0100 (CET)
Date:   Thu, 7 Nov 2019 07:56:42 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org, Jeff Layton <jlayton@redhat.com>
Subject: Re: Sparse v0.6.1
Message-ID: <20191107065642.GA4911@taurus.defre.kleine-koenig.org>
References: <20191013234630.7uuszc5auri46h4y@desk.local>
 <42602ad0-05c2-b6a1-33ac-75191b80af88@kleine-koenig.org>
 <20191106234554.crh5eyybfuhqiy7l@ltop.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20191106234554.crh5eyybfuhqiy7l@ltop.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Luc,

On Thu, Nov 07, 2019 at 12:45:54AM +0100, Luc Van Oostenryck wrote:
> On Wed, Nov 06, 2019 at 09:59:27PM +0100, Uwe Kleine-K=F6nig wrote:
> > Hello Luc,
> >=20
> > On 10/14/19 1:46 AM, Luc Van Oostenryck wrote:
> > > Sparse v0.6.1 is now out.
> >=20
> > I uploaded sparse 0.6.1 to Debian and got two failed builds. Both mipsel
> > and powerpc
> > fail in the same way:
> > 	+enum-sign-extend.c:6:28: error: static assertion failed: "type"
>=20
> This problem is already fixed on the head since a few days ago.

Great.

> I've also pushed a branch 'main-0.6.1' containing only the
> minimal fix. If needed I can tag it as 'v0.6.1.1' and update
> VERSION accordingly but I would like to be sure that such
> 4-part version isn't a problem.

For me this isn't necessary. I will cherry-pick the fix for Debian's
0.6.1. As there is a Debian specific version mangling I don't need a new
upstream release. (The version I uploaded without the fix is 0.6.1-1,
will prepare 0.6.1-2 today.)

Best regards and thanks for your prompt reply,
Uwe

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl3DwCcACgkQwfwUeK3K
7AmW6Qf+JGaaAwF4UiOC3pS1iiZfqEb4U7J3jcr3Z5b0c9t9e35GLjU8ZWbn574c
dIzTI3DVA7bQeV7ptswxVYII40UD3eBBnJqb0jVPpOokJ3UAEzTVI0yd1NO8+7jC
CAsygP9xlrFgn1o6AzgRu11Mj62OCrziNIJyccAAb+8OKJLNlMj0xY6wGlvBqNbC
0Tfa3w+AfeBEPkeF+3ijJofSAOYymGDDtKcWYyaD62zmWNpv+OK9cYxGALQgbnRK
y9dTc1EfH7KA5/ZM+PJPsADkSGVf2VtbrlYW4LbOblwNvdkb5d4uZ+rNSg/nKoDr
vbqWf+ajWlkhohOhAAcVd/pqwLzStg==
=dokc
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

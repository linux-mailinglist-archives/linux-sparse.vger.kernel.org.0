Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94984F28C8
	for <lists+linux-sparse@lfdr.de>; Thu,  7 Nov 2019 09:11:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbfKGILW (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 7 Nov 2019 03:11:22 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:36720 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfKGILW (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 7 Nov 2019 03:11:22 -0500
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 28AD0826282; Thu,  7 Nov 2019 09:11:21 +0100 (CET)
Date:   Thu, 7 Nov 2019 09:11:13 +0100
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org, Jeff Layton <jlayton@redhat.com>
Subject: Re: Sparse v0.6.1
Message-ID: <20191107081113.GA5132@taurus.defre.kleine-koenig.org>
References: <20191013234630.7uuszc5auri46h4y@desk.local>
 <42602ad0-05c2-b6a1-33ac-75191b80af88@kleine-koenig.org>
 <20191106234554.crh5eyybfuhqiy7l@ltop.local>
 <20191107065642.GA4911@taurus.defre.kleine-koenig.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <20191107065642.GA4911@taurus.defre.kleine-koenig.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Luc,

just a quick heads up:

On Thu, Nov 07, 2019 at 07:56:42AM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Nov 07, 2019 at 12:45:54AM +0100, Luc Van Oostenryck wrote:
> > On Wed, Nov 06, 2019 at 09:59:27PM +0100, Uwe Kleine-K=F6nig wrote:
> > > On 10/14/19 1:46 AM, Luc Van Oostenryck wrote:
> > > > Sparse v0.6.1 is now out.
> > >=20
> > > I uploaded sparse 0.6.1 to Debian and got two failed builds. Both mip=
sel
> > > and powerpc
> > > fail in the same way:
> > > 	+enum-sign-extend.c:6:28: error: static assertion failed: "type"
> >=20
> > This problem is already fixed on the head since a few days ago.

I tested on mipsel and the problem there is gone with your patch. Didn't
find a powerpc machine to test and hope that the build machine is happy
now.
=20
> > I've also pushed a branch 'main-0.6.1' containing only the
> > minimal fix. If needed I can tag it as 'v0.6.1.1' and update
> > VERSION accordingly but I would like to be sure that such
> > 4-part version isn't a problem.

I backported the fix myself and got the exact same result as on your
maint-0.6.1 branch. (I only documented the upstream commit hash and that
I dropped S390 in the commit log.)

Best regards
Uwe

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl3D0Z4ACgkQwfwUeK3K
7AlhSwgAj1cFkIslhIjs6eU08npXGYh1RQpKTRikKpjZMv23/MCgcozI6E8ElIFT
5ptlWVd8rlFiKqH4uyct7Ow57Ux89kwle4NHZTe9XHJ8SACgOFQ8PlUwz/NIz5nw
DvTxe/7Nne7CgS2t+VYl89CJUZK/yU3wAtM5OnWi+G1jiorEJ77u5z7pYcx0+VeV
5xYiqXN3mbcwkYGhAHKzKz73+xQVMkk9412xN7KBo9IqrbFB8jzVaGfQ2zkbwnxC
fYIGrA+PpwLWTk4CLP3mJEBnJyjjLvviCdKUEQXseDGW/2GQvcWPbQ3cUs5QyCNi
gPNkQ7AukgD+NywTdgCxXDjd6eg+aA==
=AuNC
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

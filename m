Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F6EBD572
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2019 01:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411147AbfIXXXz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 24 Sep 2019 19:23:55 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39786 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389370AbfIXXXz (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 24 Sep 2019 19:23:55 -0400
Received: by mail-lj1-f196.google.com with SMTP id y3so3627766ljj.6
        for <linux-sparse@vger.kernel.org>; Tue, 24 Sep 2019 16:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ifYMqUgjjlNkKwX4MNHotZB57THub8NmbMOhzV6AWQ=;
        b=DCRehmQvwsoeUmKMse93X8Bn0LV88sDRHkzYmH8PDvEmMHRmMf/G52ftg1YVPzqs55
         zCPR+LbCmir5CZkKJemUjL90XUUlayw/MdX+IDIWOlobyam10ATqwvCRn/U8HpU41HUZ
         AD8hVpQHzda/ZRQ70zeNJXpfJXKotxNHNwux4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ifYMqUgjjlNkKwX4MNHotZB57THub8NmbMOhzV6AWQ=;
        b=M78VDGCBsQsE4/39dz9yAqlqwi62QDT1fvwjsKv+03Be3Q0JfU9CynANrI86wekQdP
         hFvCZccOhNS0hnH2UM6fjX2zwgqNn9KWbGqoy8J6yera29Gm4jrDsz9sl8U45vCr4LCF
         xjCxTvoJUV/E9CS4RM6+b78KH0Qcn6PRcKtDzHTHocS/vW1E19RRveFomtGff+gDWVo4
         QRAPLkm0VFu1o2LRw2QAU+bUHyMCKQCJyzF422M2nBChN7ZD16b2zz92r6++MPCe+nHX
         Kj2znJyeYPe2I0BzjdBiFFzDrvRAryVrrUN/sApIBheeXo36J+NymUrtonIojy8/FgZe
         4rjQ==
X-Gm-Message-State: APjAAAWn50+Dd/SHekdXsa/Ja6DEwXEwJIGSwmmmVzvl3uwq10fcPNbf
        bnKvAhRBp2J85YjBqR9wDzkMD3hODnQ=
X-Google-Smtp-Source: APXvYqzyQbyzGipYBxVCIfP9QoeHFWPfpiJeOMIzuVTEhgYwX7+Ecg/0A7Fm3cZOjA3cgk1LZTE56g==
X-Received: by 2002:a2e:9049:: with SMTP id n9mr3704003ljg.45.1569367432575;
        Tue, 24 Sep 2019 16:23:52 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id d25sm770991lfj.15.2019.09.24.16.23.51
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2019 16:23:51 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id u3so2688630lfl.10
        for <linux-sparse@vger.kernel.org>; Tue, 24 Sep 2019 16:23:51 -0700 (PDT)
X-Received: by 2002:a19:2489:: with SMTP id k131mr3463027lfk.52.1569367430945;
 Tue, 24 Sep 2019 16:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiby96wPxF87Fdq=yPVpjBMv+okrAoQUgO+2eCYjWbqPA@mail.gmail.com>
 <20190924070852.GA24834@mwanda>
In-Reply-To: <20190924070852.GA24834@mwanda>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 24 Sep 2019 16:23:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
Message-ID: <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
Subject: Re: [PATCH] parse: Fix sign extension in casting enums
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: multipart/mixed; boundary="0000000000003e8ce1059354d4fc"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

--0000000000003e8ce1059354d4fc
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 24, 2019 at 12:09 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The problem is the sign isn't extended properly when this casts an int
> to a long.  The expr->ctype has to be the original int ctype for the
> cast_value() call so that the "value = get_longlong(old);" expansion
> works correctly.

What happens if you just remove the

        if (ctype->bit_size == base_type->bit_size) {
                expr->ctype = base_type;
                continue;
        }

part entirely? IOW, leave just

        cast_value(expr, base_type, expr, ctype);
        expr->ctype = base_type;

in place unconditionally? I _think- that should be the simpler correct
fix, but I'll leave it to Luc to think about it more.

That simpler alternate patch attached,

              Linus

--0000000000003e8ce1059354d4fc
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_k0ygu2180>
X-Attachment-Id: f_k0ygu2180

IHBhcnNlLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYXJzZS5jIGIvcGFyc2UuYwppbmRleCBmMjkxZTI0Ny4u
YjAxYzg3NmUgMTAwNjQ0Ci0tLSBhL3BhcnNlLmMKKysrIGIvcGFyc2UuYwpAQCAtODk3LDEwICs4
OTcsOCBAQCBzdGF0aWMgdm9pZCBjYXN0X2VudW1fbGlzdChzdHJ1Y3Qgc3ltYm9sX2xpc3QgKmxp
c3QsIHN0cnVjdCBzeW1ib2wgKmJhc2VfdHlwZSkKIAkJCWV4cHItPmN0eXBlID0gJmludF9jdHlw
ZTsKIAkJCWNvbnRpbnVlOwogCQl9Ci0JCWV4cHItPmN0eXBlID0gYmFzZV90eXBlOwotCQlpZiAo
Y3R5cGUtPmJpdF9zaXplID09IGJhc2VfdHlwZS0+Yml0X3NpemUpCi0JCQljb250aW51ZTsKIAkJ
Y2FzdF92YWx1ZShleHByLCBiYXNlX3R5cGUsIGV4cHIsIGN0eXBlKTsKKwkJZXhwci0+Y3R5cGUg
PSBiYXNlX3R5cGU7CiAJfSBFTkRfRk9SX0VBQ0hfUFRSKHN5bSk7CiB9CiAK
--0000000000003e8ce1059354d4fc--

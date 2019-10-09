Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8DA6D0D8F
	for <lists+linux-sparse@lfdr.de>; Wed,  9 Oct 2019 13:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbfJILWc (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 9 Oct 2019 07:22:32 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42162 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbfJILWc (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 9 Oct 2019 07:22:32 -0400
Received: by mail-ed1-f66.google.com with SMTP id y91so1644938ede.9
        for <linux-sparse@vger.kernel.org>; Wed, 09 Oct 2019 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nKYA3OwnGhKvKCfgObr3csPuvUDraN+DxqoWZBWvn+Q=;
        b=XRpIpi1GlbV+IgtOVWPHSQlhhB6edBNgBDg8KfwGhRdUlZ6KUFd/hBp8iuu/pNr08P
         g15+A9lc3MW1erCnVVKN4WA/7krJ1x1czsyfLbKgtuiYaIYjxmfN8x4W0jCZabzdxoKR
         mqMjhPEGLb/ItWKN2pMG1L/Z7Ul9bVGi5LDaHunEQo36SO599wSPV6ymmmVZ0UQVw6Z1
         0VH7IHm4fmVE51kczw1CLerlO6a3k0SidEjk2RJjvm16C3BdoZQwLbak3R6WhAWXozN0
         OkKj78W6kfD4YUVWAMLRi/grIkmODfKnOkMJIBJ47MuA6S/Vvyt3AYdJOeCoaNN2b+NF
         2UHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nKYA3OwnGhKvKCfgObr3csPuvUDraN+DxqoWZBWvn+Q=;
        b=jF1kTrpGBlGeEeo16brRevG7/oL9ucOhrF+Z4n/DHarg/Wdb+nTZoXhaPe53Ge9z5g
         ScybJfCzqiWF4Pex2qzykpa1JVwsNCh6/ospMjRQvX0xBkpYK+wnIHmfQqIW2IgyyUTc
         wNdz9Su8HYqZ0RfvGzfiF7WSFGQJ6ILvB+594zUYmQWnQh5WkAYoJKlBayzTTzuRsLes
         Nf2w/GyrmGh6ZK1zjUivmGBzX/4ts2yupaey7dkmDk2F0azhaUpRsUCgTEveyK9f4a6G
         qT5vcx3rp3l7YuxbquZGhxbDqzY3Tcr79B70GwJIMuMdA766dteALuIvOnpG74D2ET4w
         v1Kw==
X-Gm-Message-State: APjAAAVoaVYofq0mQ+i6UiY6arxzeQz8gRWpPBMyyG+0KihDiRnT6Gva
        G/deeyo6hnFbNY2eiT1gwEDsg4Fb
X-Google-Smtp-Source: APXvYqwlXCv30WhjfcnbyGln20xCaEQGIuHDd2NpZ0q1HCFWn3HQSXdGRVQ+tfc3TWuvqLILzAjEwA==
X-Received: by 2002:a17:907:429c:: with SMTP id ny20mr2178697ejb.234.1570620150265;
        Wed, 09 Oct 2019 04:22:30 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4080:1900:40a1:e401:e4e2:a0d6])
        by smtp.gmail.com with ESMTPSA id r18sm318564edx.94.2019.10.09.04.22.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 04:22:29 -0700 (PDT)
Date:   Wed, 9 Oct 2019 13:22:27 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Sparse v0.6.1-rc2 is now out.
Message-ID: <20191009112226.f6vgymntddcz7mgq@ltop.local>
References: <20191007090610.10640-1-luc.vanoostenryck@gmail.com>
 <e07a51e8-dc18-5074-3832-8a1f33ec7085@ramsayjones.plus.com>
 <4f29a2d7-de83-5b6b-ce14-1ed880b6fe12@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f29a2d7-de83-5b6b-ce14-1ed880b6fe12@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Oct 09, 2019 at 02:03:19AM +0100, Ramsay Jones wrote:
> 
> 
> On 08/10/2019 22:57, Ramsay Jones wrote:
> > 
> > 
> > On 07/10/2019 10:06, Luc Van Oostenryck wrote:
> >> The source code can be found at its usual repository:
> >>   git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.1-rc2
> >>
> >> The tarballs are found at:
> >>     https://www.kernel.org/pub/software/devel/sparse/dist/
> >>
> > 
> > Luc, I tested (last night) in the usual way on 64-&32-bit Linux
> > and 64-bit cygwin, without issue. I had intended to test (tonight)
> > also on fedora 30 and Ubuntu 19.04 (19.10 is still in beta), since
> > my normal test targets are all built on a fairly old base. However,
> > I didn't find time tonight, sorry ... :(
> 
> OK, I lied. I managed to do a quick test on fedora 30 tonight
> after all! No issues found. :-D

Awww, thanks a lot for this.
For my part, I've tested on the most recent unstable/dev version of
Debian & Ubuntu and everything was fine.

Before the release, I would like to add the patch for the problem
you had with Cygwin. Would you be fine with the:
	LLC_ARCH_OPTS="$LLC_ARCH_OPTS -mtriple=$(llvm-config --host-target)"
we had discussed before, with a note saying it's needed for recent
cygwin64 but may be inadequate for cygwin32?

Best regards,
-- Luc

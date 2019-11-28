Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A9310C0ED
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 01:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbfK1AGR (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 19:06:17 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55372 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfK1AGQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 19:06:16 -0500
Received: by mail-wm1-f65.google.com with SMTP id a131so4781991wme.5
        for <linux-sparse@vger.kernel.org>; Wed, 27 Nov 2019 16:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QxG5MQ115m5767eroI7OqXWJi4A65bPu/+lMYNK5UU8=;
        b=SrYgb2q0uXxcGbl6O1EjZEJyHACb4wYWqEpCbdHmeqrg4GGN6PDWfVnFOzXA0AknWO
         +PGUzzbQfXX9w91c6d56o/3z0v+jFi1k+RV6eyiLZqAVFr8MtZSb+G3k+5oCS6OTd46r
         PNV1R2nsvK4kARdfV9TCfLQ+fxQRpJG9EfX1Wu6f2cVyhpX1l4S/EldBBLU0pqf66UA0
         sZOqo+02xoJAy0k7XgPixBz3Ki4tmkBMD4gaKPS/Ne0yAMNFQOiplQf+Guz6bueo/vAV
         xvXIkkrsvKzPd5meN1kUbCduy70aR2wlx+pj6spmJCRc5th3INNUacqMoN3f2AHjC22D
         m0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QxG5MQ115m5767eroI7OqXWJi4A65bPu/+lMYNK5UU8=;
        b=XixOPN2TeMlbep7OvAWkvTnadmaR+ztsqmK7rWAMpbSwoNlPDytMto7bcV9VJFN3df
         XrpMae41oyFqYjhY4K3gsyv0RnWABZrrU5Ut24hKdqjUpArdU7dI+AP9o+ecz2dp2Gud
         +UdtUfOHndaVnfgJH6WFaY0THVzk1RMPVsnFCBT10eFHWTQvGrUCCvaqKVcuHauDZ2Xa
         jvKUdtzVbkNzBl6e8A/KspteF0YzwbDyIc5hL5WNBDW7EJUQ8iEKRMEfQQA/FS/MiH+B
         LMpHRilXV3dw5sgbn5nMuhJv05aHilXSsZobdGbM6My+mRKw0eezeK/NPvUH9JJzYi/r
         sp1Q==
X-Gm-Message-State: APjAAAWtHn2KiG36472TGWIL2bBfeA4Cp4RYYxTt39SJaO89WllXj25h
        5BRz3eteI90s0FGbia/Ie4lzWSWc
X-Google-Smtp-Source: APXvYqw+PgAeNzMtKfXuAfJcbyaOo+IRxCVZWkmlPRmkaXoQ+TGGyCgUQzuyh6xpJ696FRi5EQ/rnQ==
X-Received: by 2002:a1c:6746:: with SMTP id b67mr6946412wmc.16.1574899574744;
        Wed, 27 Nov 2019 16:06:14 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:2dc4:827a:b71a:1d2b])
        by smtp.gmail.com with ESMTPSA id i71sm23238786wri.68.2019.11.27.16.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2019 16:06:13 -0800 (PST)
Date:   Thu, 28 Nov 2019 01:06:13 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2 09/12] arch: use a variable for the OS
Message-ID: <20191128000613.zbz7hcppcpnwvvs2@ltop.local>
References: <20191127020643.68629-1-luc.vanoostenryck@gmail.com>
 <20191127020643.68629-10-luc.vanoostenryck@gmail.com>
 <4ee48f99-d4c0-1f27-4557-abc014c3d576@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ee48f99-d4c0-1f27-4557-abc014c3d576@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 27, 2019 at 04:27:35PM +0000, Ramsay Jones wrote:
> 
> cgcc also supports:
> 
> gnu (== Hurd kernel, Linux userspace ?)
> gnu/kfreebsd (== Hurd kernel, FreeBSD userspace ?)
> 
> Yes, I am just guessing at the above definitions! ;-)
> [I think Debian have these builds, right?]

Yes, it's for Debian builds.
* 'gnu' is Hurd/Hurd;
* 'gnu/kfreebsd' is FreeBSD kernel with Debian on userspace.

I don't have access to these (and not in an hurry to install
them in some VM). I see no reasons to add the define for them
since I have nothing specific for them. It can easily be added
if needed.

Also, Debian's sparse can't be built on them anymore because
of some problems with libraries dependencies.

Best regards,
-- Luc

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDF29181EAE
	for <lists+linux-sparse@lfdr.de>; Wed, 11 Mar 2020 18:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730195AbgCKRGa (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 11 Mar 2020 13:06:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52297 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730159AbgCKRGa (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 11 Mar 2020 13:06:30 -0400
Received: by mail-wm1-f65.google.com with SMTP id 11so2932482wmo.2
        for <linux-sparse@vger.kernel.org>; Wed, 11 Mar 2020 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7GkB/FPGut7DS90S391gZSgxuSCu1b3Ucmr0/on3iaY=;
        b=iOWi6vDmL+Bfa5YUKcemArMQ3w4nHtFBoDkNq0+MPx/yI73RjjSvmnOD1A8Yjnv7kB
         w13dVZVoQbJjC73LXV/egfWszOILG4CBszsEF5TzVrak44RYjwnX9CnskqAp4hlPQysk
         GRu42BhDSi1RYXdH8YE7e5BeP13DuIFfQRZduovsUj6KPTo5UySzMMTTl4KD6PGMIjpe
         X8qwq+66lapd2YUAiiEVVVtvSkUgxfCeab+CbnJtAxg9+1IzC8nxW0Y/lVSzQXNCpM9Q
         5FE8wD4NF6B9fuXhpJxMs2CaTrpnNCR6hm2TRLJsMWylfT5pka0Yftv4q9uwG/v86f7r
         F43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7GkB/FPGut7DS90S391gZSgxuSCu1b3Ucmr0/on3iaY=;
        b=JEgtLN7zBUP7iAaJHmEVqmIjRLKhju0F8+mab4SQfHkifScEneCR8TpEBGJ/ZLoqIE
         xFDWQmLRE6sxvm5rsB6gVJgD0NA2AYmk5GZIOiK8AuWlj/QuvVDoR1UkasqQAuyALIGY
         URu29iL8VbMvyLybZWwF4uQUhgtEx7f4/TV1fb9ksFUhirJYXc7Yly/bORjr0YazdBuM
         wFTMXtxmljThAOYQE5/rnhDTPooORMCZ/TKx93vj+HK4Z25XZE5d6P/bhaKG8yu41Qcc
         KaXHTIP7FaCZVXRw0bHjoFeLnZrHOt4wQGttx75GY5idGr9Qxrb4r80jXIZshG0tOOmH
         6qtQ==
X-Gm-Message-State: ANhLgQ20IIYjvxGdm016em+ZHS0s4oPGn+Qd0iqIjgJBfcdAWYT1lBr/
        E0llkjgV804ekqlTJTy+QC4=
X-Google-Smtp-Source: ADFU+vv9CzJUjsbTUpNoySAbl9eNpQGBagVL2yTRPsw+WP+HPMtSW7ygFg6ETRVzBNOeni3mdNl3gQ==
X-Received: by 2002:a1c:26c4:: with SMTP id m187mr4621534wmm.43.1583946388250;
        Wed, 11 Mar 2020 10:06:28 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4075:2100:f42e:1199:6e9e:3f3])
        by smtp.gmail.com with ESMTPSA id r3sm9004307wmg.19.2020.03.11.10.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 10:06:27 -0700 (PDT)
Date:   Wed, 11 Mar 2020 18:06:25 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Oleg Nesterov <oleg@redhat.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Add symantic index utility
Message-ID: <20200311170625.a53orumjtoffx75t@ltop.local>
References: <20200309152509.6707-1-gladkov.alexey@gmail.com>
 <20200309223701.dbnej7esb4qp56bm@ltop.local>
 <20200310150713.GB19012@redhat.com>
 <20200311090745.GD11561@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311090745.GD11561@kadam>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Mar 11, 2020 at 12:07:45PM +0300, Dan Carpenter wrote:
> On Tue, Mar 10, 2020 at 04:07:14PM +0100, Oleg Nesterov wrote:
> 
> This does:
> 
> 	/* Shut up warnings after an error */
> 	has_error |= ERROR_CURR_PHASE;
> 
> so we probably end up not seeing some warnings.

Yes, this is annoying, OTOH syntax errors used to cause a lot
of silly errors @ evaluation and type errors caused even more
errors or crashes at linearization or later.
Ideally we should have the equivalent of this flag but more
fine grained.

-- Luc

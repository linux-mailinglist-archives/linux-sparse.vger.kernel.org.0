Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDEBFF60F
	for <lists+linux-sparse@lfdr.de>; Sat, 16 Nov 2019 23:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727601AbfKPWua (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 16 Nov 2019 17:50:30 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34098 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfKPWua (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 16 Nov 2019 17:50:30 -0500
Received: by mail-wr1-f68.google.com with SMTP id e6so15212161wrw.1;
        Sat, 16 Nov 2019 14:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pYqYtdyrIIxceRE6eGn2bdMxh2D5tweKqHM2xxZqtDA=;
        b=b/DKbsQ3LUvsrvk9DjJ9ycbonLqvJiFOvQ06T4kNsuG4ZPEmp4idrgOnuBptNsPhxP
         Aum9QRQbsElOVRjQdMfNkY9tIAFs8ETw+qf0nuoYIGkbraCmoTCvXHzgp9oifEEGgMB3
         Yv98H4Ku2sslD0TTGynZ0Id/yaOjAEQ79kpw2P4MsTqq4heE91qZ/uigqorHTNqgpRyt
         wJhnz2pW9WL5qKXAaFTzP3BEP5mUVVXFgnNfCRde+wS8ji2mq8hmv2qq+RELE1AfnhMj
         8SQP/qwFBlxsU9TmhwtFyLWPRunBmL6rDYiQ44+8Af+Krmjid1ksGCQa/Siw85Zf8SvH
         cdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pYqYtdyrIIxceRE6eGn2bdMxh2D5tweKqHM2xxZqtDA=;
        b=qzLFABN4NsiGnFM2mBXGkxFFctsJu6FK5WYBIfa28neCzSk+sVPsOKIoD1chGq3Uq7
         41hJyhQro1dzas3WqfRDOgpif/4OPQHYfzpo5eK23/L9FesYPFSXBrXYSH2GdEMTgYvd
         OtQ13CITxrNvXEGDDKopoeh7ljucxZfvJRhVF5noqSNoIrksRiDNboTWn3E8+dd23029
         b4Ujd0JvNyH+JLtW8RybQq8G/uW96QLLBR8yyOg5EfURM8ktnuhMEnSv9tAYFlOmyLXA
         fU9Zj9bPk3ZCY7DLuIerFPiulidFO1y2TyE3awkl93dOaKarZMRw0QjIneiSBbwnQsZt
         774w==
X-Gm-Message-State: APjAAAViwrbjXg+YtvPf3sLuLL0G0fYWN7+t/S59fpZ61MEd0EEcXD8t
        2P0ttiGOJdTN/kHnSYuUNiFnIRWR
X-Google-Smtp-Source: APXvYqzNIdAWszszqPR2g/1VXwglH1WKcWZchgLj7jf/6mA+FH7i0Hkqwx2E7MSxRLjVkQpsiMHt1Q==
X-Received: by 2002:a5d:558e:: with SMTP id i14mr22221267wrv.140.1573944627473;
        Sat, 16 Nov 2019 14:50:27 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40e1:9900:1805:ba31:11d5:359d])
        by smtp.gmail.com with ESMTPSA id p1sm14018667wmc.38.2019.11.16.14.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 14:50:26 -0800 (PST)
Date:   Sat, 16 Nov 2019 23:50:24 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org, smatch@vger.kernel.org,
        John Levon <john.levon@joyent.com>,
        Alex Kogan <alex.kogan@oracle.com>
Subject: Re: [PATCH] function attributes apply to the function declaration
Message-ID: <20191116225024.kyxgkhkb2pixasnb@ltop.local>
References: <20191115004913.53104-1-luc.vanoostenryck@gmail.com>
 <7ff5e01d-817b-d367-dc61-2b5ceec957f5@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ff5e01d-817b-d367-dc61-2b5ceec957f5@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, Nov 16, 2019 at 12:26:15AM +0000, Ramsay Jones wrote:
> Hi Luc,
> 
> Just a quick heads up (since I can't look at this much for
> a few days now ...) that the current 'master' branch, when
> applied to git, causes 8 additional warnings.
> 
> I have created a cut-down version of the code, thus:

...
> ... which causes the following warnings:
> 
>   $ ./sparse git-noreturn.c
>   git-noreturn.c:17:25: warning: incorrect type in argument 1 (different modifiers)
>   git-noreturn.c:17:25:    expected void ( [noreturn] *routine )( ... )
>   git-noreturn.c:17:25:    got void ( [noreturn] * )( ... )
>   git-noreturn.c:25:76: warning: incorrect type in initializer (different modifiers)
>   git-noreturn.c:25:76:    expected void ( *static [toplevel] [noreturn] die_routine )( ... )
>   git-noreturn.c:25:76:    got void ( [noreturn] * )( ... )
>   $ 
> 
> Sorry to just dump and run ... (hopefully, the above is useful
> information - I will add the test file as an attachment).

Hi Ramsay,

Thank you very much for reporting this and, yes, the information
above is very useful.

I've looked a bit at this and all I can say for the moment is that
it's a quite intricated problem. I fact there are several problems
which interact with each other more or less subltly. 

-- Luc

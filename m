Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A33611FABF
	for <lists+linux-sparse@lfdr.de>; Sun, 15 Dec 2019 20:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfLOT1o (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 15 Dec 2019 14:27:44 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33570 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfLOT1o (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 15 Dec 2019 14:27:44 -0500
Received: by mail-wr1-f66.google.com with SMTP id b6so4665786wrq.0
        for <linux-sparse@vger.kernel.org>; Sun, 15 Dec 2019 11:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Uw72Plyh0wKP3ebXYbXHwk0QUvbqyBDsSWgXtl6bqGQ=;
        b=XimlBvnwkbOwiINZ9EitMz4rST6kRYq/PLL3rSWtprD07cZlI4SewXXYq+4rbP2Crg
         X7+fMn3r5VYvfC+J5Aa5I2bV9tVr6CN6zjmF1jHHGJmj0jHCLpSHFxco8/khHuk3hxlP
         thXiG3gbCOYcetJgzq0P5pMiwQzGN+rQ8EtmaRh9mEkX72T9jqQP4o3Xpf6Jv6e4/WfD
         x+5vXSKgFe5SwnebYlPCI9KzN6C5ETB7kzjRLf6g+GQjHo4S0BXo0rJS1Icm5IK1LLYr
         fa3tmdwUe7gl4/mgp9yqTPTOHrpMGFAKdUOYJA//dS5D/oBDGgFqsWhzFmu1XY1Na8kl
         +z7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Uw72Plyh0wKP3ebXYbXHwk0QUvbqyBDsSWgXtl6bqGQ=;
        b=A8OZSejaN1DRkMmO+9O7/88oSuKDOTgvkdwsgfuy85kD37fS9lnDy2eRMoWnqSKpDa
         WknraO7DW4xTCYDXRwAll64oI2LuIhaHT2y0SwtbpMU+wPsd2nZXcBVBN681S/B8+fiN
         20G7UJJr9y5zbNEs/Tb0otkS6PruDWsJ771wShE/HGzskRW7Jxtj0NnOwvCSjPz3X3pC
         qNsAhMtrsz+TQj5i30gThAPlEAHDX9PVJQubMEJjDFPopJjlTVwzZW8H8+uFRxkBCCzB
         3Aag6Kf9zEtuitLaFdDJQNZ7ATfiw/Mu9TLy4sUCtBKApf5STmr/+XadnrJsf7P8Mznu
         llBg==
X-Gm-Message-State: APjAAAUemeNH3WIwr6U76mWLb5jvDgsyRwopDZAMYBIsSbw7vD2hgPUG
        leLDr6cyn+UVn9QPkc5bhYY=
X-Google-Smtp-Source: APXvYqwTbdxBgUWAGBm+eq4MDpUGimfUTEaW3Oub5HhX2Z+GuzSUfrcoB1G0shsAx247FNN7N2R5XA==
X-Received: by 2002:adf:dc86:: with SMTP id r6mr27503147wrj.68.1576438062422;
        Sun, 15 Dec 2019 11:27:42 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40f6:4600:4d3d:d98:1fc5:2616])
        by smtp.gmail.com with ESMTPSA id k19sm16990874wmi.42.2019.12.15.11.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2019 11:27:41 -0800 (PST)
Date:   Sun, 15 Dec 2019 20:27:41 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 2/4] typeof: do not let classify_type() do its own
 SYM_TYPEOF expansion
Message-ID: <20191215192741.x5z54n75fzxkxb4i@ltop.local>
References: <20191215110425.76533-1-luc.vanoostenryck@gmail.com>
 <20191215110425.76533-3-luc.vanoostenryck@gmail.com>
 <0cc99807-a1d4-fa0e-0780-0b0feda53c29@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cc99807-a1d4-fa0e-0780-0b0feda53c29@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Dec 15, 2019 at 07:13:10PM +0000, Ramsay Jones wrote:
> On 15/12/2019 11:04, Luc Van Oostenryck wrote:
> > SYM_TYPEOFs are expanded at examination type.
> 
> s/type/time/ ?

Hehe, indeed it makes much more sense so :)
Thanks.
-- Luc 

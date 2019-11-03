Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B801ED5E1
	for <lists+linux-sparse@lfdr.de>; Sun,  3 Nov 2019 22:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbfKCV27 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 3 Nov 2019 16:28:59 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46267 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727856AbfKCV27 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 3 Nov 2019 16:28:59 -0500
Received: by mail-wr1-f65.google.com with SMTP id b3so9098760wrs.13
        for <linux-sparse@vger.kernel.org>; Sun, 03 Nov 2019 13:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OPRBJNYgWdiP5zoIzLBr9V5rtOBQencdgweDpuLCg48=;
        b=ByCH1c56jpaGFBdxVrd59P1tMC6J37Q6AYY+myJpbDEI3lhypEd0Ns7lNQ3sLLUBKO
         G4lw+5grLHzt+02yjxiHumXw50gqFVt7+wch/Kgr4URRjZPRiFLUFzhCoWmqfgY05wXn
         ClhWIq/k5hh+RSSb4XGw2sPpn+Z290MhjKHz0U7kBtjjjEsKmLVYTeLjxWTw3FGOt+Qx
         PohVnQ8zd6RJDc4nl+7rk9aWun6o8LB5jXlqyws3Z1UEUlvIgHZU2xkI3C6/lkKZijVE
         ymw92L9ROdmhgx2lwjfIzTEtKL1UNZ7pAkLJR/abqgCeTHcDfJQR0M4M5ymdaOFEVgZ+
         qJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OPRBJNYgWdiP5zoIzLBr9V5rtOBQencdgweDpuLCg48=;
        b=gSCV81zCB+w+6vt1f6zec16RryYogwkHBVDdz/zLWGGOX2bzEL+wwa+t5ggk4tI6KY
         Z3EhBZvp/T02l9vdrBGhNFX7FQSY4Ukv7jOsYsfHkV+UAXuyWIcRwmNCgt35gxNXiuYw
         lAagR5f1wbhoe+XY/3g+tdacR/x4cpV9pxZXrl+f6VS4nGImJmVS2A852wga5fJ4W37q
         GdZ8zGH4H2NENArNVVm5ETRvChO22+z0lMpnAB1Q8mx1yAKZOKOM+TR3RhmiLgiXRcRc
         Bez+qNlXpina+/04C/uy/ubqXfElDJvN+okme1olFvJLnJgLGycWx9AnBIWLQ0b2ctrE
         Drrw==
X-Gm-Message-State: APjAAAXOAOvLjzOeGMHPavNrGADZvUGA8ChPyD9/PsfFHKTkxXqYsRtV
        mejMoE1+EjeGGbcj6jMABF8CfQ5D
X-Google-Smtp-Source: APXvYqyeZE3PrKbJHLaG/XxA6bK58VycXcyKdpMjdJd6txNAvKZyQiOwxb6NCBNTuqJ6yyn0weDdxQ==
X-Received: by 2002:adf:f30e:: with SMTP id i14mr22173069wro.27.1572816536012;
        Sun, 03 Nov 2019 13:28:56 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40ac:ce00:ccfb:e608:d842:3a69])
        by smtp.gmail.com with ESMTPSA id y16sm5504989wro.25.2019.11.03.13.28.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Nov 2019 13:28:54 -0800 (PST)
Date:   Sun, 3 Nov 2019 22:28:53 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 4/4] remove unneeded MOD_TYPE
Message-ID: <20191103212852.vswouamwfznxkdwd@ltop.local>
References: <20191103162635.66442-1-luc.vanoostenryck@gmail.com>
 <20191103162635.66442-5-luc.vanoostenryck@gmail.com>
 <863ff559-21b0-10bf-4449-53d80a3989fc@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <863ff559-21b0-10bf-4449-53d80a3989fc@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Nov 03, 2019 at 07:10:20PM +0000, Ramsay Jones wrote:
> On 03/11/2019 16:26, Luc Van Oostenryck wrote:
> 
> Hmm, why had I not noticed gdbhelpers before! :-D

I confess that I also have never used it. Maybe I should.


Thanks for noticing the typos and inconsistencies.
-- Luc

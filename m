Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72077E9120
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 21:57:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbfJ2U5Y (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 29 Oct 2019 16:57:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53628 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726747AbfJ2U5X (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 29 Oct 2019 16:57:23 -0400
Received: by mail-wm1-f67.google.com with SMTP id n7so4112050wmc.3
        for <linux-sparse@vger.kernel.org>; Tue, 29 Oct 2019 13:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rhoqUsn9vy0bW7ON2qCA4JCTv1mQHu3AVlbJ/pt3+m0=;
        b=W4qspXhlXIGqmh+9qhh/wfttOtbdTsU6A6cZvAj5DNljsP/b++VsOaAa32TbrFXyTQ
         gM/VKh+FRwO2LFs60j91hS6ZUUmx+izFor9EdZdOoeIalQioyPCLxUETJTK20p+N6vB3
         kvB5ambsjSoS8RQDufcMa8DAlkdBnK5Uzlgcc2tKoMiwwzcj0FEHswdvu8psgJKCVcF7
         2RKW+Gu2fiy9eU1vD/u5fimtIAOyq32LOTD4OPAgd2yZ6dZ5szJBQhVVQl0Lo8Jen0YL
         2Z6+NprWJEjxa85VKrJ0U64EAUVuNjtZQkZKD3EZ/wls6c9PQ0Io5aVxC9nEAwrmT/G/
         +Emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rhoqUsn9vy0bW7ON2qCA4JCTv1mQHu3AVlbJ/pt3+m0=;
        b=rFNzL4a+Uix66RqXF9t3GW5WA8Tccv5AGIuerTi3bUScG6+8CfGhBhOueqwk4bKXbC
         MRDHIUQW/v3AnKdDxE5bkBt4iOvFffIpSxFUuI3dfLnekJIXMGSuPtQxPOiR0hW/tHO7
         3uUCnIucU5iJEdryBZ3AMlNltxS8KwPvjDW4Zf9NfwfuhIQKVXO+Y8kR+u30gmjTrDdc
         1GjapeTkWSsVgvQAuxCx6trQZ2bnUh1D3dPmBtqiBFtevWVIwXb5RyPoJiQW8EAajKe1
         lyHwSyZwznZmwEo2kvCdbPW4hGEXnAUNs+cTlx6KXQyaDSL5nKxkJcRlcLMIE/6sIfTs
         /Pbw==
X-Gm-Message-State: APjAAAVwkkGXJF26G1RMYgMZyPQfuL2ZuiDX6YcXKs5HhFxTE7WXBImP
        Eu60aHFaliBpiE8yXu71VpXsPLGX
X-Google-Smtp-Source: APXvYqyRtV+huDWEm+52H6bB2RksNZKabcEgCoMzuJ0ZJgbUS8KeRpK9xX/dfcBT8RacPIfNoYzGJw==
X-Received: by 2002:a7b:c049:: with SMTP id u9mr5788221wmc.12.1572382641829;
        Tue, 29 Oct 2019 13:57:21 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:40ac:ce00:81ee:880:54a7:d771])
        by smtp.gmail.com with ESMTPSA id 12sm4374364wmk.13.2019.10.29.13.57.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 13:57:21 -0700 (PDT)
Date:   Tue, 29 Oct 2019 21:57:19 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] options: allow to specify the desired arch with
 --arch=<arch>
Message-ID: <20191029205718.z7ki5z23j5qqovsx@ltop.local>
References: <20191028214337.70890-1-luc.vanoostenryck@gmail.com>
 <c480aeeb-2779-94b0-1354-f1f8eb6522a8@ramsayjones.plus.com>
 <20191029082334.g3evfqkc73ohn6pn@ltop.local>
 <89ebf585-7700-c8e2-7786-a599f31ee5e8@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89ebf585-7700-c8e2-7786-a599f31ee5e8@ramsayjones.plus.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 29, 2019 at 06:57:02PM +0000, Ramsay Jones wrote:
> > Do you see some complications?
> 
> No, I was thinking about the opportunity to simplify cgcc! :-D

Oh yes, I'm working on it.

-- Luc 

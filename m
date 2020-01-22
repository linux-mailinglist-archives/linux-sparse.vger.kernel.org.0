Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1695145ECA
	for <lists+linux-sparse@lfdr.de>; Wed, 22 Jan 2020 23:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgAVWsG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 22 Jan 2020 17:48:06 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50964 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgAVWsG (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 22 Jan 2020 17:48:06 -0500
Received: by mail-wm1-f65.google.com with SMTP id a5so491898wmb.0
        for <linux-sparse@vger.kernel.org>; Wed, 22 Jan 2020 14:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o8O/1dqOHVO8Y7KsbdGgEamR9WxRxTtPK/XJmNNHakk=;
        b=s7TEtXxKVd5r+sBQHhL06Hh0dM8KAUD3YOTGH8iE1jxBfG/AT5idFTtheVJiNfu+7Z
         gue1y70Wn1ZuBdhxL+qMJqS6Ja2TEH99xACF4ExOokByEWbm247tD8+3JgKYSmyHjXlo
         /ZJK+AA5owHDwjeyv4pC9TS9QXPXjU78qHLombKKw6SIxriwo9oXuUMCs4ZuaUQb/L0p
         /hSZcefx7pPPtp4XYXGJ7KcatyCg75VhTrH7eMKFUTQp6hFdNiip1Z4Q0zYy4I0kFk/S
         XB4UtGuMo/fNZ+RBrUBOkEfM4s2cBHrxWmPjAKnA4+hJhPZNzQ4lILF8WTAJ18CgCD47
         8UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o8O/1dqOHVO8Y7KsbdGgEamR9WxRxTtPK/XJmNNHakk=;
        b=XeE+J/OXN1OEkeNP7WBpOMNkbmYoYQRD+nZ/x2XCL7ODvOLn25TRLue0wD4V2801N4
         dey4Xz6t9zcnXs9QUq4+SJtXe+g8SY3ztd041QDRKum9D0xRfFV5c+0U4tEp7YdaXjv8
         7Amzv97w2yTZk8GwmpoyWkMO9JCqCzGwfmGEaCHs2lkTSkgO9JwSve8WAEx4OcvmKbVX
         amOHLRj/RV/1+KBlinw67JDuXvVBbs9j+YhboGkORTjTHLX3aOpvhh2gBieR+7plbi1l
         zlPfYyVa1yJ8FL5cD4KBjY//A94f73hYkpvnLIgHoU/Dhci+gkjuPR77uxh+xyy3HIY5
         viHQ==
X-Gm-Message-State: APjAAAWAcniIUvj7/ZAMnMz6NV8jDTyyNavwQ4xS8p+8tjW2e06Y7I8T
        L6vOMS58Om9bIowfJojX3G8=
X-Google-Smtp-Source: APXvYqw9ZvwfcWayFBMRUbb3q8NBcYRieZqLogpDcHJmS3LMEgHtgBB6L+O5L70G2eZDY+1ixOhkgw==
X-Received: by 2002:a05:600c:2050:: with SMTP id p16mr422141wmg.176.1579733283929;
        Wed, 22 Jan 2020 14:48:03 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:186d:f1b8:64f0:3cd8])
        by smtp.gmail.com with ESMTPSA id h17sm426211wrs.18.2020.01.22.14.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 14:48:02 -0800 (PST)
Date:   Wed, 22 Jan 2020 23:48:01 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Toomas Soome <tsoome@me.com>
Cc:     John Levon <john.levon@joyent.com>, linux-sparse@vger.kernel.org
Subject: Re: [PATCH] correct sparcv9 defines
Message-ID: <20200122224801.piocizxa45ejy3zg@ltop.local>
References: <20200120103824.20746-1-john.levon@joyent.com>
 <20200121001322.zikj2xsacqt765fi@ltop.local>
 <BFD5AC88-E262-4579-BBD4-3C2BBBEAEBF9@me.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BFD5AC88-E262-4579-BBD4-3C2BBBEAEBF9@me.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Jan 22, 2020 at 12:53:58PM +0200, Toomas Soome wrote:
> > On 21. Jan 2020, at 02:13, Luc Van Oostenryck <luc.vanoostenryck@gmail.com> wrote:
> > 
> > Thanks for the patch.
> > Is it possible to have Toomas' Signed-off-by for this patch?
> > No need to resend the patch, just a reply to this email
> > saying it's OK is enough.
> 
> OK by me:)
> 
> > 
> >> 	case MACH_SPARC32:
> >> 		predefine("__sparc__", 1, "1");
> >> 		predefine("__sparc", 1, "1");
> >> +		predefine("sparc", 1, "1");
> > 
> > I'm wondering if there is a real need for this one or if
> > it's just to reflect what GCC do? I'm a bit reluctant to
> > add it since it lies in the user's namespace. But I'm fine
> > to add it if there is a real use case for it (in which case
> > I'll just slightly change the patch to not predefine it if
> > one of the ISO dialect is selected (via --std=c99, ...)).
> > 
> 
> 
> The problem is that gcc does define those symbols and the code is using them, hence smatch should behave the same:

OK, fine for me if the symbol is effectively used.
This patch and John's are applied and pushed with some adaptations
for a related pending branch I merged first.

Thanks,
-- Luc

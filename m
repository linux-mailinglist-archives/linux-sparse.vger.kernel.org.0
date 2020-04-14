Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FCC1A752B
	for <lists+linux-sparse@lfdr.de>; Tue, 14 Apr 2020 09:49:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406802AbgDNHtm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 14 Apr 2020 03:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406749AbgDNHtk (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 14 Apr 2020 03:49:40 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 232ECC0A3BDC
        for <linux-sparse@vger.kernel.org>; Tue, 14 Apr 2020 00:49:40 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o81so6337977wmo.2
        for <linux-sparse@vger.kernel.org>; Tue, 14 Apr 2020 00:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AS+qIfThAommTxiCdDYKDKDveLY9o/1xaUg3ZG5Ko3g=;
        b=UV3Dt5/93+xo+TY1lUwqCOfrdsKAB69HijJ5x/c56yH3ZVLTOMZiQ+h3M7vodmPJj1
         Ol/LuUImmO3CSRgMa8RDLurLLJXBAnxDA2/+ciewhIUBAIIHmsDBe35VC59nwCYppkJo
         B8LZqcwEznyQWqSD2PXxv0EvAwDfsPzhXy2+0NfjKllyA0nJdTHtfvi6r7jMJEyq0121
         Db43/Z2D5YLcbfA8JVc6svPDwTd7vLiA7uiHVCH0b3XMyED20b7cv5++9RLbnijNTMo6
         TYEcWKAyVHrtCYb/4lhuDihewpzhzv9fDKWQDT9THTe1xkLNsYa7eVlvT1lA/duWhGcy
         DJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AS+qIfThAommTxiCdDYKDKDveLY9o/1xaUg3ZG5Ko3g=;
        b=NS4Ieunu9c+ANOaTzkefaQNNga1z4vLI3B+F1EC8C01pL2brVlXCW9tFPwHfWlCfzR
         8ywZgTYE9pKCZkUhXrHx4zrZzWMyUmbmJIs1RRrdF1FmRglSjXsoCxnauecy0MW5nlHY
         yQRbf5/A6+0qkxis1hh+CSnsS8Xk3OItXEPmcKrvTMMkLn3VTTfleOXFXPX8SL/pHcLU
         n6saMMtz3rPwJwUMzcZ74f1MxUWalV129HqVKtgMpH4n3vPZRCVXJW6MXiRxmzsQV2Kx
         oPrVpLyY+EtNT0MmPy/kHU4MXnIvQScIJJXrd038DOaAmErBHxm30JhqEOWnRMvdZ4Sx
         nuLg==
X-Gm-Message-State: AGi0PuYUWTBW1VLwcPgEwmKGqt/b3UkDzwC3EnoLoONCnHMyyGWNFTUQ
        b2AXuE58fNgUy+x55W8MATb5IAfo
X-Google-Smtp-Source: APiQypLQMU9AOa+Ba5FoHICXPKwCIUjcZ8OGmKzpT7Xi+Zr6G3X4eRib77rAc7kzsjrpMBHPuS5dnQ==
X-Received: by 2002:a1c:7d04:: with SMTP id y4mr21972072wmc.10.1586850578728;
        Tue, 14 Apr 2020 00:49:38 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:f48f:b75:fb3a:3723])
        by smtp.gmail.com with ESMTPSA id q18sm11172215wmj.11.2020.04.14.00.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 00:49:37 -0700 (PDT)
Date:   Tue, 14 Apr 2020 09:49:34 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH 15/17] scope: give a scope for labels & gotos
Message-ID: <20200414074934.urvzzgpi2a36jdf2@ltop.local>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
 <20200413161605.95900-16-luc.vanoostenryck@gmail.com>
 <CAHk-=wiy-BFXMpmm9-GNT_WtDKVLeR0ki4OTj83xPk=npuNSHA@mail.gmail.com>
 <20200413185452.pgj75pj5g7a42kik@ltop.local>
 <CAHk-=wjMSeVVQHZ23=HJ3V-yYPooeuHNHmZtexUVRKg_e5VMXA@mail.gmail.com>
 <CAHk-=whNLSTtSsmMD5a6D3s_LtjEYwZPWOSvUdz4mCd5kFO26Q@mail.gmail.com>
 <20200413233900.t7fczyyqrees5gwr@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413233900.t7fczyyqrees5gwr@ltop.local>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Apr 14, 2020 at 01:39:00AM +0200, Luc Van Oostenryck wrote:
> 
> I like the idea. I just gave it a very quick test with sparse's
> "make check" (it covers a lot of simple but corner/dirty cases that
> the kernel may/should not have). It seemed to pass all the tests but
> the ones using __label__. For exemple, things like this complain:
> 	{
> 		__label__ l;
> 
> 	l:
> 		goto l;
> 	}
> 
> I'll look more at it tommorow as it's a bit late here. I just fear
> that __label__ will spoil things here or at least complicate them.

The problem is that now normal labels use the new label_scope
but the ones declared with __label__ use block_scope and these
2 scopes are kinda in a different namespace of scope.
It's easy to make it work here but the problem would remain
when extra block levels are present, like in:
	{
		__label__ l;
		{
		l:
			goto l;
		}
		goto l;
	}

It's surely salvageable in some ways but I'm not sure it's worth
the troubles.

-- Luc

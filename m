Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62CFF121C16
	for <lists+linux-sparse@lfdr.de>; Mon, 16 Dec 2019 22:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfLPVlH (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 16 Dec 2019 16:41:07 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44935 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726275AbfLPVlH (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 16 Dec 2019 16:41:07 -0500
Received: by mail-wr1-f65.google.com with SMTP id q10so9049311wrm.11
        for <linux-sparse@vger.kernel.org>; Mon, 16 Dec 2019 13:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cRIMBir9/A6RGAGqN2wYH8PVgqb/rxXWXAxcvpJaWJY=;
        b=vMRh8dWmpCyYiWMWlmZFBLZVO+oE+Fn2lYJn1CYKBQYm5z8vqFoC22Y9Hc/tTtGvV1
         SsMO0lgMEAy0fIlQ97EGnexKBGRlBROCXcLCI2j+4tzDZ9dkYLCH8GPgIy6IWQBK2+CR
         C2+XHj9RMbzB5+TOywULVanmZUsNrp6ZAcKB/fOrPFjUL7NNpd/VxMt+ZHaP26//Lut9
         cKmCI/XQCI3enAywDcKfDR7xmO7a+2VUHStG9K8yxBlt9dR05JBylo5GLrBI512CFlbA
         fsqXk2P9tAe9vqqCVO4UZnCjPShs8UUx9tEsZc6gpX50E7guHze01JQP5ChWn3HZb1g8
         HQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cRIMBir9/A6RGAGqN2wYH8PVgqb/rxXWXAxcvpJaWJY=;
        b=QjQutLB9+38zGUzWD3pUBT84YZ6yIsZFLsDQwUpDj5rlVkoIK24cgnfVHL94OqWsfK
         lF7vnGNBD0J8La6Eoyql/nZhgdQ7RncJSrpbXL43V7EFrxnH93R2cxD5fe/QQDkNfY15
         81WZ23zk6VIL4E9bzrTs0+xCEuiAv/LQcXVj8ZDE1r+o+QjLZQqkUBQz3406rKhbPLZa
         0o0ePoznBWruETiJdxeMR+VmgaMdJZPwKOs3sgL2Ksvk6ZXoaDt+5eLU5SgKdcaD0EmD
         ewSEHiq7ZuVWgnjCiCNwuWFIhpYSMAoFLSVBcxq0y+YVc1fBRIXWS5E5vrhDUtXWEN35
         aSiQ==
X-Gm-Message-State: APjAAAXljcX4+urQiAevdtvtrGELU4hsJiV7+AyOmEX6YTtRtMm0zZL3
        /4z7vX5PIY+PNrWQ4KH4w4jQkpIN
X-Google-Smtp-Source: APXvYqwGYTKDH9txrRvjaIpbaZ6xRPtAvjmg7z1wFQ06yG7yxN2biIoxpEvtCx1p5AQrafb/L0Yf4Q==
X-Received: by 2002:adf:e547:: with SMTP id z7mr33459515wrm.258.1576532465018;
        Mon, 16 Dec 2019 13:41:05 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40f6:4600:cc19:8fa5:c37:9263])
        by smtp.gmail.com with ESMTPSA id t5sm22653219wrr.35.2019.12.16.13.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 13:41:04 -0800 (PST)
Date:   Mon, 16 Dec 2019 22:41:02 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH v2] improve diagnostic message about wrong redeclaration
Message-ID: <20191216214102.zteh3q3nxi765kcy@ltop.local>
References: <3037fb4a-aabd-6386-e14a-906a948510bf@ramsayjones.plus.com>
 <20191215201327.12270-1-luc.vanoostenryck@gmail.com>
 <5f9ec786-3cdd-b584-ba57-cdec105d4fb3@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f9ec786-3cdd-b584-ba57-cdec105d4fb3@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Dec 16, 2019 at 02:11:59PM +0000, Ramsay Jones wrote:
> 
> Yep, this looks better. Thanks.
> 
> However, ...
> 
> It is interesting that both gcc and clang sometimes do/don't include
> the equivalent of the 'typediff' information. In the case of redeclared
> functions with different parameter types, etc., it seems they are
> content to display both function prototypes (including parameters) and
> let you deduce the information yourself! ;-)

Yes, indeed. OTOH, sparse doesn't display the argument's type,
which is often very annoying. I never tried to fix it, though.
 
> Note also, that sparse, gcc and clang all give different warnings and
> errors on 'validation/c11-atomic.c'! (sparse is not passed a --std=
> for either c11 or gnu11 - does that matter?)

No, it doesn't. But it more or less should since, standardwise,
_Atomic only exists since C11.

> thus:
> 
>   $ gcc --std=gnu11 validation/c11-atomic.c
>   validation/c11-atomic.c:9:6: error: conflicting types for ‘f00’
>    void f00(int dst)   { } /* check-should-pass */
>         ^~~

[snip]

> ... and for clang (does it understand --std=gnu11?):

I think so.

>   $ clang --std=gnu11 validation/c11-atomic.c
>   validation/c11-atomic.c:9:6: error: conflicting types for 'f00'
>   void f00(int dst)         { }   /* check-should-pass */
>        ^
[snip] 

> [note that both gcc and clang complain about 'f00']

Yes, indeed. Quite interesting.
 
I wonder which version of gcc I used when I added this (I'm
kinda 99% sure I compared the output with gcc's but ...).
I tried to check this in the standard and at first I concluded
that sparse was right but a closer look made me think the contrary.
I really hate how things are specified in the standard.
So, from what I underdstand:
1) base rule: for type compatibility, only the unqualified types
   matter.
2) the qualifiers are const, volatile, restrict & _Atomic
3) restrict is special anyway
4) for type compatibility _Atomic is special and must not be
   ignored (which totally makes sense since its alignment and
   even its size can be different than the base/unqualified type).

I'll fix this in the coming weeks.
Thank you very much for the review and for noticing this.
-- Luc

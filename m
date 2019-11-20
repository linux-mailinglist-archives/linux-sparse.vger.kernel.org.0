Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20061104254
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 18:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbfKTRoK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 Nov 2019 12:44:10 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45369 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfKTRoK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 Nov 2019 12:44:10 -0500
Received: by mail-wr1-f67.google.com with SMTP id z10so814447wrs.12
        for <linux-sparse@vger.kernel.org>; Wed, 20 Nov 2019 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yG31yDzIToojpu/+vTlZw5moHhg9qzYS8fgMH+kubrE=;
        b=i+kG1YJA35XI1GYtpVLiryOHYP1aek5s7H4tUisYuctbuOp9+rU+sNHKdwQcsxE5/e
         5nbXs3897RjO1ZZhHDj9QPL66XbRYDp1+LA7MqT0knBH1IBBCaODtBmC0oX1qqSgLMM+
         tvKnHSD4db7bhNBNDpimLuJA9FiYduPBrdsrGwN5W0YTT6CkZoy5E4ZVXVBrZ7fvT3kg
         6AWo99jxbu2ePrjvJ+KUaKV9rxQ5ZLhno/CWya+cwx9myuXZf3qt+jbzitD/mSdBr7k0
         JAVWaz7XY0pj0SueNm9PuS15bceUkmB/2ckklXJFclvvJDfvkKlNE+jZ24hcadyI2eVV
         5Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yG31yDzIToojpu/+vTlZw5moHhg9qzYS8fgMH+kubrE=;
        b=bd2oREEUXJzqsU1IOQzkJtYlIXtOJotKFQ7XxYJalCMxV+O1VYgCHmbl//AAZjvWez
         Q1rzyMdrb2fZArihxGiuRswcTJXOssz2xKu6Z6YX+ZsX3Z+HYcRg6e0mCZaDFhKZDZYA
         zHPbRwtAD8Szal2drhoYrw68svtdn2j/GYd+7rwNf4hafnrpwNU4YUN4PDPt0WXmMQPW
         QiHQ8zzSoXOA46MY1vRTSQVa8pOReJeJXnI5zUR4yDUOarEzfWFdI7qW1GfPOtnJBq7J
         c0a6Yjo4EH+Bbe9MrTFP6jn9/shSjB3LobUEU8weg8vOLUApNMqj97kzmmzIDYvFVr4O
         EaAg==
X-Gm-Message-State: APjAAAW/TTdjwdPliOSZ+4ey3vyW29i/kqtoMm+6eKvZu5lYD9TEGElu
        aDi3xt3FnTJrjn/Lf+IP1xg=
X-Google-Smtp-Source: APXvYqyTyeMre5EbQeRPxlDVFIAlJj5jyQKrggptltnLklRVKB5olURzEzoxEn6LNUkGfRX7JI2tpw==
X-Received: by 2002:a5d:50c3:: with SMTP id f3mr4865817wrt.14.1574271848256;
        Wed, 20 Nov 2019 09:44:08 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40e1:9900:950c:3e8e:b6df:1425])
        by smtp.gmail.com with ESMTPSA id r2sm32496332wrp.64.2019.11.20.09.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 09:44:07 -0800 (PST)
Date:   Wed, 20 Nov 2019 18:44:06 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH 1/5] add tests for function attributes
Message-ID: <20191120174406.u44nkqhmwfcgn47q@ltop.local>
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
 <20191120000224.30441-2-luc.vanoostenryck@gmail.com>
 <0969a62b-4fab-eacb-b2aa-26c04b2f4a0b@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0969a62b-4fab-eacb-b2aa-26c04b2f4a0b@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 20, 2019 at 02:05:58AM +0000, Ramsay Jones wrote:
> On 20/11/2019 00:02, Luc Van Oostenryck wrote:
> > Function attributes need to be parsed differently than
> > the usual specifiers. For example, in code like:
> > 	#define __noreturn __attribute__((noreturn))
> > 	__noreturn void foo(int a);
> > the __noreturn attribute should apply to the function type,
> > while a specifier like 'const' would apply to its return type.
> > It's even more clear when function pointers are involved:
> > 	__noreturn void (*fptr)(void);
> > here too, the attribute should be applied to the function type,
> > not the its return type, nor to the declared pointer type.
> 
> Hmm, it _is_ applied to the 'pointed to' type; ie the pointer
> base type. I don't quite know how to say that succinctly (so
> just ignore my rambling! ;-)

Well, yes, in the case with the function pointer, the attribute
should be applied to the 'pointed to' type. But this 'pointed to'
type is the function type and that was what I wanted to emphase.

Best regards,
-- Luc 

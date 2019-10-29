Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6DD3E8279
	for <lists+linux-sparse@lfdr.de>; Tue, 29 Oct 2019 08:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbfJ2HYg (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 29 Oct 2019 03:24:36 -0400
Received: from mail-lj1-f172.google.com ([209.85.208.172]:38948 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfJ2HYg (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 29 Oct 2019 03:24:36 -0400
Received: by mail-lj1-f172.google.com with SMTP id y3so14103646ljj.6
        for <linux-sparse@vger.kernel.org>; Tue, 29 Oct 2019 00:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SoFQNKQ4Qa81yrqKCpibxDMBO3sAN1LEi2FGE9F/8RA=;
        b=Hy0//0hOS03mKb68HU9qDOg02jeHGzftxkWxOIgCuOU7CKTJ+k6iUZX7gjKOSvGQPl
         4BICrmSElIBBlJfP3hi6Yo0Otz+bH5RNw0pVZLArmHAfxPetqDt+zD9HpnTKyeckCM+D
         g8xjzcLF853wbCU3oVitJzkWqZdiNvQxj+RoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SoFQNKQ4Qa81yrqKCpibxDMBO3sAN1LEi2FGE9F/8RA=;
        b=D+ZTrf+ikiSOgRlq/ZNbIzoJeHzZ7CrR4LYEtO8nhG2qt5pFkBTFGNIO8Z0xh3l+4U
         kRpfQgMtPRc/sqq12ExxEGrZDuj1LUudiC6mVRqgILGtAB2VprTLRzxt5QzY8YzD8SBC
         JWiBfLyXcqbf3JHViFUS8DnJIfBiMJ/NeRWyNbQXS652MtcL20zLvl7MaHPtK6OYSWoX
         VkZIp1rOo0Zx/kXlZHpCvAwzvh00Ro/Ue+N0MNWFEQhfiDTeIfFDleZJN/S/mmtt9XaO
         dE9cOxcZcrNocVRqFfDdkVhO+3UxJKMlu9ejJymG6jmG3IJVyVjF2TRqexG6dyLQoy7y
         ztzA==
X-Gm-Message-State: APjAAAUp51hcrHdP1lkR1qEBfVkJB8DyFN735bCJVKlbvOW/vRCOGJDw
        BEI5hvm5HQpJ4Cf9IHJwJxc3ORA+Rzyy+4ii
X-Google-Smtp-Source: APXvYqxZ8IhrFy/tgteftGXSXlOqZ4BXScz2I7670qyE6XtdMubwJllvBbNMdBuHGKwNyqbFNN3qLw==
X-Received: by 2002:a2e:b0c9:: with SMTP id g9mr1293910ljl.95.1572333873850;
        Tue, 29 Oct 2019 00:24:33 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id p88sm9377100ljp.13.2019.10.29.00.24.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Oct 2019 00:24:33 -0700 (PDT)
Subject: Re: detecting misuse of of_get_property
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.co>,
        linux-sparse@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <ec277c12-c608-6326-7723-be8cab4f524a@rasmusvillemoes.dk>
 <20191028224914.enpqjkcvbxyeexnl@desk.local>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <2dcd6ac3-8a01-a11c-3532-5a8eb83ccdf5@rasmusvillemoes.dk>
Date:   Tue, 29 Oct 2019 08:24:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028224914.enpqjkcvbxyeexnl@desk.local>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 28/10/2019 23.49, Luc Van Oostenryck wrote:
> On Mon, Oct 28, 2019 at 08:32:42PM +0100, Rasmus Villemoes wrote:
>> Hi,
>>
>> I just spent some time trying to convert some so far PPC-only drivers to
>> be more generic. One of the things I had to do was convert stuff like
>>
>>   u32 *val = of_get_property(np, "bla", NULL);
>>   do_stuff_with(*val);
>>
>> with
>>
>>   of_property_read_u32(np, "bla", &val);
>>   do_stuff_with(val);
>>
>> (error checking omitted for simplicity). The problem is that
>> of_get_property() just returns void*. When the property is just a
>> string, there's no problem interpreting that as a char*. But when the
>> property is a number of array of numbers, I'd like some way to flag
>> casting it to u32* as an error - if you cast it to a (pointer to integer
>> type wider than char), it must be to a __be32*. Is there some way
>> sparse/smatch could help find such cases?
> 
> If I understand you correctly, you would need a kind of 'soft'
> bitwise pointer?

Yes, that's a very good way of putting it.

> I guess it shouldn't be too hard to add a new flag which would
> allow cast of bitwise pointers to pointers to char/void (see
> at end of evaluate.c:evaluate_cast()).

Hm, yeah, but it should also allow casting to __be32* , but not u32* or
__le32* (though somebody must have gone out of their way to introduce a
bug in the latter case). Don't spend too much time on it, I was just
wondering if there was an easy (maybe already existing) way.

Thanks,
Rasmus

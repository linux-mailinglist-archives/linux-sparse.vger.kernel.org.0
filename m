Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C29CD10B435
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 18:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbfK0RPX (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 27 Nov 2019 12:15:23 -0500
Received: from avasout03.plus.net ([84.93.230.244]:41506 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbfK0RPW (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 27 Nov 2019 12:15:22 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id a0uOiKNbnKleZa0uPim8Cq; Wed, 27 Nov 2019 17:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574874921; bh=JKsXud+v9+zlq9oS4y6zd8HN7KpF/Jm083IcPH10CJs=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=j+e7KLJUvGPZZzuHQaPyP1Sm/sBUU4xbR+P8agamR53agbPKR47s2bje1PM4vprLv
         0inAiHP2rv1B2SkG10ROxWdZ4oEGuaO4aCTyTscC/ODPubeD9DVBMLMLRoqb5CX34D
         hrTYzA4lF8PGiDXn3nhbe3te3ko1bpxGU42QlT8/CFBfRydG/KYulIq8KY6cS5gV9K
         gyHLJk9c8ZLvI1SxiFImxlz5LXcOn170rBhwT9FICjygqlBQtLY7FRNtYB7COTP0Ak
         rlel3l5xrl69mUzURFbSut7X9VyB7rg7f0guphJyhieOo8TqI53SFN3LD4iifjBnLR
         u17LbrQjm9EHQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=sLJvnk74krxChZghyXEA:9
 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 0/4] More arch specific fixes
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <2c56999a-3ee8-999a-be41-962ec8c8d70e@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 17:15:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191127022351.68902-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLd4gN0xL4cZZcVDly2/08iyL/CbUIJsyOmMZOZ0LqWCzfz2tc05vTxZYB2RshfTF3nljLVGr8tBrN8f6dz/ekCq/aSZNW/FJ4+y22H7PNHp6vqKtQpI
 qJKhpCxZR41/H2OZF+3ylzrHi5E4IFLrOt68l7CbK2kA38YrSO057aR7PVaNqW+gGs7jBrV+MuyQzQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 27/11/2019 02:23, Luc Van Oostenryck wrote:
> These are small tweaks going on top of all the previous ones.

Hi Luc,

I only had minor comments on this (and the previous) series, but I
haven't had a chance to apply and test them yet.

I was going to just test 'luc/int128_ctype', but looking at the output
of 'git log --oneline --graph master..luc/int128_ctype' I can see that
several other branches are merged into the result. So, I will apply
the patches from the mailing list directly to test them (hmm, _hopefully_
tonight).

ATB,
Ramsay Jones

> 
> Luc Van Oostenryck (4):
>   arch: add missing predfines: __amd64 & __amd64__
>   arch: add missing predefines for PPC
>   arch: fix wchar_t & wint_t for openbsd
>   cgcc: add support for riscv64
> 
>  cgcc     | 3 +++
>  lib.c    | 5 +++++
>  target.c | 4 ++++
>  3 files changed, 12 insertions(+)
> 
> 
> base-commit: 28f3149490ea905dedbb892b5f7bed7078d3fd23
> 

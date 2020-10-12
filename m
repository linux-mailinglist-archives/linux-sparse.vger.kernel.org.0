Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68EB928C024
	for <lists+linux-sparse@lfdr.de>; Mon, 12 Oct 2020 20:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730818AbgJLS7e (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 12 Oct 2020 14:59:34 -0400
Received: from avasout07.plus.net ([84.93.230.235]:41847 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbgJLS7e (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 12 Oct 2020 14:59:34 -0400
X-Greylist: delayed 451 seconds by postgrey-1.27 at vger.kernel.org; Mon, 12 Oct 2020 14:59:33 EDT
Received: from [10.0.2.15] ([195.213.6.24])
        by smtp with ESMTPA
        id S2vQkGTyloEd7S2vRkRjQJ; Mon, 12 Oct 2020 19:52:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1602528722; bh=Oz57lvLX/jee0+L+B+j2S0PzNTaADUfwbXDT584rRIQ=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=WrUuozyW9vu5g7X9W9BdOiebU6NFWaFRHX/9UaacUAgELquoT1vMwDgKkbNgeuBBZ
         GwhWhjhn2pvDiR0bPyCK555KxCs5PyJpvv032mLw08njoDzNJnJ+JsD9WyHrWqqxOI
         AlsRNwEc0XNqUfby6fkA5XjEmnZaTLO4ntF1iF/RmR9Ju1SeyI4S/m7lcJ9toR8QTH
         uGZ/Lf5WqG99KyrTWoNnt9ghcVZPuCPXwcE4L2jERNY2afdX71MXjpPOaH4H6y462c
         o3OBL3QcgmG0MIQzd/OMvM/vbd93c5W7tkH/XMCnKi03IaczjYLMLCfTMvLB7EDvM6
         ZDES99lmdrolQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=Kp/WJVeN c=1 sm=1 tr=0
 a=ZbLTZYmGBvpB9CrD5UJtoA==:117 a=ZbLTZYmGBvpB9CrD5UJtoA==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=WxOvGc0BQiYQRxOMmKoA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: ramsayjones@:2500
Subject: Re: [ANNOUNCE] Sparse v0.6.3-rc1
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20201011225804.fgpismx45eqjivay@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <11aa016d-7a56-0759-d53b-df406f164545@ramsayjones.plus.com>
Date:   Mon, 12 Oct 2020 19:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201011225804.fgpismx45eqjivay@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNj9YDr9IF1JbCCAiZ+9Gid5TOeabiY+jdcDlGgD+WQj/6GCWVnKnQXDw4EKpIgCQfKqEXB7qEO5+E88ng8De6rgK9TIm6Eo/+CZc1bcz2dY0rmPz4np
 tQqxMBgvhDXR2/kwk3XrAyvrVFh8etYWp1imbIkGVjTVPgxRxPt4MMECC0BlYiF323iToX7nl8Mnuw==
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 11/10/2020 23:58, Luc Van Oostenryck wrote:
> Sparse v0.6.3-rc1 is now out.
> 
> The source code can be found at its usual repository:
>    git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.3-rc1

Tested as usual (on 32-bit Linux (LM19.3), 64-bit Linux (LM20) and
64-bit cygwin), no issues found! ;-D

Thanks!

ATB,
Ramsay Jones



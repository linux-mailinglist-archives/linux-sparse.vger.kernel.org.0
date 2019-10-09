Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBDD7D04FB
	for <lists+linux-sparse@lfdr.de>; Wed,  9 Oct 2019 03:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbfJIBDZ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 8 Oct 2019 21:03:25 -0400
Received: from avasout01.plus.net ([84.93.230.227]:50838 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729700AbfJIBDZ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 8 Oct 2019 21:03:25 -0400
Received: from [10.0.2.15] ([146.198.133.39])
        by smtp with ESMTPA
        id I0NtilOoCbMsOI0NuiSOBr; Wed, 09 Oct 2019 02:03:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1570583003; bh=SPNv7DvlGAWcogxz2GAkaFB1B7uBYNa5tX0DDwanxdU=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=CL5VaCe2zmFRM3XejO73N2qlglI0E+7svC+VoMSIkm/tHEqD4eJuKrMHSBdbUAvpd
         KylMfjtZl3m1o7sM0+o79H1sT7B9ClYwYo99IKrt+E4IOQ7o9qK2d+PEcmZ5ctvnO0
         RhVQ3CNIMGPWT3BcE2lPIIG10NxLvci2ge3FGNErnQBE+AKRwd/c7kBWTS2/K89+3X
         dw5QgNTS62mlB+ebfEpUjDsFqMLKR5qoeC1Pkn9wNnsX99oRn0RtHcDqUQ+o6QLcQM
         UiLIgqJBAOnSlfJ4CMHsZ2Q1MguonSHOV/rHPxSnZVlJHoruZOSaMJOb/vjll68URY
         HjetXbCJBVl1Q==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=C5WXNjH+ c=1 sm=1 tr=0
 a=1Jh3712dEPwUcX5EWi7t+w==:117 a=1Jh3712dEPwUcX5EWi7t+w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8
 a=nrUGU_Z7TbSQzYrLYiUA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] Sparse v0.6.1-rc2 is now out.
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191007090610.10640-1-luc.vanoostenryck@gmail.com>
 <e07a51e8-dc18-5074-3832-8a1f33ec7085@ramsayjones.plus.com>
Message-ID: <4f29a2d7-de83-5b6b-ce14-1ed880b6fe12@ramsayjones.plus.com>
Date:   Wed, 9 Oct 2019 02:03:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e07a51e8-dc18-5074-3832-8a1f33ec7085@ramsayjones.plus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFSCTt/FzcBDpgWU657rIvrfnA5ZsPdwZ3mLTz9QI5r6btS8sF8xBGbWosPyfDAqIJpIHCqrqsNAfRb8BGZ2kD8lIA2+W7tk74FVtrWsyLtDwBGd4/K0
 h/F16pYO32Zg57uuUhRNn2l3jm+f+iIVEXRpfqKFxx+AMq6BCVSEFJ0IT/aInK7cmYbb3hc1XnzPuw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 08/10/2019 22:57, Ramsay Jones wrote:
> 
> 
> On 07/10/2019 10:06, Luc Van Oostenryck wrote:
>> The source code can be found at its usual repository:
>>   git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.1-rc2
>>
>> The tarballs are found at:
>>     https://www.kernel.org/pub/software/devel/sparse/dist/
>>
> 
> Luc, I tested (last night) in the usual way on 64-&32-bit Linux
> and 64-bit cygwin, without issue. I had intended to test (tonight)
> also on fedora 30 and Ubuntu 19.04 (19.10 is still in beta), since
> my normal test targets are all built on a fairly old base. However,
> I didn't find time tonight, sorry ... :(

OK, I lied. I managed to do a quick test on fedora 30 tonight
after all! No issues found. :-D

(well, I guess it's actually morning now!)

ATB,
Ramsay Jones


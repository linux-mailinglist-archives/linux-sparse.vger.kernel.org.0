Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C16C1F8A63
	for <lists+linux-sparse@lfdr.de>; Sun, 14 Jun 2020 21:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgFNTfz (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 15:35:55 -0400
Received: from avasout06.plus.net ([212.159.14.18]:44385 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgFNTfy (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 15:35:54 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id kYQ4jIYoUkvt5kYQ5jX0ZE; Sun, 14 Jun 2020 20:35:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1592163353; bh=GUl7H/XJhKr/c8dF1FRGYM20S1bEWRdeOTnA6KS2WyY=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=naROOcw0IYLOIQPt/Al5gYowinvY2M/Cfkhj3U7Jw6XvVZOJfztu1mN3i27Y5VGOa
         bZvw3i2TJXuGp1caq/5uCCVuyhbPdLO9CwyFGm3MlcyUBLB8uYkYEzGHpGmxp0BF+B
         +8pQiAiJGuI1e7yzSOgCYf2doKs1ah56c0YjOThAAl1FxuSi31O42s7aN7fU9hUoOf
         KNpLm94sHMS/Tg3MQGocWeQjQgFY2SX0aXO2yuG0zib2sqmZyJZAgx8vhB5nrPVuCx
         E1bZQLdTVUHVHjAzolIMAsRSthGtjoG5bEGRgbG2x41vwzBWG6n1JUNV5209ZLLDrh
         1ovt6IpN5zSLA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ENCdL2RC c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=DVPYXS8LpvQyOh3eBv8A:9 a=QEXdDO2ut3YA:10
 a=umGxW14bZhoA:10 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: ramsayjones@:2500
Subject: Re: [ANNOUNCE] Sparse v0.6.2-rc1
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20200613020735.iqb2vd23jpomisbq@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <c80024d2-6d91-4fe7-a919-3edcf4a9b80a@ramsayjones.plus.com>
Date:   Sun, 14 Jun 2020 20:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200613020735.iqb2vd23jpomisbq@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMc5Ce7D5FH7ytW0QnIi0QNgHJRk8NIYyWcxHbQeCbMNaBrIyNa7IchmyPPs/zFWEFJJa4WpdSoJ/avYhFDICngsdzOBi9O2q5LiCNBsu8u/FvKSAMZm
 Zcl6yaW0vnjdFIyoUqWU/MqkCiAEUoEDVRYmXaNrd7a8inFgEuQINN56iUOg9sy+12xalS0RbrIvtQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 13/06/2020 03:07, Luc Van Oostenryck wrote:
> Sparse v0.6.2-rc1 is now out.

Tested in the usual places (Linux Mint 19.3, 64-bit and 32-bit and
64-bit cygwin) and in the usual way; no issues found!

Well, I say no issues - I did notice some spelling errors and
the formatting of the release notes does not look correct to
me (https://sparse.docs.kernel.org/en/latest/release-notes/v0.6.2.html).
Unfortunately, I don't know anything about the documentation tools
you are using, so I can't try to fix this. (It seems to be the only
attempt at nested 'bulleted lists', ...)

I will send a (spelling) patch soon.

ATB,
Ramsay Jones


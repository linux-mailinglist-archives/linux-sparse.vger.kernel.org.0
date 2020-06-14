Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDBD1F8B5D
	for <lists+linux-sparse@lfdr.de>; Mon, 15 Jun 2020 01:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgFNXm6 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 19:42:58 -0400
Received: from avasout02.plus.net ([212.159.14.17]:43943 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727928AbgFNXm6 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 19:42:58 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id kcH9jh4FAU8CkkcHAjxaUX; Mon, 15 Jun 2020 00:42:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1592178176; bh=U/HNFchS04Af0Fcotu7xMmlOeFXb9jKHYLqq+zjF5Co=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=RwDsQlpMdhbc3stbolYo4yvFRbaOUVRkQ0HELM8i4l7xiRx3e2rCrK/CY+Qot/Aa+
         z5kG5XaUndmd883BOcUSHE4yl1+aT3oZJkCj3D49Itmlh6rCLOdlrcD4RGZccbsPVC
         +J3dAes851SWoQbVlvD6AwIWIBZzxqCNmOsGHtZzzf0TCG8qAuttBWxUGXlHtjEY/w
         3wKl81gH6EA0+QaDtg+KGV3WGL4IHyq8FTPMlZh8YJvUxR9h7NHpdMEzLQ2/0Kkq5l
         wuZqd/4GSlnNSloZF3VCJtX79oGRpKI7Zjqi2tfUZa3VX0WhkDbjGVy8tg++W67CgS
         RUhrS4RfCC6BQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8 a=kloxa7Ee07kwsyMnsWYA:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] doc: correct some spelling
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
References: <a03299d8-fd2f-8f04-2bd0-e94091247bdb@ramsayjones.plus.com>
 <20200614220530.x4nr7zhlmxuk7zj7@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <c02ba9b6-2367-6963-b682-d19812cd9692@ramsayjones.plus.com>
Date:   Mon, 15 Jun 2020 00:42:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614220530.x4nr7zhlmxuk7zj7@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKIERh6HUz4guSJLyDHEaWZkFhGbaWNpyVFJ0fp8flZ0AT4WDMwZ3A/hs0olkhlDZJ8eNFZmr4u0p16BSnu4J/4+5pEhlEXxDH+maOIuWLz9N3M5lq5G
 kdrcvuYKjkiCnw3bLzGY5kJQblIsYLD/yN7rmmcaxgnQop4+Llx29WXMY+kK3CMeRHSwXxKMTCUENw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 14/06/2020 23:05, Luc Van Oostenryck wrote:
> On Sun, Jun 14, 2020 at 08:36:38PM +0100, Ramsay Jones wrote:
>> Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
>>
>> The only spelling fixes in the manpage are s/exemple/example/,
>> s/trigered/triggered/ and s/&/and/. I would not normally change
>> any 'formatting' in sparse.1, but the '{ 0 }' and '{ }' got
>> split across line-endings, so I removed the spaces.
>> (other solutions are possible ...)
> 
> Thank you again for noticing and fixing these typos.
> 
> Yes, the formatting is often very bad on the man page
> because of bad or missing linebreaks.
> I changed this part of your patch to use a non-breakable
> space for the '{ 0 }' and '{ }'. They look, I think, better.

Yeah, I tried a nbsp too (that was part of my 'other solutions'), and
compared the two outputs; there wasn't much difference in the output
so I went with the 'easier' patch. ;-)

This looks good. (I see you noticed a couple more ...)

ATB,
Ramsay Jones


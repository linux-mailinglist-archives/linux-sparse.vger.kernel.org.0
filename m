Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E174103BB6
	for <lists+linux-sparse@lfdr.de>; Wed, 20 Nov 2019 14:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfKTNhB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 Nov 2019 08:37:01 -0500
Received: from avasout01.plus.net ([84.93.230.227]:37804 "EHLO
        avasout01.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730864AbfKTNhA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 Nov 2019 08:37:00 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id XQAEiXWykSXPqXQAFiCJtb; Wed, 20 Nov 2019 13:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574257019; bh=4GutkkR7tfOlTK+6jsH609RbdEJHie4emF5O4q/gZos=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=pLsHTA/hzWDLZRDLdbtwXNNaklI98bNTFqpJn5VdGEGXQ81FzT3W9SEJYfT8uJvsT
         XW03BmL8KstKPviab0EAzeOmuaCRR5bglmILBIuY9Vo3IECWwYeFJ00IavuW5KKxOd
         dBgGyE8WyB3a6M0F2RrpvtasdZNner3uKCYeHOuDb3VRPE8alVPzmlaYvXQoUM2Ocx
         MxuM/5DI3UkzCAmDEkY/wE6JiNCGsgqbFubXzqbszNMSsPRkrYOtInyB1dn/iDWygx
         Eq0BPC8FuNfonkd5giRSiUjfW5xL6stJy1jvePNv2C15ESaOsyMMzIL7TExwTkXyIs
         LxJPMXgc0I/MQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=U/js8tju c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=6NHFKx9cINla41NyLg0A:9
 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 4/5] propagate function modifiers only to functions
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191120000224.30441-1-luc.vanoostenryck@gmail.com>
 <20191120000224.30441-5-luc.vanoostenryck@gmail.com>
 <b9aa0b5c-7e65-25ac-898a-a87c5fcaee98@ramsayjones.plus.com>
Message-ID: <f3185314-1232-1046-ed9d-6ccc4b497d14@ramsayjones.plus.com>
Date:   Wed, 20 Nov 2019 13:36:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b9aa0b5c-7e65-25ac-898a-a87c5fcaee98@ramsayjones.plus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBLBi6RcQjMzCK/Eboe9wX4AvkC2MxWoJMYm7DmYc0e4NZLGwLWEAUHXawCtFVnoScZDWO5E2Dg3qvOn6XAtJitxRysZErocUARYPWTYsM15IWyatrEX
 pQdX28p2/ZR1La+nG0ni50vJUgRpZyBFrOj+FfB8KBtNcH98qhJUR8czRes7nIDWLOW5c82kVMx8iQ==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 20/11/2019 02:13, Ramsay Jones wrote:
[snip]

> 
> Hmm, shouldn't these:
> 
>> +	{"const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
>> +	{"__const",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
>> +	{"__const__",	NS_KEYWORD,	MOD_PURE,	.op = &attr_fun_op },
> 
> ... be attr_mod_op? (I'm just reading this in my email client, so I
> haven't given it much thought, but it just seems wrong ...)

Of course, as soon as my head hit the pillow, I remembered that
gcc has a 'const function attribute', somewhat similar to 'pure'.
(I just looked it up, because I couldn't remember what the
difference was between 'const' and 'pure'!).

So, just ignore me! :-D

ATB,
Ramsay Jones


Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEF7910D053
	for <lists+linux-sparse@lfdr.de>; Fri, 29 Nov 2019 02:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbfK2BPQ (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 20:15:16 -0500
Received: from avasout06.plus.net ([212.159.14.18]:49532 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbfK2BPQ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 20:15:16 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id aUsLiZnCRsjQSaUsMiFDSv; Fri, 29 Nov 2019 01:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574990114; bh=E/HL/NpO/uG3l/ObD/IhEDsN9CTNLFOnOfI74p4l7xk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=G5t6Dq/S6xSPtdRf+1cAwPsUjAd/FZ8IHA1we1st+9sx4cDRkR6GXhCYZqBoI2z+Z
         n0fawUUIp1zwo+ilMRUmFZFXVKaMVsdRRPDXYHA/5oDJ4MhhY61qffSnllyu2Ie6/s
         ska+ynYOeaedcmXJqy/Wgo9VbQR5rggyVH/xJo3jK/2y7x1GrvwmP0/1KOBXQRupfx
         sEoDdxOpvz1w8W6PDY58qa3jIbkDQvzIfwhFiVtxempfOvp71UbqlK41XOUSFl5Uiu
         QDe/ylXxSnt69LX3fBnCj7RCPLtBLtBpkk9Bb9pmjrc6GIcBEDBKBnheO/P47/6Q+T
         Ow0bZBa74LyFw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=cZasUULM c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8
 a=dqb706xE0NWz4BpLEsoA:9 a=QEXdDO2ut3YA:10 a=yJM6EZoI5SlJf8ks9Ge_:22
X-AUTH: ramsayjones@:2500
Subject: Re: [RFC PATCH] cgcc: only define __CYGWIN32__ for -m32 builds
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
References: <b342ed82-2949-7a44-3cf7-23ae3d266cbf@ramsayjones.plus.com>
 <20191128200642.wbrb2rukozyac5go@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <b4b8bd95-ef23-d296-9d16-16fa2683926f@ramsayjones.plus.com>
Date:   Fri, 29 Nov 2019 01:15:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191128200642.wbrb2rukozyac5go@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJAgC/f07aG4tqs+gb2xmzLwHnCqwrSbFatyHvKVZAyW/jhqALIHQroYC1KdkGmjB+fOWECoYSw+Tk/6eMregxNZU2OlOY9HktHleUwp+Uj6I2t1y62P
 lTgamqfPsEEjEmEE7g5L7wU0ClDA1+AAdIE+y68SUnmbXE6q8lhFx7t2G2P4cY3bAYblZR3sG/t2GA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 28/11/2019 20:06, Luc Van Oostenryck wrote:
> On Thu, Nov 28, 2019 at 05:45:06PM +0000, Ramsay Jones wrote:
>>
>> Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
>> ---
>>
>> Hi Luc,
> 
> Hi,
> 
>> This is marked RFC because it only improves the situation on 64-bit cygwin.
>> Without access to a (up-to-date) 32-bit cygwin, I can't experiment to find
>> a means to determine what platform I am on. I don't recall what the output
>> of 'uname' is on 32-bit cygwin, but I have a hunch that you can't tell which
>> is which from it's output. On 64-bit cygwin:
>>
>>   $ uname -a
>>   CYGWIN_NT-10.0 satellite 3.0.7(0.338/5/3) 2019-04-30 18:08 x86_64 Cygwin
>>   $ uname -s
>>   CYGWIN_NT-10.0
>>   $ uname -o
>>   Cygwin
>>   $ 
>>
>> [ie. I don't think 'uname -o' returns Cygwin32 or similar. :( ]
> 
> Indeed, I'm guess it doesn't. 
> 
>> So, I don't know.
> 
> I see several possibilities:
> 1)  just this patch, wich is OK for 64-bit platform/compiler
>     where 32-bit needs to be forced with -m32
> 2)  simply not define __CYGWIN32__ at all based on the
>     conviction that it's only __CYGWIN__ that should be tested
> 3a) in cgcc add 'm32=1' in the i386 part if $m64 is not set
> 3b) in cgcc add 'm64=1' in the x86_64 part if $m32 is not set
>     and change this patch to test $m64 instead of testing $m32
> 4a) in sparse itself, add something like:
> 	if (arch_mach == MACH_X86_64 && arch_os == OS_CYGWIN)
> 		add_pre_buffer("#undef __CYGWIN32__");
>     or:
> 	if (arch_m64 != LP32 && arch_os == OS_CYGWIN)
> 		add_pre_buffer("#undef __CYGWIN32__");
> 4b) do not define __CYGWIN32__ in cgcc and add something like:
> 	if (arch_mach == MACH_i386 && arch_os == OS_CYGWIN)
> 		add_pre_buffer("#define __CYG_WIN32__ 1");
>     or:
> 	if (arch_m64 == LP32 && arch_os == OS_CYGWIN)
> 		add_pre_buffer("#define __CYGWIN32__ 1");
> 
> For the long term, I would prefer something like 4a) or 4b)
> but currently it would only work for native builds.
> 
> So, I think that 3a) should be the best.

I nearly sent this patch instead:

$ git diff
diff --git a/cgcc b/cgcc
index 2223c97d..ddc6de23 100755
--- a/cgcc
+++ b/cgcc
@@ -252,10 +252,16 @@ sub add_specs {
     } elsif ($spec eq 'unix') {
        return ' -Dunix=1 -D__unix=1 -D__unix__=1';
     } elsif ( $spec =~ /^cygwin/) {
+       my $c32 = 0;
+       my $m = `uname -m`;
+
+       chomp $m;
+       $c32 = 1 if ($m =~ /^(i.?86|athlon)$/i);
+
        return &add_specs ('unix') .
            ' -fshort-wchar' .
            ' -D__CYGWIN__=1' .
-           ($m32 ? ' -D__CYGWIN32__=1' : '') .
+           (($m32 || ($c32 && !$m64)) ? ' -D__CYGWIN32__=1' : '') .
            " -D'_cdecl=__attribute__((__cdecl__))'" .
            " -D'__cdecl=__attribute__((__cdecl__))'" .
            " -D'_stdcall=__attribute__((__stdcall__))'" .
$ 

I was going to use 'uname -p', but the man page on Linux says that
this is 'not portable'.

However, other than 'hand testing', I could not be sure it would
work on an actual 32-bit cygwin system. (hand testing seems to
imply that it should work, but well ... :-D ).

ATB,
Ramsay Jones



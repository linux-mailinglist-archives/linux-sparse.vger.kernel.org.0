Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EED91E6BC9
	for <lists+linux-sparse@lfdr.de>; Thu, 28 May 2020 21:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406775AbgE1T5x (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 May 2020 15:57:53 -0400
Received: from avasout07.plus.net ([84.93.230.235]:48561 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406687AbgE1T5v (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 May 2020 15:57:51 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id eOerj2ALp0wwMeOesj5u26; Thu, 28 May 2020 20:57:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1590695869; bh=3fdUYYUrUQ2NKURdENWrruEZgJ688hhCCS+0bikNpLc=;
        h=Subject:To:References:Cc:From:Date:In-Reply-To;
        b=kkANcx1yf2o5HLkUdfrSBZitkYjovN91yIWUgrIg1l+J+ss/ZKQoLHkWwyu0h+yyo
         xrsBgMNnYgKqYDCWfufrKtA4V30oGiu9OmXJK79lqs7ZPcs6RHWVGF1nnbavch5Fwq
         0kRhHRt3v5TgYg0msuCGfvZSW8xFj3lvCaM3ZzeHYRXgfWJoVZu2g89ZNVO3SHvwAg
         71XK04w03jdLeeNO8L+tsCeeVUS+KOtX6bSZMFNHk4B2nuHwzxqOwV/ql0BoukDhOI
         LwCRQxzabP3Dx2Rm726OKEE7AEhdjJkPlsO1bFViAKBzPVbGfOb8Fr+hxPOSNP0ame
         RtLt6Ba3QQ+kg==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=b/4pHuOx c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=uChsZFC9AAAA:8 a=mDV3o1hIAAAA:8
 a=02qkFDxbdNTpHubz2ngA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=ULtXvzFHYWHLyBAuiDia:22 a=_FVE-zBwftR9WsbkzFJk:22
X-AUTH: ramsayjones@:2500
Subject: Re: [Bug 207959] New: Don't warn about the universal zero initializer
 for a structure with the 'designated_init' attribute.
To:     linux-sparse@vger.kernel.org
References: <bug-207959-200559@https.bugzilla.kernel.org/>
Cc:     AsDaGo@posteo.net
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <90ad9ce9-fcbc-7018-3c1f-243602e49dd7@ramsayjones.plus.com>
Date:   Thu, 28 May 2020 20:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bug-207959-200559@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfEpZ/Jh+IgNwk4tJ6ZcN6xYsmf2hFsl2Seaa1Z2OfuuG6kj7DoqoweO/XzYo53KyuBNhE13mmQis39xq3XlDIDrwji0JupYbRttU5KmslG5wHxn3OkNS
 4uk7se/Mtw94GoAzrh79qebDQc34xF3RjGcDqwUs+phu5pwKwzQiyx+9O9AsLa+dLnpXjJ0ytq+hqA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 28/05/2020 17:27, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=207959
> 
>             Bug ID: 207959
>            Summary: Don't warn about the universal zero initializer for a
>                     structure with the 'designated_init' attribute.
>            Product: Tools
>            Version: unspecified
>     Kernel Version: Sparse 0.6.1 (Debian: 0.6.1-2+b1)
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: enhancement
>           Priority: P1
>          Component: Sparse
>           Assignee: tools_sparse@kernel-bugs.kernel.org
>           Reporter: AsDaGo@posteo.net
>         Regression: No
> 
> Created attachment 289383
>   --> https://bugzilla.kernel.org/attachment.cgi?id=289383&action=edit
> A test program illustrating the issue
> 
> I reported this bug to GCC here:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=95379
> 
> They don't want to diverge GCC's behavior from Sparse's, but I think this would
> be a useful feature, and I think it should be implemented in Sparse as well.
> Below is my bug report to GCC.
> 
>> When the 'designated_init' attribute is used on a structure type, GCC warns
>> when an instance of that structure is initialized with '{ 0 }'. I think GCC
>> should make an exception for this, since '{ 0 }' is often used to initialize
>> all fields of a structure to 0, and it does not depend on the internal
>> structure of the structure type.
>>
>> If '{ }' is used to initialize the structure, GCC does not warn. However,
>> although '{ }' seems to initialize the structure to zero in GCC, I'm not
>> sure if it's as portable as '{ 0 }' (and it's less readable, IMO). I think
>> '{ }' is part of the C++ standard; does anyone know if it's part of C too?

No this is not standard C:

  $ cat -n junk1.c
       1	#include <stdio.h>
       2	
       3	int main (int argc, char *argv[])
       4	{
       5		struct { char *f; int i; } fred = {};
       6		printf("fred.f %p, fred.i %d\n", fred.f, fred.i);
       7		return 0;	
       8	}
  $ gcc -pedantic -o junk1 junk1.c
  junk1.c: In function ‘main’:
  junk1.c:5:36: warning: ISO C forbids empty initializer braces [-Wpedantic]
    struct { char *f; int i; } fred = {};
                                      ^
  $ ./junk1
  fred.f (nil), fred.i 0
  $ 

... and you get similar results with clang:

  $ clang -pedantic -o junk1 junk1.c
  junk1.c:5:36: warning: use of GNU empty initializer extension
        [-Wgnu-empty-initializer]
          struct { char *f; int i; } fred = {};
                                            ^
  junk1.c:6:35: warning: format specifies type 'void *' but the argument has type
        'char *' [-Wformat-pedantic]
          printf("fred.f %p, fred.i %d\n", fred.f, fred.i);
                         ~~                ^~~~~~
                         %s
  2 warnings generated.
  $ 
  

ATB,
Ramsay Jones


  

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1A01DB893
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 17:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbgETPm2 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 20 May 2020 11:42:28 -0400
Received: from avasout07.plus.net ([84.93.230.235]:34523 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgETPm2 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 20 May 2020 11:42:28 -0400
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Wed, 20 May 2020 11:42:27 EDT
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bQkAjshGh0wwMbQkBj20Cp; Wed, 20 May 2020 16:34:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1589988896; bh=ozCrtgQAtWU4HPkS5sh+KznCmofBf7/HAS3/8Plzf1Y=;
        h=Subject:From:To:References:Date:In-Reply-To;
        b=oHAw9nQ4Iy6cqgvelG4t4Df+xncskhVjlke1kjf1biljn0RvMMKfpQvKc0P1I/efW
         3GZsSTP5V/rO3wHWaTSK3eFXFcIy7xqs2imeCW2yzzoeKDKX8s+VnSeVeJuh15136n
         BbYmPK/NMY+9gdeh6KGghRoeiDlXNgH9nQaDgFaUW+fbJw0XS1qx+mFNWT3iTnLKn0
         OIk2Kd1ZkgUnPVlkyq3rTExEQMonXciU5JkEEdAQ3ohwsegvfkl0WOt9xnev1xGt3b
         PdM2ORuYzUa8gMnxsAgUNEJHCFUHIQVRJpmLwoisSqBn3G1E3zUDO96UorjMn9IG7o
         vNxTE3HAyztnA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=b/4pHuOx c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=__Hyq5l-Wme8eTUUGhkA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v1 01/28] misc: fix testcase typeof-safe
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-2-luc.vanoostenryck@gmail.com>
 <422723ea-00aa-ee89-72aa-f4dddbd8da06@ramsayjones.plus.com>
Message-ID: <2de08a4e-ce53-8694-da00-c2c90334da65@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 16:34:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <422723ea-00aa-ee89-72aa-f4dddbd8da06@ramsayjones.plus.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfNUWEug+G/un09oO/oapG8DygCwLzqceWFXhIoP+gncjOhzn/DStQCi3ebc6zyiSwyBD+tKe+A75kE6XC+3Mq1rafqgjW/0+xJ8Q/T3bE18oK/aJRv4f
 +1vw0O4clxcwJ0Al+d5usslxXaT0VkhPOrLJoze6GnF67zCMjw51WyF83/mYpq87YFZIJWWgXCzXFA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 20/05/2020 01:33, Ramsay Jones wrote:
> On 19/05/2020 01:57, Luc Van Oostenryck wrote:
>> This testcase was marked as known-to-fail but it was
>> simply the expected error messages that were missing.
>>
>> So, slightly reorganize the test a little bit, add the
>> expected messages and remove the 'known-to-fail' tag.
>>
>> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
>> ---
>>  validation/typeof-safe.c | 26 ++++++++++++++++++++------
>>  1 file changed, 20 insertions(+), 6 deletions(-)
>>
>> diff --git a/validation/typeof-safe.c b/validation/typeof-safe.c
>> index 614863fba381..508bd39204c5 100644
>> --- a/validation/typeof-safe.c
>> +++ b/validation/typeof-safe.c
>> @@ -2,16 +2,24 @@
>>  
>>  static void test_safe(void)
>>  {
>> -	int __safe obj, *ptr;
>> -	typeof(obj) var = obj;
>> -	typeof(ptr) ptr2 = ptr;
>> +	int obj;
>> +	int __safe *ptr;
>> +
>> +	int __safe *ptr2 = ptr;
>> +	typeof(ptr) ptr3 = ptr;
>>  	typeof(*ptr) var2 = obj;
>> -	typeof(*ptr) *ptr3 = ptr;
>> -	typeof(obj) *ptr4 = ptr;
>> +	int __safe  var3 = obj;
>> +	int *ptr4 = &obj;
>> +	int *ptr4 = ptr;		// KO
> 
> ptr4 declared twice - and sparse didn't complain?

Heh, I had a slightly different example in the test case
for my '{0}' initializer patch (but involving different
types as well).

I had a quick look at this and tried to use 'git-bisect' to
isolate the change which broke this. However, I couldn't find
a version of sparse that worked correctly! :D (I went all the
way back to v0.4.2 before giving up - several tagged releases
didn't even compile without some fix-ups, including v0.4.2).

Just FYI, this was my test-case:

  $ cat -n test-dup-decl.c
       1	#ifdef WORKS_OK
       2	static int sobj;
       3	static int *sptr4 = &sobj;
       4	static int *sptr4 = 0;
       5	#endif
       6	
       7	static void func(void)
       8	{
       9		int obj, *ptr;
      10		int *ptr4 = &obj;
      11		int *ptr4 = ptr;
      12		int a;
      13		float a;
      14	}
  $ 

  $ gcc -c test-dup-decl.c
  test-dup-decl.c: In function ‘func’:
  test-dup-decl.c:11:7: error: redefinition of ‘ptr4’
    int *ptr4 = ptr;
         ^~~~
  test-dup-decl.c:10:7: note: previous definition of ‘ptr4’ was here
    int *ptr4 = &obj;
         ^~~~
  test-dup-decl.c:13:8: error: conflicting types for ‘a’
    float a;
          ^
  test-dup-decl.c:12:6: note: previous declaration of ‘a’ was here
    int a;
        ^
  $ 

  $ ./sparse test-dup-decl.c
  $ 

ATB,
Ramsay Jones



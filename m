Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81139E0217
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 12:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731793AbfJVKba (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 06:31:30 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:51376 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731761AbfJVKba (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 06:31:30 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iMrRo-0007V5-AB; Tue, 22 Oct 2019 11:31:28 +0100
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
 <20191020165512.glldp4pyxbjnk5ne@desk.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <cb7ba4b7-751d-d4e1-ae9f-08837796247f@codethink.co.uk>
Date:   Tue, 22 Oct 2019 11:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020165512.glldp4pyxbjnk5ne@desk.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 20/10/2019 17:55, Luc Van Oostenryck wrote:
> On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
>> +		if (*ptr == 'x' || *ptr == 'X' || *ptr == 'u' || *ptr == 'o') {
>> +			ptr++;
>> +			type->test = printf_fmt_numtype;
>> +			switch (szmod) {
>> +			case -1:
>> +				type->data = &ushort_ctype;
>> +				break;
>> +			case 0:
>> +				type->data = &uint_ctype;
>> +				break;
>> +			case 1:
>> +				type->data = &ulong_ctype;
>> +				break;
>> +			case 2:
>> +				type->data = &ullong_ctype;
>> +				break;
>> +			default:
>> +				type->test = NULL;
>> +			}
>> +		} else if (*ptr == 'i' || *ptr == 'd') {
>> +			ptr++;
>> +			type->test = printf_fmt_numtype;
>> +			switch (szmod) {
>> +			case -1:
>> +				type->data = &short_ctype;
>> +				break;
>> +			case 0:
>> +				type->data = &int_ctype;
>> +				break;
>> +			case 1:
>> +				type->data = &long_ctype;
>> +				break;
>> +			case 2:
>> +				type->data = &llong_ctype;
>> +				break;
>> +			default:
>> +				type->test = NULL;
>> +			}
> 
> When testing this on the kernel, I've a bunch of
> 	warning: incorrect type in argument . (different types)
> 	   expected unsigned int
> 	   got int
> This will quickly be quite annoying.
> 
> I've also a bunch of:
> 	warning: incorrect type in argument . (different types)
> 	   expected int
> 	   got int
> but I can't investigate more for now.

I might spend some time fixing those up... there's plenty of warning
fixes to go through.

I've not yet run my test on a current kernel, but printf type seems
to be one place where people have been a bit sloppy.

Thanks!


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

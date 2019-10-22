Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E7C9E0253
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 12:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730141AbfJVKw0 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 06:52:26 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:52090 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729666AbfJVKwZ (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 06:52:25 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iMrm4-00080W-26; Tue, 22 Oct 2019 11:52:24 +0100
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
 <20191020200753.h7d3ixqdc6nxjpqs@desk.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <86748824-6d14-42b9-35b6-de036c29534b@codethink.co.uk>
Date:   Tue, 22 Oct 2019 11:52:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020200753.h7d3ixqdc6nxjpqs@desk.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 20/10/2019 21:07, Luc Van Oostenryck wrote:
> On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
>> +static struct format_type *parse_printf_get_fmt(struct format_type *type, const char *msg, const char **msgout)
>> +{
> 
> ...
> 
>> +	} else if (*ptr == 'p') {
>> +		ptr++;
>> +		type->test = printf_fmt_print_pointer;
>> +		//todo - check if there's anything after these?
>> +		if (*ptr == 'x' || *ptr == 'X') {
>> +			ptr++;
>> +		} else if (isalpha(*ptr)) {
>> +			// probably sxomething that /is/ being de-referenced
>> +			ptr++;
>> +			type->test = printf_fmt_pointer;
>> +		}
> 
> This needs an explanation for the isalpha() and why x/X is special cased.

ok, added
		/* check for pointer being printed as hex explicitly */

and
		/* probably some extra specifiers after %p */


>> +	} else if (*ptr == 'z') {
>> +		ptr++;
>> +		if (*ptr == 'd') {
>> +			ptr++;
>> +			type->test = printf_fmt_numtype;
>> +			type->data = &long_ctype;
>> +		} else if (*ptr == 'u' || *ptr == 'x') {
>> +			ptr++;
>> +			type->test = printf_fmt_numtype;
>> +			type->data = &ulong_ctype;
> 
> These should use size_t_ctype & ssize_t_type.
> They also work with 'i', 'o' & 'X'.

ok, thanks

>> +		} else if (is_float_spec(*ptr)) {
>> +			type->test = printf_fmt_numtype;
>> +			type->data = &double_ctype;
> 
> if (szmod == 1) type->data = &ldouble_ctype;

ok, changed.

szmod == 1 ? &ldouble_ctype :  &double_ctype;
-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

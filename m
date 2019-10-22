Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 793ADE020A
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 12:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388150AbfJVK0m (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 06:26:42 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:51240 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388077AbfJVK0m (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 06:26:42 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iMrNA-0007Of-Dg; Tue, 22 Oct 2019 11:26:40 +0100
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
 <20191020164046.klhcn7uz2sr6syhy@desk.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <5d61dc83-656a-af15-acce-0a108c2d932a@codethink.co.uk>
Date:   Tue, 22 Oct 2019 11:26:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020164046.klhcn7uz2sr6syhy@desk.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 20/10/2019 17:40, Luc Van Oostenryck wrote:
> On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
>> +static int printf_fmt_string(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
>> +{
>> +	*target = &string_ctype;
> 
> This should be const_string_ctype and a test should be added for "%s"
> with a non-const char pointer/array.

ok.

>> +static int printf_fmt_pointer(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
>> +{
>> +	*target = &ptr_ctype;
> 
> Same here with const_ptr_ctype (but I've not tested it).

ok


>> +static int printf_fmt_print_pointer(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
>> +{
>> +	int ret;
>> +	*target = &ptr_ctype;
> 
>
ok



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

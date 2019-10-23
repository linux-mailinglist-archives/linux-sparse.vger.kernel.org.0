Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C54BE1FA3
	for <lists+linux-sparse@lfdr.de>; Wed, 23 Oct 2019 17:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406861AbfJWPlM (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 23 Oct 2019 11:41:12 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:35568 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406593AbfJWPlM (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 23 Oct 2019 11:41:12 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iNIl4-00035Q-My; Wed, 23 Oct 2019 16:41:10 +0100
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
 <20191020220129.pr4edy5t64rizqyw@ltop.local>
 <20191021114737.pnpgdx3taiwn2ovy@ltop.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <ba739518-0ed6-6a08-c334-87a512bf6b75@codethink.co.uk>
Date:   Wed, 23 Oct 2019 16:41:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021114737.pnpgdx3taiwn2ovy@ltop.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 21/10/2019 12:47, Luc Van Oostenryck wrote:
> On Mon, Oct 21, 2019 at 12:01:30AM +0200, Luc Van Oostenryck wrote:
>> On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
>>> +static void evaluate_format_printf(const char *fmt_string, struct symbol *fn, struct expression_list *head)
>>> +{
>>> +	struct format_state state = { };
>>> +	struct expression *expr;
>>> +
>>> +	expr = get_expression_n(head, fn->ctype.printf_msg-1);
>>> +	if (!expr)
>>> +		return;
>>> +
>>> +	state.expr = expr;
>>> +	state.va_start = fn->ctype.printf_va_start;
>>> +	state.arg_index = fn->ctype.printf_va_start;
>>> +
>>> +	if (!fmt_string) {
>>> +		warning(expr->pos, "not a format string?");
>>> +	} else {
>>> +		const char *string = fmt_string;
>>> +		int fail = 0;
>>> +
>>> +		for (; string[0] != '\0'; string++) {
>>> +			if (string[0] != '%')
>>> +				continue;
>>> +			if (parse_format_printf(&string, &state, head) < 0)
>>> +				fail++;
>>> +			string--;
>>
>> This last statement is wrong, it just needs to be removed.
> 
> It's more subtle than that: the string++ should only be done
> when stripping the chars before the '%'.
> Thus the loop should be something like:
> 		while (string[0]) {
> 			if (string[0] != '%') {
> 				// strip everything before '%'
> 				string++;
> 				continue;
> 			}
> 			if (parse_format_printf(&string, &state, head) < 0)
> 				fail++;
> 		}

ok, will make this change and test.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

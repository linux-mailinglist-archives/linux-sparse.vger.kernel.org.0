Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8333CE0239
	for <lists+linux-sparse@lfdr.de>; Tue, 22 Oct 2019 12:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729666AbfJVKij (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 22 Oct 2019 06:38:39 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:51736 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727101AbfJVKij (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 22 Oct 2019 06:38:39 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iMrYj-0007iJ-97; Tue, 22 Oct 2019 11:38:37 +0100
Subject: Re: [PATCH 3/5] evaluate: check variadic argument types against
 formatting info
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-4-ben.dooks@codethink.co.uk>
 <20191020191246.p65zl3dr557vkt3y@desk.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <f6afcd67-b8bc-c874-c095-1389793c290d@codethink.co.uk>
Date:   Tue, 22 Oct 2019 11:38:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020191246.p65zl3dr557vkt3y@desk.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 20/10/2019 20:12, Luc Van Oostenryck wrote:
> On Wed, Sep 25, 2019 at 11:00:13AM +0100, Ben Dooks wrote:
>> +static int printf_fmt_numtype(struct format_type *fmt, struct expression **expr, struct symbol *ctype, struct symbol **target, const char **typediff)
>> +{
>> +	struct symbol *type = fmt->data;
>> +	*target = type;
>> +	return ctype == type;
> 
> Comparing these pointer will never be the correct way to compare the
> types. You have to use something like check_assignment_types().
> Currently, a simple test like:
> 	void print(const char *, ...) __attribute__((format(printf, 1, 2)));
> 	static void foo(unsigned int u)
> 	{
> 		print("%x\n", u);
> 	}
> 
> gives a warning like:
> 	warning: incorrect type in argument 2 (different types)
> 	   expected unsigned int
> 	   got unsigned int u
> 
> -- Luc

ok, thanks for pointing this out.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

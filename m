Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A8AE2097
	for <lists+linux-sparse@lfdr.de>; Wed, 23 Oct 2019 18:28:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404960AbfJWQ2X (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 23 Oct 2019 12:28:23 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:36937 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733066AbfJWQ2X (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 23 Oct 2019 12:28:23 -0400
Received: from [167.98.27.226] (helo=[10.35.5.173])
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iNJUj-0004Ic-62; Wed, 23 Oct 2019 17:28:21 +0100
Subject: Re: [PATCH 2/5] parse: initial parsing of __attribute__((format))
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     linux-sparse@vger.kernel.org
References: <20190925100015.31510-1-ben.dooks@codethink.co.uk>
 <20190925100015.31510-3-ben.dooks@codethink.co.uk>
 <20191020145714.uai45bjrrkih2ars@desk.local>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <9b512ff3-1605-ebb0-1c95-1ccc04aeac9b@codethink.co.uk>
Date:   Wed, 23 Oct 2019 17:28:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191020145714.uai45bjrrkih2ars@desk.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On 20/10/2019 15:57, Luc Van Oostenryck wrote:
> On Wed, Sep 25, 2019 at 11:00:12AM +0100, Ben Dooks wrote:
>> diff --git a/parse.c b/parse.c
>> index f291e24..583a82c 100644
>> --- a/parse.c
>> +++ b/parse.c
>> @@ -87,7 +87,7 @@ static attr_t
>>   	attribute_address_space, attribute_context,
>>   	attribute_designated_init,
>>   	attribute_transparent_union, ignore_attribute,
>> -	attribute_mode, attribute_force;
>> +	attribute_mode, attribute_force, attribute_format;
> 
> I prefer that you simply insert for the attribute without touvhing the
> others one:
> 	+ invalid_printf_format_args,
> 
>>   typedef struct symbol *to_mode_t(struct symbol *);
>>   
>> @@ -136,6 +136,11 @@ static void asm_modifier_inline(struct token *token, unsigned long *mods)
>>   	asm_modifier(token, mods, MOD_INLINE);
>>   }
>>   
>> +/* the types of printf style formatting from __attribute__((format)) */
>> +enum {
>> +	FmtPrintf = 0, FmtScanf,
>> +};
> 
> Please change this to:
> 	FORMAT_PRINTF,
> 	FORMAT_SCANF,
> 
>> @@ -1172,6 +1195,59 @@ static struct token *attribute_address_space(struct token *token, struct symbol
>>   	return token;
>>   }
>>   
>> +static int invalid_printf_format_args(long long start, long long at)
>> +{
>> +	return start < 0 || at < 0 || (start == at && start > 0) ||
>> +		(start == 0 && at == 0);
>> +}
> 
> The name suggest it is only used for printf format but the code below
> uses it for all formats, please rename it.
> I would prefer to have the reverse logics, check if the format is valid
> and to have a simpler check, something like:
> 	static bool validate_attribute_format(...)
> 	{
> 		return (start > 1) && ((at > start) || at == 0);
> 	}
> but since more validations are done after, I think it's best to simply
> not use this helper and directly doing the checks and emitting the
> approriate warning messages when needed ("index smaller than 1", ...).
> 
>> +static struct token *attribute_format(struct token *token, struct symbol *attr, struct decl_state *ctx)
>> +{
> ...
> 
>> +			ctx->ctype.printf_va_start = start;
>> +			ctx->ctype.printf_msg = at;
> 
> GCC's manpage call them 'string-index' & 'first-to-check'. Best to keep things
> coherent and use the same names everywhere, for example 'index' & first' ?

ok.

>> diff --git a/symbol.h b/symbol.h
>> index ac43b31..7bb6f29 100644
>> --- a/symbol.h
>> +++ b/symbol.h
>> @@ -103,6 +104,7 @@ struct ctype {
>>   	struct context_list *contexts;
>>   	struct ident *as;
>>   	struct symbol *base_type;
>> +	unsigned short printf_va_start, printf_msg;
> 
> What about something like:
> +	struct {
> +		unsigned short index;
> +		unsigned short first;
> +	} format;

ok, done.

> Also the validation should check that these are not bigger than
> USHORT_MAX.

ok, will do.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

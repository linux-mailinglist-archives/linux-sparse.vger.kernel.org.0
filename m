Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D95E1075B1
	for <lists+linux-sparse@lfdr.de>; Fri, 22 Nov 2019 17:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbfKVQXb (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 22 Nov 2019 11:23:31 -0500
Received: from avasout03.plus.net ([84.93.230.244]:55479 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKVQXb (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 22 Nov 2019 11:23:31 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id YBiSiEFvIKleZYBiTijgOe; Fri, 22 Nov 2019 16:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574439809; bh=dgCqMTEwL8bHPIjzC1wffhXhmCAG7kjj3oK8eJUwMPQ=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=o7qf+7KUDqppj0nChspvrVG3lJwkVsK/AsdU8LKOxvqfJd1i//5PvBA0fWcG55vta
         IgJscHa0LOHTGPRw+uM1L1eK6eqjLA9cRG5Z3G5Mxl4gf/bgbIrXgOmn9J+F637IUW
         RgD9ouwv8F1n1iU84g2TLbtu9vifuLBNfnJZ3AoDKFN9+7+KSB4rfV0in6ykk27PHt
         N/BKhD4CGojW4GKYHSsuuu9p4zHUNPRvbYZXQGRvG1zOHBCq6yizbLHQxT9ACxUAIx
         85JJ4CcA8AmUnZ1qDFOHvbd/j9Yb9ZcaVj+8pEXrlI75E4D5yWZD3TQkeX5axFqNxz
         XqdZP/vmWqeMA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=S0M5J17CAAAA:20 a=19lUgbSR5oNPKvXSGdQA:9 a=QEXdDO2ut3YA:10
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v2] let function definition inherit prototype attributes
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191121131128.7563-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <8f474daa-4c17-3012-6cee-d68807d48a6b@ramsayjones.plus.com>
Date:   Fri, 22 Nov 2019 16:23:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121131128.7563-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfG0mmSC5xFyLYejgmg78HQMxS7E6Ds22lCttSAjhF6jsaREau6mlQMVyKKlr1XRJ1apq6z+ZMf8bOscQkKfD2XdcvnzJyDLMRHpclVpHLw6ceUshaOPo
 3GW6q5e+mdysPohLiuawrmQMQxgKKcabmMrR3VA35dzhK2Ok5TA4jEgs/HZ3mm+fJpnSe93L/E85HA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 21/11/2019 13:11, Luc Van Oostenryck wrote:
> It's common to declare a function with the attribute
> 'pure' or 'noreturn' and to omit the attribute in the
> function definition. It mak somehow sense since the
> information conveyed by these attributes are destined
> to the function users not the function itself.
> 
> So, when checking declaration/definition, let the
> current symbol inherit any function attributes present
> in previous declarations.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
> 
> The patch is also available for review & testing at:
> 	git://github.com/lucvoo/sparse-dev.git fun-attr-inherit
> 
> Changes since v1:
> * the old name was 'allow omitted function attribute in definition'
> * change the approach: instead of filtering out these attributes at
>   check-time, let's inherit them at declaration-time.

Yep, I noticed that you didn't push the last patch #5. I had also
thought that this would be a better approach, or rather that the
test should be that the 'attributes list' given on the function
definition should be a subset of the list given on the declaration.
(so that the 'extra' attributes would be inherited by the function).

This would imply, of course, that sparse should issue a warning/error
when the attribute list on the definition contained some attributes
that were not present in the declaration. Well, it seems reasonable
anyway! ;-)

It seems gcc has other ideas:

  $ cat -n junk.c
     1	
     2	extern void exit (int __status) __attribute__ ((__noreturn__));
     3	
     4	void func0(int a) __attribute__ ((pure));
     5	
     6	__attribute__ ((pure)) __attribute__ ((__noreturn__))
     7	void func0(int a)
     8	{
     9		exit(0);
    10	}
  $ 

So, sparse (with this patch applied) gets it:

  $ ./sparse junk.c
  junk.c:7:6: error: symbol 'func0' redeclared with different type (originally declared at junk.c:4) - different modifiers
  $

But gcc, not so much:

  $ gcc -c junk.c
  $ gcc -Wall -c junk.c
  $ gcc -Wall -Wextra -c junk.c
  junk.c: In function ‘func0’:
  junk.c:7:16: warning: unused parameter ‘a’ [-Wunused-parameter]
   void func0(int a)
                  ^
  $ 

So, I don't know ...

ATB,
Ramsay Jones

> 
> 
>  symbol.c                                                 | 9 +++++++++
>  ...ion-attribute-omitted.c => function-redecl-funattr.c} | 3 +--
>  validation/function-redecl2.c                            | 3 ---
>  3 files changed, 10 insertions(+), 5 deletions(-)
>  rename validation/{function-attribute-omitted.c => function-redecl-funattr.c} (75%)
> 
> diff --git a/symbol.c b/symbol.c
> index 90149e5ae..bafa7c432 100644
> --- a/symbol.c
> +++ b/symbol.c
> @@ -588,6 +588,14 @@ struct symbol *befoul(struct symbol *type)
>  	return NULL;
>  }
>  
> +static void inherit_declaration(struct symbol *sym, struct symbol *prev)
> +{
> +	unsigned long mods = prev->ctype.modifiers;
> +
> +	// inherit function attributes
> +	sym->ctype.modifiers |= mods & MOD_FUN_ATTR;
> +}
> +
>  void check_declaration(struct symbol *sym)
>  {
>  	int warned = 0;
> @@ -598,6 +606,7 @@ void check_declaration(struct symbol *sym)
>  			continue;
>  		if (sym->scope == next->scope) {
>  			sym->same_symbol = next;
> +			inherit_declaration(sym, next);
>  			return;
>  		}
>  		/* Extern in block level matches a TOPLEVEL non-static symbol */
> diff --git a/validation/function-attribute-omitted.c b/validation/function-redecl-funattr.c
> similarity index 75%
> rename from validation/function-attribute-omitted.c
> rename to validation/function-redecl-funattr.c
> index 43b301d8f..b1e2fb195 100644
> --- a/validation/function-attribute-omitted.c
> +++ b/validation/function-redecl-funattr.c
> @@ -9,6 +9,5 @@ void __noreturn	n(void);
>  void		n(void) { while (1) ; }
>  
>  /*
> - * check-name: function-attribute-omitted
> - * check-known-to-fail
> + * check-name: function-redecl-funattr
>   */
> diff --git a/validation/function-redecl2.c b/validation/function-redecl2.c
> index 3435aa00c..ef396137a 100644
> --- a/validation/function-redecl2.c
> +++ b/validation/function-redecl2.c
> @@ -25,7 +25,4 @@ void func2(int a)
>  
>  /*
>   * check-name: function-redecl2
> - *
> - * check-known-to-fail
> - *
>   */
> 

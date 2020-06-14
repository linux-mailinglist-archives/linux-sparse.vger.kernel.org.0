Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB141F8A62
	for <lists+linux-sparse@lfdr.de>; Sun, 14 Jun 2020 21:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgFNTfP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 15:35:15 -0400
Received: from avasout06.plus.net ([212.159.14.18]:44385 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgFNTfP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 15:35:15 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id kYPPjIYmgkvt5kYPQjX0Yd; Sun, 14 Jun 2020 20:35:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1592163313; bh=bnHHAsj7IjueCjf2e2iMTi3ldI3QqC9VngSReKOk044=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=HZP/M4en16SRUum0Kqkt8vaSUm+MzrzmgdnYOdW1EIzUNJDzq+ebbDJfWwWhS2kqW
         3We3AtCZR5z+oV+Tg4T7qxdWku4HmiYW3w08q5O07qOBT463o0MRLr65OZFfzlQWK6
         +/8Vv5/3Ab5858DxWFmepFvVBQDd0TSz9UBQsBPqHjlFeTGRfr6xoV4Gam8/b2Psc6
         8f/z5ult7b5OxsxYrHzZQRCz1gIkRUcfOsm8hncqMPDJgkuYBqA2n48P20No65IU88
         e0ypUg/KbpPJ6lF6WnbcWTLu00iT/u0vRV8RYnhMzulLIvdoVmoeKv92d+Yh82Kqdt
         pD0L88u7x94rw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ENCdL2RC c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=aY-Ws1ZPUF2FYupRm0EA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] attribute: parse but ignore enum attributes
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20200614160235.22320-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <402dc19b-9d5f-d42b-169f-a96a2cc16a58@ramsayjones.plus.com>
Date:   Sun, 14 Jun 2020 20:35:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200614160235.22320-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOMNQpEMboDaGHzy+q0mMk7PfhNZ0YCOzNjPc9n4BuAqZ0QFu1jAHsbA67hxIzO/Xn0Gm5cSDgBqlkAxmuBx6B96FPPjKfZ9ynaWPxKjfabEHn6XD+bH
 /s9uj0/a2vwIBJyFljdQeZlFX622ivK0bt9+E4cOtZlhwlEGonnjPsVQFWfY0FstmK/nisgerNZ2tA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 14/06/2020 17:02, Luc Van Oostenryck wrote:
> Currently, sparse is confused whne encountering an enum attribute.

s/whne/when/

ATB,
Ramsay Jones

> 
> Teach sparse about these attributes and, for now, ignore them.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  parse.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/parse.c b/parse.c
> index 570b2516714f..70d8b237ce5e 100644
> --- a/parse.c
> +++ b/parse.c
> @@ -937,8 +937,12 @@ static struct token *parse_enum_declaration(struct token *token, struct symbol *
>  	while (token_type(token) == TOKEN_IDENT) {
>  		struct expression *expr = NULL;
>  		struct token *next = token->next;
> +		struct decl_state ctx = { };
>  		struct symbol *sym;
>  
> +		// FIXME: only 'deprecated' should be accepted
> +		next = handle_attributes(next, &ctx, KW_ATTRIBUTE);
> +
>  		if (match_op(next, '=')) {
>  			next = constant_expression(next->next, &expr);
>  			lastval = get_expression_value(expr);
> 

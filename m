Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F9C1DA6D1
	for <lists+linux-sparse@lfdr.de>; Wed, 20 May 2020 02:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgETA4b (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 20:56:31 -0400
Received: from avasout02.plus.net ([212.159.14.17]:33458 "EHLO
        avasout02.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbgETA4a (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 20:56:30 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id bD23jxWSjU8CkbD24jjSEV; Wed, 20 May 2020 01:56:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1589936189; bh=3uohJmfES7jMrd9FCEK7W4p6y/MFBzCotVSeJRPUBTM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=BrD9GQn5YBRr49aPcpKPQXOEQA8eOQZthyzjmq5Zle8arYXalmVMcwmMiNZwRmIGl
         fywyUe8aJ84+22XeiKiSDjQ8lI2ZODFs1vLFJ8CDfMG1GWu22frspnlRaUKR5l0ami
         Psia+GzCwYbF5Vwod2FXfnBR3FNfGf/jP1U2cO8BT0xZXTgNSpUR9WNXnP7ECbfoxS
         ftr3f7eIdZW6NJ5rWFzv4ulzB1rseorPnU25GjEsVeuoR6Tl6q0vKsgTisYpLYQs1z
         rMEqO5uYAp9gc/gaNl50FZTPc+/v5T5EggLGEhNdFPtE7/vxeG9shjiSZIq1umBIMM
         LkUlmiPtBYLkQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=G/eH7+s5 c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=hgWT5SG7uF_KschTBVsA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH v1 25/28] bad-goto: check declaration of label expressions
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <20200519005728.84594-26-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <f75a85c4-c5c1-baab-7c8e-6bf14a925764@ramsayjones.plus.com>
Date:   Wed, 20 May 2020 01:56:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519005728.84594-26-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMfTi2jA+Qze+t0/gj2mEhYddbaEYHWTLh1cj6RTBeP/Dpm2E3KxJ56pZlcIy+mJcA+rRXD7UBFxAM47cZCnM8uTpg8VmXwWABpJgWCw2FNZHxy9+KoO
 a5IhYiBg6J/d+wL7qAeGFHdBpFDHuLgiYg8Xc/DAEjyxNUdsbFTu1n2YkvNoGRc1XAl9ksmcv5eV6Q==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 19/05/2020 01:57, Luc Van Oostenryck wrote:
> Issue an error when taking the address of an undeclared label
> and mark the mark the function as improper for linearization

s/mark the mark the/mark the/

ATB,
Ramsay Jones

> since the resulting IR would be invalid.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  evaluate.c                            | 1 +
>  validation/label-scope-cgoto.c        | 1 -
>  validation/linear/label-scope-cgoto.c | 1 -
>  3 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/evaluate.c b/evaluate.c
> index b272e3f642b2..63d75d9031d1 100644
> --- a/evaluate.c
> +++ b/evaluate.c
> @@ -3344,6 +3344,7 @@ struct symbol *evaluate_expression(struct expression *expr)
>  
>  	case EXPR_LABEL:
>  		expr->ctype = &ptr_ctype;
> +		check_label_declaration(expr->pos, expr->label_symbol);
>  		return &ptr_ctype;
>  
>  	case EXPR_TYPE:
> diff --git a/validation/label-scope-cgoto.c b/validation/label-scope-cgoto.c
> index c5d278d3d654..1edb9948d8cf 100644
> --- a/validation/label-scope-cgoto.c
> +++ b/validation/label-scope-cgoto.c
> @@ -65,7 +65,6 @@ l:		 1;
>  /*
>   * check-name: label-scope-cgoto
>   * check-command: sparse -Wno-decl $file
> - * check-known-to-fail
>   *
>   * check-error-start
>  label-scope-cgoto.c:12:19: error: label 'l' used outside statement expression
> diff --git a/validation/linear/label-scope-cgoto.c b/validation/linear/label-scope-cgoto.c
> index 592f1ce4f664..0eba05aea3c7 100644
> --- a/validation/linear/label-scope-cgoto.c
> +++ b/validation/linear/label-scope-cgoto.c
> @@ -3,7 +3,6 @@
>  /*
>   * check-name: linear/label-scope-cgoto
>   * check-command: test-linearize -Wno-decl -I. $file
> - * check-known-to-fail
>   *
>   * check-error-ignore
>   * check-output-ignore
> 

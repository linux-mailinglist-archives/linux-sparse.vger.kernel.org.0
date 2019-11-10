Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC5DFF6209
	for <lists+linux-sparse@lfdr.de>; Sun, 10 Nov 2019 02:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfKJBco (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sat, 9 Nov 2019 20:32:44 -0500
Received: from avasout03.plus.net ([84.93.230.244]:42620 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfKJBco (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sat, 9 Nov 2019 20:32:44 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id Tc5oixhvmKleZTc5pibCym; Sun, 10 Nov 2019 01:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1573349563; bh=1lIUg7hcAkl3v2tVFJlwUtdZ3nTB88Vdcik/Tehkm4g=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=n9Q04XZHzXfet4ckzISuMHyKvAw4REx2LVqDt6NHD1U5IFMKJJndDxLW944M9uqIW
         snnknzykUa3VB/m11B1yxh23DQUjl022AeI+YWekKoQq50gwXYc8tgVc8NOouKpGrS
         ykqv/Y2Dc7i6XL5TY7LOWGBGkzv+hS2FICyTPWxaoK5kaNuPcmf2iuevtAZEGTvdWA
         QKIaXPg6xzo5T9cYcbM0G2NFa+6JPaAI9ZhI/cLiFZBZU22L0raZUq53W/yzGkEAGo
         F4vcC10W6OFf7GdSeHIZGLjuoGsLuDlVidfMB4DCxco62XnFUbdwGYxH0Sbk/z3jMs
         uMIDgNcyUDbIQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GfxpYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8
 a=ciQpqvJqny1jBfAaaJcA:9 a=QEXdDO2ut3YA:10 a=pHzHmUro8NiASowvMSCR:22
 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 3/4] typeof: add a test for unexaminated typeof
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191109133519.63010-1-luc.vanoostenryck@gmail.com>
 <20191109133519.63010-4-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <83003c2b-7e92-334c-1acf-be5d4a70191d@ramsayjones.plus.com>
Date:   Sun, 10 Nov 2019 01:32:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191109133519.63010-4-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfAC+bEMiSnQ5cRFatsNb8HDh7HGuNOuQKJulI72XwqnIR06BFClDRDuozZwbc1CHYDGcs6fC1RCwD7G0bVAN1zaj9j9F6nH1Hr3JGyMf1HL63yYB3TV6
 Y7V+rvpQP76wp5Ifau4vNQjQ1hcksmYTBXidWnHLP6PEf2YTa2zkM900cY41MBAdHyOITInbHFKv1A==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org


typo in subject: s/unexaminated/unexamined/

On 09/11/2019 13:35, Luc Van Oostenryck wrote:
> The base type of pointers are not examined when the pointer is.
> It neends to be done later when looked at.

s/neends/needs/

ATB,
Ramsay Jones

> 
> This may be a problem when show_typename() is used on a pointer
> which has not yet been 'deep-examined' and, for example, has a
> SYM_TYPEOF as its base type.
> 
> Add a test case showing the problem.
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  validation/eval/typeof0.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 validation/eval/typeof0.c
> 
> diff --git a/validation/eval/typeof0.c b/validation/eval/typeof0.c
> new file mode 100644
> index 000000000..abef63865
> --- /dev/null
> +++ b/validation/eval/typeof0.c
> @@ -0,0 +1,11 @@
> +static int i;
> +static typeof(i) *ptr;
> +
> +/*
> + * check-name: eval-typeof0
> + * check-command: test-show-type $file
> + * check-known-to-fail
> + *
> + * check-output-ignore
> + * check-output-excludes: unknown type
> + */
> 

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 146DD10A765
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 01:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfK0ASL (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 19:18:11 -0500
Received: from avasout04.plus.net ([212.159.14.19]:47205 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbfK0ASL (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 19:18:11 -0500
Received: from [10.0.2.15] ([87.115.253.23])
        by smtp with ESMTPA
        id Zl20i0tUT4Al0Zl21i2nZt; Wed, 27 Nov 2019 00:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1574813889; bh=2zd27F8tJvuhu5MYMvQZOEwYvcDFn4yRoBzMU5xlfrk=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Emng41L5PvUxZkiTQsmGMpsnVz4NQqVMZAH0IrPTK2AwI1ZhYrPlBnlmMJmEqBZgr
         pQy3ZLUOHEzMcEblkRVSij5gDxFNUdUhEBcs0+KoKCzr4LmdgRLLRncDdQMKDs8aXI
         n6ccN3cvpFPOcvhXApejwaSU5LZwamSCin3mR5YqRUDXLOlYwB+rRN02AxH/btoOp6
         /JTdWyTbbC+NuLQeTfUD6TeAtBtZTjbUl27Y+Q0Kn46BD4OYWe7x8c7x/pLFp5Qzk9
         Ql1M016x9vJBUWi3ST/+eTbzYC2s16AaWeKfFcXHinHh7cR8+PCtl1VqtUrtXnMOmi
         ENy97YqATnUVQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=GY1pYjfL c=1 sm=1 tr=0
 a=LuhjJmsKGzDBBq+cJWlr3w==:117 a=LuhjJmsKGzDBBq+cJWlr3w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=EBOSESyhAAAA:8
 a=pGLkceISAAAA:8 a=QXx2Hm9tmN6jMf7pizUA:9 a=QEXdDO2ut3YA:10
 a=yJM6EZoI5SlJf8ks9Ge_:22 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] cgcc: filter-out -msize-long & -msize-llp64
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191126203018.63627-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <00eb42aa-eeaa-1f68-3d27-102993211207@ramsayjones.plus.com>
Date:   Wed, 27 Nov 2019 00:18:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191126203018.63627-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOhTjLE66v2Gtk3bRSFvXGfYBIpLOLZZmsl6aJKoNPHNCyE3BfiuNj52bBc5m57/692fBvddB44ow8bR6W/swPK/YWYhHlgR53knyNIyabalZuUXpQ7e
 WUpyfDi+gVH6mH0DG6Ib8Iu8tldNJXOu7Gog5RBfIZgRXb+Q1bZNPHnP7SsdKdrgZc4KaVOyohJzWA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 26/11/2019 20:30, Luc Van Oostenryck wrote:
> These options are sparse-specific and shouldn't be passed to GCC.
> 
> Reported-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  cgcc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/cgcc b/cgcc
> index 40dea2a05..ef0375c50 100755
> --- a/cgcc
> +++ b/cgcc
> @@ -131,6 +131,7 @@ sub check_only_option {
>      return 1 if $arg =~ /^-v(no-?)?(entry|dead)$/;
>      return 1 if $arg =~ /^-f(dump-ir|memcpy-max-count|diagnostic-prefix)(=\S*)?$/;
>      return 1 if $arg =~ /^-f(mem2reg|optim)(-enable|-disable|=last)?$/;
> +    return 1 if $arg =~ /^-msize-(long|llp64)$/;
>      return 0;
>  }
>  
> 

Looks good to me: applied and tested on current 'master'.

ATB,
Ramsay Jones


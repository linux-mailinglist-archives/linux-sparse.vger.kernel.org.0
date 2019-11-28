Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D08C10CF14
	for <lists+linux-sparse@lfdr.de>; Thu, 28 Nov 2019 21:06:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfK1UGr (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 Nov 2019 15:06:47 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45865 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726545AbfK1UGq (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 Nov 2019 15:06:46 -0500
Received: by mail-wr1-f67.google.com with SMTP id j42so6644473wrj.12
        for <linux-sparse@vger.kernel.org>; Thu, 28 Nov 2019 12:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dElg3r6LDJHUNeJYrwB1khylYRNiq8W9Xe/p327c7lw=;
        b=GfJ+MFGiq0NulIrbqm2iAdOstsW+4U3REVPEheSKZmAmKGfCpFl2/NZ8AiqxIwBGAX
         7kYXj+SYU772NhIl3CaHy3L9wJAVkp9TV9yjulN1nMAPTsXkYZMy6cZYaYt6H0EKE7to
         881DBU0Y+DgXNqKYVkaNUMBWNn5+DxxJ/rp62gPvDlLlT1zYDM8q6M4ctNJcpCXuCAcd
         AtpaFXSmPJWPDAeZW1SZUsLYolvvWJv+iDgPpQVb2kKL7KwL+6jp21IDrLX2iwTfSjlw
         0ITZqMp5d8KEQhXjFCeTKz+PuZG89XND5012aiCRquTu4DyrQD2O5704QLCQCXgs7XVr
         JqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dElg3r6LDJHUNeJYrwB1khylYRNiq8W9Xe/p327c7lw=;
        b=gKZsQSgT0TfvhJMglewt/DhiCswmHNLmsioECpIAHguuaoC6v+IJVz2dAkStqN+PYk
         RZrllppJIkEN00cpML30/rrTsWgDVzUihaKK++QOC0MDgOwqEGLA6/zb1BirQO2mBrFn
         qwM7/Y61/e+eCkie2frqwHM6BEUr2WyTRd4Z2O3fK8kxQWo3CxscB33a54Bq0pchJNUE
         OKEU1OCIU2R3drwi98o5p6EWJfiLU/9Na9mWi6KBcjBh6jlbtvVt2D0VDdHFayEoSwdM
         aoWq8XAw0S9st6gT800xwvKQlqzlpDjDqxcdMWevzmPAEp/+uuaOSzIGjJug4afoaNCS
         NWXw==
X-Gm-Message-State: APjAAAW44U3rZH/lYf0UB8SIwoB7OimFUfCApEkQP+iwb35u4A322G3g
        ay49NGIUknzEl/adb+LhP2zrkdze
X-Google-Smtp-Source: APXvYqx8s9aUoB1IAybc/TVqiib3hOKEu9hQ4R5Kcubl/pAwpMtXqNf5LMqdXR34zUivC6TSmlaP6A==
X-Received: by 2002:adf:f606:: with SMTP id t6mr33335792wrp.85.1574971604522;
        Thu, 28 Nov 2019 12:06:44 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:d55b:3f3b:6182:682d])
        by smtp.gmail.com with ESMTPSA id f24sm10665927wmb.37.2019.11.28.12.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 12:06:43 -0800 (PST)
Date:   Thu, 28 Nov 2019 21:06:42 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [RFC PATCH] cgcc: only define __CYGWIN32__ for -m32 builds
Message-ID: <20191128200642.wbrb2rukozyac5go@ltop.local>
References: <b342ed82-2949-7a44-3cf7-23ae3d266cbf@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b342ed82-2949-7a44-3cf7-23ae3d266cbf@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Nov 28, 2019 at 05:45:06PM +0000, Ramsay Jones wrote:
> 
> Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
> ---
> 
> Hi Luc,

Hi,

> This is marked RFC because it only improves the situation on 64-bit cygwin.
> Without access to a (up-to-date) 32-bit cygwin, I can't experiment to find
> a means to determine what platform I am on. I don't recall what the output
> of 'uname' is on 32-bit cygwin, but I have a hunch that you can't tell which
> is which from it's output. On 64-bit cygwin:
> 
>   $ uname -a
>   CYGWIN_NT-10.0 satellite 3.0.7(0.338/5/3) 2019-04-30 18:08 x86_64 Cygwin
>   $ uname -s
>   CYGWIN_NT-10.0
>   $ uname -o
>   Cygwin
>   $ 
> 
> [ie. I don't think 'uname -o' returns Cygwin32 or similar. :( ]

Indeed, I'm guess it doesn't. 

> So, I don't know.

I see several possibilities:
1)  just this patch, wich is OK for 64-bit platform/compiler
    where 32-bit needs to be forced with -m32
2)  simply not define __CYGWIN32__ at all based on the
    conviction that it's only __CYGWIN__ that should be tested
3a) in cgcc add 'm32=1' in the i386 part if $m64 is not set
3b) in cgcc add 'm64=1' in the x86_64 part if $m32 is not set
    and change this patch to test $m64 instead of testing $m32
4a) in sparse itself, add something like:
	if (arch_mach == MACH_X86_64 && arch_os == OS_CYGWIN)
		add_pre_buffer("#undef __CYGWIN32__");
    or:
	if (arch_m64 != LP32 && arch_os == OS_CYGWIN)
		add_pre_buffer("#undef __CYGWIN32__");
4b) do not define __CYGWIN32__ in cgcc and add something like:
	if (arch_mach == MACH_i386 && arch_os == OS_CYGWIN)
		add_pre_buffer("#define __CYG_WIN32__ 1");
    or:
	if (arch_m64 == LP32 && arch_os == OS_CYGWIN)
		add_pre_buffer("#define __CYGWIN32__ 1");

For the long term, I would prefer something like 4a) or 4b)
but currently it would only work for native builds.

So, I think that 3a) should be the best.

Best regards,
-- Luc

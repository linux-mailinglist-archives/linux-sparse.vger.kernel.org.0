Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13FB3D591B
	for <lists+linux-sparse@lfdr.de>; Mon, 14 Oct 2019 02:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729374AbfJNApL (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 13 Oct 2019 20:45:11 -0400
Received: from avasout04.plus.net ([212.159.14.19]:39571 "EHLO
        avasout04.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729180AbfJNApL (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 13 Oct 2019 20:45:11 -0400
Received: from [10.0.2.15] ([146.198.133.39])
        by smtp with ESMTPA
        id JoTziqbK937rvJoU0iX3ga; Mon, 14 Oct 2019 01:45:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1571013909; bh=OsMWpO/aTJXGNw3ZC287PLRNN3wBU1qBh7C3nPRz10U=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=F02OLtswH+3mjONAZxVO5oObSL5VgjSCLDRYsE0Mb01tOkBoAZMAoDrnD7i0RCGiX
         vC6YYpwwxOtRBfsU0IrArdKyI5RPHZ/GDGsSTveZyKhkYf2I8Y+PHXSCtiLx7cbcfQ
         jLQ+5gcKYaieIY7e3+eA+YE+yzzOr4StJ9P7kH14c6VUhcHmtzLnm3+HPQt1v27ZZw
         SQUIpwPiyP4NWuGpPQCI4o7uyLbL40cysUs2NyJYAuSAaB+nWlkpDuyIWRfOWIwZK0
         FTStpZ9JSPJW0931nqJ5yFUU8KisY7Uhwf5ZzpmHViOwg8QpVvd9EmVJh/RBFI8n4X
         EWbFLcTFv8oiw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=UvodyN4B c=1 sm=1 tr=0
 a=1Jh3712dEPwUcX5EWi7t+w==:117 a=1Jh3712dEPwUcX5EWi7t+w==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8
 a=edPYq4vm_a_vvALFUj4A:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-AUTH: ramsayjones@:2500
Subject: Re: Sparse v0.6.1
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191013234630.7uuszc5auri46h4y@desk.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <88c22f42-37d6-ce5b-a8e8-cff597c91061@ramsayjones.plus.com>
Date:   Mon, 14 Oct 2019 01:45:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191013234630.7uuszc5auri46h4y@desk.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJu/BQGNf3QlOkZyqQCITIrahMfLBDkj4DEMOVeRjvG4PBzmL880dw4sdDpVkRAT8QhFvU8lU8lZZ6+RZtggLgSaF/zvY0xbzqtZbZcMKAETN7cyvjKX
 UTR1lYIsaFoqwPTlvWyK96hCqWLpTUFyZRMnSWOmNkr/6m2ALfQSUk/Ba8M+Nz4Dt9TzAuwqtcS1jg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 14/10/2019 00:46, Luc Van Oostenryck wrote:
> Sparse v0.6.1 is now out.

Thanks!

> 
> It's a small, 74 patches, release containing mainly small
> fixes and improvements:
> * improve build & test support for distros, mainly Debian
> * stop warning on externally_visible functions without a prototype
> * accept casts of __user/__iomem/... pointers to/from uintptr_t
> * fix the underlying type of some enumeration values
> * fix a build problem for sparse-llvm by using 'llvm-config --cppflags'
> * conditionals (?:) may now be considered as constants if the condition is
> * some error messages are now clearer or more coherent
> * add missing expansion of compound literals
> * improve parsing & checking of asm operands
> * add missing expansion of asm operands
> * expand some more builtins with constant operands (ffs, clz, ...)
> * fix sparsec with recent version of cygwin

Just to confirm, cygwin passes the entire test-suite (also
including selftest).

I have only had time to just do a shakedown test on 64-bit
Linux and cygwin - but I don't expect any problems.

Looks good. Thanks again. :-D

ATB,
Ramsay Jones

> * fix crashes with some tools on toplevel asm.
> 
> Many thanks to people who have contributed to this release:
> Uwe Kleine-König, Ramsay Jones, Randy Dunlap, Thomas Weißschuh,
> Dan Carpenter, Jann Horn, Ben Dooks, Vegard Nossum, Aurelien Aptel,
> Oliver Hartkopp, Linus Torvalds and Ilya Maximets.
> 
> The source code can be found at its usual repository:
>     git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.1
> 
> The tarballs are found at:
>     https://www.kernel.org/pub/software/devel/sparse/dist/
> 
> -- Luc Van Oostenryck
> 

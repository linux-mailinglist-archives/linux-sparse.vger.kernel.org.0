Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772981FA5B4
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 03:38:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgFPBic (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 15 Jun 2020 21:38:32 -0400
Received: from avasout03.plus.net ([84.93.230.244]:39750 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725891AbgFPBic (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 15 Jun 2020 21:38:32 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id l0YVjVEwZNXR9l0YWjg3Ke; Tue, 16 Jun 2020 02:38:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1592271510; bh=FMb/TLIsW6mOofBs89yd16JAeCAj79fHX7KP+yzQQO4=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=XyDXNzJz3Gd45XsO3kK2C/KFjMX7F5DxAy/cUNtVGxJU9l/scqrFxd3+iFrcfSgmi
         CDVHHKD+nI8dWC0Lge6Gg/qURRf+SW31HUpY9Zmsv28Uq8VpFATAs5UlZ9Uyq8Xjvq
         LlRQUOCEoADQlsEqezP6Y3+kr+xhUMiskcGKSZetvIv1zjmQ1EUTWUjOm+lVQJunBd
         VDZB9d7jphdk3une5dTiMgYluBbCpJNyu7sK4pWTsI3CfLDCv9Z6IqTglkdpXZzxbc
         Qg5/4Y9Q3NSZhy5phifVe2pvsj1aUHkZaVIa3QRDGUar/O9CoT1TjJhZtE+gHBTO0F
         g3NQlK5zmYIXw==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ZemGyvdA c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=anyJmfQTAAAA:8
 a=gu6fZOg2AAAA:8 a=yISuzSt8kOFt0f0vfuoA:9 a=Mxa113GQDFJwKt8m:21
 a=n3Itpq_GfM8oCTgU:21 a=QEXdDO2ut3YA:10 a=jTmf7VFZImIA:10 a=-FEs8UIgK8oA:10
 a=NWVoK91CQyQA:10 a=AjGcO6oz07-iQ99wixmX:22 a=YJ_ntbLOlx1v6PCnmBeL:22
 a=2RSlZUUhi9gRBrsHwhhZ:22 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] doc: add intro stolen from the wiki
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20200616001122.65350-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <1d164023-8e9d-8950-7fec-b1bd7b673c31@ramsayjones.plus.com>
Date:   Tue, 16 Jun 2020 02:38:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616001122.65350-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMnAOvwrVDfOyBO7hi5xLaKfimgATg8BhaCvL0EszBp4CcgXjutLjX0IepccmWY/RBArlRgAyGU35BAr809FWYJiebboST8h3yaBel4xs5fh5Xg0k0qa
 +DCYeDA247h9ZGlSoRD6qUfxqRgU1gboCu+Mq037ZHIuqnDWzv0E4RIiZ90NTM/DGAA5Bj+ONx7HVg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 16/06/2020 01:11, Luc Van Oostenryck wrote:
> The wiki has a small into, perfectable but nice

s/into/intro/ or s/into/introduction/
s/perfectable but/which could be improved, but is/

> enough while the doc here has no such thing.

s/enough/enough,/

> 
> So, copy the intro from the wiki into the entrypoint

s/intro/introduction/ maybe.

ATB,
Ramsay Jones

> of the documentation (and convert the wikimedia markup
> into restructuredtext).
> 
> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> ---
>  Documentation/index.rst | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/Documentation/index.rst b/Documentation/index.rst
> index eb3de63c9ca7..415da4bb27af 100644
> --- a/Documentation/index.rst
> +++ b/Documentation/index.rst
> @@ -6,6 +6,43 @@ Welcome to sparse's documentation
>  .. toctree::
>     :maxdepth: 1
>  
> +About Sparse
> +------------
> +
> +Sparse, the semantic parser, provides a compiler frontend capable of
> +parsing most of ANSI C as well as many GCC extensions, and a collection
> +of sample compiler backends, including a static analyzer also called `sparse`.
> +Sparse provides a set of annotations designed to convey semantic information
> +about types, such as what address space pointers point to, or what locks
> +function acquires or releases.
> +
> +Linus Torvalds started writing Sparse in 2003, initially targeting issues such
> +as mixing pointers to user address space and pointers to kernel address space.
> +
> +Josh Triplett was Sparse's first maintainer in 2006. This role was taken over
> +by Christopher Li in 2009 and by Luc Van Oostenryck in late 2018.
> +
> +Getting Sparse
> +--------------
> +
> +You can find released versions of sparse at http://www.kernel.org/pub/software/devel/sparse/dist/
> +
> +Obtaining sparse via Git
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Sparse uses the `Git version control system <http://git-scm.com/>`_. You can obtain the most recent version of sparse directly from the Git repository with the command::
> +
> +	git clone git://git.kernel.org/pub/scm/devel/sparse/sparse.git
> +
> +You can also `browse the Git repository <https://git.kernel.org/pub/scm/devel/sparse/sparse.git>`_.
> +
> +Mailing list
> +~~~~~~~~~~~~
> +
> +Discussions about sparse occurs on the sparse mailing list, linux-sparse@vger.kernel.org. To subscribe to the list, send an email with ``subscribe linux-sparse`` in the body to ``majordomo@vger.kernel.org``.
> +
> +You can browse the list archives at https://marc.info/?l=linux-sparse.
> +
>  User documentation
>  ------------------
>  .. toctree::
> 

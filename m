Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D67ACD0324
	for <lists+linux-sparse@lfdr.de>; Tue,  8 Oct 2019 23:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbfJHV6E (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 8 Oct 2019 17:58:04 -0400
Received: from avasout03.plus.net ([84.93.230.244]:38303 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJHV6D (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 8 Oct 2019 17:58:03 -0400
Received: from [10.0.2.15] ([146.198.132.191])
        by smtp with ESMTPA
        id HxUSiFXjgtvkXHxUUiWyLw; Tue, 08 Oct 2019 22:58:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1570571880; bh=kb+xCp3cQZoL6If7Ry1NxGdcxkHeDdlJqmmEZ0nYe8Y=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=Rdl3FuBRdxoJbWT+mZjW1zJavK+r65n7Swa92ikzofFFjBZLQxcCcqWNt4EQLY59E
         yGV5pqDyv9YDo0eLdfV+eDEZhN77hJM/roGJTfMPXQZOMazdm3actjmjv7c8xCwDQ2
         jLh8e3R10VkyKB/xFsnCXXlSrlOj6ZZWDonwvRXAGhCBN/L6Gdrvi/sXbyM0VecMpm
         jWxPJIA7H12waKwMtQaZO/DWy54dYnJOJYozGSDzRk3JyC/2i+1e17+74KmzgIoGqZ
         lV2X8guvZDRh/I1q1BbPiA8JTeqq7GvrAThbisYDf757sFH115nVNbUEA4FEIGlIUD
         PqN+x0JLyxaWQ==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ePBtc0h1 c=1 sm=1 tr=0
 a=Fsx7Iv7+m2wQNRAD/kuoBg==:117 a=Fsx7Iv7+m2wQNRAD/kuoBg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8
 a=K8EfRmuQLNw3Xq9DjzsA:9 a=QEXdDO2ut3YA:10 a=pRQRx_yQ9a0A:10
 a=AjGcO6oz07-iQ99wixmX:22 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH] Sparse v0.6.1-rc2 is now out.
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191007090610.10640-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <e07a51e8-dc18-5074-3832-8a1f33ec7085@ramsayjones.plus.com>
Date:   Tue, 8 Oct 2019 22:57:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191007090610.10640-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfG8cgPhvMupylNYtSgqZaZKgu6JotwMKHMLU4TsRgT/4RzEfpqruVwN0PMPgV6kiortkmYszEDBtbzg3U3lfVMgPMSx2ESusFU+NwJ0gksQ54NXjaCv0
 6d1LYoI80P3jhYDuG03NRCVDA0ZXSEGecyBbfx7zKvS8DhLqHZw+/bR3ru/JcA1OmShmjOcEwbfjtg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 07/10/2019 10:06, Luc Van Oostenryck wrote:
> The source code can be found at its usual repository:
>   git://git.kernel.org/pub/scm/devel/sparse/sparse.git v0.6.1-rc2
> 
> The tarballs are found at:
>     https://www.kernel.org/pub/software/devel/sparse/dist/
> 

Luc, I tested (last night) in the usual way on 64-&32-bit Linux
and 64-bit cygwin, without issue. I had intended to test (tonight)
also on fedora 30 and Ubuntu 19.04 (19.10 is still in beta), since
my normal test targets are all built on a fairly old base. However,
I didn't find time tonight, sorry ... :(

ATB,
Ramsay Jones


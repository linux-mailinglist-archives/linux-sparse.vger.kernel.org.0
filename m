Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 586111172F1
	for <lists+linux-sparse@lfdr.de>; Mon,  9 Dec 2019 18:39:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfLIRjP (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 9 Dec 2019 12:39:15 -0500
Received: from avasout06.plus.net ([212.159.14.18]:33456 "EHLO
        avasout06.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbfLIRjP (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 9 Dec 2019 12:39:15 -0500
Received: from [10.0.2.15] ([87.115.253.35])
        by smtp with ESMTPA
        id eN04ilwOPsjQSeN05iVM6N; Mon, 09 Dec 2019 17:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1575913154; bh=B977ortdmUPW1U3nD4XwZYDozq7ompStspjxyu7RJXg=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=TPy9ybWs/dQzA84Z4sZoZiOelTYu5/aEJejmeeibVMhuAtEJHnqdXdkuLYpq19UdH
         8EGBoAwWiOG9zpqfk6CNBg5cHRuBf1Ctho8DGhIZ5geh4oi0w9KFEg2WqBKtR36mCC
         s9CKFPIc0Eq/exlpNupl+O7fCpAv6LHZpW032oaMSam9h59M4tuy20K4yqJyCT5IXA
         4l36uktYKd+s5T845nb4zjBEqTV3d6fyf3X2GOkuuUyBN9goNKVEbMjY1la5Pv+vdB
         OSLY78iHYVoJTNspE8K/kAYlsGOaXufEG+zAnZNiKyPnFbO4j02IqzPJwnEDuDrR6R
         qEA4YRKEwqIBA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=cZasUULM c=1 sm=1 tr=0
 a=VLDPgNmCULccAgTy/RRLiQ==:117 a=VLDPgNmCULccAgTy/RRLiQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=S0M5J17CAAAA:20
 a=ymyixAidp3iPO6nL9a0A:9 a=QEXdDO2ut3YA:10 a=rblfI0TChoxLVqhZACYb:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-AUTH: ramsayjones@:2500
Subject: Re: [PATCH 0/5] improve diagnostic messages concerning bitfields
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <e6aac4ce-a264-ac7b-dfa2-026eb6a8a532@ramsayjones.plus.com>
Date:   Mon, 9 Dec 2019 17:39:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191208231921.49964-1-luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfF3kFPOtmzWv/mH8sQ9j9W78G6x04UqrnhHpLlyU2acLIEvmmYMZw6Ul9/GKP3V+4bV/shTgQIHqZoOG6WZUNNxWUyKypaEO5gUB0mugboxVzN68qhP1
 SzvOtOqduPWJMirAHwTy3cuZkNinfrYYLLEKMg+i0824hR7hj8WIgpucYOYGw8QTPBvM7jD8TnvP1A==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 08/12/2019 23:19, Luc Van Oostenryck wrote:
> These few patches contains some fixes or improvements
> of diagnostic concerning the size of bitfields.
> 
> 
> This series is also available at:
>   git://github.com/lucvoo/sparse-dev.git bitfield-size

I tested these patches by applying them on top of current 'master'
branch (@817270f9). I tested in the usual way (Linux 32-&64-bit and
cygwin) including a quick run over git source, without issue.

Today, I noticed that the above branch was based on commit 9b2efc15
rather than 'master'. I just did a trial merge of 'luc/bitfield-size'
with 'master' and 'git-diff'ed the result against my tested branch
head - no difference shown. So, I think we are good! (famous last
words) ;-)

ATB,
Ramsay Jones

> 
> 
> Luc Van Oostenryck (5):
>   bitfield: add testcases for invalid bitfield width
>   bitfield: don't warn twice on invalid width
>   bitfield: oversized bitfields are errors
>   bitfield: keep the bitfield ident
>   bitfield: display the bitfield name in error messages
> 
>  parse.c                     | 10 ++++------
>  symbol.c                    | 10 ++++++----
>  validation/bitfield-sizes.c | 30 ++++++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 10 deletions(-)
>  create mode 100644 validation/bitfield-sizes.c
> 

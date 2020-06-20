Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC42A201EFE
	for <lists+linux-sparse@lfdr.de>; Sat, 20 Jun 2020 02:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730643AbgFTALT (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 19 Jun 2020 20:11:19 -0400
Received: from avasout03.plus.net ([84.93.230.244]:45736 "EHLO
        avasout03.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730639AbgFTALR (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 19 Jun 2020 20:11:17 -0400
Received: from [10.0.2.15] ([80.189.83.36])
        by smtp with ESMTPA
        id mR6JjaI6NNXR9mR6KjiPK6; Sat, 20 Jun 2020 01:11:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1592611876; bh=VgynHSlQxmB5VdWMXZ4ZsukMD6zbF8trh/C+6URFGl4=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=QavZ/gGbqjVdkGAsMZbC0qWRSqt9cIVY/301F9sKptbwnwA7Kw8MpQpbfr38TDKEs
         2+rhvJH1Hr4V65df0C3pjb3y5CF/GgmEJQejgZud4h9hwoIQGfWEPXupArb2vhSzdz
         io7/nIF3PFOy8s9ndC379TzcibcdT2IItFkzu4yYbI1QZtk6nOhgjNjd6k30v7qaem
         dgolhkM8UK5inlZDSq5q8YSD7f6RYQxe2gIZZIP4Ytl6WisM88Z8CsE8vW/02y+VvD
         3aQYctEwlyBeCKiNQda5/otE70lHVkEYr1IEQVfjokUqGmKEMR+CPnAovqYAMcPoId
         lFRZmy7hCUdEA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=ZemGyvdA c=1 sm=1 tr=0
 a=wkuGFLPET1X3QCvBVkIa5g==:117 a=wkuGFLPET1X3QCvBVkIa5g==:17
 a=IkcTkHD0fZMA:10 a=rZYAVS0B_NKvsXODgwcA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [ANNOUNCE] Sparse v0.6.2-rc2
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-sparse@vger.kernel.org
References: <20200618221540.gvibhjj5fxiu4g4h@ltop.local>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <ce3f1a29-e7d1-a18b-dec9-a0e794c6d7ac@ramsayjones.plus.com>
Date:   Sat, 20 Jun 2020 01:11:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618221540.gvibhjj5fxiu4g4h@ltop.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFcOkyRolmYIG0nx6ti/1vLFmktgtOrau6wiYJmWrCFoUYzpAHQIphNTlNmC+Z6XwERDowVP0THjt+q1FC646iYiAbDh0qe0Wyg4JdQRYfPlEuHD2uCL
 Pa5OScTgig1C7kX67dF9Bg47P5p8Cm3zT1pegrUbAl94PRtimISqWCwmq7/uxdVo3JJe76WqwRztZw==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 18/06/2020 23:15, Luc Van Oostenryck wrote:
> Sparse v0.6.2-rc2 is now out.

As expected, no issues found during testing. :-D

Thanks!

ATB,
Ramsay Jones


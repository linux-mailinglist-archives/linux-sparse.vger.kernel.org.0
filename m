Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252DA1FA3C7
	for <lists+linux-sparse@lfdr.de>; Tue, 16 Jun 2020 00:54:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgFOWyu (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 15 Jun 2020 18:54:50 -0400
Received: from avasout07.plus.net ([84.93.230.235]:57257 "EHLO
        avasout07.plus.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgFOWyu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 15 Jun 2020 18:54:50 -0400
Received: from [10.0.2.15] ([217.32.115.138])
        by smtp with ESMTPA
        id ky06jRE1D0wwMky07jEVJO; Mon, 15 Jun 2020 23:54:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plus.com; s=042019;
        t=1592261687; bh=bnbyRwkMHLBtPQ4OZA4tKJxWtojwEYqugfSBwxjgnqY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=CIaVC+xxpb1SEA5u+8he87N+v4a3rc+3+Es71ZSdQ/t8MesgLEtLtPK12bt4pAhzj
         OlwjLNrWbyc/193gkczxIoQwEthlVY9yvKgB1g2ywRAaeTKE6bGlrfoNPk25tXWW8u
         R3o8acXJzcN+kx3P5OCCLf6nyxZsa6klaAN4HnQDB46w7pyOqI570Oe6g2pFASu+cc
         N4FoJTPn9IlKs9fcTX1p/iuRvO7XIIlO+CAhTwM9kVb6eD9yuwFLQCzuXwKHebIh1n
         JZiHmmpiiL9Qby2lHcl4ZMuciOvnpj29Hy2rse/k9jDVNR4/He/Mm76TnR/E+DNpEM
         lTqKs+hUqg/TA==
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=b/4pHuOx c=1 sm=1 tr=0
 a=T9WNts+jH3PhiGdS1gtV5Q==:117 a=T9WNts+jH3PhiGdS1gtV5Q==:17
 a=IkcTkHD0fZMA:10 a=Aigxobg2hUBL4PSr6mIA:9 a=QEXdDO2ut3YA:10
X-AUTH: ramsayjones@:2500
Subject: Re: [ANNOUNCE] Sparse v0.6.2-rc1
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Linux-Sparse <linux-sparse@vger.kernel.org>
References: <20200613020735.iqb2vd23jpomisbq@ltop.local>
 <c80024d2-6d91-4fe7-a919-3edcf4a9b80a@ramsayjones.plus.com>
 <20200614215445.rtfbx23ve57fhlbr@ltop.local>
 <d540f450-c72e-5c51-ffba-32d7eb800137@ramsayjones.plus.com>
 <CAExDi1RbuRvkQb0DAYZUdwj+XQvVn91D8rU_-_bkybfCqi10eg@mail.gmail.com>
From:   Ramsay Jones <ramsay@ramsayjones.plus.com>
Message-ID: <9fecbef9-12c8-6374-d5cd-914c3b009afa@ramsayjones.plus.com>
Date:   Mon, 15 Jun 2020 23:54:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAExDi1RbuRvkQb0DAYZUdwj+XQvVn91D8rU_-_bkybfCqi10eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLRHG6La2qVOch7hHDrgbgReg/pQwxHXvMztofxrkAP7rCAf0SI1iqdYfbXATdJuCONpMvoaLcUsQS1v9GAviG6WeQ0uwRiwrkp6jFydfKZUC/ZcB8xB
 lrFUrqxSxIHyFt5D1QVjPGcoWSf3WwtqkPmYwmP01UrOnX7WZJIz32HTC/Y2AA+xDOY0U81dymcWwA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org



On 15/06/2020 17:38, Luc Van Oostenryck wrote:
> On Mon, Jun 15, 2020 at 12:37:28AM +0100, Ramsay Jones wrote:
>> I just installed python-sphinx (on LM 19.3 it is the python2
>> version) to give it a try, and it failed:
>>
>>   $ make html
>>   Running Sphinx v1.6.7
> 
> This is probably too old (running 3.0 here but IIRC 2.7 or
> 2.8 should be OK).

I'm not that surprised! I will wait until LM20 which, being based
on Ubuntu 20.04, should hopefully have a sufficiently new version.

BTW, the on-line version of the v0.6.2 release notes look good to
me now ... except one thing! ;-)

This part of the release notes:

  * fully propagate declarations downward.
      For example, it means that code like:

          static int foo(void);
          int foo(void) { return 0; }

      now behaves as expected: foo() is effectively static.

... has the two lines of code formatted as a 'filled paragraph'.

I assume that some 'code-block' marker(s) of some description are
required to format this correctly.

ATB,
Ramsay Jones




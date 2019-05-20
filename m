Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA1AE23E26
	for <lists+linux-sparse@lfdr.de>; Mon, 20 May 2019 19:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388626AbfETRQd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 20 May 2019 13:16:33 -0400
Received: from know-smtprelay-omc-7.server.virginmedia.net ([80.0.253.71]:57039
        "EHLO know-smtprelay-omc-7.server.virginmedia.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390305AbfETRQd (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 20 May 2019 13:16:33 -0400
X-Greylist: delayed 333 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 May 2019 13:16:32 EDT
Received: from [192.168.1.201] ([82.2.1.89])
        by cmsmtp with ESMTPA
        id SloNhnWkkkdLISloPh1w6c; Mon, 20 May 2019 18:10:57 +0100
X-Originating-IP: [82.2.1.89]
X-Authenticated-User: dmjones@ntlworld.com
X-Spam: 0
X-Authority: v=2.3 cv=X+l81lbe c=1 sm=1 tr=0 a=WPUjqzW0G8tv1tco57yGEQ==:117
 a=WPUjqzW0G8tv1tco57yGEQ==:17 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19
 a=IkcTkHD0fZMA:10 a=pxdNzhGcAAAA:8 a=wKC-sUEZuKkF5-w_Kl4A:9 a=QEXdDO2ut3YA:10
 a=6UCLHkHsjq5DW36378aM:22
Subject: Re: Sparse context checking Vs Clang Thread Safety analysis
To:     Himanshu Jha <himanshujha199640@gmail.com>,
        linux-sparse@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Philipp Reisner <philipp.reisner@linbit.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <20190520164214.GA14656@himanshu-Vostro-3559>
From:   Derek M Jones <derek@knosof.co.uk>
Organization: Knowledge Software, Ltd
Message-ID: <1511500c-ccab-1702-2813-d063ebf7aa0a@knosof.co.uk>
Date:   Mon, 20 May 2019 18:10:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 5.1; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <20190520164214.GA14656@himanshu-Vostro-3559>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBhlPALVXy/9AIunJfnBgs6QyqM/vTflTrJrvRJG3jnjUy4OY8yZmZu19IML7ErxUyamy9DTd2dzQ0l71Di9BX0ikrSTzDb1GwHPGizYyqjEIay8foHb
 ek6rhgXcTIuKjH37fYdKwNuBo6Oispy5Hs0qavtJeKszc6WyilzUlU+2e3pFGXzSSqx38Zio2EgkreK9GtnsZk6mh+xEEZB99oSdgHT3UcrBfxZ0q5l8cooK
 KqmVgjP1w8IvFth4+Y1hhAKgcLIRzVi+sdLzkZ+9/ow+U9mxN4c2Px4u0qKLlloaMftjLRUET6y1lINZwDAIC3IPCEPe2kOeqzS3+J4VD55vUiIU9YP6fD0u
 3sT2EZ7c11joI/T9KaI4OWnzIcWBpA==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Himanshu Jha,

Good luck with your project.

> Could you please point me some critical data examples that you know in
> the kernel source which should be protected. This would help us a lot!

Hopefully not the sort of thing that appears in the kernel,
but a problem that the C committee continues to grapple with:
http://shape-of-code.coding-guidelines.com/2019/05/17/c-considering-support-for-background-checks-on-pointer-values/


-- 
Derek M. Jones           Software analysis
tel: +44 (0)1252 520667  blog:shape-of-code.coding-guidelines.com

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF20E1D5707
	for <lists+linux-sparse@lfdr.de>; Fri, 15 May 2020 19:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgEORIq (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 15 May 2020 13:08:46 -0400
Received: from know-smtprelay-omc-3.server.virginmedia.net ([80.0.253.67]:55393
        "EHLO know-smtprelay-omc-3.server.virginmedia.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726023AbgEORIp (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 15 May 2020 13:08:45 -0400
X-Greylist: delayed 333 seconds by postgrey-1.27 at vger.kernel.org; Fri, 15 May 2020 13:08:45 EDT
Received: from localhost.localdomain ([82.2.1.89])
        by cmsmtp with ESMTPA
        id ZdjojwbnWoX2yZdjojHTpc; Fri, 15 May 2020 18:03:08 +0100
X-Originating-IP: [82.2.1.89]
X-Authenticated-User: dmjones@ntlworld.com
X-Spam: 0
X-Authority: v=2.3 cv=EJUoLWRC c=1 sm=1 tr=0 a=WPUjqzW0G8tv1tco57yGEQ==:117
 a=WPUjqzW0G8tv1tco57yGEQ==:17 a=IkcTkHD0fZMA:10 a=pxdNzhGcAAAA:8
 a=lPChu_ellxRgd434YvkA:9 a=QEXdDO2ut3YA:10 a=5iRRnDWHcAYA:10
 a=-2GkgDtef2wA:10 a=6UCLHkHsjq5DW36378aM:22
Subject: Re: complain about re-declared functions with different modifiers
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
References: <20200514140451.GD2078@kadam>
 <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
 <20200514205604.f4uxvv7lf4wrg4un@ltop.local>
 <CAHk-=wh_1ycEjZGN+qFBP8==XPF-+wsiyJ0=-J5JSMDMxmo32g@mail.gmail.com>
From:   Derek M Jones <derek@knosof.co.uk>
Organization: Knowledge Software, Ltd
Message-ID: <e938cf36-8fe2-ab97-4179-e7927473d4fd@knosof.co.uk>
Date:   Fri, 15 May 2020 18:03:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wh_1ycEjZGN+qFBP8==XPF-+wsiyJ0=-J5JSMDMxmo32g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMR2MIuTHdl3WP+4fey5H1e6ufpiDL4Ch0vhvjiQ10IDPK/82deE7sfZoyU6zwLloKmadLRuSTeiyCX7PZoktKCIEt7ee/6jr67cxcQNrmCIirZTPHox
 stfGF6ULit4DGZuxqm/8DmLb6VGq8/uPllXfZe0SjAIQ7gvzfKaa/Y2gQZvjaSXcGa5ZVt5UN8lJQcvEJ+u+fxGk1m8ZzV44HcnvWiex2tuRToT8+Drx1NgH
 cc1DXRIEqUftB57Bc4fm4zOrokbJJTRVtd2rMcWzRyntfxruzvdqTbkvNNQpXA9dWbjtxZNbI1AS0g8eNSvzwg==
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Linus,

> So I think sparse is in the wrong here, and we should consider both
> external and static symbols to be in the same scope and conflict with
> each other unless their declarations match.

Yes.

The C standard only has one one file scope (i.e., the is no
file scope+extra_stuff):
http://c0x.coding-guidelines.com/6.2.1.html

Difference between extern/static revolve around the concept of linkage:
http://c0x.coding-guidelines.com/6.2.2.html

-- 
Derek M. Jones           Evidence-based software engineering
tel: +44 (0)1252 520667  blog:shape-of-code.coding-guidelines.com

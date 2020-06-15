Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E781FA011
	for <lists+linux-sparse@lfdr.de>; Mon, 15 Jun 2020 21:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731179AbgFOTRa (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 15 Jun 2020 15:17:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:44020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729354AbgFOTRa (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 15 Jun 2020 15:17:30 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2574720739;
        Mon, 15 Jun 2020 19:17:29 +0000 (UTC)
Date:   Mon, 15 Jun 2020 15:17:27 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        kernel test robot <lkp@intel.com>,
        linux-sparse@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild-all@lists.01.org
Subject: Re: [PATCH] printk: Make linux/printk.h self-contained
Message-ID: <20200615151727.3c7e9786@oasis.local.home>
In-Reply-To: <20200615114038.GA20708@gondor.apana.org.au>
References: <20200611125144.GA2506@gondor.apana.org.au>
        <20200613122834.GA23739@xsang-OptiPlex-9020>
        <20200613130949.GA22005@gondor.apana.org.au>
        <20200613142901.65xieioomt6bbqa6@ltop.local>
        <20200615114038.GA20708@gondor.apana.org.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, 15 Jun 2020 21:40:38 +1000
Herbert Xu <herbert@gondor.apana.org.au> wrote:

> Thanks for investigating.  I now realise that this was sent against
> my first patch which did have this problem, which was fixed in my
> second patch.  Sorry for the false alarm.

Which is why it is recommended that new patches start their own threads ;-)

That said,

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

for the v2 patch.

-- Steve

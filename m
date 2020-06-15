Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E97911F956C
	for <lists+linux-sparse@lfdr.de>; Mon, 15 Jun 2020 13:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbgFOLlU (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 15 Jun 2020 07:41:20 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:49154 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728510AbgFOLlU (ORCPT <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 15 Jun 2020 07:41:20 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jknTi-0007GD-FX; Mon, 15 Jun 2020 21:40:39 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Mon, 15 Jun 2020 21:40:38 +1000
Date:   Mon, 15 Jun 2020 21:40:38 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     kernel test robot <lkp@intel.com>, linux-sparse@vger.kernel.org,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kbuild-all@lists.01.org
Subject: Re: [PATCH] printk: Make linux/printk.h self-contained
Message-ID: <20200615114038.GA20708@gondor.apana.org.au>
References: <20200611125144.GA2506@gondor.apana.org.au>
 <20200613122834.GA23739@xsang-OptiPlex-9020>
 <20200613130949.GA22005@gondor.apana.org.au>
 <20200613142901.65xieioomt6bbqa6@ltop.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200613142901.65xieioomt6bbqa6@ltop.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sat, Jun 13, 2020 at 04:29:01PM +0200, Luc Van Oostenryck wrote:
>
> while there is no such problem with the previous commit.
> I think the problem is that:
> * ratelimit.h needs raw_spinlock_t
> * spinlock_types.h needs lockdep.h
> * lockdep.h needs ratelimit.h

Thanks for investigating.  I now realise that this was sent against
my first patch which did have this problem, which was fixed in my
second patch.  Sorry for the false alarm.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

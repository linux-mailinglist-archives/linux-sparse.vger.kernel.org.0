Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A98C9591
	for <lists+linux-sparse@lfdr.de>; Thu,  3 Oct 2019 02:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbfJCAWe (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 2 Oct 2019 20:22:34 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37805 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbfJCAWe (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 2 Oct 2019 20:22:34 -0400
Received: by mail-ed1-f68.google.com with SMTP id r4so805155edy.4
        for <linux-sparse@vger.kernel.org>; Wed, 02 Oct 2019 17:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tLIUWMBYqzjFOZWnahCF3vGrYJvQ5cmLqC5C6Nl78ok=;
        b=T0jAM8qeaj2GAk1h6yJGN8oaMH+Ee8qrN+G3BMGOdc/r0qrVCrUDB/qZZSwsThhcSc
         /SW+FlQ5ZyAMKy2RE0m6RuVD3p55gjVUWW7BWkSXk2+r25tvlUf/gIefemDK0ijiYpv0
         NZLEwQyNHqQiSc050Xiz0/eiy9/HrqaWjl1rO+keAZZRoVEagbok6ivJ24Iweeby83hy
         z+umiR5lIcFhbf6a77WsMxt9G8p359pt9PVhJjDTd/2msVdOMjpJYvnMetLLdLzTQyFN
         5vjHkGF7ohqMawApI/aM1jESPUWFiXgImFT8EqM7zKgvHGRuIWcIpZJaXPwNNQOxIlBk
         mAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tLIUWMBYqzjFOZWnahCF3vGrYJvQ5cmLqC5C6Nl78ok=;
        b=URmbmdygHqJjf5JjyR4TQ9fgotkOhGYYSntGsBB/vPOU9167W7j6taOxMY3buPPcPz
         n9ztIjaLB2Lb1pJa94xbpL497pG4HRuvHMVpdVzf3efgDwCG/FQNNyRwky/ItfwOxrlq
         Va5q4HNHZxkzezQVBcNEwQaZiotegXSR1IEjk9jtobXold4Hd7gKDav8hgpQkFs0CZay
         3LRiqnX+QY67GhVTChKGJJ6M86viKpVBvIkigLaOsBTxpuxZ2xuvG5gi//hX9HFSpl4k
         UiZ+ynWYPtrZkVrQ2xtQJcBD4yLV+C1KZMa+zaKRYXmIiQJP+oXIR+B5uH1etFUkBfAU
         U2FQ==
X-Gm-Message-State: APjAAAVcSImm537Vyu3Gsz81c3/0FcY0rC7EDFJQx2zk/4lsRBjljhwC
        +WCjd4xoH8CDeYeDLJEBLEM=
X-Google-Smtp-Source: APXvYqyqIUEKSXj7H5PxOBfw3f1EDakgFADot1LqysUkaqk3EeddlR8k4E/y362iu+5v0xBK9ZOedA==
X-Received: by 2002:a17:906:5382:: with SMTP id g2mr5439439ejo.203.1570062152413;
        Wed, 02 Oct 2019 17:22:32 -0700 (PDT)
Received: from desk.local ([91.177.171.57])
        by smtp.gmail.com with ESMTPSA id br14sm68152ejb.15.2019.10.02.17.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 17:22:31 -0700 (PDT)
Date:   Thu, 3 Oct 2019 02:22:31 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ramsay Jones <ramsay@ramsayjones.plus.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] void-cond: allow void in conditional expression
Message-ID: <20191003002230.m3dstdiwftqx3p33@desk.local>
References: <CAHk-=wiE8gMJhM9gDsA_ErJqvs=5T+-eRYBY7CttGhQJEZYeKQ@mail.gmail.com>
 <20191002212333.51017-1-luc.vanoostenryck@gmail.com>
 <99173481-dbb9-ee7d-2b03-31aac80980e5@ramsayjones.plus.com>
 <CAHk-=whpCQ8m7TZYE-LBUcZjzTADgBbtuhOWa46xKOWYv70Cnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whpCQ8m7TZYE-LBUcZjzTADgBbtuhOWa46xKOWYv70Cnw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Oct 02, 2019 at 04:26:51PM -0700, Linus Torvalds wrote:
> On Wed, Oct 2, 2019 at 4:11 PM Ramsay Jones <ramsay@ramsayjones.plus.com> wrote:
> >
> > ... and the fact that such code exists in the kernel is, er,
> > somewhat disappointing ... :(
> 
> No, I do agree. There's no reason for it in this case anyway, and it
> just looks odd.
> 
> So I just committed a patch to remove the case that Randy reported.

Good, I prefer it so too. I'm dropping the patch then.

-- Luc

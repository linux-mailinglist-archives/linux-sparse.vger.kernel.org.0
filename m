Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0BFD0D98
	for <lists+linux-sparse@lfdr.de>; Wed,  9 Oct 2019 13:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbfJIL0s (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 9 Oct 2019 07:26:48 -0400
Received: from mail-ed1-f51.google.com ([209.85.208.51]:37839 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727657AbfJIL0s (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 9 Oct 2019 07:26:48 -0400
Received: by mail-ed1-f51.google.com with SMTP id r4so1684341edy.4
        for <linux-sparse@vger.kernel.org>; Wed, 09 Oct 2019 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1Z0L4+5Ip+08k1C9Vt1FCxdarrgfOloJAyHLU3a2hJA=;
        b=GiugH+flCNBd+tcNfyrJO3jTPzC0QXn4zwquUIlBH1yhEJiuLO8NwOQ+y8Fy8LD4NR
         dFAL5Puo+ab50AvL+5mTqX+NfgK3/uh3uOZAObTjRZUetGguLxMEwh/1R5oTJc8oNI/m
         fulDhCbc/2xyAvRqOGXDFk4cfps/y52N9Fkif3Cr2TuAOPDmAZHRi4h+WTEVVFo1Q3eK
         D7tx1LYA46YbtS7HEAleYtAu/oqWYKPe+UXf2ah9+J4BHTQvcDCVjDxojE+7EouVlvb4
         dUHhUSGNLyQLOJFdQjp4OuuktuH+LAB2IfsJ30cn2H//lyGDDatsH8wN6/sIIngvKKec
         THHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1Z0L4+5Ip+08k1C9Vt1FCxdarrgfOloJAyHLU3a2hJA=;
        b=dgmDqGyltHqxY5OeA0cmxQqyHzdrvexGIkHS35mjP3+5RvSvX0hxgP5jPT20iAXIFB
         jnS3ldMsHu+eA+t6lPV7ASobTGOMwG/67G89Kh34JcVqZKbHWZWOTNhzVCkJRdGQUhBn
         1WMU9FsppjiOEYx2MKvrFEWHU3cRmc3o+sZ4D+WJ/QpMwHfm8brRn4f9VNy47DuTL2dt
         P8kXoKK0oB2KRKATLOqac7iJFYmjk1hafP7cW3VNPQzQrmkTL25PhGehNASOdgN/y12b
         4baSxXDa4GmSXfw2egYUVl2uFI7LzG9oXibtJ2H4lANL3fXWXPspkrRh+T9o53Qma1p+
         ZTVA==
X-Gm-Message-State: APjAAAXQ4pDaVLRCgiBNZL4mG4jZ+m5DA6l1DN/Smpuawdc/L3HZbWSS
        VMSfnZ4nvWqa7T0jzSCWGMM=
X-Google-Smtp-Source: APXvYqwkhyR97ispdO1q7GLDZTRU1Dnbu7kcDEOItqJ4ZgPUujAvJNbDyF9w71ircamw/KP1s2m+bw==
X-Received: by 2002:a17:906:792:: with SMTP id l18mr2192674ejc.170.1570620406327;
        Wed, 09 Oct 2019 04:26:46 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4080:1900:40a1:e401:e4e2:a0d6])
        by smtp.gmail.com with ESMTPSA id r16sm310910eds.72.2019.10.09.04.26.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 04:26:45 -0700 (PDT)
Date:   Wed, 9 Oct 2019 13:26:45 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Vegard Nossum <vegard.nossum@gmail.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: "graph" (v0.6.1-rc2) segfaults on top-level asm
Message-ID: <20191009112644.o2bahzvz4og4kqh4@ltop.local>
References: <CAOMGZ=EeKcRczKWsM1DnZgHEGZYjuPJ2VPwkngY5ZY9w3WuhOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMGZ=EeKcRczKWsM1DnZgHEGZYjuPJ2VPwkngY5ZY9w3WuhOw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Oct 08, 2019 at 04:12:28PM +0200, Vegard Nossum wrote:
> Hi,
> 
> The "graph" binary segfaults on this input:
> 
> asm("");
> 
> This is what gdb says:
> 
> (gdb) run
> Starting program: /home/vegard/git/sparse/graph asm.c
> digraph call_graph {
> 
> Program received signal SIGSEGV, Segmentation fault.
> 0x0000000000401505 in graph_ep (ep=0x7ffff7f62010) at graph.c:52
> 52              sname = stream_name(ep->entry->bb->pos.stream);
> (gdb) bt
> #0  0x0000000000401505 in graph_ep (ep=0x7ffff7f62010) at graph.c:52
> #1  main (argc=<optimized out>, argv=<optimized out>) at graph.c:191
> (gdb) p ep->entry
> $1 = (struct instruction *) 0x0
> 
> I've attached a tentative patch that fixes my segfault, but maybe this
> is not the correct solution or maybe other binaries are impacted.

Hi,

Thank you a lot for investigating this.
Yes, most others binaries also need some supplementary checks. At first
I did the same obvious change as you did but I think I'll finally do
a partial revert of the offending commit. I'll look at it this evening.

Best regards,
-- Luc 

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0F91A6CE6
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 22:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388186AbgDMUAr (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 16:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388135AbgDMUAq (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 16:00:46 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B825FC0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 13:00:45 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id h26so104730wrb.7
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2P1EMht26yUheWEBgL9vkdHn16/i6QBkNo+8UJu3qbY=;
        b=jFaZ0Ofq69lYm/OcA3OdftTEFQ9PXWLFVUQtH2P+pGeDvLEpusaavfODmBFHWFhhTp
         TS3pGwtIxyE3KPfQjJZuFad2x06bj3QAH82BWH806dNBKXQuTnBuYHxAL+g5ou4rPgCt
         plBT5XUTBazEEkdd8jgCYvIbHyvbzAjJfjKA4JfUnhYFNizUiJge9mvqwWQAqQCFsvr8
         E1SpkkpeHyxzHoU9K3Q8gGl0qheRV8PYVzuE0iD88vGeUXHfMoZKbfP8sboKO2UFClcH
         ThNOLxtbKfypjrrsSxhjv7vhJ6hx5WNEvF1lgMSrG2jHzZFWlC86C+ijDgX+Bn8zECY5
         ssTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2P1EMht26yUheWEBgL9vkdHn16/i6QBkNo+8UJu3qbY=;
        b=rm7LxPbDKbhhIkjuxAnQfxMDMHTQTH8iIC7QopfhROdJyEYRRqHZn0F5safBwZQNtS
         YkgfzmFUITkG27yB5w/53m4FpHVcckPaJLO8vT4+FKY/IpdRsw8KfcmezlDOCQ1Bb1PR
         gB+JAV51+G6jCU8TqCacm1vOkKmLPo6KlM+ENm+COQEgaEd7m0E2fLU9mfpH5oyCUkCL
         glVC3CRbiQCZW0PTSknLMkzQY4fabpVRonbGWBXioNUU6PlY0Z0ui5KPAPA9Gl7NLOWH
         jbf5EwFXhOE31lA3f6zJX0RWO8+NhieJmAzvpSSQK7229aFkCP6vXOS1NqYAQZ4y03ka
         OHWA==
X-Gm-Message-State: AGi0PubGGusPdEeJkGFYrNzblV/HVdeOiKwgQaGP91AKHV/JA5hAAUW/
        D0jUZ3JFLbzoC7jXL8O/2sBOYyZa
X-Google-Smtp-Source: APiQypLZJflwgN8dn5/3dpb62Pdp2N90xMfmLrsGdRnDlbcztArMvXLBXqlRRF+niLXemRaS8is++g==
X-Received: by 2002:adf:b1c8:: with SMTP id r8mr19840063wra.218.1586808044517;
        Mon, 13 Apr 2020 13:00:44 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:a133:3be6:37e3:4975])
        by smtp.gmail.com with ESMTPSA id 132sm16376376wmc.47.2020.04.13.13.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 13:00:43 -0700 (PDT)
Date:   Mon, 13 Apr 2020 22:00:43 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH 15/17] scope: give a scope for labels & gotos
Message-ID: <20200413200043.6mv4d67pioex52wb@ltop.local>
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com>
 <20200413161605.95900-16-luc.vanoostenryck@gmail.com>
 <CAHk-=wiy-BFXMpmm9-GNT_WtDKVLeR0ki4OTj83xPk=npuNSHA@mail.gmail.com>
 <20200413185452.pgj75pj5g7a42kik@ltop.local>
 <CAHk-=wjMSeVVQHZ23=HJ3V-yYPooeuHNHmZtexUVRKg_e5VMXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjMSeVVQHZ23=HJ3V-yYPooeuHNHmZtexUVRKg_e5VMXA@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Apr 13, 2020 at 12:32:41PM -0700, Linus Torvalds wrote:
> 
> I _feel_ like the fix to that should be that the only thing that
> creates the actual symbol is the label definition, and that the goto
> should only ever use the 'ident' and we'd tie the two together later.

Yes, I tried that too but it didn't worked because:
 
> But yeah, that "tie the two together later" may not work, simply
> because scoping is so tightly tied to parsing in sparse.
> 
> So maybe your approach is the best one.
> 
> It feels hacky and wrong, but maybe that just fundamentally comes from
> labels having that very special "use = implicit declaration" thing.

Yes, that and the way the symbol 'table' is done: very clever but
unusable for our problem here. But maybe there is something that can
be done there. Currently end_scope() sets scope->symbols to NULL but
as far as I can see, this is not really needed and, if left, the
"tie the two together later" could be done by doing a symbol lookup
via this list instead of the usual lookup via ident->symbols, much
like classical symbol tables are used. It should be quite easy.
I'll give it a try because I'm also not really satisfied with my
current solution giving a kind of secondary scope to the statements.

-- Luc

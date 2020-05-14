Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE081D3901
	for <lists+linux-sparse@lfdr.de>; Thu, 14 May 2020 20:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgENSTN (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 14 May 2020 14:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726075AbgENSTN (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 14 May 2020 14:19:13 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9200CC061A0C
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 11:19:12 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w10so4639104ljo.0
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rWuWuD3JZBodE6ljZrsSfD3MEO+r39UF++VriIJOj54=;
        b=a37z8xIJP7u/rUxfGUfAMNPYLJxDOExiFG8XmkycXvqpNVdvARbthsNnMF5cBcKJmU
         izoWBWwxGgmf6UTRb8Z4TQj8Sts6+HC29MGcFNENU3frdsd7o23iRnheFkP5sbKtgwz5
         K6WVvmKMYpoz9zpdxHd+8ygOW/wD2E1zYZts8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rWuWuD3JZBodE6ljZrsSfD3MEO+r39UF++VriIJOj54=;
        b=N6ihm7mjh1yxR8eib5vjieZkixUg0RBGCYG0Ke/Tc8XJfaRCIpKCa/mDpAhpQUfpoE
         JyuVfRbu/wMAtukvsoXA8wbUoFjoah0Mg9d/VAe6X8gj6EUkI4yv2LMXSs5nHZum5nOI
         XUQb6PqVL4b8ZS3na/QTXsuKIi+S3LDqkHbunCvvG8XuiI3Gpd1LQV6KD6TAxFui2xgX
         tZRt2ZFRPKk1oqBHi51ryENk18uadV5AkP/2ce1hqtbvQGRood/y0OT/kOkXd3PeNIZE
         RZ+DtnhPvj9JggXGTig5SmWMUp+ZXfwNguhkD7UNuETPDaIfDby3901NN9KmZ4o83nGd
         vAGw==
X-Gm-Message-State: AOAM532bwJWv1ApWLSiG4c4Z3kq17j7eobgGwFW/rvU7Wbv0CjsjBaxo
        5kORUyq4LKeQvHLwNvTqclyULPsvm9Q=
X-Google-Smtp-Source: ABdhPJzCuc/0vZYOASRZvthaxhP7TPeoUTz4eEJJ+R5z56FZgFJ5UwU41npTh43oEQ8qTrlrx708aA==
X-Received: by 2002:a2e:584a:: with SMTP id x10mr3640628ljd.181.1589480350526;
        Thu, 14 May 2020 11:19:10 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id r19sm1968400ljp.68.2020.05.14.11.19.09
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 11:19:09 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id u15so4619725ljd.3
        for <linux-sparse@vger.kernel.org>; Thu, 14 May 2020 11:19:09 -0700 (PDT)
X-Received: by 2002:a2e:9641:: with SMTP id z1mr3646060ljh.201.1589480349032;
 Thu, 14 May 2020 11:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200514140451.GD2078@kadam>
In-Reply-To: <20200514140451.GD2078@kadam>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 14 May 2020 11:18:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
Message-ID: <CAHk-=wih1XbdV_MQ2OkcYPx2xZkvuhWKcLaZ=_wd8+5r3yLJQA@mail.gmail.com>
Subject: Re: complain about re-declared functions with different modifiers
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, May 14, 2020 at 7:05 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> But then it's re-declared as not inline.
>
> Could Sparse print a warning for that?

I actually think that would be a bug.

Having a non-inline declaration for an inline function sounds normal
and correct and even expected. I'd not be surprised at all if a
function is declared in a header file as non-inline (because there it
is), but then in the implementation it's defined as inline (because
later uses in that same file might want to inline it).

So warning about inline/non-inline differences is I think actively wrong.

HOWEVER.

In this case I wonder if the real difference is that first we have a
"static" definition of the symbol, and then later there's a non-static
declaration of it. That, to me, smells a bit odd - one has file scope,
the other has external scope, and particularly with the external scope
coming _after_ the file scope, which version of that same symbol does
a subsequent use then use?

Because a static symbol and a symbol with external linkage are clearly
not the same symbol. It's perfectly fine to have an external symbol
'x' that is shadowed by a static symbol 'x' in file scope.

But I wonder if smatch sees the *external* symbol nvme_put_ctrl()
(which doesn't have an inline definition!) rather than the static one
(which does!) because the external declaration comes after the static
definition.

So _that_ might be worth warning about: seeing an external declaration
after a static one makes for confusion.

I'm not sure that is the problem here.

                Linus

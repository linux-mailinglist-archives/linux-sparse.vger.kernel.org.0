Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC61C1D8D39
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 03:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgESBl0 (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 18 May 2020 21:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbgESBl0 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 18 May 2020 21:41:26 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E2BC061A0C
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 18:41:26 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id h188so9808210lfd.7
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 18:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mk95Vtsc2Efhz1CzS3eDyfEpbU6JXi3OmbJuKT05t+o=;
        b=RCSE+L3xwTniEdos++DQj9tsUbSIi0z6UzP/S15v67AdIhjdL8Q7HJY9gYcjNZNASX
         XAkaXEvmuxbqv2VvnIlazdMywwN5sfdXY+K1KNTvmamoBNRuw9+5PKv1bATuWhf56Gme
         v8uae9e64812goMaopHyR7o0T8wJpbHndfsR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mk95Vtsc2Efhz1CzS3eDyfEpbU6JXi3OmbJuKT05t+o=;
        b=cgF1TdrkIiXLRzSaAotaOBxXNlupVsPS52oQmmj0mFbkgmlkVNMGcM43Q7Pot58eh3
         D73830uZdFUSBRgYqj5iQfkg82WjOswEqAqLHvur+1Prq+M5KvMGBtr9UbBtNBNu4hUP
         yJKNZpsB6PL80JQN+VkIOqdpGWpWWcAvzSLcZpfrhHetUXtltquWsLDUyy7enLTEemar
         fnRE9CaA4+9ZQjhF4HWgfoZX/CibtlaNv8F4y+tW0fbVgaQNezZSwy+ohwIZnbuPckIx
         8bJRJy9X+6biClPmdrQmogM2Hi2mNKaZ7j0XLoCqeYYtVPXOV8bL2xj5uXk8pM0UFFfL
         d9Dw==
X-Gm-Message-State: AOAM533zZ5szL76UakBmwQASGq7NZjBnTssIzREipuQAH2Yv3O3M//kn
        6SeokG0xbtfapvAvL9CDpeOaEA2b5vk=
X-Google-Smtp-Source: ABdhPJyN4pE0Gav8Zck88mcsHXevWGYVSbzwiKQJxlIsFJyiB2jlI11PxfVYDKfk6qE2rJmMNEgIFg==
X-Received: by 2002:a05:6512:3b6:: with SMTP id v22mr1743494lfp.97.1589852484128;
        Mon, 18 May 2020 18:41:24 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id u3sm7935131lfq.59.2020.05.18.18.41.23
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 18:41:23 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id b6so11962012ljj.1
        for <linux-sparse@vger.kernel.org>; Mon, 18 May 2020 18:41:23 -0700 (PDT)
X-Received: by 2002:a2e:9641:: with SMTP id z1mr12215739ljh.201.1589852482952;
 Mon, 18 May 2020 18:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
In-Reply-To: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 18 May 2020 18:41:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiaZgBKwC2-ku3UeV4Rdv=tPcKLAfjy96PbJSntcLBWHw@mail.gmail.com>
Message-ID: <CAHk-=wiaZgBKwC2-ku3UeV4Rdv=tPcKLAfjy96PbJSntcLBWHw@mail.gmail.com>
Subject: Re: [SPARSE v2 00/28] detect invalid branches
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, May 18, 2020 at 5:57 PM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> The goals of the patches in this series are:
> *) to detect such gotos at evaluation time;
> *) issue a sensible error message;
> *) avoid the linearization of functions with invalid gotos.

Ack. Apart from that one question I had, which I didn't actually
verify whether it was a problem for the insane test-case I posted.

I only _read_ the patches, I didn't actually apply and test them in any way.

               Linus

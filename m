Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 042821A2E24
	for <lists+linux-sparse@lfdr.de>; Thu,  9 Apr 2020 06:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgDIEDU (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 9 Apr 2020 00:03:20 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:32867 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725271AbgDIEDU (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 9 Apr 2020 00:03:20 -0400
Received: by mail-lf1-f51.google.com with SMTP id h6so6886834lfc.0
        for <linux-sparse@vger.kernel.org>; Wed, 08 Apr 2020 21:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4X79jS+iYVXO/IU1KnCVanAOuaAuDKW7v0h6Qe3VsVQ=;
        b=SP04btFgjlnaTrRtJMUDh/46pp4xlp4gZ9y93G9zcbElT+bPRhsL09L0gJjLyoFZMy
         zcV02mTUSoEqSLtf1eYLnw1VmKFqiidnFMC01nx7MwbAtY9OET0P2fgEjFsMfMllqH2w
         xFSTsKItwPiglnvadWA6aplBAVFwBeunbZCx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4X79jS+iYVXO/IU1KnCVanAOuaAuDKW7v0h6Qe3VsVQ=;
        b=U7YLGXppe0VhlScim3utrrM9CuGEOfiBn4do2t2MF9587w0mk4IF+h7PCnsOKc38bJ
         kqYsIAYvL4cDuNiIMhoq8eKIErN/miKCzri2AMEYYv/mEbYOMlzsykah/M+I2OcHk23G
         gEs3LRG4VyyTUrvWdVW2mS79h0zhXDuLYoDVL5bO3SGLFYMGXfMfYc0te8nGP5CHJXwK
         FzqYUmQSTf9h34PIeRpS+JsU06ZvqtIJ6rhuJR9BIvd9S5318A8gh6vVqJlmZhfqLGJw
         1ONtBRybe1xPLDsegRCyJhHVU02yax8P0LTuTWe92HFcnbeeGyLYeDeYIgjJWLqw+tB0
         PX7g==
X-Gm-Message-State: AGi0Pubhg+5nnIY1CgTQZ87hpUTvwGTefBioTdhgpT1x5Fs/oU3bP0Ze
        AzmOPprcizeZuvFWXdEYNNIIRET4XqU=
X-Google-Smtp-Source: APiQypJV3zNysQYq6254bvM+S7dvQVZ4rUSnAD4jpLOBivBbPD+pcU7a2dAKqR69zi6nfuaD7ldogg==
X-Received: by 2002:a05:6512:3081:: with SMTP id z1mr1737025lfd.102.1586404996723;
        Wed, 08 Apr 2020 21:03:16 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id k16sm14583443ljk.64.2020.04.08.21.03.15
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2020 21:03:15 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id b1so10013736ljp.3
        for <linux-sparse@vger.kernel.org>; Wed, 08 Apr 2020 21:03:15 -0700 (PDT)
X-Received: by 2002:a2e:870f:: with SMTP id m15mr1204033lji.16.1586404995387;
 Wed, 08 Apr 2020 21:03:15 -0700 (PDT)
MIME-Version: 1.0
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 8 Apr 2020 21:02:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=Fs=EecQCNNzofn8+QXuB-sYy9m+YVPAmzDesmqFsbg@mail.gmail.com>
Message-ID: <CAHk-=wg=Fs=EecQCNNzofn8+QXuB-sYy9m+YVPAmzDesmqFsbg@mail.gmail.com>
Subject: Interesting (?) failure case
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Try linearizing this with 'sparse', and see it fail miserably:

   int t(void)
   {
        goto inside;
        return 0 ?
                 ({ inside: return 3; 1; })
                :
                 2;
   }

I came up with that disgusting example after talking to Nick
Desaulniers about how sparse does some front-end optimizations early,
and it made me go "Hmm... What about.."

There are two reasonable approaches for the above:

 - return 3 (due to the "goto inside")

 - tell the user to pound sand for doing crazy things and jumping into
a statement expression from outside.

clang does #1. gcc does #2.

sparse does something bad, and just generates garbage silently.

             Linus

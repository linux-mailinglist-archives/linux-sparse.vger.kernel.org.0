Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8E91A6B5E
	for <lists+linux-sparse@lfdr.de>; Mon, 13 Apr 2020 19:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732807AbgDMRbK (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 13 Apr 2020 13:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732781AbgDMRbK (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 13 Apr 2020 13:31:10 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD075C0A3BDC
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 10:31:09 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id m8so9569272lji.1
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 10:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WDDbqQ0qoZVUw9Qfw61g2e1G3PgQVpjysOhG1/AdaxU=;
        b=UK8BqQnL2dFMqO05i/mrQ+X2Eop2Rz6y5sAyYjBvSNtUrK3qt2TxU9AfbHkokmrpSf
         jRU+W9/eEbIcejYYFsVbzXEWxCx/1feCnQzZfJcG+fhTP+3LNTjRvZLhWE++/zTwTcEO
         w/TjbNhRA+6fvFR0QeAXM6buqqHAzVaaSxayQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WDDbqQ0qoZVUw9Qfw61g2e1G3PgQVpjysOhG1/AdaxU=;
        b=JDhJrZ1GXjwMrsMWTTLYeHjOXoVozhPh6XfenqiBTuINt4xea6Xhe0H/DXeJdCWt5I
         j1dRpgQ0Fw0lsFcOPsNMYo707z8ARN/+POW0mpOv0dOc3vFVAj15Zqc3E7CLbju2/mJX
         sah4kC/VHO10FconxWk94/+CWS102ywsGMyif893EuyEZFnnLX9vPNgMfVu+yOwAZro2
         ivRaTq3+dvZBeYEE3DCwuAPe9plU0JZ6r7dD4Gn7zlmNT9jg+2jfRFgLRLMXmy5/7rVp
         H7z67I742J5dj4lYpfvhkro/VgXODyEZBIqbijbC5Mlcmv3b8rWDEG7glzcZZvLMRCFj
         /DjQ==
X-Gm-Message-State: AGi0PuYM3Vu5Id3RbwCg0ccGhaxweOIp8wbYzkFxOKtxzTC92HCSsXmC
        7TEUaHtYhROAH6DT7Fo1L2M+Pc2hsYY=
X-Google-Smtp-Source: APiQypL4p49DLjrZBLPhAc4Aeu7Dubx1U88FMKSR/c4RGIKVAcWY6lPWwvdiAOp0pVDg/M4LXg2isA==
X-Received: by 2002:a2e:8688:: with SMTP id l8mr2123960lji.233.1586799067608;
        Mon, 13 Apr 2020 10:31:07 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id c4sm8470976lfg.82.2020.04.13.10.31.06
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 10:31:06 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id j14so1812476lfg.9
        for <linux-sparse@vger.kernel.org>; Mon, 13 Apr 2020 10:31:06 -0700 (PDT)
X-Received: by 2002:a19:240a:: with SMTP id k10mr11184805lfk.30.1586799065904;
 Mon, 13 Apr 2020 10:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200413161605.95900-1-luc.vanoostenryck@gmail.com> <20200413161605.95900-14-luc.vanoostenryck@gmail.com>
In-Reply-To: <20200413161605.95900-14-luc.vanoostenryck@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 13 Apr 2020 10:30:49 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiLAGGb=RLUQvAggvqf5tbAp1nUPyKUrimwy2BRAso69A@mail.gmail.com>
Message-ID: <CAHk-=wiLAGGb=RLUQvAggvqf5tbAp1nUPyKUrimwy2BRAso69A@mail.gmail.com>
Subject: Re: [PATCH 13/17] scope: let labels have their own scope
To:     Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, Apr 13, 2020 at 9:16 AM Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:
>
> One way of detecting gotos inside an statement expression
> is to use a new kind of scope for the gotos & labels.

Ack. This is a much better approach than trying to figure things out later.

Very nice.

               Linus

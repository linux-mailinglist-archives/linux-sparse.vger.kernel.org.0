Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE36BD579
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2019 01:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439140AbfIXX1I (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 24 Sep 2019 19:27:08 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46880 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438752AbfIXX1I (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 24 Sep 2019 19:27:08 -0400
Received: by mail-lf1-f65.google.com with SMTP id t8so2681026lfc.13
        for <linux-sparse@vger.kernel.org>; Tue, 24 Sep 2019 16:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EWx/4XUbdFzHbQNCWGS5jUVr95TVrJH7GenMmMv9gDE=;
        b=Hid3B0Dff87KSEQqCwFFGfaqO7LjpiHCMsFgX7x/nP0QLSnk/umo52zFonbMFyb4jX
         jyuuLBc0GKnXKgdDinN0DEC0aYkXseXdghotG+zP2Fg0fPWIbYVOPoSmSLiEhmLNajQU
         DwFJR0d8XS4zyFEcRHnBo0V0cjnm30Bb2HWCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EWx/4XUbdFzHbQNCWGS5jUVr95TVrJH7GenMmMv9gDE=;
        b=AKQqQtkG30uqnWzWvGv1Bc+i6t7WSoBhppWYmoVXbje9GVckim/vVEm1GFH3Fnpf1C
         qThS601LA/ja8gn7ZxY3UZtI16MIo6C+TGUyQ4P4+egCZoanNPJWna6/cx5vkA1e7yzN
         ivQPwMLSc2uUtEbjk63ue+ZZ4DunEhsGtb0wo6Kh76yUVHs3JKNckyJzSPo0YVQqjWtV
         YmhGuY/0LPA2z3H7jlcOYnIoy1toEQLbFELbC/dXO1Y7IFnTk8L5imUw+5AA1gaO+dD9
         kx/PCM/F2MwmZaAax0j0vUaiSu4Nb35sx8fcX4Epm6fQOo0RGvQv1gBUutMKE2CuxEn+
         ndHA==
X-Gm-Message-State: APjAAAXaWWpcbieQ/4v35Osxzoo6j5YoFvUjwfzzsPTSorXeVSvPTB3H
        oa9LDWbpBbVlaQHuz52IK0MQ+nheCFs=
X-Google-Smtp-Source: APXvYqysa24WMVMuJBMX3PNuz8irFzZ75yNCAkUIfJAe0Os1WVPfUaPgo3mW3MSFjaTPXkLRI94gNg==
X-Received: by 2002:a19:3f47:: with SMTP id m68mr3482683lfa.108.1569367625785;
        Tue, 24 Sep 2019 16:27:05 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id g27sm803569lja.33.2019.09.24.16.27.04
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Sep 2019 16:27:05 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id r22so2717710lfm.1
        for <linux-sparse@vger.kernel.org>; Tue, 24 Sep 2019 16:27:04 -0700 (PDT)
X-Received: by 2002:ac2:47f8:: with SMTP id b24mr3521686lfp.134.1569367624594;
 Tue, 24 Sep 2019 16:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiby96wPxF87Fdq=yPVpjBMv+okrAoQUgO+2eCYjWbqPA@mail.gmail.com>
 <20190924070852.GA24834@mwanda> <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
In-Reply-To: <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 24 Sep 2019 16:26:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgEV=+S+AzwqxDKfSuux6g1t8yHHtXuASnL+kXXJnE5iA@mail.gmail.com>
Message-ID: <CAHk-=wgEV=+S+AzwqxDKfSuux6g1t8yHHtXuASnL+kXXJnE5iA@mail.gmail.com>
Subject: Re: [PATCH] parse: Fix sign extension in casting enums
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Sep 24, 2019 at 4:23 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I _think- that should be the simpler correct
> fix, but I'll leave it to Luc to think about it more.

Side note: I don't think I've seen anything from Luc on the git list
since April, and the last commit is early April too. It may be that
sparse has lost its maintainer..

        Linus

Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681BE1E6EDB
	for <lists+linux-sparse@lfdr.de>; Fri, 29 May 2020 00:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437067AbgE1W0H (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 28 May 2020 18:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437062AbgE1WZ7 (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 28 May 2020 18:25:59 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A367C08C5C6
        for <linux-sparse@vger.kernel.org>; Thu, 28 May 2020 15:25:59 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q2so119006ljm.10
        for <linux-sparse@vger.kernel.org>; Thu, 28 May 2020 15:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o78G55oJ4Pohx8zepEiJ1EJRD/IXmPZynrXYV5rblhE=;
        b=gLsLUaGtc/YC8xXTDBW+QZrBeoIK1FCtamp8VyNzJQPiXL/vNbWaZpF9vAnmbR9gEE
         PEQuOxwevw/ZyizOM1lWXiX5Wy/QcE4z+RMcobIgjQiIpZg3UretT2VOaCt+Pt5QDKr9
         V81paWvFGSAgvkT7hWMNKyzF6DgBU0l7F3DY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o78G55oJ4Pohx8zepEiJ1EJRD/IXmPZynrXYV5rblhE=;
        b=lhVdwtp2sYR3LniabCp7gS29cgcCJjsJl+lVQeTPpKb0PoneeNmkzcbipqC6VsFFeR
         KIEJq4CkIDGxYo3GbYvKvXPy29bHQ631uo04Wf9flBP6FArB7ThFjsYER12ow8n64kLy
         FFkID19pg/sF7H061cUlGDSaADoTFVdDgtrNRiBVM0Sf/gwacsxXJQZCu0qKGrDIL+lm
         czg3bFER+x6wPnLMJwhmuvpaEIYaHkJBomsJwpR9W6GAG0SVwx2f/Tw7IEdu/jtKYXrW
         mA8hejQYlciNuvXIBSr+nFlZ9wPIWlF/cr/JkIDE0qQtabCkQ206ClqxqFIsVpleasWq
         fV+g==
X-Gm-Message-State: AOAM533TS1WcJg26iBw520DuKInvDD/ISd2L6n37lE2shRD2v/mlUYa1
        oWpUtwQ1OkrDqE4KnuPmF1jHWWLRndk=
X-Google-Smtp-Source: ABdhPJzBokNMYA4kww3RlJeuTpgPaxSR4O/VOUUKnG5jm8lmS5vQjY0BRsyYxYzchmY8tBK3UZA2eA==
X-Received: by 2002:a2e:8018:: with SMTP id j24mr2510359ljg.99.1590704757147;
        Thu, 28 May 2020 15:25:57 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id a16sm1651844ljh.111.2020.05.28.15.25.56
        for <linux-sparse@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 15:25:56 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 82so112151lfh.2
        for <linux-sparse@vger.kernel.org>; Thu, 28 May 2020 15:25:56 -0700 (PDT)
X-Received: by 2002:ac2:5a0a:: with SMTP id q10mr2809702lfn.142.1590704755924;
 Thu, 28 May 2020 15:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <bug-207959-200559@https.bugzilla.kernel.org/> <bug-207959-200559-nznJfyeqKD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207959-200559-nznJfyeqKD@https.bugzilla.kernel.org/>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 28 May 2020 15:25:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiKCXoeynr6am-B-_=XP=mQxtxREjP+q_zzMfe5CaeJeQ@mail.gmail.com>
Message-ID: <CAHk-=wiKCXoeynr6am-B-_=XP=mQxtxREjP+q_zzMfe5CaeJeQ@mail.gmail.com>
Subject: Re: [Bug 207959] Don't warn about the universal zero initializer for
 a structure with the 'designated_init' attribute.
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, May 28, 2020 at 2:24 PM <bugzilla-daemon@bugzilla.kernel.org> wrote:
>
> Well, that's really the point.
> The problem Sparse also gives the warnings corresponding to clang's -Wnonnull
> and my understanding is that these warnings are desired for the kernel even
> when coming from using '{ 0 }'.

In the kernel, the empty initializer is be the usual way to create a
zero initializer. So yes, { 0 } may exist, but it generally should be
used for initializing something that is known to be an integer. And if
it's a pointer, it should warn, because '0' should never have been a
valid pointer, traditional C or not.

It's not like we use pedantic and portable standard C to begin with.

So yeah, the sparse defaults may be a bit kernel-centric.

             Linus

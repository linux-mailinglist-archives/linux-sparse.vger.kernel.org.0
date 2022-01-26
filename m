Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 698E549CC83
	for <lists+linux-sparse@lfdr.de>; Wed, 26 Jan 2022 15:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242251AbiAZOkG (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 26 Jan 2022 09:40:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60783 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242202AbiAZOkF (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 26 Jan 2022 09:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643208005;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hqZ5S1prQcULJgjev4pMri/oRUOkdQMRX3yC6zfVtIg=;
        b=hNs0q2Z0TximkBB1XVshKnU1hfjHIbesIYizb2XA9iqE1JevkntJXHsSSjvwphrk2GEoZE
        1oNVHG1TRjJsXjVjmYa8B6SweF5bApEEe6Kcym2egOpwM//V8xvCjrV6AcDwfTBarWGwyL
        VGHIAwTMeeNxV0jFvNjWs3hxg8o/aSQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-8EahTpE3OrC-xqR0nFhczg-1; Wed, 26 Jan 2022 09:40:03 -0500
X-MC-Unique: 8EahTpE3OrC-xqR0nFhczg-1
Received: by mail-qk1-f200.google.com with SMTP id a134-20020ae9e88c000000b0047ebe47102dso5444927qkg.18
        for <linux-sparse@vger.kernel.org>; Wed, 26 Jan 2022 06:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hqZ5S1prQcULJgjev4pMri/oRUOkdQMRX3yC6zfVtIg=;
        b=6565UUFFPH4hBFizL6NPbGgYedjCvhroslOxNUVeiIdjr29mQ0SR913FXT+f/AzxGQ
         2IhrXpIey7N6f+s4WwwKcFzCdtODKkDiDIeNaX8M7RxPZV5CCYVI5uVwb/slhpdFozOZ
         SMnDPQL1gbAqaTqtu2lsi0kfODOQ12WZtYDSrVDMKY4Oisl3Qqa4hcUPC6Nymie/zLuO
         zVDAK3fbiWgBWwRi5nCy+4+Hps/ocTxHgRuQG+BbuxO+M158dTQiQBtXvxVlGP0QS3Nn
         KMrDskP8TNzspxqu3tWNaBjX7h4JKxs9SNNov+RWu5KF+ZLmgtBw2UhF9Yr+K/j//7/7
         xwEQ==
X-Gm-Message-State: AOAM5328SQjV7UqgSVZuN4dM8WYXoXba1PE/lNMDE9yditA6o2fyBsxL
        zXDPrEtDv2MNpAPqgzLjMH1M/WTAsG2H1XayuHZD7e0z/RGfAYXzxRAvvT/S4sypf+gs66JaCMM
        zbrCND9bhq7E9GmFBJ7BdRmo5z8iGt66ZLQOFBeDw
X-Received: by 2002:a05:6214:21ef:: with SMTP id p15mr17778180qvj.92.1643208003249;
        Wed, 26 Jan 2022 06:40:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyywkK5Wtoe5LXL+drsPdIe17bzNdMMNSpjrYtTkG1KAmitJKJB8fjznSP4WEioXe8AorW1rs112OFEWD2So/0=
X-Received: by 2002:a05:6214:21ef:: with SMTP id p15mr17778166qvj.92.1643208003014;
 Wed, 26 Jan 2022 06:40:03 -0800 (PST)
MIME-Version: 1.0
References: <202201221028.YKA8kSdm-lkp@intel.com> <CAK-6q+h_hb94J3DSXPk=E44kCxiwZ+BE3kMJe09iShRzMb=vzQ@mail.gmail.com>
 <91901e7b-7d82-116c-aaf2-c74c6a6b999c@infradead.org> <CAK-6q+j2jc3pBmbvQ-DCmxveC-UMV75SFc2nC1zwXKe9wm4YPg@mail.gmail.com>
 <20220124124530.GS1951@kadam> <CAK-6q+iZfY=FyOxJfS7cY7MqScs+nU=U3B4NnLnvcLH3fofuAg@mail.gmail.com>
 <CAK-6q+ga2zT2h4oY0=aCXFeU=oaFHbSXGzuVRptB8Hg-YKR7Gw@mail.gmail.com>
 <CAK-6q+jfA2k1TFrLqK4YN2vshgLidD=6r_CCV6df_VRFMFO7ag@mail.gmail.com>
 <20220124201417.GI4285@paulmck-ThinkPad-P17-Gen-1> <CAK-6q+gGx68Wx8mBJAdo0ygpBWPoHW+L+HD11U6UQSOjSXVP3w@mail.gmail.com>
 <20220124220628.GL4285@paulmck-ThinkPad-P17-Gen-1> <CAK-6q+j-3CWEvbFVqxd-_rc67VBZHBXPbGOo5QfGUb_KFEf_FA@mail.gmail.com>
In-Reply-To: <CAK-6q+j-3CWEvbFVqxd-_rc67VBZHBXPbGOo5QfGUb_KFEf_FA@mail.gmail.com>
From:   Alexander Aring <aahringo@redhat.com>
Date:   Wed, 26 Jan 2022 09:39:51 -0500
Message-ID: <CAK-6q+gye79SDL-zh6Uq_-oCa1gMELVi_riuqnBs-EPYfyNbow@mail.gmail.com>
Subject: Re: fs/dlm/midcomms.c:913:22: sparse: sparse: restricted __le32
 degrades to integer
To:     paulmck@kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org, David Teigland <teigland@redhat.com>,
        cluster-devel <cluster-devel@redhat.com>,
        linux-sparse@vger.kernel.org, rcu@vger.kernel.org
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=aahringo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

Hi,

On Tue, Jan 25, 2022 at 5:35 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Mon, Jan 24, 2022 at 5:14 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Mon, Jan 24, 2022 at 04:36:55PM -0500, Alexander Aring wrote:
> > > Hi,
> > >
> > > On Mon, Jan 24, 2022 at 3:23 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > >
> > > > On Mon, Jan 24, 2022 at 12:41:04PM -0500, Alexander Aring wrote:
> > > > > Hi,
> > > > >
> > > > > On Mon, Jan 24, 2022 at 12:36 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On Mon, Jan 24, 2022 at 12:21 PM Alexander Aring <aahringo@redhat.com> wrote:
> > > > > > >
> > > > > > > Hi,
> > > > > > >
> > > > > > > On Mon, Jan 24, 2022 at 7:46 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > > > > >
> > > > > > > > On Sun, Jan 23, 2022 at 01:41:52PM -0500, Alexander Aring wrote:
> > > > > > > > >
> > > > > > > > > I see also:
> > > > > > > > >
> > > > > > > > > fs/dlm/midcomms.c:213:1: sparse: sparse: symbol
> > > > > > > > > '__srcu_struct_nodes_srcu' was not declared. Should it be static?
> > > > > > > > >
> > > > > > > >
> > > > > > > > Why not just do this?  (Untested.  Maybe I don't understand?)
> > > > > > > >
> > > > > > > > diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
> > > > > > > > index cb1f4351e8ba..a164089abec4 100644
> > > > > > > > --- a/include/linux/srcutree.h
> > > > > > > > +++ b/include/linux/srcutree.h
> > > > > > > > @@ -121,7 +121,7 @@ struct srcu_struct {
> > > > > > > >  #ifdef MODULE
> > > > > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > > > > >         is_static struct srcu_struct name;                              \
> > > > > > > > -       struct srcu_struct * const __srcu_struct_##name                 \
> > > > > > > > +       is_static struct srcu_struct * const __srcu_struct_##name       \
> > > > > > > >                 __section("___srcu_struct_ptrs") = &name
> > > > > > > >  #else
> > > > > > > >  # define __DEFINE_SRCU(name, is_static)                                        \
> > > > > > > >
> > > > > > >
> > > > > > > I tried it and yes it will fix the issue and introduce another one
> > > > > > > about "is_static struct srcu_struct * const __srcu_struct_##name" is
> > > > > > > unused ("-Wunused-const-variable").
> > > > > > > I added a __maybe_unused after the introduced is_static and it seems
> > > > > > > to fix the introduced issue, now it compiles and sparse is happy. I am
> > > > > > > not sure if this is the right fix?
> > > > > >
> > > > > > it is obviously unused, but it has something to do with
> > > > > > "__section("___srcu_struct_ptrs")" and during module loading it, I
> > > > > > suppose, srcu tries to access it to find whatever needs to be
> > > > > > registered?
> > > > >
> > > > > Sorry, but if this is true then it can't be declared as static... and
> > > > > we are at the beginning again.
> > > >
> > > > Welcome to my world!!!  ;-)
> > > >
> > > > More seriously, thank you for chasing this down.  But would it work to
> > > > add a declaration just before?
> > > >
> > >
> > > only if I add an "extern" in front of the declaration before, so it looks like:
> > >
> > > extern struct srcu_struct * const __srcu_struct_##name;
> > >
> > > (compile and sparse tested only)
> >
> > If that works for everyone, it seems worth persuing.
> >
> > One way to test this is as follows:
> >
> > 1.      Build a kernel with CONFIG_RCU_TORTURE_TEST=m.  Boot this and
> >         type "modprobe rcutorture torture_type=srcu".
> >
> >         If you want to stop the torture test, type "rmmod rcutorture".
> >
> >         This will test DEFINE_SRCU() for the module case.
> >
>
> I tested this case, I still need to do the 2. case. Sorry I am quite
> busy with something else, but I am still working on it.
>

I did the 2. test successful...:
"tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 3
--configs 'SRCU-N' --trust-make"
but I was required to hack it because my "qemu-system-x86_64" did not
exist, it was "/usr/libexec/qemu-kvm" (it was able to run by just
doing a symlink). I think I already cc'd the right people to report
this issue (rcu subsystem)...

I will send a patch for the export declaration soon as possible.

- Alex


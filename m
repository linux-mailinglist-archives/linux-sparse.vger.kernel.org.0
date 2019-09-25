Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53CC3BD5C0
	for <lists+linux-sparse@lfdr.de>; Wed, 25 Sep 2019 02:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389656AbfIYAcu (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 24 Sep 2019 20:32:50 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46020 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388529AbfIYAcu (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 24 Sep 2019 20:32:50 -0400
Received: by mail-wr1-f65.google.com with SMTP id r5so4101829wrm.12
        for <linux-sparse@vger.kernel.org>; Tue, 24 Sep 2019 17:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BrYOfv9eIe+12nhL+Pd7gILvH0fD9hC58lNNrO6Sn7A=;
        b=Z6NTVu7r4Dr5FA7QaPsQkYzXGh5zY8IEEPTdERcyEuGJAZh8KLzkpJ97fymheNxImX
         V30MuxkyHMkxpSMcWLx+oPaGDWq40ESjqJgTwOTMDQlTkNztoW0Yey2pnd4l81xuwW/b
         z5cyX/cvZd8Er+5zGKxSHdIJRigign6lvRFlsHhd29REtyhuqLQj0CFzpchDMW7HRplQ
         D3jVj55k2FSw3JvWak/XT1pDeyDKp+UnHbDyuzCDKO8MW/x1ysJQtY37qbx6A7+qogDv
         OVhXrGLZfezNsUsZfcbZ26qLIN+kPiH5G7PnHUnWSRetYgrTyXxKCxIx4brH7LQDa4Rf
         nbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BrYOfv9eIe+12nhL+Pd7gILvH0fD9hC58lNNrO6Sn7A=;
        b=KaoNKXapBhMSxV0DGuqmjfnpmmCZna+qMby7yuIWa89bmMSGUGwvt+JdslV2tSW/u5
         jPIXUVT3YV38l/kYZ9fcjlJTHMYFc8smJJumwjqmuwUCDFG3EO2PevfD4qk816g9EHtu
         AOWf5MEqLAwj2vkSL3Uikzm2acxH7AXJ3GC/d/RanAIxNhdBnnvJDENbI1m9h1LBvTaE
         /m4tmPpGIeUuJp/Rr7w+2CrdZsuOjUUyyNpc9ycS4/uSSR87hBXc/1eClJlqJlrj05V/
         45SeBw9an+ZTqZOFHZKYIrB7L8twdvKODSxvBv9orvo5jh+PbZeg10HzdfWUat+3I/gO
         lmTg==
X-Gm-Message-State: APjAAAWFyvd9OxL4LMS2kQ1GdD068I7/yCF6HUxxyuNjYx/wkbIwH7vW
        y8FKaJ/HY/ry6le3gSYRHXU=
X-Google-Smtp-Source: APXvYqz8gG+Nf1WuasDDI9+dRagFwaBg6iQ+q2O8/tfQ3FjKMLp2K/5SzF5Ml0PknW8hMdRmfqge8Q==
X-Received: by 2002:a05:6000:188:: with SMTP id p8mr5701306wrx.220.1569371568470;
        Tue, 24 Sep 2019 17:32:48 -0700 (PDT)
Received: from desk.local ([91.177.171.57])
        by smtp.gmail.com with ESMTPSA id z65sm665239ede.86.2019.09.24.17.32.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 17:32:48 -0700 (PDT)
Date:   Wed, 25 Sep 2019 02:32:47 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] parse: Fix sign extension in casting enums
Message-ID: <20190925003246.7j4sffxf62a4qkkm@desk.local>
References: <CAHk-=wiby96wPxF87Fdq=yPVpjBMv+okrAoQUgO+2eCYjWbqPA@mail.gmail.com>
 <20190924070852.GA24834@mwanda>
 <CAHk-=wgpzse8AOSLS39GC4-qc0BSMPKtd_ehkjpWg4SSd_pykw@mail.gmail.com>
 <CAHk-=wgEV=+S+AzwqxDKfSuux6g1t8yHHtXuASnL+kXXJnE5iA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgEV=+S+AzwqxDKfSuux6g1t8yHHtXuASnL+kXXJnE5iA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Tue, Sep 24, 2019 at 04:26:48PM -0700, Linus Torvalds wrote:
> On Tue, Sep 24, 2019 at 4:23 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I _think- that should be the simpler correct
> > fix, but I'll leave it to Luc to think about it more.
> 
> Side note: I don't think I've seen anything from Luc on the git list
> since April, and the last commit is early April too. It may be that
> sparse has lost its maintainer..

Sorry, I just had some issues and I'm stil catching up.

-- Luc

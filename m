Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDCC1DA35D
	for <lists+linux-sparse@lfdr.de>; Tue, 19 May 2020 23:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726304AbgESVQm (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 19 May 2020 17:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgESVQl (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 19 May 2020 17:16:41 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83016C08C5C0
        for <linux-sparse@vger.kernel.org>; Tue, 19 May 2020 14:16:41 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id f13so645602wmc.5
        for <linux-sparse@vger.kernel.org>; Tue, 19 May 2020 14:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=USTYOqR4vhpfNtB5L2L+Z2oXDbViSTfEAISoFcynu0I=;
        b=ZRU7nl9579+zPah8C7BBMM/Ik/gHsH7sEAWglG6TgjUTdc+YcWJOpeOgSt4VoRvi8/
         Zybp6YfK/3VPjK2gu8l34k1aplGlhxihgyf49tD7oBKNKZwwWEy6kO3Zz6LYoN59vwEf
         UucKlXA3hlrbdk1l7S70K0yXEOM1YpKGLqXK5jGu4fujK3Z1QONPCW7HPRgUu+TyImsX
         OIWKDIv+Hsj0k6V+m6q87Niuoj27tLehbEF3ryjbi1lksNWlI2kdgOGcPFrUfxV9UPw2
         4N1Fry0KfcoPD+y9HM+iKHSLRtq2PYK/nMSWy+NT5VvqEvw1oRqvmFCOwKP9w4L8oJFM
         CKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=USTYOqR4vhpfNtB5L2L+Z2oXDbViSTfEAISoFcynu0I=;
        b=lh/SmIWvBG3wkncoFuUAG0nl99nGLlLiF/1LIREJqEJDGf48niimijKSVhhmPhzxEO
         BkTj9e/vBuf7pnDfIoZv3FcGx7x8aUBKsSzJJv7xjqjYG7G68zrmfuCUs5fm1QEjYQSp
         DpneMn9x6jpeAxPIh1dHDF5g82QTpQehb2QOyqNg8jLZMDe3tBkyITLVgL9s968MH9sL
         o9BhQCPnhrZVYXPKA6KqV2jLBxBq/f8zhrEq9pLMkM0ETBjsT0Ly8wBWlM8b3vKsOvz+
         9a3FbIzSFR5MzB3rGHX0i8hm+7bPg+ENzeCBL5M9+nDAeCOZFLqHeUfegCvSf7ZVK1ds
         ewMA==
X-Gm-Message-State: AOAM530KC2KUR8Ar05kxmxUPKf+BO4d3yrmkw3ugRM99vU+1S3n5Mu7I
        LEeTaIp1F37SuEGRMiWr1SRhsGRK
X-Google-Smtp-Source: ABdhPJxd4DS43qY3aGwPc98UenRVrVZOg78vgnoORqC6aLJL9AC5OSV4jtV9WR7ZGJElUc+zu1kyuQ==
X-Received: by 2002:a7b:ce08:: with SMTP id m8mr1235916wmc.97.1589923000237;
        Tue, 19 May 2020 14:16:40 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:d8cf:13ec:5b9:8f3c])
        by smtp.gmail.com with ESMTPSA id 81sm1033298wme.16.2020.05.19.14.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 14:16:38 -0700 (PDT)
Date:   Tue, 19 May 2020 23:16:37 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [SPARSE v2 00/28] detect invalid branches
Message-ID: <20200519211637.4hjorseu675acihh@ltop.local>
References: <20200519005728.84594-1-luc.vanoostenryck@gmail.com>
 <CAHk-=wiaZgBKwC2-ku3UeV4Rdv=tPcKLAfjy96PbJSntcLBWHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiaZgBKwC2-ku3UeV4Rdv=tPcKLAfjy96PbJSntcLBWHw@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Mon, May 18, 2020 at 06:41:07PM -0700, Linus Torvalds wrote:
> On Mon, May 18, 2020 at 5:57 PM Luc Van Oostenryck
> <luc.vanoostenryck@gmail.com> wrote:
> >
> > The goals of the patches in this series are:
> > *) to detect such gotos at evaluation time;
> > *) issue a sensible error message;
> > *) avoid the linearization of functions with invalid gotos.
> 
> Ack. Apart from that one question I had, which I didn't actually
> verify whether it was a problem for the insane test-case I posted.
> 
> I only _read_ the patches, I didn't actually apply and test them in any way.

Sure, I understand that very well. I tend to give to this kind of
series a decent amount of testing and its mostly fully automatic
anyway (and, I think, the tests cover well most situations),
but having another eye and another opinion on the patches is very
much appreciated.

-- Luc

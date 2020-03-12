Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30B07183944
	for <lists+linux-sparse@lfdr.de>; Thu, 12 Mar 2020 20:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgCLTNA (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 12 Mar 2020 15:13:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51202 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLTNA (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 12 Mar 2020 15:13:00 -0400
Received: by mail-wm1-f68.google.com with SMTP id a132so7354747wme.1
        for <linux-sparse@vger.kernel.org>; Thu, 12 Mar 2020 12:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v+WJlp3xyfJjsG48xuEHSue+kaniZuVstZmenk9Yxq0=;
        b=mlziLp3OyBdgrDgr6grGArLniSy1gvK+4SR8TZyUAn5mKjAfgPQ7LKT2PSpBtWjlbu
         7de2noTkecYy8THw06g3c4LI5j3/yeebkmHnGBcz9bKR26PrKCDf/6fKCT+VjJk8Ewl8
         bhnXCidozOHW9aXDoZjTXzMr/r/2IZu8bkHyhSCHJJNp9ykkrNsQlrBB6gFstwNZtUJ2
         Abi3rICQQfmYzgS/MsgBR14bI3r0sU+SJcPEEFvFhpzcJzazUShwjo+Kfm3RN8b2pvvk
         Fj64Ze6GyKW+n7Y5w3I7L+xmOoA1z/Esso28NlOUoKE5XOrvQMl5eNnGMBIsY2tSCsth
         HZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v+WJlp3xyfJjsG48xuEHSue+kaniZuVstZmenk9Yxq0=;
        b=QihpM/UvS6IwcLW5J7Md7nrBPyS5qvw1UvWsXNVJiaYoFAEGp4+Sfvynxb96uC9zK0
         EkMsevuEpjyyVRdtwd5kzZ9JWtRuIVOXgUTxZfsEHwelTMmCsJ45Oi2Jca5GlwETNuuP
         erg/+DZaWgsg6FUtnF/2mzBnJNXLVyFa/Qx99qTLZ2286QXMVg8jkZjkt0KIihA1GX6C
         YR1kqzgxWvj9cwKRUYoVhwsPgyMSI8+fXSlJmkkYkksA+egmlZOoMcPc4xtAfkMqiH0O
         dX+iuGrjTwOt+MeaQejW+yGYJ3SI1NoneB25NztuXi/Q8nyAXemQ2ZM7fyNm3Xq3btdU
         QwQw==
X-Gm-Message-State: ANhLgQ0oIIkO9c33x8WuWRI79rpEsY2POni8pylipenKOaQ2GpfdCRo3
        AuXNW4/deimHLDE75uES48zGdO7O
X-Google-Smtp-Source: ADFU+vuvBcc7YKFgKGfh2U5g9xGnP7MYUD+XdNxcU6bO6RM59lD0zxraNDlL6e3eUjhwcy52wQFWUw==
X-Received: by 2002:a1c:2856:: with SMTP id o83mr6070583wmo.157.1584040378292;
        Thu, 12 Mar 2020 12:12:58 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4075:2100:dce0:d823:c691:d081])
        by smtp.gmail.com with ESMTPSA id r12sm22034712wrx.26.2020.03.12.12.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:12:57 -0700 (PDT)
Date:   Thu, 12 Mar 2020 20:12:55 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Oleg Nesterov <oleg@redhat.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] introduce Wdirective_within_macro
Message-ID: <20200312191255.j7ifliuaqmuq3us4@ltop.local>
References: <20200312150909.GA3403@redhat.com>
 <CAHk-=wiNPBt4wNkfgSd_utshPkjqQv-z7cg5iCji2jbFAUrLkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiNPBt4wNkfgSd_utshPkjqQv-z7cg5iCji2jbFAUrLkg@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Mar 12, 2020 at 11:24:06AM -0700, Linus Torvalds wrote:
> On Thu, Mar 12, 2020 at 8:09 AM Oleg Nesterov <oleg@redhat.com> wrote:
> >
> > When used on linux kernel, sparse issues a lot of "directive in macro's
> > argument list" errors, "#if" within a macro invocation is widely used in
> > the kernel code.
> 
> Ack. Downgrading to a warning is a good thing anyway.
> 
> I'd even be ok with making the default be "don't warn", and enable
> warnings only if explicitly asked for, or perhaps with "pedantic" (not
> that I think sparse cares about pedantic right now).

*nod*
 
> Yes, it's undefined behavior. But sparse does the right thing, and
> it's the better thing to do. And it's not like we're necessarily
> always particularly pedantic about some other cases.
> 
> Now, the example where somebody _redefined_ a macro inside the macro
> expansion, that's a different thing. That's just crazy. Maybe we could
> make that "directive in macro argument list" thing be a more nuanced
> flag?

Yes, it's what I was thinking too. The #if*/#elif/#else/#endif should be
perfectly safe here. A redefine is indeed crazy, same for a self-#undef
IMO (even if its meaning is better defined and I think it would need a
small change with sym->expansion), #include could make some sense
but probably should be avoided too, like the other directives.

-- Luc

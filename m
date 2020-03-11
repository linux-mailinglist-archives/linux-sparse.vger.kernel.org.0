Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABA1D181ED5
	for <lists+linux-sparse@lfdr.de>; Wed, 11 Mar 2020 18:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730100AbgCKRMB (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Wed, 11 Mar 2020 13:12:01 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33412 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729675AbgCKRMB (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Wed, 11 Mar 2020 13:12:01 -0400
Received: by mail-wm1-f67.google.com with SMTP id r7so3632575wmg.0
        for <linux-sparse@vger.kernel.org>; Wed, 11 Mar 2020 10:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=f4nmOuD1uPwPuXGzx3/52FMlIb4oBFiO2uobTYSlChk=;
        b=FZ5NCb+d13ho/MH0VVBohQxLdiooEINij5DXnlOrPLLQJ6qxU9u6YG67FXX+MscWui
         GsOpMsH4THwQQBQ3xZLhdva2Yjk358/QJ4UNNIwa5O75dtM8FpNA+TkbMjQiXU4GM+di
         szj/R324ZNORuDfYIvr/kFZ31jRdlg2pTCuwq7e32PF6kitnVER41hVNa06+pOf9Cqnq
         B/Sblsn3jrsrUD7mJHMr1+zG4U4VEekN8fZLG83nKrCSj5rIQcKbhJVDibNZin3Fzhql
         WMPCYQGPncRKX4gIUf52vMCS11OB+E/XEwdVf+wrJw9DsPUdmj+BOPRikl8LGHD0AUOy
         jZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f4nmOuD1uPwPuXGzx3/52FMlIb4oBFiO2uobTYSlChk=;
        b=oIi87KL6NQX46NpbY3oblb6lIW/26aERJx9zpuyVqIJS4YuXwnKBz9svPH3Adq07wt
         LsksirYDG+HOCxR5lx7ik5ug+UI1267mg0qcSeeOQgHCoNuj04AR2UMMSyMNhl44vxh/
         LDxU+g80BBfZM0ilA6x7frbHSJuAfTUhVDDYQVPKBaXBg1Teh3z3c8tMg3B59AdRg3qL
         fdoRaPsPatDaGuQQdUQdK+8eebXMFevg1HPOIfjyyHPU12IHa/scuNbVogZ4JqREayhL
         VtupU2L9ahqz/34KML/9D+20spkPJuV4Bh8NHCtRDNU6aORaaQk7uwZT59L7xXb3cYJh
         dntg==
X-Gm-Message-State: ANhLgQ1CcCirtD7Zcyi4O+CI3BKDx321xzRgX/dBuZpjYEYDq/td0GSe
        BZQwE48y9z/CK8kzL3+ZuPzEYdm0
X-Google-Smtp-Source: ADFU+vtuGiBAyjL2qusVySKw4QPl4zt+UozhzO4GxGTuNj9/GPYfwIvvVUlKl+z/CaEGMNRFXGtAOA==
X-Received: by 2002:a05:600c:2f01:: with SMTP id r1mr4621202wmn.31.1583946719626;
        Wed, 11 Mar 2020 10:11:59 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:4075:2100:f42e:1199:6e9e:3f3])
        by smtp.gmail.com with ESMTPSA id c8sm62764372wru.7.2020.03.11.10.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 10:11:58 -0700 (PDT)
Date:   Wed, 11 Mar 2020 18:11:57 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] Add symantic index utility
Message-ID: <20200311171157.fhpuwphwfn3ek7wm@ltop.local>
References: <20200309152509.6707-1-gladkov.alexey@gmail.com>
 <20200309223701.dbnej7esb4qp56bm@ltop.local>
 <20200310150713.GB19012@redhat.com>
 <20200311090745.GD11561@kadam>
 <20200311113351.GA19327@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311113351.GA19327@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Mar 11, 2020 at 12:33:52PM +0100, Oleg Nesterov wrote:
> and just in case... there are other cases when GCC and sparse differ,
> 
> 	if, within a macro invocation, that macro is redefined, then the new
> 	definition takes effect in time for argument pre-expansion, but the
> 	original definition is still used for argument replacement. Here is a
> 	pathological example:
> 
> 		#define f(x) x x
> 		f (1
> 		#undef f
> 		#define f 2
> 		f)
> 
> 	which expands to
> 
> 		1 2 1 2
> 
> ./sparse -E outputs
> 
> 	/tmp/M.c:3:1: error: directive in macro's argument list
> 	/tmp/M.c:4:1: error: directive in macro's argument list
> 	2

Not much, indeed. But I see that sparse & gcc differ also in the
non-erroneous case:
	#define f(x) x x
	f(1
	2)

(Sparse adds newlines after the 1s) but it seems easy to solve.

-- Luc

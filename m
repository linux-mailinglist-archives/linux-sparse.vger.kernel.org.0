Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 088E7154C9F
	for <lists+linux-sparse@lfdr.de>; Thu,  6 Feb 2020 21:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgBFUGO (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 6 Feb 2020 15:06:14 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38079 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbgBFUGO (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 6 Feb 2020 15:06:14 -0500
Received: by mail-wm1-f67.google.com with SMTP id a9so189165wmj.3
        for <linux-sparse@vger.kernel.org>; Thu, 06 Feb 2020 12:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UQRocQ0/Lv6Jc3lHcSl9NZ/ctg1h8+3qrZ6bLpSmlJk=;
        b=phFb/poFQjywCv3gn6ymhV/+45w7IqnFj0XpYCzABaul/RKvfAItpZLsnS4ZmkXfi9
         iwKowmMNlMkug7Zb0JKmJQk1B+j97kfiqOBN8imLjeHahufrZuAF2GtXfopVGpIveYum
         QZYKEoofuDdSyXeuqcFm7gW7ZEyCmgJ3ktrfsVp3EdUcnVISQPQEltb22rcS6O64lIHx
         DcWxXiaL+nm4pg4eJjG3EFXmceevJ0hT6Rzhx/cuBfaIFHAxt+BXclqU68nqbb7jDRfu
         03XjwdwiYYYZiQTnw7NsEaVziCd3tpwaPtJsCnR1GNNPdK9ln1Br2act0KxGBpd+fFIn
         LX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UQRocQ0/Lv6Jc3lHcSl9NZ/ctg1h8+3qrZ6bLpSmlJk=;
        b=BWagUfLoWfjZQ63b2EE/LhMXWV1twojZXCoJ7KT+OqWNbKLZiCwFuppLMwOoopusTf
         nS2yHpyN0BecyPB7buaWjox2gEKwx9HoM8561wuuh1C26YPUE+i6eG8zMdGn1oWi3iYa
         rKMlCKdh2/0yFfn+5OgQPoF7lkR7U5zrp4oWFjXp2eCqs6kiFEItwhSMdv0xTifFtc9i
         4QfRtPftxF4yrEIDegIe70RT4/64M/3fq6ap1eV9ZIeaMnMY6VCJRwmL4ux29Wqn488i
         ftY1OR6Slab5SAy5eO4ywTPxy2IGGADI7vjaBA1oYkKTl9DXxIF2negINjYY5TUOgTkP
         tYOg==
X-Gm-Message-State: APjAAAXjEhgFA/sPdknNyPRwkixBDsZg0OaA0LXDJeZjLRujEpC/VYCx
        SNpkM4w4dwaSIh5kmHsomIHgNn85EiA=
X-Google-Smtp-Source: APXvYqzUMxBBaIhl+3bSUvvFED5qRPY1DpOqDKzyWwjCOK8XiN7dVvc/7i2LdFcbM3cWlfxu9DF1ng==
X-Received: by 2002:a05:600c:218b:: with SMTP id e11mr6467972wme.56.1581019572560;
        Thu, 06 Feb 2020 12:06:12 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:7c4c:6743:ca73:a9e5])
        by smtp.gmail.com with ESMTPSA id c9sm409985wrq.44.2020.02.06.12.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:06:11 -0800 (PST)
Date:   Thu, 6 Feb 2020 21:06:10 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Arthur Fabre <afabre@cloudflare.com>
Subject: Re: sparse problem with Linux kernel v5.5
Message-ID: <20200206200610.7ktqp2yzriw7zurx@ltop.local>
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
 <20200206114619.bfszxgs6jmdgroo6@ltop.local>
 <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Feb 06, 2020 at 10:25:39AM -0800, Randy Dunlap wrote:
> 
> All of the oom-killer instances list sphinx-build as running, and I often
> have OOM problems using it (make htmldocs), so that may be a factor.
> 
> This morning sparse is handling bpf_sk_storage.c OK (no sphinx-build running).

OK, make sense.
However, I thought that the 5+seconds of runtime with 2.9Gb of memory
consumption I reported earlier was somehow excessive. So, I looked
at the preprocessed file and my editor (and several other tools) chocked
near the end ... It appears that one line is 2.8Mb on a total of 6.2MB
and contains 28968 times the expression for num_possible_cpus().

The origin of this is situted at line 647:
	smap->bucket_log = max_t(u32, 1, ilog2(roundup_pow_of_two(...));
because ilog2() is an 'interesting' macro which is already expanded
inside roundup_pow_of_two().

This exists since the introduction of this file in commit
    6ac99e8f23d4 bpf: Introduce bpf sk local storage
but back then it made sparse consume only about 500Mb of memory on it.
Use of the macro max_t make things even worse in commit 
    85749218e3a6 ("bpf: Fix out of bounds memory access in bpf_sk_storage")

To illustrate the situation, the following patch cuts sparse memory consumption
down to 109Mb in 0.3s:

diff --git a/net/core/bpf_sk_storage.c b/net/core/bpf_sk_storage.c
index 458be6b3eda9..bdf4a1a256c3 100644
--- a/net/core/bpf_sk_storage.c
+++ b/net/core/bpf_sk_storage.c
@@ -644,7 +644,7 @@ static struct bpf_map *bpf_sk_storage_map_alloc(union bpf_attr *attr)
 	bpf_map_init_from_attr(&smap->map, attr);
 
 	/* Use at least 2 buckets, select_bucket() is undefined behavior with 1 bucket */
-	smap->bucket_log = max_t(u32, 1, ilog2(roundup_pow_of_two(num_possible_cpus())));
+	smap->bucket_log = max_t(u32, 1, ilog2(__roundup_pow_of_two(num_possible_cpus())));
 	nbuckets = 1U << smap->bucket_log;
 	cost = sizeof(*smap->buckets) * nbuckets + sizeof(*smap);
 

but a better patch should, I think, directly use ilog2() and avoid the roundup.

Cheers,
-- Luc

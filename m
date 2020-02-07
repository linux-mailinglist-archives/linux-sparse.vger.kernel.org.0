Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8146B1555D2
	for <lists+linux-sparse@lfdr.de>; Fri,  7 Feb 2020 11:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgBGKfw (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Fri, 7 Feb 2020 05:35:52 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40207 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgBGKfw (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Fri, 7 Feb 2020 05:35:52 -0500
Received: by mail-wr1-f65.google.com with SMTP id t3so2025370wru.7
        for <linux-sparse@vger.kernel.org>; Fri, 07 Feb 2020 02:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ojFggppHKuyBlWTTAe10/XThvVo9CVVhWuTWB/QFpV4=;
        b=LzaJUPU8p3Suz5riwCcA9bDYDLLyzJmdAndRAdhY7qY/lsLCZT/UQjyPUxFflAMBxM
         jTVZTuN6fKdJfS65tM7GKubQ1D1gXTIwLRIhCVrHl/FQHAhOd1wMBpHmH4dbm0GVhuNU
         E92lBJqIbaH+FVGF5j7AEqgVH+eZ4qRKRgf8MvuuW/15TMUpZoaHmz9s3YgttqG8gqXd
         pon9ACd6xUTSXWlldZpWQNLO6RGaw2OFNZxZlSW0SB1HJhEHgnyLOtoC1C5depTem9Q2
         WlkMLMce4DJLqMb0zp9s6TQflImORzqhtIAIk/jabWc2IIlmT7AO6YgS2OPQ4lAC4Y84
         UuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ojFggppHKuyBlWTTAe10/XThvVo9CVVhWuTWB/QFpV4=;
        b=A8dIQfcaqpLWYKWoFLNyGDhxpbNbeLteyQBToWqnnIXdAJE8m+Jm02V54ai7OW33My
         UVXgnm9KP0bmL3hGVgcUUxM0+yKzI/kX+URUGonjKHoKqkKavfZZzsK/neFgAQ66qYap
         YGBvIU9MFLgiWQLG2XzDJt7PkEW7/Fl3pk5duKsvnvqsYDuKhhp+485D7fwxApJQc/zW
         CjVusBLdzZ5YfCl3XyMRJNZ30e8aDPBZZC/96ZUqigniQ9vVxFol/Qaz4e/zIiBWHMba
         0otdsELy9gmZMhfXXAm68WaEv+DaUbsjUdJ6q5cLTwDz1ZnEEYSkMJqGvhMvbQ2nxr5k
         xuQQ==
X-Gm-Message-State: APjAAAVW5/ujY5j+pl5Spdd6j40TfLg8zDtjsjuNabqWuVFW35eJSl2Q
        2EfHbSbfmnEjnsH0LUjs/nE=
X-Google-Smtp-Source: APXvYqzweNeaIbjzJ0ubjkkHkWaysC1JnuIoxQHnWN2LehtYBXqcU18sx+iI+0Vj3nk6o8LtYT7cJw==
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr3754609wrv.291.1581071750733;
        Fri, 07 Feb 2020 02:35:50 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:7c4c:6743:ca73:a9e5])
        by smtp.gmail.com with ESMTPSA id l17sm2766748wro.77.2020.02.07.02.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2020 02:35:50 -0800 (PST)
Date:   Fri, 7 Feb 2020 11:35:49 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Martin KaFai Lau <kafai@fb.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux-Sparse <linux-sparse@vger.kernel.org>,
        Arthur Fabre <afabre@cloudflare.com>
Subject: Re: sparse problem with Linux kernel v5.5
Message-ID: <20200207103549.lhfxdi6e57v7cvor@ltop.local>
References: <6ee65b69-9ffc-78c6-66b7-3ce586687d74@infradead.org>
 <CAHk-=wgQM29j0BJ-b0fTfwA9nc_fiS09Mi2oO8hX34oRxR6+xA@mail.gmail.com>
 <20200206114619.bfszxgs6jmdgroo6@ltop.local>
 <3b68ba4b-f16a-8404-4e07-27788ebbfce3@infradead.org>
 <20200206200610.7ktqp2yzriw7zurx@ltop.local>
 <CAHk-=whEFcgPW8oD=rGGyDiML_7AaCP0DGdW=WXjvF9zAv6Vrg@mail.gmail.com>
 <20200207003434.klmw4vuwbrkv7ykt@kafai-mbp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207003434.klmw4vuwbrkv7ykt@kafai-mbp>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Feb 06, 2020 at 04:34:34PM -0800, Martin KaFai Lau wrote:
> On Thu, Feb 06, 2020 at 03:47:21PM -0800, Linus Torvalds wrote:
> > 
> > Instead, it could just calculate the nbuckets first, and then do the
> > "log2()" on that:
> > 
> >         /* Use at least 2 buckets, select_bucket() is undefined
> > behavior with 1 bucket */
> >         nbuckets = max_t(u32, 2, roundup_pow_of_two(num_possible_cpus()));
> >         smap->bucket_log = ilog2(buckets);
> > 
> > because honestly, that is just a whole lot more legible anyway. Maybe
> > even split _that_ up, and have the max_t as a separate thing.
> Thanks for the suggestion.  I can post a patch for this.

There is also order_base_2() which,  I think, does exactly what you
need and shouldn't have the current problem.

-- Luc 

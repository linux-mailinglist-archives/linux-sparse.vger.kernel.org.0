Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6C710A7E4
	for <lists+linux-sparse@lfdr.de>; Wed, 27 Nov 2019 02:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725851AbfK0BUv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Tue, 26 Nov 2019 20:20:51 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46558 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfK0BUv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Tue, 26 Nov 2019 20:20:51 -0500
Received: by mail-wr1-f67.google.com with SMTP id z7so21284973wrl.13
        for <linux-sparse@vger.kernel.org>; Tue, 26 Nov 2019 17:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5l5HxjNlxXIknDbAaVn1eIdvvaNWFu4b4ZyzJI/GCGQ=;
        b=TXgKd5HeBSbVudvjPETNGEaWOLTujuBVw9G2/S0jKN8h4DpkyEBPpdqKlhoF6SgWAC
         JQIIC3s4YLWBKmxCkwlyP/j2ucLESLGJ+wZf911h2i4+vCzM4DECy0GZb45MKEiIV00I
         vkKE4lNu6zkhr8T3aHCNhfguuv1FoDhhlWzrtw06nfpyg34D0aCBz0HD9F/3uTtm4rUR
         uakjh8tYQSM3gTncYdE7NX/czEHgcWdyh5EIgUSTJTukM/8oXaGkrAQEhASf5Wb4tkQW
         2DlgR8WWRIFRQeiG8Ttwe2PZzp5iUiWEJYy0a3Zu7O18mNFGzlpsvs6XKJCQ7x9rA507
         DHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5l5HxjNlxXIknDbAaVn1eIdvvaNWFu4b4ZyzJI/GCGQ=;
        b=FS7emgk1Onr+Rs2LZ7zzaF6+lpPeKy5V5Iq6dH0/gifZO5v6AhnC+eZKaZAo9ZpftD
         w0NicmByWsXAg1TRpSNze+ws9KRK3OFs6cZ7R+b2agtJtDqVHy4NUdepq1XdlWYEC82q
         hNge1Ehfhvc5Y0iQs7YTBo4L5H3vnUkmObmJHM/+puVNrtIs21HMotUPKR3YZT4NMDTa
         IP5N+y2b1C2hwPXChu+Uv2lpIi0vcAxTZT+tGPOoCGwK2JJM8bs4yr2+H4ZSNQSQQrAn
         UfM2jtFq24U3brr2LJNpc9LVOycx1Gi2eqIYw4jYlOJbx9UAmS3DgicMXvQF+t8Fzw7x
         1t/A==
X-Gm-Message-State: APjAAAXCzBXUSgv67C6cjlzYPTU3qYvpGnZqJhDGEegMYcV1Xh5Ypfv8
        Izx8kg1NJn8NOWZa3TUDZAVF0v8v
X-Google-Smtp-Source: APXvYqy5JYh+jqkRZIWjU6AzXyPuAVh82JbcMfcq8Kt5bv/8DTfAM/8UMD5fxhw341W5Neq85LYxEg==
X-Received: by 2002:a5d:55c8:: with SMTP id i8mr1896192wrw.352.1574817648929;
        Tue, 26 Nov 2019 17:20:48 -0800 (PST)
Received: from ltop.local ([2a02:a03f:404e:f500:ac14:4c10:6104:457f])
        by smtp.gmail.com with ESMTPSA id d14sm3975597wru.9.2019.11.26.17.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 17:20:48 -0800 (PST)
Date:   Wed, 27 Nov 2019 02:20:46 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] spec: replace lllong_ctype by int128_ctype
Message-ID: <20191127012046.lkfjejpcuri3vtc7@ltop.local>
References: <20191126203029.63676-1-luc.vanoostenryck@gmail.com>
 <015e3edd-3eba-2e02-13e6-d88d879f45f0@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <015e3edd-3eba-2e02-13e6-d88d879f45f0@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Wed, Nov 27, 2019 at 12:21:01AM +0000, Ramsay Jones wrote:
> 
> 
> On 26/11/2019 20:30, Luc Van Oostenryck wrote:
> > Sparse knows about __int128_t, __uint128_t & __int128.
> > 
> > However, internally, these types are treated as a kind of 128-bit
> > 'long long long' type. It's mainly a question of variable naming,
> > but these types are also displayed by show_typename() as
> > 'long long long' which can't be parsed back, neither by GCC,
> > nor even  by sparse itself.
> > 
> > So, rename the variables to use 'int128' and let show_typename()
> > display these types as '[signed|unsigned] __int128'.
> > 
> > Reported-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
> > Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
> 
> Hmm, where does this patch apply? I tried 'master' along with
> (on a hunch) 'luc/parse-spec', but could not get it to 'git-am'
> correctly.

Mmmm, yes, sorry for that. It probably only apply on top of the
merge of the pending branches, including the one with all the other
'arch cleaning' patches which I still need to check after some
changes and new patches.

I've pushed everything now on github:
	git://github.com/lucvoo/sparse-dev.git int128_ctype

and I think it look pretty good (at least for the 12-15
arch/bitness combo that I'm tracking).

Best regards,
-- Luc

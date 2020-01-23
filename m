Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF9AA1471BA
	for <lists+linux-sparse@lfdr.de>; Thu, 23 Jan 2020 20:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbgAWT1b (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Thu, 23 Jan 2020 14:27:31 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47103 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgAWT1b (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Thu, 23 Jan 2020 14:27:31 -0500
Received: by mail-wr1-f65.google.com with SMTP id z7so4379424wrl.13
        for <linux-sparse@vger.kernel.org>; Thu, 23 Jan 2020 11:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tqA8sDOpF8oPE/0LsMdY94A8PBYJIjKvDQmvucU5BlA=;
        b=oqf4LaOtMo3ZicdcgjFBZvvCugui7i8+Qv0YXsWF327uU2sWR9Mqaid1fbKzqCztU+
         KJdkAL4Hb2BEoWuxD9MZn4TXpxHFJGtvRnQEojkLlpygBnwODEBwIWBo+vlBnFvooNGe
         wxnQzENhgwiBaRhwmuvST7ITmO1lHv1dnYE0dIVcHUeodwq6vqo11jLlbdC8sJZ8Wyfy
         cYeKJrHepR3KXjjZg7xr9zbScnZVwBPvZ04ZVnkpizCpHvVZnFEJVyWrDj83oJFI/xOH
         0BQlBaZKmycpp22v9zOclTofQOILHMnMEe9i7Is4hWQfA0GlTpv8gdrCsQjLklvLYTTR
         sUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tqA8sDOpF8oPE/0LsMdY94A8PBYJIjKvDQmvucU5BlA=;
        b=lH62A0yUcDDKPwd6pegmqsg2l0n8bZQRSXhgHdDtczDX7QnmA/LYmbLDSMp53a2Woh
         7Ieg11IP16D5DgxSvOqwnU1QesrcgQKS4B9wRLAfoxsf51wObVI8Nva0yhxFaIAXwcYq
         diUvJwIa1v4+ge7MLKmqHKyb8jo8kudT9Rfyxc7vlZUHtEt2svqMD7UiZWccaPJ5SWZW
         H57uNzfuwFKwbHwrshLWVoHwqUDWSZLntVtH84bwrHXxsIWcXtOaUcbC3wgbqDw6icU9
         jJXztBMhivMDs4df2Qs370F4cHMFAlkDgH8C1LTKs81n2PeNDUdKUrfWq102yhOUhFME
         pMmQ==
X-Gm-Message-State: APjAAAUsNgzsaGtQDNRzQJ3JYPpAr32r47H8MbfnNrx7EiebqEy1vwzH
        ZoWDcMdgVLraZwDr5p1StPuW2EojhY0=
X-Google-Smtp-Source: APXvYqxUtWGYviXNYysud157wIfR73yWRaTCiPpfT9TYx58/WUNfVz4Ed5nHtJt0tsAUjo6FlMFGpA==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr20194002wrt.229.1579807649374;
        Thu, 23 Jan 2020 11:27:29 -0800 (PST)
Received: from ltop.local ([2a02:a03f:4017:df00:1462:7c76:8bf3:e0a6])
        by smtp.gmail.com with ESMTPSA id 16sm3746984wmi.0.2020.01.23.11.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 11:27:27 -0800 (PST)
Date:   Thu, 23 Jan 2020 20:27:26 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Xan Phung <xan.phung@gmail.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: PATCH: domtree_build() creates extraneous bb->doms entries
Message-ID: <20200123192726.hiownrizgbkwpekk@ltop.local>
References: <CAO6moYtTsA8niRvL135+OMXDjAEnGEGMf8kG+CYgq+YDKPi4UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO6moYtTsA8niRvL135+OMXDjAEnGEGMf8kG+CYgq+YDKPi4UQ@mail.gmail.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Jan 23, 2020 at 04:27:41PM +0800, Xan Phung wrote:
> Hi, I use Sparse's domtree_build() as the basis of my C implementation of
> the "Relooper" algorithm. I notice domtree_build appears to have a "memory
> leak" (this is an oversimplification of the problem, but not far off the
> truth).
> 
> Specifically, each time domtree_build gets called, extraneous/duplicated
> child nodes get left in the bb->doms ptrlist.  This is because the existing
> children are not cleared from bb->doms ptr list before rebuilding it.  (If
> you want to reproduce this problem, I can supply a demo of it comprising a
> test input source file and a modified test-linearized.c, which calls
> domtree_build repeatedly and reports the memory allocation stats).
> 
> In addition to consuming memory, the extraneous child nodes cause problems
> with my Relooper algorithm (as it results in a malformed dominance tree
> when walking down bb->doms).

Yes, indeed. The leak is one thing but the correctness is another one.

> The following 3 line patch fixes this problem:

Yes, that should do it. Thank you.

For me to take your patch would you mind to add your Signed-off-by,
certifying that you wrote the patch? Details can be found, for example,
at https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

-- Luc

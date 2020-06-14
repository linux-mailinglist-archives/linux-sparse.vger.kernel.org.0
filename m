Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB561F8B0D
	for <lists+linux-sparse@lfdr.de>; Mon, 15 Jun 2020 00:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgFNWFd (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 14 Jun 2020 18:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727918AbgFNWFd (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 14 Jun 2020 18:05:33 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BF5C05BD43
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 15:05:32 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id g1so10102635edv.6
        for <linux-sparse@vger.kernel.org>; Sun, 14 Jun 2020 15:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kfuvbcQu+nkzQpaIdP+QiJw7IYrtaPPCMyQCutUs5Mo=;
        b=bM2GSMCknHX09cvwqNia7YtnHB4vJzbDMCKN7rpwuLuOpurLl99gglHJM3tifQc3b+
         MAq1YafXeB1p7E/0M4OH0WS+I+B4LA/72/h9BiqISg8kYlEblb1cmojATQ0gGUyBe+bB
         tFDP333vLfpCmOy4zzj0Kd8dF2XxNDWQ47dZ3LLwF66NSFNa4yqVl65xN0bNPzoNCr9e
         wn38R3WEocnemWGizUHva6TbcpQBM3LvgVXXW0NU4G6ye3TWza8lwJgbpWkWhxDQECQE
         +q3lifYJ3SS+2wxg/whgNKrQuu4r+O01q/jAOMgbAAnw4Y/ys89NMpfxfUwT1lvxGxu0
         NuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kfuvbcQu+nkzQpaIdP+QiJw7IYrtaPPCMyQCutUs5Mo=;
        b=k49r2mKTvNbZGXgtDWEPAYgHE9cJGoJ6P75IzoFwH9rB6HYO4Zn0wDolZN41uwDeV3
         JnUQDafFCZhEatlck3o2ud4VBJ8E1WPTSwGffGhTTKf1SsJteiq5QRktpbC9N9eESNSC
         U37F6a8ow+EjT1sMqt9jA4sZrIoawqXzy2rQXw0FmUr9ETSmmiqBLxK9DHGYD+5Msz+i
         EZF6DRacUAORN45PDuM5K7s3ZrNV9nNncr3iEefmms5ISH9CL0+LYCraUwT5EXDpdJDH
         G97r55m0anAoOQxrkM731AsrHwi8C5/wStxKxFUXe0pYktSY3M9d85ccAjXcnov7+4GB
         m+jA==
X-Gm-Message-State: AOAM5315OwxRlySW41jbC/MZcfrFBol2NwosXKEr6S6wf4yti3OZLmHn
        Q1BVCZYtLzeXAuhLbMvYPCOhRwoe
X-Google-Smtp-Source: ABdhPJze9CTKq4eoRRpTmmNbB+2Jglc6YnDoM3RJqMDtb5eeIc5vC3CGpRq5y2QICTJ7notY0/3cIA==
X-Received: by 2002:aa7:dd8e:: with SMTP id g14mr21530513edv.263.1592172331581;
        Sun, 14 Jun 2020 15:05:31 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:d91c:9a32:92ae:d7bf])
        by smtp.gmail.com with ESMTPSA id q5sm7243313edr.21.2020.06.14.15.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 15:05:31 -0700 (PDT)
Date:   Mon, 15 Jun 2020 00:05:30 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Ramsay Jones <ramsay@ramsayjones.plus.com>
Cc:     Sparse Mailing-list <linux-sparse@vger.kernel.org>
Subject: Re: [PATCH] doc: correct some spelling
Message-ID: <20200614220530.x4nr7zhlmxuk7zj7@ltop.local>
References: <a03299d8-fd2f-8f04-2bd0-e94091247bdb@ramsayjones.plus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a03299d8-fd2f-8f04-2bd0-e94091247bdb@ramsayjones.plus.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Jun 14, 2020 at 08:36:38PM +0100, Ramsay Jones wrote:
> Signed-off-by: Ramsay Jones <ramsay@ramsayjones.plus.com>
> 
> The only spelling fixes in the manpage are s/exemple/example/,
> s/trigered/triggered/ and s/&/and/. I would not normally change
> any 'formatting' in sparse.1, but the '{ 0 }' and '{ }' got
> split across line-endings, so I removed the spaces.
> (other solutions are possible ...)

Thank you again for noticing and fixing these typos.

Yes, the formatting is often very bad on the man page
because of bad or missing linebreaks.
I changed this part of your patch to use a non-breakable
space for the '{ 0 }' and '{ }'. They look, I think, better.

-- Luc

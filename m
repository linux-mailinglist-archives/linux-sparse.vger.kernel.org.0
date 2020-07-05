Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A418214C22
	for <lists+linux-sparse@lfdr.de>; Sun,  5 Jul 2020 13:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726728AbgGELpv (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Sun, 5 Jul 2020 07:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbgGELpv (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Sun, 5 Jul 2020 07:45:51 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A212CC061794
        for <linux-sparse@vger.kernel.org>; Sun,  5 Jul 2020 04:45:50 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id rk21so39524704ejb.2
        for <linux-sparse@vger.kernel.org>; Sun, 05 Jul 2020 04:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rmwu3ZxhYX+zpYKKPWYOlhqSDAXJocRSkStbfwaqK0w=;
        b=EnYcPtjbaJiL9DAoRps606hwxwckbFehL9CQcCxsmwJvRTN+k2gEM8bP/mX21hWygL
         WzqvQj5vEp167bBaeOxqavg0/QdkpN/PARkPaj7PodXD0SVrnGO371Fe6eEz5/JJHq/F
         9DzFGKC0verWh9UspTkSawK1STj4NcH3vYFykPCctkhnrRVQrzV6GfyRKP0uSQJa4GII
         4pdgYwqVHMKFoJWVuK4rq1XRN9u5E2UxtPe+hFcLSTAZHgKi7OfaPjP8pr9wy2hsO3Ve
         M7JYascPMcz6+gl3cFOOeoriRD6vlRqcO8nWJ0BpVXjfw8kJ6YySyXmKhQrzQBjduatf
         zDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rmwu3ZxhYX+zpYKKPWYOlhqSDAXJocRSkStbfwaqK0w=;
        b=CjWuV50Phf4TIUl9PubGIC7bL+pAQ3LPgTjTG+Fm33eeSul9YMUMalkSi1YyNXUZus
         LYfWc/2A8lubdcVuTIDhiS6kov2bCYTtlotT9hjPctYA6E4+Os6ivdLuL7y/P7K7oKDz
         xxHhdME/gBSpkUfw3h5Fty0DZ74zSgSzFR3HV/SKYo4tHhJg+tulKUo50OsfRSe7bxqy
         1DkhR+FqMUjQlnDIhuzH1tMbamc/qPq6OE4SDOrcyVmOnxn8ATO0Uh/LAXBVCCXjLXzu
         7PzTeVl1t3+pZJmEP7xPgzDXkgDQjWaWS7Ac/mpBSJ0uEciLix0v5T13veWa5IeUq9rL
         23nQ==
X-Gm-Message-State: AOAM533sYC5p8uvIC+QG9TVZU9E9yloz28p+4pWL0tvXS1mCU5wvXKFl
        CU1CJwxk6lYzTJNJC9t9bpc=
X-Google-Smtp-Source: ABdhPJxnOiyBKrDYEyeqme2OiMdQy/hSYZxMJ6t/q2Tr59juH73vQFebfOopGhyTBv92sm/mAbiTwA==
X-Received: by 2002:a17:906:a449:: with SMTP id cb9mr19921412ejb.115.1593949549397;
        Sun, 05 Jul 2020 04:45:49 -0700 (PDT)
Received: from ltop.local ([2a02:a03f:b7f9:7600:a542:d3fb:b75a:dec5])
        by smtp.gmail.com with ESMTPSA id lj18sm14165548ejb.43.2020.07.05.04.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 04:45:48 -0700 (PDT)
Date:   Sun, 5 Jul 2020 13:45:47 +0200
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Alexey Gladkov <gladkov.alexey@gmail.com>
Cc:     linux-sparse@vger.kernel.org
Subject: Re: [PATCH] sindex: avoid a warning with 'case -1:'
Message-ID: <20200705114547.ctqm5znkigrzkmyq@ltop.local>
References: <20200704235453.7756-1-luc.vanoostenryck@gmail.com>
 <20200705111204.lqutcuzkjkb4unl7@comp-core-i7-2640m-0182e6>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705111204.lqutcuzkjkb4unl7@comp-core-i7-2640m-0182e6>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Sun, Jul 05, 2020 at 01:12:04PM +0200, Alexey Gladkov wrote:
> 
> Looks good :)
> 
> Reviewed-by: Alexey Gladkov <gladkov.alexey@gmail.com>

Thanks.
It's now pushed to the main tree.

-- Luc 

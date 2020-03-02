Return-Path: <linux-sparse-owner@vger.kernel.org>
X-Original-To: lists+linux-sparse@lfdr.de
Delivered-To: lists+linux-sparse@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0795B175B67
	for <lists+linux-sparse@lfdr.de>; Mon,  2 Mar 2020 14:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbgCBNRI (ORCPT <rfc822;lists+linux-sparse@lfdr.de>);
        Mon, 2 Mar 2020 08:17:08 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39604 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbgCBNRI (ORCPT
        <rfc822;linux-sparse@vger.kernel.org>);
        Mon, 2 Mar 2020 08:17:08 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so12554641wrn.6
        for <linux-sparse@vger.kernel.org>; Mon, 02 Mar 2020 05:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A+CWDgVxl8GMs79Y3b/nbV0n3Vs3nJwWq68W+4+0M4s=;
        b=gDQKBF0PZv9mxAiP+lfhDgwcUz7isep2z/BnxjvNl2TT0Hj4dbTgovvdb24K1QDEL4
         0rji7HGk+h6vlPFqIcCiMDmkHgYgd786mpVNxJl8+YQMQq+khjPTuFB1IR/5NflfVMje
         NwUUMr9b0zNU/iS2RjXZPXVKDh1FREFsN/iHA4gsC9nQYpe9nMv0NjE0MJ3CiaWHk8r1
         FPNsH/AGDSpGt+dvsNu7JkzWROnJoGlTNoy0YiuWaeNAuad7pKtHo+65+hoKyeZMvyfe
         ljT+qgrFZTyRr5u+3fKqLAv2IwUyh4bcLc1u0qYsVrpoloWXK9lVgLwnCPlKjdvznOSh
         qLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A+CWDgVxl8GMs79Y3b/nbV0n3Vs3nJwWq68W+4+0M4s=;
        b=QhyjMMTbLQ+/5G/VkMVTgaVNudpzoOjDLzU0WAGrvHeoPJHhbAIFytjcqcqSoDSQhy
         7MCfK4XVLcZlKSR8P2T7eDEF/jOTnZZE+Abv/JhERnIZ/U4xL+q/sAbOR6rGE+spGave
         S/gs//kMTJHVsyyHVWMNSHWzIJcFYg9e2pppg80d2kXFm2bR06f+nDFW2vh2egrGXul+
         oOYc5QACaV4GE9pREyxgHRlmvcsGUcVvWzeii6CO3iYLzcL1wHW3supg8Sy+6JX8SdEq
         idOukRgoA91nmNP9FfNGSpFiqaQGclAc1F9XJBQj0ObbkrWS/4Y/bl8reukxNeDzRj0v
         b3Kg==
X-Gm-Message-State: ANhLgQ2xu81UnnAR9kjeD7WUOFcnVc5WgE7VlmGIwiChtvLsPpqlnWo6
        rzIrxnf3rF1q5dK7utkzQT0=
X-Google-Smtp-Source: ADFU+vtYXzdZEOYM1CfXzgev0VIcXNb3k1LnHSvtjXQdX9v+cxO0oJJZF+1WHVfL7LpSdb1VvFf97w==
X-Received: by 2002:adf:804c:: with SMTP id 70mr14010810wrk.27.1583155026792;
        Mon, 02 Mar 2020 05:17:06 -0800 (PST)
Received: from ltop.local ([2a02:a03f:40bd:500:e8ac:7b18:63cd:7637])
        by smtp.gmail.com with ESMTPSA id n2sm29387788wro.96.2020.03.02.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2020 05:17:05 -0800 (PST)
Date:   Mon, 2 Mar 2020 14:17:04 +0100
From:   Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
To:     Oleg Nesterov <oleg@redhat.com>
Cc:     Alexey Gladkov <gladkov.alexey@gmail.com>,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH] dissect: enforce toplevel() if SYM_STRUCT was not defined
Message-ID: <20200302131704.4oiixurruvcmjduj@ltop.local>
References: <20200227152115.GA19970@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227152115.GA19970@redhat.com>
Sender: linux-sparse-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-sparse.vger.kernel.org>
X-Mailing-List: linux-sparse@vger.kernel.org

On Thu, Feb 27, 2020 at 04:21:15PM +0100, Oleg Nesterov wrote:
> A separate change for documentation purposes.

Thanks.
Applied & pushed.

-- Luc 
